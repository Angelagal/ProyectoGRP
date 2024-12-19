<#--
 * Copyright (c) Open Source Strategies, Inc.
 *
 * Opentaps is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Opentaps is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with Opentaps.  If not, see <http://www.gnu.org/licenses/>.
-->

<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>


<script  languaje="JavaScript">    
		function buscaCuentasBancarias(nombreCampoBanco, nombreCampoCuenta) 
		{   var bancoId = document.getElementById(nombreCampoBanco).value;
			if (bancoId != "")
		    { 	var requestData = {'bancoId' : bancoId, 'organizationPartyId': '${parameters.organizationPartyId}'};		    
		    	opentaps.sendRequest('obtieneCuentasBancarias', requestData, function(data) {cargarCuentasResponse(data,nombreCampoCuenta)});
		    }
			
		}

		//Functions load the response from the server
		function cargarCuentasResponse(data,nombreCampoCuenta) 
		{	i = 1;				
			var select = document.getElementById(nombreCampoCuenta);
			document.getElementById(nombreCampoCuenta).innerHTML = "";
			select.options[0] = new Option('');
			select.options[0].value = '';
			for (var key in data) 
			{	if(data[key]=="ERROR")
				{	document.getElementById(nombreCampoCuenta).innerHTML = "";
				}
				else
				{	select.options[i] = new Option(data[key]);
					select.options[i].value = key;					
				  	i++;
				}	    		
			}		
		}
</script>

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
					document.buscaTraspasos.fechaContableDesde.value = " ";
          			document.buscaTraspasos.fechaContableHasta.value = " ";
				}else if(fechaIni >= fechaFin){
					alert("La fecha inicial no puede ser mayor o igual a la final");
          			document.buscaTraspasos.fechaContableDesde.value = " ";
          			document.buscaTraspasos.fechaContableHasta.value = " ";
				}else if((fechaIni != " ") && (fechaFin != " ")){
					alert("Fechas vacias o formato incorrecto");
          			document.buscaTraspasos.fechaContableDesde.value = " ";
          			document.buscaTraspasos.fechaContableHasta.value = " ";
				}		
  }
</script>

<form name="buscaTraspasos" method="post" action="">
  <@inputHidden name="performFind" value="Y"/>
  <table class="twoColumnForm">
    <tbody>
    <#assign fechaHoy = Static["org.ofbiz.base.util.UtilDateTime"].nowSqlDate() />
	<#assign fechaInicioMes = Static["org.ofbiz.base.util.UtilDateTime"].getMonthStart(fechaHoy) />
      <@inputTextRow title=uiLabelMap.FinancialsTransactionId name="findAcctgTransId" size="20" maxlength="20"/>	
	  <@inputDateRangeRow title=uiLabelMap.FinancialsAccountigDate fromName="fechaContableDesde" thruName="fechaContableHasta"
				defaultFrom=fechaInicioMes defaultThru=fechaHoy />
      <@inputRangeRow title=uiLabelMap.FinancialsPostedAmount fromName="postedAmountFrom" thruName="postedAmountThru" size=10/>
      <@inputSelectRow title=uiLabelMap.BancoOrigen required=false list=bancos  displayField="nombreBanco" name="bancoOrigen" id="bancoOrigen" key="bancoId"
								default=bancoId?if_exists onChange="buscaCuentasBancarias('bancoOrigen','cuentaOrigen')"/>
	  <@inputSelectRow title=uiLabelMap.CuentaOrigen name="cuentaOrigen" id="cuentaOrigen" list=([]) />
      <@inputSelectRow title=uiLabelMap.BancoDestino required=false list=bancos  displayField="nombreBanco" name="bancoDestino" id="bancoDestino" key="bancoId"
								default=bancoId?if_exists onChange="buscaCuentasBancarias('bancoDestino','cuentaDestino')" />
	  <@inputSelectRow title=uiLabelMap.CuentaDestino name="cuentaDestino" id="cuentaDestino" list=([]) />
      <@inputSubmitRow title=uiLabelMap.CommonFind onClick="validarFecha();"/>
    </tbody>
  </table>
</form>
