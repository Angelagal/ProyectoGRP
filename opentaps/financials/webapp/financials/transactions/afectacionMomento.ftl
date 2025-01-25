<@import location="component://opentaps-common/webapp/common/includes/lib/opentapsFormMacros.ftl"/>
<script language="JavaScript" type="text/javascript">
	function cargaEventos(/*String*/ moduloId){
		var requestData = {'moduloId' : moduloId};	    			    
		    	opentaps.sendRequest('getEventosAfectacion', requestData, function(data) {llenaComboEventos(data)});
	}
	
	function llenaComboEventos(data){
		var idDefecto = '${parameters.acctgTransTypeId!}';
		i = 0;				
		var select = document.getElementById("acctgTransTypeId");
		select.innerHTML = "";
		for (var key in data) 
		{	if(data[key]=="ERROR")
			{	select.innerHTML = "";
			}
			else
			{	select.options[i] = new Option(data[key]);
				select.options[i].value = key;	
				if(key == idDefecto){
					select.options[i].selected = true;
					acctgTransTypeId = idDefecto;
				} 
			  	i++;
			}	    		
		}	
	}
</script>

<script>
  function validarFecha(){
    var fecha_ini = document.getElementById("fechaInicial").value;
		fecha_ini = fecha_ini.replace(/\D/g, ' ');
		var componentes = fecha_ini.split(' ');
		var fechaIni = new Date(componentes[2]+"/"+componentes[1]+"/"+componentes[0]);
		
		var fecha_fin = document.getElementById("fechaFinal").value;
		fecha_fin = fecha_fin.replace(/\D/g, ' ');
		var componentes1 = fecha_fin.split(' ');
		var fechaFin = new Date(componentes1[2]+"/"+componentes1[1]+"/"+componentes1[0]);

    if(fechaIni < fechaFin)
				{	
					alert("Generando busqueda");
					document.getElementById('buscarClasificacion').submit();
				}else if(fechaIni >= fechaFin){
					alert("La fecha inicial no puede ser mayor o igual a la final");
					document.BuscaAfectacion.fechaInicial.value = " ";
					document.BuscaAfectacion.fechaFinal.value = " ";
				}else if((fechaIni != " ") && (fechaFin != " ")){
					document.BuscaAfectacion.fechaInicial.value = " ";
					document.BuscaAfectacion.fechaFinal.value = " ";
				}	
  }
</script>

<@frameSection title=uiLabelMap.FinancialsConsultarMomento>

<@form name="BuscaAfectacion" url="">
	<table>
	  <tr>
        <@displayTitleCell title=uiLabelMap.FinancialTipoAfectacion + " *"/>
        <@inputSelectHashCell hash= {"":"","CONTABILIDAD_E":"EGRESO", "CONTABILIDAD_I":"INGRESO"} id="moduloId" name="moduloId" onChange="cargaEventos(this.value);"/>
      </tr> 
		<tr>
        <@displayTitleCell title=uiLabelMap.FinancialsTipoEvento />
			<td>
			<select id="acctgTransTypeId" name="acctgTransTypeId" class="inputBox">
			</select>
			</td>
      	</tr>
		<@inputTextRow name="numeroPoliza" title=uiLabelMap.FormFieldTitle_numeroPoliza />
		<@inputDateRow name="fechaTransaccion" title=uiLabelMap.FinancialsTransactionDate form="BuscaAfectacion" id="fechaInicial" />
		<@inputDateRow name="fechaContable" title=uiLabelMap.FinancialsAccountigDate form="BuscaAfectacion" id="fechaFinal"/>
		<@inputTextRow name="comentario" title=uiLabelMap.FormFieldTitleComentario />
		<@inputSubmitRow title=uiLabelMap.CommonFind onClick="validarFecha();"/> 
	</table>
</@form>
<strong style="font-size: 12px;color: grey;">* Campos obligatorios</strong>
<@paginate name="listAfectacionListBuilder" list=afectacionListBuilder rememberPage=false>
    <#noparse>
        <@navigationHeader/>
        <table class="listTable">
            <tr class="listTableHeader">
                <@headerCell title=uiLabelMap.NumeroAfectacion orderBy="afectacionId"/>
				<@headerCell title=uiLabelMap.FormFieldTitle_numeroPoliza orderBy="poliza"/>
                <@headerCell title=uiLabelMap.FinancialsTransactionDate orderBy="transactionDate"/>
                <@headerCell title=uiLabelMap.FinancialsAccountigDate orderBy="postedDate"/>
                <@headerCell title=uiLabelMap.Comentario orderBy="description"/>
            </tr>
            <#list pageRows as row>
            <tr class="${tableRowClass(row_index)}">
                <@displayLinkCell href="VerAfectaMomento?acctgTransTypeId=${row.eventoSeleccionado}&afectacionId=${row.afectacionId}" text=row.afectacionId/>
                <@displayCell text=row.poliza/>
                <@displayCell text=row.transactionDate/>
                <@displayCell text=row.postedDate/>
				<@displayCell text=row.description/> 
            </tr>
            </#list>
        </table>
    </#noparse>
</@paginate>

</@frameSection>
<script type="text/javascript">
	var moduloId = document.getElementById('moduloId').value;
    opentaps.addOnLoad(cargaEventos(moduloId));
</script>