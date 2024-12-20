<#--
 * Formulario de busqueda de p�lizas contables
 * Author: Vidal Garc�a
 * Versi�n 1.0
 * Fecha de Creaci�n: Julio 2013
-->
<script>
  function validarFecha(){
    var fecha_ini = document.getElementById("fechaContableDesde").value;
		fecha_ini = fecha_ini.replace(/\D/g, ' ');
		var componentes = fecha_ini.split(' ');
		var fechaIni = new Date(componentes[2]+"/"+componentes[1]+"/"+componentes[0]);
		
		var fecha_fin = document.getElementById("fechaContableHasta").value;
		fecha_fin = fecha_fin.replace(/\D/g, ' ');
		var componentes1 = fecha_fin.split(' ');
		var fechaFin = new Date(componentes1[2]+"/"+componentes1[1]+"/"+componentes1[0]);

    if(fechaIni < fechaFin)
				{	
					alert("Generando busqueda");
				}else if(fechaIni >= fechaFin){
					alert("La fecha inicial no puede ser mayor o igual a la final");
          document.BuscaPoliza.fechaContableDesde.value = " ";
          document.BuscaPoliza.fechaContableHasta.value = " ";
				}else if((fechaIni != " ") && (fechaFin != " ")){
					alert("Fechas vacias o formato incorrecto");
          document.BuscaPoliza.fechaContableDesde.value = " ";
          document.BuscaPoliza.fechaContableHasta.value = " ";
				}	
  }
</script>

<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>
<form name="BuscaPoliza" >
  <table class="twoColumnForm">
    <tbody>
      <@inputTextRow title=uiLabelMap.NumeroDePoliza name="poliza" size="20" maxlength="20"/>
      <@inputSelectRow title=uiLabelMap.FinancialsTipoPoliza required=false list=listaTipoPoliza  displayField="description" name="tipoPolizaId" key="tipoPolizaId" />
      <@inputAutoCompletePartyRow title="${uiLabelMap.PurchArea}" name="areaId" />
      <@inputAutoCompleteUserLoginPartyRow name="usuario" title=uiLabelMap.Usuario />
	  <#assign diaActual = Static["org.ofbiz.base.util.UtilDateTime"].nowSqlDate()>
      <@inputDateRangeRow title=uiLabelMap.FinancialsFechaContable fromName="fechaContableDesde" thruName="fechaContableHasta" 
			defaultFrom=Static["org.ofbiz.base.util.UtilDateTime"].getMonthStart(diaActual) defaultThru=diaActual />
      <@inputRangeRow title=uiLabelMap.Monto fromName="montoDesde" thruName="montoHasta" size=10/>           
      <@inputSubmitRow title=uiLabelMap.CommonFind onClick="validarFecha();"/>
    </tbody>
  </table>
</form>
