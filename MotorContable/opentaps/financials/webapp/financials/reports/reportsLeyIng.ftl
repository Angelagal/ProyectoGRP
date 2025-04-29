<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<div class="tabletext" style="margin-bottom: 30px;">
<#assign hostname = request.getServerName()/>
<table style="width: 100%;">
<tr>
  <td style="vertical-align: top; width: 35%;">
	
	<#-- PRESUPUESTALES -->
    
  	<@displayReportGroup group="BUD_EXEC_I_R" nameOnly=true>
    	<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEIXRI1.prpt/viewer" target="_blank">${uiLabelMap.EEIXRI1_R}</a></li>
		<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEIXRI2.prpt/viewer" target="_blank">${uiLabelMap.EEIXRI2_R}</a></li>
		<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEIXRI3.prpt/viewer" target="_blank">${uiLabelMap.EEIXRI3_R}</a></li>
		<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEIXRI4.prpt/viewer" target="_blank">${uiLabelMap.EEIXRI4_R}</a></li>	
    	<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEIXCA1.prpt/viewer" target="_blank">${uiLabelMap.EEIXCA1_R}</a></li>
		<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEIXCA2.prpt/viewer" target="_blank">${uiLabelMap.EEIXCA2_R}</a></li>
	</@displayReportGroup>
		
  </td>
</tr>
</table>
</div>

