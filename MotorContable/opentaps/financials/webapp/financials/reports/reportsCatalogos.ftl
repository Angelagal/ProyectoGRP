<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<div class="tabletext" style="margin-bottom: 30px;">
<#assign hostname = request.getServerName()/>
<table style="width: 100%;">
<tr>
  <td style="vertical-align: top; width: 35%;">
	
	<#-- CAT�LOGOS -->
    <@displayReportGroup group="CATALOGOS" nameOnly=true>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3ACatalogos%3ACatalogos_presupuestales.prpt/viewer" target="_blank">${uiLabelMap.CATALOGOS_PRESUPUESTALES_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3ACatalogos%3ACatalogos_auxiliares.prpt/viewer" target="_blank">${uiLabelMap.AccountingCatalogosAuxiliares}</a></li>
      <#--<li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:CAT%C3%81LOGOS:CATALOGOPRODUCTOS.prpt/viewer" target="_blank">${uiLabelMap.AccountingCatalogosProductos}</a></li>-->    
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3ACatalogos%3ALista_de_cuentas.prpt/viewer" target="_blank">${uiLabelMap.LISTA_DE_CUENTAS_R}</a></li>    
    </@displayReportGroup>
		
  </td>
</tr>
</table>
</div>		