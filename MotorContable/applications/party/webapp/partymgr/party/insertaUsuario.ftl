<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Editar Usuario</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: sans-serif;
      background-color: #f4f4f4;
    }

    .center-wrapper {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      min-height: 100vh;
      padding-top: 50px;
    }

    .form-container {
      background-color: #ffffff;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 500px;
    }

    h1 {
      text-align: center;
      color: #333;
      margin-bottom: 25px;
      font-size: 25px; /* Puedes ajustar este valor según tu preferencia */
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #555;
      font-weight: bold;
      font-size: 20px; /* Puedes ajustar este valor según tu preferencia */
    }

    input[type="text"],
    select {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 16px;
    }

    button {
      width: 100%;
      background-color: #235e52;
      color: white;
      padding: 12px;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #235e52;
    }

  </style>
</head>
<body>
  <div class="center-wrapper">
    <div class="form-container">
      <h1><p><b>Editar Usuario</b></p></h1>
      <form id="editForm">
        <label for="puesto">Puesto:</label>
        <input type="text" id="puesto" name="puesto" required>

        <label for="geo_id">Geo ID:</label>
          <select id="geo_id" name="geo_id" required style="font-size: 18px; padding: 14px; height: 50px; color: #000; background-color: #fff;">
            <option value="">Seleccione Geo ID</option>
            <option value="Aguascalientes">Aguascalientes</option>
            <option value="Baja California">Baja California</option>
            <option value="Baja California Sur">Baja California Sur</option>
            <option value="Campeche">Campeche</option>
            <option value="Chiapas">Chiapas</option>
            <option value="Chihuahua">Chihuahua</option>
            <option value="Ciudad de México">Ciudad de M&eacute;xico</option>
            <option value="Coahuila">Coahuila</option>
            <option value="Colima">Colima</option>
            <option value="Durango">Durango</option>
            <option value="Estado de México">Estado de M&eacute;xico</option>
            <option value="Guanajuato">Guanajuato</option>
            <option value="Guerrero">Guerrero</option>
            <option value="Hidalgo">Hidalgo</option>
            <option value="Jalisco">Jalisco</option>
            <option value="Michoacán">Michoac&aacute;n</option>
            <option value="Morelos">Morelos</option>
            <option value="Nayarit">Nayarit</option>
            <option value="Nuevo León">Nuevo Le&oacute;n</option>
            <option value="Oaxaca">Oaxaca</option>
            <option value="Puebla">Puebla</option>
            <option value="Querétaro">Quer&eacute;taro</option>
            <option value="Quintana Roo">Quintana Roo</option>
            <option value="San Luis Potosí">San Luis Potos&iacute;</option>
            <option value="Sinaloa">Sinaloa</option>
            <option value="Sonora">Sonora</option>
            <option value="Tabasco">Tabasco</option>
            <option value="Tamaulipas">Tamaulipas</option>
            <option value="Tlaxcala">Tlaxcala</option>
            <option value="Veracruz">Veracruz</option>
            <option value="Yucatán">Yucat&aacute;n</option>
            <option value="Zacatecas">Zacatecas</option>
          </select>
        <button type="submit">Actualizar</button>
      </form>
    </div>
  </div>

  <script>
    const partyId = 'PONER_ID_AQUÍ'; // Reemplaza esto dinámicamente o desde backend

    document.getElementById('editForm').addEventListener('submit', function(event) {
      event.preventDefault();

      const puesto = document.getElementById('puesto').value;
      const geo_id = document.getElementById('geo_id').value;

      fetch(`http://localhost:3000/editarCampos/${partyId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ puesto, geo_id })
      })
      .then(res => res.json())
      .then(data => {
        alert("Campos actualizados correctamente.");
        console.log(data);
      })
      .catch(err => {
        alert("Error al actualizar.");
        console.error("Error:", err);
      });
    });
  </script>
</body>
</html>

