<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<script language="JavaScript" type="text/javascript">
<!-- //
	function cambiaTipo(){
		document.getElementById("performFind").value = "N";
		document.getElementById("ConsultaClavesPresupuestalesPoliza").submit();		
    
	}	
	// -->
</script>

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
			document.ConsultaClavesPresupuestalesPoliza.fechaInicialPeriodo.value = " ";
			document.ConsultaClavesPresupuestalesPoliza.fechaFinalPeriodo.value = " ";
		}else if(fechaIni >= fechaFin){
			alert("La fecha inicial no puede ser mayor o igual a la final");
			document.ConsultaClavesPresupuestalesPoliza.fechaInicialPeriodo.value = " ";
			document.ConsultaClavesPresupuestalesPoliza.fechaFinalPeriodo.value = " ";
		}else if((fechaIni != " ") && (fechaFin != " ")){
			document.ConsultaClavesPresupuestalesPoliza.fechaInicialPeriodo.value = " ";
			document.ConsultaClavesPresupuestalesPoliza.fechaFinalPeriodo.value = " ";
		}
	}
</script>


<form id="ConsultaClavesPresupuestalesPoliza" name="ConsultaClavesPresupuestalesPoliza" method="post" action="">
  <@inputHidden id="performFind" name="performFind" value="Y"/>
  <table class="twoColumnForm">
    <tbody>
      <@displayTitleCell title=uiLabelMap.FinancialTipoClave + " *"/>
      <@inputSelectCell key="id" displayField="id" list=tiposClave name="ingresoEgreso" defaultOptionText=ingresoEgreso?if_exists onChange="cambiaTipo()"/>
	    <@inputSelectRow title=uiLabelMap.FinancialMomento required=false list=momentos  displayField="description" name="momentoId" default=momentoId?if_exists />
      <@displayCvesPresupRow tagTypes=tagTypes />
	    <@inputDateRangeRow title=uiLabelMap.FinancialsFechaContable fromName="fechaInicialPeriodo" thruName="fechaFinalPeriodo" />
	    <@inputTextRow title=uiLabelMap.NumeroDePoliza name="poliza" size="20" maxlength="20"/>
      <@inputSelectRow title=uiLabelMap.FinancialsTipoPoliza required=false list=listaTipoPoliza  displayField="description" name="tipoPolizaId" key="tipoPolizaId" />	
	    <@displayTitleCell title=uiLabelMap.FinancialsMovimiento/>
	    <@inputSelectHashCell hash= {"D":"Cargo", "C":"Abono", "A":"Ambos"} id="tipoMovimiento" name="tipoMovimiento"/>	
      <@inputSubmitRow title=uiLabelMap.CommonFind onClick="validarFecha();"/>
    </tbody>
  </table>
  <strong style="font-size: 12px;color: grey;">* Campos obligatorios</strong>
</form>
