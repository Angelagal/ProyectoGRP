<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>

<script>

  function validarFecha()
  	{
		var fecha_ini = document.getElementById("fromDate").value;
		fecha_ini = fecha_ini.replace(/\D/g, ' ');
		var componentes = fecha_ini.split(' ');
		var fechaIni = new Date(componentes[2]+"/"+componentes[1]+"/"+componentes[0]);
		
		var fecha_fin = document.getElementById("thruDate").value;
		fecha_fin = fecha_fin.replace(/\D/g, ' ');
		var componentes1 = fecha_fin.split(' ');
		var fechaFin = new Date(componentes1[2]+"/"+componentes1[1]+"/"+componentes1[0]);

	    if(fechaIni < fechaFin)
		{	
			alert("Etiqueta generada");
			document.getElementById("creaEtiqueta").submit();
		}
		else if(fechaIni >= fechaFin)
		{
			alert("La fecha inicial no puede ser mayor o igual a la final");
			document.creaEtiqueta.fromDate.value = " ";
			document.creaEtiqueta.thruDate.value = " ";
		
		}else if((fechaIni != " ") && (fechaFin != " "))
		{
			document.creaEtiqueta.fromDate.value = " ";
			document.creaEtiqueta.thruDate.value = " ";
			alert("Fechas vacias o formato incorrecto");
		}	
   }
</script>
<@frameSection title=uiLabelMap.PresupuestoAdminEtiquetas >
	<@form name="creaEtiqueta" url="creaEtiqueta" id="creaEtiqueta">
	<table>
		<@inputTextRow name="etiquetaId" title=uiLabelMap.PresupuestoEtiquetaId size=20 maxlength=20 titleClass="requiredField"/>
		<@inputTextRow name="descripcion" title=uiLabelMap.CommonDescription size=50 maxlength=20 titleClass="requiredField"/>
		<@inputDateRangeRow title=uiLabelMap.PresupuestoFechaVigencia fromName="fromDate" thruName="thruDate" titleClass="requiredField"/>
	</table>
	</@form>
	<table>
		<td style="width:187px"></td>
		<@inputSubmitRow  title=uiLabelMap.CommonCreate onClick="validarFecha();"/>	
	</table>
</@frameSection>
