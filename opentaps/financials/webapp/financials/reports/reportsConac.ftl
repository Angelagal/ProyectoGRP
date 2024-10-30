<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<div class="tabletext" style="margin-bottom: 30px;">
<#assign hostname = request.getServerName()/>
<table style="width: 100%;">
<tr>
  <td style="vertical-align: top; width: 35%;">

	<#-- CONAC -->
	<@displayReportGroup group="CONAC_CONTABLES" nameOnly=true>
		<#--<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3ACONAC%3AContables%3AEF1.prpt/viewer" target="_blank">${uiLabelMap.EF1}</a></li>-->
		<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3ACONAC%3AContables%3AEF2.prpt/viewer" target="_blank">${uiLabelMap.EF2}</a></li>
		<#--<li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/%3Ahome%3ASIPAC%3ACONAC%3AContables%3AEF3%20Estado%20de%20actividades%3AEF3.prpt/viewer" target="_blank">${uiLabelMap.EF3}</a></li>-->
		<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3ACONAC%3AContables%3AEF4%20Estado%20de%20cambios%20en%20la%20situaci%C3%B3n%20financiera.prpt/viewer" target="_blank">${uiLabelMap.AccountingEF4}</a></li>
		<#--<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3ACONAC%3AContables%3AEF5%2BEstado%2Bde%2BVariaci%25C3%25B3n%2Ben%2Bla%2BHacienda%2BPublica.prpt/viewer" target="_blank">${uiLabelMap.EF5Conac}</a></li>
		<li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:Estado%20de%20Flujo%20de%20Efectivo.prpt/viewer" target="_blank">${uiLabelMap.EF6Conac}</a></li>-->
		<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3ACONAC%3AContables%3AEF7%2BEstado%2BAnal%25C3%2583%25C2%25ADtico%2Bde%2Bla%2BDeuda%2By%2BOtros%2BPasivos.prpt/viewer" target="_blank">${uiLabelMap.EF7}</a></li>
	</@displayReportGroup>		
    <@displayReportGroup group="CONAC_PRESUPUESTALES" nameOnly=true>
		<#--<li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/%3Ahome%3ASIPAC%3ACONAC%3APresupuestales%3AIngreso%3AEstado%20analitico%20de%20ingresos%3AEAIXRF.prpt/viewer" target="_blank">${uiLabelMap.AccountingEAIXRF}</a></li>-->
		<#--<li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/%3Ahome%3ASIPAC%3ACONAC%3APresupuestales%3AEgreso%3AEAEPXOG%20Estado%20analitico%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20clasificacion%20por%20objeto%20del%20gasto%20%28capitulo%20y%20concepto%29%3AEAEPXOG.prpt/viewer" target="_blank">${uiLabelMap.AccountingEAEPXOG}</a></li>-->
		<#--<li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/%3Ahome%3ASIPAC%3ACONAC%3APresupuestales%3AEgreso%3AEAEPXCE%20Estado%20analitico%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20clasificacion%20economica%20%28por%20tipo%20de%20gasto%29%3AEAEPXCE.prpt/viewer" target="_blank">${uiLabelMap.AccountingEAEPXCE}</a></li>-->
		<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3ACONAC%3APresupuestales%3AEAEPXCA.prpt/viewer" target="_blank">${uiLabelMap.AccountingEAEPXCA}</a></li>
		<#--<li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/%3Ahome%3ASIPAC%3ACONAC%3APresupuestales%3AEgreso%3AEAEPXCF%20Estado%20analitico%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20clasificacion%20funcional%20%28finalidad%20y%20funcion%29%3AEAEPXCF.prpt/viewer" target="_blank">${uiLabelMap.AccountingEAEPXCF}</a></li>-->
		<#--<li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/%3Ahome%3ASIPAC%3ACONAC%3APresupuestales%3AEgreso%3AEAEPXCP%20Estado%20analitico%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20gasto%20por%20categoria%20programatica%3AEAEPXCP.prpt/viewer" target="_blank">${uiLabelMap.AccountingEAEPXCP}</a></li>-->
		<#--<li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:CONAC:Presupuestales:Egreso:Indicadores%20de%20Postura%20Fiscal:IndicadoresPosturaFiscal.prpt/viewer" target="_blank">${uiLabelMap.AccountingIndPostFisc}</a></li>-->    
    </@displayReportGroup>
	<#-- CONAC --> 
		
  </td>
</tr>
</table>
</div>