<!-- Botón para abrir el modal -->
<div style="margin-top: 20px; margin-left: 200px;">
    <button type="button" onclick="document.getElementById('zonaModal').style.display='block'">
        <strong>Zona Geogr&aacute;fica</strong>
    </button>
<!-- Campo de destino (donde se mostrará la zona seleccionada) -->
<input 
  type="text" 
  id="EditPerson_geoId" 
  readonly 
  style="margin-left: 20px; width: 300px; height: 20px; font-size: 16px; padding: 5px;" 
/>
</div>
<!-- Modal -->
<div id="zonaModal" style="display:none; position:fixed; z-index:1000; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.4);">
    <div style="background-color:#fff; margin:10% auto; padding:20px; border:1px solid #888; width:60%; border-radius:10px; position:relative;">
        
        <!-- Botón cerrar -->
        <span onclick="document.getElementById('zonaModal').style.display='none'"
              style="color:#aaa; float:right; font-size:28px; font-weight:bold; cursor:pointer;">&times;</span>

        <h2>Zona Geográfica</h2>

        <!-- Lista desplegable + botón "Seleccionar" -->
        <div style="display: flex; align-items: center; gap: 10px;">
            <select name="zonaGeografica" id="zonaGeografica">
                <option value="">-- Selecciona una opción --</option>
                <option value="Aguascalientes">Aguascalientes</option>
                <option value="Baja California">Baja California</option>
                <option value="Baja California Sur">Baja California Sur</option>
                <option value="Campeche">Campeche</option>
                <option value="Chiapas">Chiapas</option>
                <option value="Chihuahua">Chihuahua</option>
                <option value="Ciudad de M&eacute;xico">Ciudad de M&eacute;xico</option>
                <option value="Coahuila">Coahuila</option>
                <option value="Colima">Colima</option>
                <option value="Durango">Durango</option>
                <option value="Estado de M&eacute;xico">Estado de M&eacute;xico</option>
                <option value="Guanajuato">Guanajuato</option>
                <option value="Guerrero">Guerrero</option>
                <option value="Hidalgo">Hidalgo</option>
                <option value="Jalisco">Jalisco</option>
                <option value="Michoac&aacute;n">Michoac&aacute;n</option>
                <option value="Morelos">Morelos</option>
                <option value="Nayarit">Nayarit</option>
                <option value="Nuevo Le&oacute;n">Nuevo Le&oacute;n</option>
                <option value="Oaxaca">Oaxaca</option>
                <option value="Puebla">Puebla</option>
                <option value="Quer&eacute;taro">Quer&eacute;taro</option>
                <option value="Quintana Roo">Quintana Roo</option>
                <option value="San Luis Potos&iacute;">San Luis Potos&iacute;</option>
                <option value="Sinaloa">Sinaloa</option>
                <option value="Sonora">Sonora</option>
                <option value="Tabasco">Tabasco</option>
                <option value="Tamaulipas">Tamaulipas</option>
                <option value="Tlaxcala">Tlaxcala</option>
                <option value="Veracruz">Veracruz</option>
                <option value="Yucat&aacute;n">Yucat&aacute;n</option>
                <option value="Zacatecas">Zacatecas</option>
            </select>

            <button type="button" onclick="seleccionarZona()">Seleccionar</button>
        </div>
    </div>
</div>

<!-- Script -->
<script>
function seleccionarZona() {
    const valorSeleccionado = document.getElementById("zonaGeografica").value;
    if (valorSeleccionado) {
        document.getElementById("EditPerson_geoId").value = valorSeleccionado;
        document.getElementById("zonaModal").style.display = "none";
    } else {
        alert("Por favor selecciona una zona geográfica.");
    }
}

function validarFormulario() {
  const geoId = document.getElementById('EditPerson_geoId').value;
  if (!geoId) {
    alert('El campo "Zona Geográfica" es obligatorio.');
    return false; // evita que se envíe el formulario
  }
  return true; // permite el envío si todo está bien
}
</script>

