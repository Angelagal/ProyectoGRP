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

<script>
  function validarFecha(){
    var fecha_ini = document.getElementById("fechaInicialPeriodo").value;
		fecha_ini = fecha_ini.replace(/\D/g, ' ');
		var componentes = fecha_ini.split(' ');
		var fechaIni = new Date(componentes[2]+"/"+componentes[1]+"/"+componentes[0]);
		
		var fecha_fin = document.getElementById("fechaFinalPeriodo").value;
		fecha_fin = fecha_fin.replace(/\D/g, ' ');
		var componentes1 = fecha_fin.split(' ');
		var fechaFin = new Date(componentes1[2]+"/"+componentes1[1]+"/"+componentes1[0]);

    if(fechaIni < fechaFin)
		{	
			alert("Generando busqueda");
			document.buscaTraspasos.fechaInicialPeriodo.value = " ";
			document.buscaTraspasos.fechaFinalPeriodo.value = " ";
		}else if(fechaIni >= fechaFin){
			alert("La fecha inicial no puede ser mayor o igual a la final");
			document.buscaTraspasos.fechaInicialPeriodo.value = " ";
			document.buscaTraspasos.fechaFinalPeriodo.value = " ";
		}else if((fechaIni != " ") && (fechaFin != " ")){
			document.buscaTraspasos.fechaInicialPeriodo.value = " ";
			document.buscaTraspasos.fechaFinalPeriodo.value = " ";
        	alert("Fechas vacias o formato incorrecto");
        }	
  }
</script>

<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>


<form name="buscaTraspasos" method="post" action="">
	<@inputHidden name="performFind" value="Y"/>
	<table class="twoColumnForm">
    <tbody>
      <@inputSelectRow title=uiLabelMap.BancoOrigen required=false list=bancos key="bancoId" displayField="nombreBanco" name="bancoId" default=bancoId?if_exists />
	  <#assign diaActual = Static["org.ofbiz.base.util.UtilDateTime"].nowSqlDate()>
	  <#assign inicioMes = Static["org.ofbiz.base.util.UtilDateTime"].getMonthStart(diaActual)>
 	  <@inputDateRangeRow title=uiLabelMap.FinancialPeriodo fromName="fechaInicialPeriodo" thruName="fechaFinalPeriodo" defaultFrom=inicioMes defaultThru=diaActual/>
      <@inputSubmitRow title=uiLabelMap.CommonFind onClick="validarFecha();"/>
	</tbody>
	</table>
</form>
