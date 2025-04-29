<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<div class="tabletext" style="margin-bottom: 30px;">
<#assign hostname = request.getServerName()/>
<table style="width: 100%;">
<tr>
  <td style="vertical-align: top; width: 35%;">
	
	<#-- PRESUPUESTALES -->
    <@displayReportGroup group="BUD_EXEC_E_R"  nameOnly=true>
  		<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCA1-Estado_del_ejercicio_del_presupuesto_de_egreso_en_clasificaci%C3%B3n_administrativa_(1er%20nivel).prpt/viewer" target="_blank">${uiLabelMap.EEPXCA1_R}</a></li>
      <#--<li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:CONAC:Presupuestales:Egreso:EEPXOG1%20Estado%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20por%20cap%C3%ADtulo:EEPXOG1.prpt/viewer" target="_blank">${uiLabelMap.EEPXOG1_R}</a></li>
      <li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:CONAC:Presupuestales:Egreso:EEPXOG2%20Estado%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20por%20cap%C3%ADtulo%20y%20concepto:EEPXOG2.prpt/viewer" target="_blank">${uiLabelMap.EEPXOG2_R}</a></li>
      <li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:CONAC:Presupuestales:Egreso:EEPXOG3%20Estado%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20por%20cap%C3%ADtulo,%20concepto%20y%20partida%20gen%C3%A9rica:EEPXOG3.prpt/viewer" target="_blank">${uiLabelMap.EEPXOG3_R}</a></li>
      <li><a href="http://pentaho.colsan.edu.mx/pentaho/api/repos/:home:SIPAC:CONAC:Presupuestales:Egreso:EEPXOG4%20Estado%20del%20ejercicio%20del%20presupuesto%20de%20egresos%20por%20cap%C3%ADtulo,%20concepto,%20partida%20gen%C3%A9rica%20y%20partida%20espec%C3%ADfica:EEPXOG4.prpt/viewer" target="_blank">${uiLabelMap.EEPXOG4_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCF1.prpt/viewer" target="_blank">${uiLabelMap.EEPXCF1_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCF2.prpt/viewer" target="_blank">${uiLabelMap.EEPXCF2_R}</a></li>
      --><li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCF3-Estado_del_ejercicio_del_presupuesto_de_egreso_en_clasificaci%C3%B3n_funcional_por_finalidad_funci%C3%B3n_y_subfunci%C3%B3n.prpt/viewer" target="_blank">${uiLabelMap.EEPXCF3_R}</a></li>
      <#--<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCP1.prpt/viewer" target="_blank">${uiLabelMap.EEPXCP1_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCP2.prpt/viewer" target="_blank">${uiLabelMap.EEPXCP2_R}</a></li>-->
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCP3-Estado_del_ejercicio_del_presupuesto_de_egreso_en_clasificaci%C3%B3n_program%C3%A1tica_por_programa_presupuestario_tipo_de_proyecto_y_proyecto_espec%C3%ADfico.prpt/viewer" target="_blank">${uiLabelMap.EEPXCP3_R}</a></li>
      <#--<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXTG1.prpt/viewer" target="_blank">${uiLabelMap.EEPXTG1_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXTG2.prpt/viewer" target="_blank">${uiLabelMap.EEPXTG2_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXTG3.prpt/viewer" target="_blank">${uiLabelMap.EEPXTG3_R}</a></li>-->
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXTG4-Estado_del_ejercicio_del_presupuesto_de_egreso_por_tipo%20de%20gasto_cap%C3%ADtulo_concepto_partida_gen%C3%A9rica_y_partida_espec%C3%ADfica.prpt/viewer" target="_blank">${uiLabelMap.EEPXTG4_R}</a></li>
      <#--<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXFF1.prpt/viewer" target="_blank">${uiLabelMap.EEPXFF1_R}</a></li>-->
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXFF2-Estado_del_ejercicio_del_presupuesto_de_egresos_en_clasificador_por_fuente_de_financiamiento_(2do%20nivel).prpt/viewer" target="_blank">${uiLabelMap.EEPXFF2_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCG1-Estado_del_ejercicio_del_presupuesto_de_egresos_en_clasificacion_geografica.prpt/viewer" target="_blank">${uiLabelMap.EEPXCG1_R}</a></li>
      <#--<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEPXCG1.prpt/viewer" target="_blank">${uiLabelMap.EEPXCG1_R}</a></li>-->    
		</@displayReportGroup>

    <@displayReportGroup group="BUD_EXEC_I_R"  nameOnly=true>
  		<li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEIXRI4-Estado_de_ejecuci%C3%B3n_de_la_ley_de_ingresos_por%20rubro_tipo_clase_y_concepto.prpt/viewer" target="_blank">${uiLabelMap.EEIXRI4_R}</a></li>
      <li><a href="http://localhost:8080/pentaho/api/repos/%3Ahome%3AFINABIEN%3APresupuestales%3AEEIXCA2-Estado_de_ejecucion_de_la_ley_de_ingresos_en_clasificacion_administrativa(2do%20nivel).prpt/viewer" target="_blank">${uiLabelMap.EEIXCA2_R}</a></li>    
		</@displayReportGroup>
		
  </td>
</tr>
</table>
</div>

