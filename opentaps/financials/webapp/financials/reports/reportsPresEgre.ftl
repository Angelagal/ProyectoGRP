<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<div class="tabletext" style="margin-bottom: 30px;">
<#assign hostname = request.getServerName()/>
<table style="width: 100%;">
<tr>
  <td style="vertical-align: top; width: 35%;">
	
	<#-- PRESUPUESTALES -->
    <@displayReportGroup group="BUD_EXEC_E_R" nameOnly=true>
  		<#--<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCA~1.prpt/viewer" target="_blank">${uiLabelMap.EEPXCA1_R}</a></li>
      <li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:CONAC:Presupuestales:Egreso:EEPXOG1%20Estado%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20por%20cap%C3%ADtulo:EEPXOG1.prpt/viewer" target="_blank">${uiLabelMap.EEPXOG1_R}</a></li>
      <li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:CONAC:Presupuestales:Egreso:EEPXOG2%20Estado%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20por%20cap%C3%ADtulo%20y%20concepto:EEPXOG2.prpt/viewer" target="_blank">${uiLabelMap.EEPXOG2_R}</a></li>
      <li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:CONAC:Presupuestales:Egreso:EEPXOG3%20Estado%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20por%20cap%C3%ADtulo,%20concepto%20y%20partida%20gen%C3%A9rica:EEPXOG3.prpt/viewer" target="_blank">${uiLabelMap.EEPXOG3_R}</a></li>
      <li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:CONAC:Presupuestales:Egreso:EEPXOG4%20Estado%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20por%20cap%C3%ADtulo,%20concepto,%20partida%20gen%C3%A9rica%20y%20partida%20espec%C3%ADfica:EEPXOG4.prpt/viewer" target="_blank">${uiLabelMap.EEPXOG4_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCF1.prpt/viewer" target="_blank">${uiLabelMap.EEPXCF1_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCF2.prpt/viewer" target="_blank">${uiLabelMap.EEPXCF2_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCF3.prpt/viewer" target="_blank">${uiLabelMap.EEPXCF3_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCP1.prpt/viewer" target="_blank">${uiLabelMap.EEPXCP1_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCP2.prpt/viewer" target="_blank">${uiLabelMap.EEPXCP2_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCP3.prpt/viewer" target="_blank">${uiLabelMap.EEPXCP3_R}</a></li>-->
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXTG1.prpt/viewer" target="_blank">${uiLabelMap.EEPXTG1_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXTG2.prpt/viewer" target="_blank">${uiLabelMap.EEPXTG2_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXTG3.prpt/viewer" target="_blank">${uiLabelMap.EEPXTG3_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXTG4.prpt/viewer" target="_blank">${uiLabelMap.EEPXTG4_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXFF1.prpt/viewer" target="_blank">${uiLabelMap.EEPXFF1_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXFF2.prpt/viewer" target="_blank">${uiLabelMap.EEPXFF2_R}</a></li>
      <#--<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCG1.prpt/viewer" target="_blank">${uiLabelMap.EEPXCG1_R}</a></li>-->    
		</@displayReportGroup>
		
  </td>
</tr>
</table>
</div>

