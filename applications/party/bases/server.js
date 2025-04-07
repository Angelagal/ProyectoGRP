import pkg from "pg";
import cors from "cors";
import express from "express";
import bodyParser from 'body-parser';



import { Party, Person, UserLogin } from "./index.js";

const { Pool } = pkg;
const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "contableA1",
  password: "1234",
  port: 5432,
});

app.get('/', (req, res) => {
  res.json({saludo: "Hola mundo!"});
});

// ✅ Obtener todos los usuarios
app.get("/usuarios", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM usuario");
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// ✅ Obtener un usuario por empleado
app.get("/usuarios/:empleado", async (req, res) => {
  const { empleado } = req.params;

  try {
    const result = await pool.query("SELECT * FROM usuario WHERE empleado = $1", [empleado]);

    if (result.rowCount === 0) {
      return res.status(404).json({ error: "Usuario no encontrado" });
    }

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// ✅ Alternar el estado de activo
app.put("/usuarios/:empleado/toggle", async (req, res) => {
  const { empleado } = req.params;

  try {
    // Obtener el estado actual
    const usuario = await pool.query("SELECT activo FROM usuario WHERE empleado = $1", [empleado]);

    if (usuario.rowCount === 0) {
      return res.status(404).json({ error: "Usuario no encontrado" });
    }

    // Cambiar el estado
    const nuevoEstado = !usuario.rows[0].activo;
    await pool.query("UPDATE usuario SET activo = $1 WHERE empleado = $2", [nuevoEstado, empleado]);

    res.json({ success: true, activo: nuevoEstado });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// ✅ Crear un nuevo usuario
app.post("/usuarios", async (req, res) => {
  const { rusp, empleado, nombre, apellido, puesto, zona_geografica, usuario, correo, grupo, rol, activo } = req.body;

  if (!empleado || !nombre || !correo) {
    return res.status(400).json({ error: "Los campos empleado, nombre y correo son obligatorios" });
  }

  try {
    const result = await pool.query(
      `INSERT INTO usuario (rusp, empleado, nombre, apellido, puesto, zona_geografica, usuario, correo, grupo, rol, activo) 
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *`,
      [rusp, empleado, nombre, apellido, puesto, zona_geografica, usuario, correo, grupo, rol, activo]
    );

    res.status(201).json({ message: "Usuario creado", usuario: result.rows[0] });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// ✅ Editar usuario
app.put("/usuarios/:id_usuario", async (req, res) => {
  const { id_usuario } = req.params;
  const {rusp, empleado, nombre, apellido, puesto, zona_geografica, usuario, correo, grupo, rol, activo } = req.body;
  try {
    const result = await pool.query(
      `UPDATE usuario SET (rusp, empleado, nombre, apellido, puesto, zona_geografica, usuario, correo, grupo, rol, activo) 
      = ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) WHERE id_usuario = ${id_usuario} `,
      [rusp, empleado, nombre, apellido, puesto, zona_geografica, usuario, correo, grupo, rol, activo]
    );

    res.status(201).json({ message: "Usuario actualizado", usuario: result.rows[0] });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Obtener participantes
app.get("/parties", async (req, res) => {
  try {
    const { partyId, apellidos, nombre, usuario } = req.query;

    if (!partyId) {
      return res.status(400).json({ msg: "partyId es requerido" });
    }

    const usuarioEncontrado = await Party.findOne({
      where: {
        party_id: partyId
      },
      include: [
        {
          model: Person,
          as: "person"
        },
        {
          model: UserLogin,
          as: "user_login"
        }
      ]
    });

    if (!usuarioEncontrado) {
      return res.status(404).json({ msg: "Usuario no encontrado"});
    }

    res.json(usuarioEncontrado);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get("/parties/:partyId", async (req, res) => {
  try {
    const { partyId } = req.params;

    if (!partyId) {
      return res.status(400).json({ msg: "partyId es requerido" });
    }

    const usuarioEncontrado = await Party.findOne({
      where: {
        party_id: partyId
      },
      include: [
        {
          model: Person,
          as: "person"
        },
      ]
    });

    if (!usuarioEncontrado) {
      return res.status(404).json({ msg: "Usuario no encontrado"});
    }

    res.json(usuarioEncontrado);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.put("/parties/:partyId/users/desactivar", async (req, res) => {
  try {
    const { partyId } = req.params;

    if (!partyId) {
      return res.status(400).json({ msg: "partyId es requerido" });
    }

    const usuariosEncontrados = await UserLogin.findAll({
      where: {
        party_id: partyId
      },
    });

    usuariosEncontrados.forEach(async usuario => {
      await usuario.update({
        enabled: 'N',
        disabled_date_time: new Date(),
      });
    });

    res.status(200).json({
      status: true,
      msg: "Usuarios desactivados con éxito."
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.put("/parties/:partyId/users/activar", async (req, res) => {
  try {
    const { partyId } = req.params;

    if (!partyId) {
      return res.status(400).json({ msg: "partyId es requerido" });
    }

    const usuariosEncontrados = await UserLogin.findAll({
      where: {
        party_id: partyId
      },
    });

    usuariosEncontrados.forEach(async usuario => {
      await usuario.update({
        enabled: 'Y',
        disabled_date_time: null,
      });
    });

    res.status(200).json({
      status: true,
      msg: "Usuarios activados con éxito."
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// 🔵 NUEVA CONSULTA: Historial de cambio sin filtrar por empleado
app.get("/historial-cambios", async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT * FROM historico_cambio ORDER BY fecha DESC"  // Sin filtrar por 'empleado'
    );

    if (result.rowCount === 0) {
      return res.status(404).json({ msg: "No se encontró historial de cambios" });
    }

    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

///obtener el usuario
/*app.get("/user_login/:username", async (req, res) => {
  const { username } = req.params;

  try {
    const result = await pool.query(`
      SELECT party_id FROM user_login WHERE user_login_id = $1
    `, [username]);

    if (result.rowCount === 0) {
      return res.status(404).json({ error: "Usuario no encontrado" });
    }

    res.json({ partyId: result.rows[0].party_id });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
});*/


// Caducidad de la contraseña
/*app.get("/party/:partyId/caducidad", async (req, res) => {
  const { partyId } = req.params;

  if (!partyId) {
    return res.status(400).json({ error: "El partyId es requerido" });
  }

  try {
    // Obtener la fecha de creación de la contraseña desde la tabla 'party'
    const result = await pool.query(`
      SELECT fecha_creacion_contrasenia 
      FROM party 
      WHERE party_id = $1
    `, [partyId]);

    if (result.rowCount === 0) {
      return res.status(404).json({ error: "Usuario no encontrado" });
    }

    const fechaCreacion = result.rows[0].fecha_creacion_contrasenia;
    const fechaActual = new Date();
    const diferenciaEnMilisegundos = fechaActual - new Date(fechaCreacion);
    const diasDiferencia = Math.floor(diferenciaEnMilisegundos / (1000 * 60 * 60 * 24)); // Convertir milisegundos a días

    if (diasDiferencia > 5) {
      return res.json({ passwordCaducada: true });
    } else {
      return res.json({ passwordCaducada: false });
    }

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
});*/

//Ruta para la fecha de creacion y  la  contraseña

app.get('/getPasswordInfo', async (req, res) => {
  const { username } = req.query; // Aquí esperamos el parámetro en la URL

  try {
    console.log("Consultando usuario:", username); // Para verificar el valor recibido

    const result = await pool.query(
      `SELECT fecha_creacion_contrasenia, current_password
       FROM user_login 
       WHERE user_login_id = $1`, 
      [username]
    );

    console.log("Resultado de la consulta:", result.rows);

    if (result.rows.length > 0) {
      res.json({
        fechaCreacion: result.rows[0].fecha_creacion_contrasenia,
        currentPassword: result.rows[0].current_password
      });
    } else {
      res.status(404).json({ message: "Usuario no encontrado" });
    }
  } catch (error) {
    console.error("Error en la consulta SQL:", error);
    res.status(500).json({ message: "Error interno del servidor", error: error.message });
  }
});



// Ruta para actualizar la contraseña y la fecha de creación
app.put("/updatePassword", async (req, res) => {
  const { username, newPassword } = req.body;

  if (!username || !newPassword) {
    return res.status(400).json({ error: "El nombre de usuario y la nueva contraseña son obligatorios." });
  }

  try {
    // Actualizar la contraseña y la fecha de creación en la base de datos
    const result = await pool.query(
      `UPDATE user_login 
       SET current_password = $1, fecha_creacion_contrasenia = NOW() 
       WHERE user_login_id = $2 RETURNING *`,
      [newPassword, username]
    );

    if (result.rowCount === 0) {
      return res.status(404).json({ error: "Usuario no encontrado" });
    }

    res.json({ message: "Contraseña actualizada con éxito", usuario: result.rows[0] });
  } catch (error) {
    console.error("Error al actualizar la contraseña:", error);
    res.status(500).json({ error: error.message });
  }
});

// ✅ Insertar en uom_conversion_dated
app.post("/uom_conversion_dated", async (req, res) => {
  const { uom_id, uom_id_to, conversion_factor, from_date, thru_date } = req.body;

  if (!uom_id || !uom_id_to || !conversion_factor) {
    return res.status(400).json({ error: "Los campos uom_id, uom_id_to y conversion_factor son obligatorios" });
  }

  try {
    const result = await pool.query(
      `INSERT INTO uom_conversion_dated (uom_id, uom_id_to, conversion_factor, from_date, thru_date) 
       VALUES ($1, $2, $3, $4, $5) RETURNING *`,
      [uom_id, uom_id_to, conversion_factor, from_date, thru_date]
    );

    res.status(201).json({ message: "Conversión insertada", conversion: result.rows[0] });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});




//Insertar Usuario
app.post("/insertar", async (req, res) => {
  const { party_id, geo_id, employee_num, puesto, first_name, last_name } = req.body;

  console.log("Datos recibidos en el backend:", { party_id, geo_id, employee_num, puesto, first_name, last_name });

  // Validación de campos obligatorios
  const camposFaltantes = [];
  if (!geo_id) camposFaltantes.push("geo_id");
  if (!employee_num) camposFaltantes.push("employee_num");
  if (!puesto) camposFaltantes.push("puesto");
  if (!first_name) camposFaltantes.push("first_name");
  if (!last_name) camposFaltantes.push("last_name");

  if (camposFaltantes.length > 0) {
    return res.status(400).json({
      error: "Faltan campos obligatorios: " + camposFaltantes.join(", "),
    });
  }

  try {
    let partyId = party_id;

    if (party_id) {
      const resultCheckPartyId = await pool.query(
        `SELECT * FROM party WHERE party_id = $1`,
        [party_id]
      );

      if (resultCheckPartyId.rowCount > 0) {
        return res.status(400).json({
          error: "El party_id proporcionado ya existe.",
        });
      }
    } else {
      partyId = uuidv4(); // Generar uno nuevo si no viene
    }

    const fechaActual = new Date(); // Fecha en formato ISO

    await pool.query(
      `INSERT INTO party (
        party_id, geo_id, employee_num, puesto, first_name, last_name,
        created_date, last_modified_date, last_updated_stamp, last_updated_tx_stamp,
        created_stamp, created_tx_stamp
      ) VALUES (
        $1, $2, $3, $4, $5, $6,
        $7, $8, $9, $10, $11, $12
      )`,
      [
        partyId, geo_id, employee_num, puesto, first_name, last_name,
        fechaActual, fechaActual, fechaActual, fechaActual, fechaActual, fechaActual
      ]
    );

    console.log("Datos insertados correctamente en la base de datos.");

    return res.status(200).json({ message: "Registro exitoso", party_id: partyId });

  } catch (error) {
    console.error("Error al insertar:", error);
    return res.status(500).json({ error: "Error interno del servidor" });
  }
});



// Obtener datos de un usuario por partyId
app.get('/obtenerUsuario/:partyId', async (req, res) => {
  const { partyId } = req.params;
  try {
    const result = await pool.query('SELECT * FROM usuario WHERE party_id = $1', [partyId]);
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Usuario no encontrado' });
    }
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: 'Error al obtener usuario' });
  }
});

// Editar puesto y geo_id
app.post('/editar', async (req, res) => {
  const { party_id, puesto, geo_id } = req.body;
  try {
    await pool.query(
      'UPDATE usuario SET puesto = $1, geo_id = $2 WHERE party_id = $3',
      [puesto, geo_id, party_id]
    );
    res.json({ mensaje: 'Usuario actualizado correctamente' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Error al actualizar usuario' });
  }
});










// Iniciar el servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});