package org.opentaps.dataimport.domain;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javolution.util.FastList;
import javolution.util.FastMap;

import org.ofbiz.base.util.Debug;
import org.ofbiz.base.util.UtilDateTime;
import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.base.util.UtilNumber;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.common.AB.UtilCommon;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.condition.EntityCondition;
import org.ofbiz.entity.condition.EntityOperator;
import org.ofbiz.entity.transaction.TransactionUtil;
import org.ofbiz.entity.util.EntityUtil;
import org.ofbiz.entity.util.LineaMotorContable;
import org.ofbiz.service.DispatchContext;
import org.ofbiz.service.GenericServiceException;
import org.ofbiz.service.LocalDispatcher;
import org.ofbiz.service.ServiceUtil;
import org.opentaps.dataimport.UtilImport;

public class ImportarModifo {

	private static String MODULE = ImportarModifo.class.getName();

	private static String eventoContableId;
	private static String organizationPartyId;
	private static String tipoClave = "INGRESO";
	private static GenericValue userLogin;
	private static String userLoginId;
	
	/**
	 * Metodo para importar MODIFO
	 * @param dctx
	 * @param context
	 * @return
	 */
	public static Map<String, Object> importModifo(DispatchContext dctx, Map<String, ?> context) {
		boolean error = false;
		Delegator delegator = dctx.getDelegator();
		LocalDispatcher dispatcher = dctx.getDispatcher();
		Map<String, Object> regreso = ServiceUtil.returnSuccess();
		System.out.println("ENTRA AL METODO");
		
		eventoContableId = (String) context.get("eventoContable");
		organizationPartyId = (String) context.get("organizationPartyId");
		userLogin = (GenericValue) context.get("userLogin");
		userLoginId = userLogin.getString("userLoginId");
				
		try {
			GenericValue partyOrganization = delegator.findByPrimaryKeyCache("Party", UtilMisc.toMap("partyId", organizationPartyId));
			if (UtilValidate.isEmpty(partyOrganization)){
				throw new GenericEntityException("El identificador de la organizaci\u00f3n es incorrecto");
			}
			
			GenericValue EventoContable = delegator.findByPrimaryKeyCache("EventoContable", UtilMisc.toMap("acctgTransTypeId", eventoContableId));
			
			if (UtilValidate.isEmpty(EventoContable)) {
				throw new GenericEntityException("El evento contable no se encuentra configurado en el sistema");
			}
			
			List<GenericValue> listLineasPresupuestales = delegator.findByCondition("LineaPresupuestal",
							EntityCondition.makeCondition("acctgTransTypeId", EntityOperator.EQUALS, eventoContableId),
							UtilMisc.toList("momentoCompara","comparacion","secuencia", "catalogoAbono"), UtilMisc.toList("secuencia"));
			// ---- Obtiene la linea primer presupuestal , presupuestalmente de donde se obtiene el dinero
			GenericValue PrimeraLineaPresupuestal = EntityUtil.getFirst(listLineasPresupuestales);
			
			//Se crea el mapa de Lineas Presupuestales, el motor contable lo requiere , sin embargo en este proceso no se utiliza
			Map<String,GenericValue> mapaSecuenciaPresupuestal = FastMap.newInstance();
			List<String> fieldsToSelect = delegator.getModelEntity("ValidaPagoModifo").getAllFieldNames();
			EntityCondition condicionValida = UtilImport.condicionesSinProcesar(userLoginId);
			
			String momentoIdCompara = new String();
			boolean validacionCompara = true;
			
			if (UtilValidate.isNotEmpty(PrimeraLineaPresupuestal)) {
				validacionCompara = UtilValidate.isNotEmpty(PrimeraLineaPresupuestal.getString("comparacion"));
				momentoIdCompara = PrimeraLineaPresupuestal.getString("momentoCompara");
			}
			
			// ---- Se obtiene la validacion presupuestal
			if (validacionCompara) {
				//Se guarda el momento a comparar , para esto se genera una transaccion temporal
				TransactionUtil.begin();
				delegator.storeByCondition("DataImportModifo", UtilMisc.toMap("momentoId",momentoIdCompara), UtilImport.condicionesSinProcesar(userLoginId));
				TransactionUtil.commit();
			} else {
				fieldsToSelect.remove("montoControl");
			}
			
			List<String> orderBy = UtilMisc.toList("dataImportModifoId");
			List<GenericValue> listDataImportModifo = delegator.findByCondition("DataImportModifo", UtilImport.condicionesSinProcesar(userLoginId), null, orderBy);
			List<GenericValue> listValidaModifo = delegator.findByCondition("ValidaPagoModifo", condicionValida , fieldsToSelect , orderBy);
			Map<String,GenericValue> mapDataImportModifo = FastMap.newInstance();
			
			for (GenericValue DataImportModifo : listDataImportModifo) {
				mapDataImportModifo.put(DataImportModifo.getString("dataImportModifoId"), DataImportModifo);
			}
			
			Map<String,Map<String,Object>> mapRenglonModifoLinea = FastMap.newInstance();
			Map<String,Object> mapTipoModifoLinea = FastMap.newInstance();
			List<LineaMotorContable> listLineaMotorContable = FastList.newInstance();
			List<GenericValue> listModifo = FastList.newInstance();
			String dataImportModifoId = new String();
			BigDecimal monto = BigDecimal.ZERO;
			BigDecimal montoCompara = BigDecimal.ZERO;
			Map<String,String> mapaCuentaBanco = FastMap.newInstance();
			
			for (GenericValue ValidaModifo : listValidaModifo) {
				LineaMotorContable LineaMotorContable = new LineaMotorContable();
				dataImportModifoId = ValidaModifo.getString("dataImportModifoId");
				GenericValue DataImportModifo = mapDataImportModifo.get(dataImportModifoId);
				
				for (GenericValue LineaPresupuestal : listLineasPresupuestales) {
					String cuentaBancaria = DataImportModifo.getString("cuentaBancariaId");
					String catalogoAbono = LineaPresupuestal.getString("catalogoAbono");
					Debug.log("Busca a poner el catalogo abono darky" + catalogoAbono + " secuencia de linea "+LineaPresupuestal.getString("secuencia") + " Evento contable " + eventoContableId);
					
					if(UtilValidate.isNotEmpty(catalogoAbono)){
						LineaPresupuestal.set("catalogoAbono",LineaPresupuestal.getString("catalogoAbono").equalsIgnoreCase("BANCO") ? "BANCO" : cuentaBancaria);
						Debug.log("Entra a poner el catalogo abono darky y la cuenta bancaria " + cuentaBancaria);
					}
					
					mapaSecuenciaPresupuestal.put(LineaPresupuestal.getString("secuencia"), LineaPresupuestal);
				}
				
				UtilImport.limpiarRegistroError(DataImportModifo);
				
				if (UtilValidate.isEmpty(ValidaModifo.getString("clavePresupuestalCve"))) {
					UtilImport.registrarError(DataImportModifo, "No existe la clave presupuestal");
					error = true;
				} else {
					LineaMotorContable.setClavePresupuestal(ValidaModifo.getString("clavePresupuestalCve"));
				}
				
				if (UtilValidate.isNotEmpty(ValidaModifo.getString("inactivo"))) {
					UtilImport.registrarError(DataImportModifo, "La clave presupuestal [" + ValidaModifo.getString("clavePresupuestal") + "] esta inactiva");
					error = true;
				}
				
				monto = UtilNumber.getBigDecimal(ValidaModifo.getBigDecimal("monto"));
				
				if (UtilValidate.isEmpty(DataImportModifo.getBigDecimal("monto"))) {
					UtilImport.registrarError(DataImportModifo, "Es necesario ingresar el monto ");
					error = true;
				}
				
				if (validacionCompara) {
					montoCompara = UtilNumber.getBigDecimal(ValidaModifo.getBigDecimal("montoControl"));
					
					if (monto.compareTo(montoCompara) > 0) {
						UtilImport.registrarError(DataImportModifo, "No existe suficiencia presupuestal : " + montoCompara.subtract(monto));
						error = true;
					} else {
						LineaMotorContable.setMontoPresupuestal(monto);
					}
				} else {
					LineaMotorContable.setMontoPresupuestal(monto);
				}
				
				if (UtilValidate.isEmpty(ValidaModifo.getDate("fechaContable"))) {
					UtilImport.registrarError(DataImportModifo, "Debe ingresar la fecha contable");
					error = true;
				} else {
					LineaMotorContable.setFecha(UtilDateTime.toTimestamp(ValidaModifo.getDate("fechaContable")));
				}
				
				if (UtilValidate.isEmpty(ValidaModifo.getString("conceptoPago"))) {
					UtilImport.registrarError(DataImportModifo, "Debe ingresar el concepto del pago");
					error = true;
				}
				
				if (UtilValidate.isEmpty(ValidaModifo.getString("cuentaBancariaId"))) {
					UtilImport.registrarError(DataImportModifo, "Debe ingresar la cuenta bancaria");
					error = true;
				} else {
					if (UtilValidate.isEmpty(ValidaModifo.getString("cuentaBancariaIdCta"))) {
						UtilImport.registrarError(DataImportModifo, "El identificador de la cuenta bancaria es incorrecto o no existe");
						error = true;
					} else {
						mapaCuentaBanco.put(ValidaModifo.getString("cuentaBancariaIdCta"),ValidaModifo.getString("bancoId"));
					}
				}
				
				if (UtilValidate.isEmpty(ValidaModifo.getString("moneda"))) {
					UtilImport.registrarError(DataImportModifo, "Debe ingresar la moneda");
					error = true;
				} else {
					if(UtilValidate.isEmpty(ValidaModifo.getString("uomId"))){
						UtilImport.registrarError(DataImportModifo, "El identificador de la moneda es incorrecto o no existe");
						error = true;
					}
				}
				
				if(UtilValidate.isEmpty(ValidaModifo.getString("metodoPago"))){
					UtilImport.registrarError(DataImportModifo, "Debe ingresar el m\u00f3todo de pago");
					error = true;
				} else {
					if(UtilValidate.isEmpty(ValidaModifo.getString("paymentTypeId"))){
						UtilImport.registrarError(DataImportModifo, "El identificador del m\u00f3todo de pago es incorrecto o no existe");
						error = true;
					}
				}
				
				LineaMotorContable.setLineasPresupuestales(mapaSecuenciaPresupuestal);
				//Se agrega la linea motor para la primera poliza
				listLineaMotorContable.add(LineaMotorContable);
				mapTipoModifoLinea.put("LineaMotorContable", LineaMotorContable);
				//Ahora se crea el registro de modifo
				GenericValue Modifo = GenericValue.create(delegator.getModelEntity("Modifo"));
				
				Modifo.setAllFields(ValidaModifo.getAllFields(), false, null, false);
				listModifo.add(Modifo);
				mapTipoModifoLinea.put("Modifo", Modifo);
				mapRenglonModifoLinea.put(dataImportModifoId, mapTipoModifoLinea);
				mapTipoModifoLinea = FastMap.newInstance();
			}
			
			TransactionUtil.begin(43200);
			
			if (!error) {
				Map<String,Object> result = ServiceUtil.returnSuccess();
				
				for (Entry<String, Map<String, Object>> RenglonModifoLinea : mapRenglonModifoLinea.entrySet()) {
					Map<String,Object> mapaProducto = FastMap.newInstance();
					Map<String,Object> mapaMontoClave = FastMap.newInstance();
					Map<String,Object> montoMap = FastMap.newInstance();
					Map<String,Object> clavePresupuestalMap = FastMap.newInstance();
					Map<String,Object> catalogoCargoContMap = FastMap.newInstance();
					Map<String,Object> catalogoAbonoContMap = FastMap.newInstance();
					Map<String,Object> catalogoCargoPresMap = FastMap.newInstance();
					Map<String,Object> catalogoAbonoPresMap = FastMap.newInstance();
					int iteracion = 0;
					
					GenericValue DataImportModifo = mapDataImportModifo.get(RenglonModifoLinea.getKey());
					String llaveSimple = Integer.toString(iteracion);
					
					mapaMontoClave.put(llaveSimple, DataImportModifo.getString("monto"));
					clavePresupuestalMap.put(llaveSimple,DataImportModifo.getString("clavePresupuestal"));
					
					LineaMotorContable lineaMotor = (LineaMotorContable) RenglonModifoLinea.getValue().get("LineaMotorContable");
					GenericValue Modifo = (GenericValue) RenglonModifoLinea.getValue().get("Modifo");
					
					List<GenericValue> DetallePresupuesto = delegator.findByCondition("LineaPresupuestal", EntityCondition.makeCondition("acctgTransTypeId",EntityOperator.EQUALS, eventoContableId), null, null);
					
					for (GenericValue DetalleLinea : DetallePresupuesto) {
						String llaveCompuesta = DetalleLinea.getString("descripcion").replaceAll("\\s","");
						llaveCompuesta = llaveCompuesta+iteracion;
						catalogoAbonoPresMap.put(llaveCompuesta, DataImportModifo.getString("cuentaBancariaId"));
						montoMap.put(llaveCompuesta,DetalleLinea.getString("monto"));
					}
					 
					Map context2 = FastMap.newInstance();
					context2.put("clavePresupuestalMap", clavePresupuestalMap);
					context2.put("montoMap", montoMap);
					context2.put("catalogoCargoContMap", catalogoCargoContMap);
					context2.put("catalogoAbonoContMap", catalogoAbonoContMap);
					context2.put("catalogoCargoPresMap", catalogoCargoPresMap);
					context2.put("catalogoAbonoPresMap", catalogoAbonoPresMap);
					
					Map<String, Object> input = FastMap.newInstance();
					input.put("fechaRegistro", UtilDateTime.nowTimestamp());
					input.put("fechaContable", lineaMotor.getFecha());
					input.put("eventoContableId", eventoContableId);
					input.put("usuario", userLoginId);
					input.put("organizationId", organizationPartyId);
					input.put("currency", "MXN");
					input.put("tipoClaveId", tipoClave);
					input.put("lineasMotor",UtilCommon.getLineasContables(eventoContableId, delegator, context2, "" ,DataImportModifo.getString("cuentaBancariaId"), mapaMontoClave, mapaProducto));
					//input.put("lineasMotor", UtilMisc.toList(lineaMotor));
					input.put("descripcion", DataImportModifo.getString("conceptoPago")+DataImportModifo.getString("nombreExterno"));
					
					result = dispatcher.runSync("creaTransaccionMotor",input, 43200, false);
					
					if (ServiceUtil.isError(result)) {
						Debug.logError("Hubo Error al crear la poliza del renglon "+DataImportModifo.getString("renglon"), MODULE);
						return ServiceUtil.returnError(ServiceUtil.getErrorMessage(result));
					} else {
						GenericValue AcctgTrans = (GenericValue) result.get("transaccion");
						DataImportModifo.setString("poliza", AcctgTrans.getString("poliza"));
						
						Modifo.put("acctgTransId", AcctgTrans.getString("acctgTransId"));
					}
					
					DataImportModifo.store();
					Modifo.setNextSeqId();
					Modifo.create();
					
					iteracion++;
					
				}
				
				if (ServiceUtil.isSuccess(result)) {
					regreso = ServiceUtil.returnSuccess("Se realiz\u00f3 correctamente la importaci\u00f3n de los ("+listDataImportModifo.size()+") pagos");
					
					for (GenericValue DataImportIngresoPres : listDataImportModifo) {
						UtilImport.registrarExitoso(DataImportIngresoPres);
					}
				}
				
			}

			delegator.storeAll(listDataImportModifo);
			
			TransactionUtil.commit();
		} catch (GenericEntityException | NullPointerException | GenericServiceException e) {
			e.printStackTrace();
			return ServiceUtil.returnError(e.getMessage());
		}
		
		return regreso;
	}
	
}
