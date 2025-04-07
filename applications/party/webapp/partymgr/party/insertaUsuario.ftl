<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Formulario de Usuario</title>
  <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <style>
    .success { color: green; }
    .error { color: red; }
    input[disabled] {
      background-color: #eee;
      color: #666;
    }
    .perfil-btn {
      margin-left: 20px;
    }
  </style>
</head>
<body>
 <!-- Comprobación rápida -->
  <p>Party ID recibido: ${partyId!"NO DEFINIDO"}</p>

<div id="app">
  <h1>Formulario de Usuario</h1>

  <form v-if="!formDesactivado" @submit.prevent="submitForm">
    <label>Party ID (opcional):</label><br>
    <input type="text" v-model="party_id" :disabled="formDesactivado"><br><br>

    <label>Empleado:</label><br>
    <input type="text" v-model="employee_num" required :disabled="formDesactivado"><br><br>

    <label>Puesto:</label><br>
    <input type="text" v-model="puesto" required :disabled="formDesactivado"><br><br>

    <label>Nombre(s):</label><br>
    <input type="text" v-model="first_name" required :disabled="formDesactivado"><br><br>

    <label>Apellido(s):</label><br>
    <input type="text" v-model="last_name" required :disabled="formDesactivado"><br><br>

    <label>Zona Geográfica:</label><br>
    <input type="text" v-model="geo_id" required :disabled="formDesactivado" placeholder="Ingresa la zona geográfica"><br><br>

    <button type="submit" :disabled="formDesactivado">Registrar</button>

    <!-- Botón de Perfil -->
    <a
      class="perfil-btn"
      v-if="formDesactivado && party_id"
      :href="'http://localhost/partymgr/control/viewprofile?partyId=' + party_id"
      target="_blank"
    >
      <button type="button">Perfil</button>
    </a>
  </form>

  <!-- Formulario de Edición -->
  <form v-if="formDesactivado" @submit.prevent="guardarEdicion">
    <label>Party ID (opcional):</label><br>
    <input type="text" v-model="party_id" :disabled="formDesactivado"><br><br>

    <label>Empleado:</label><br>
    <input type="text" v-model="employee_num" required :disabled="formDesactivado"><br><br>

    <label>Puesto:</label><br>
    <input type="text" v-model="puesto" required :disabled="formDesactivado"><br><br>

    <label>Nombre(s):</label><br>
    <input type="text" v-model="first_name" required :disabled="formDesactivado"><br><br>

    <label>Apellido(s):</label><br>
    <input type="text" v-model="last_name" required :disabled="formDesactivado"><br><br>

    <label>Zona Geográfica:</label><br>
    <input type="text" v-model="geo_id" required :disabled="formDesactivado" placeholder="Ingresa la zona geográfica"><br><br>

    <button type="submit" :disabled="formDesactivado">Guardar Cambios</button>

    <!-- Botón de Perfil -->
    <a
      class="perfil-btn"
      v-if="formDesactivado && party_id"
      :href="'http://localhost/partymgr/control/viewprofile?partyId=' + party_id"
      target="_blank"
    >
      <button type="button">Perfil</button>
    </a>
  </form>

  <p :class="messageClass">{{ message }}</p>
</div>

<script>
  new Vue({
    el: '#app',
    data: {
      party_id: '',
      employee_num: '',
      puesto: '',
      first_name: '',
      last_name: '',
      geo_id: '',
      message: '',
      messageClass: '',
      formDesactivado: false,
      palabraIngresada: '',
      esCorrecta: false
    },
    methods: {
      verificarEnTiempoReal() {
      this.esCorrecta = this.palabraIngresada === 'Aguascalientes';
      },
      // Cargar datos del usuario al acceder a la página de edición
      cargarDatosUsuario() {
        const urlParams = new URLSearchParams(window.location.search);
        this.party_id = urlParams.get('partyId'); // Obtener el partyId de la URL

        if (this.party_id) {
          axios.get(`http://localhost:3000/obtenerUsuario/${this.party_id}`)
            .then((response) => {
              this.employee_num = response.data.employee_num || '';
              this.puesto = response.data.puesto || '';
              this.first_name = response.data.first_name || '';
              this.last_name = response.data.last_name || '';
              this.geo_id = response.data.geo_id || '';
              this.formDesactivado = true; // Habilitar el formulario para edición
            })
            .catch((error) => {
              this.message = 'Usuario no encontrado';
              this.messageClass = 'error';
            });
        }
      },
      submitForm() {
        // Validación
        if (!this.geo_id) {
          this.message = 'La zona geográfica es obligatoria.';
          this.messageClass = 'error';
          return;
        }

        const formData = {
          party_id: this.party_id,
          geo_id: this.geo_id,
          employee_num: this.employee_num,
          puesto: this.puesto,
          first_name: this.first_name,
          last_name: this.last_name
        };

        // Enviar datos para registrar
        axios.post('http://localhost:3000/insertar', formData)
          .then((response) => {
            this.message = 'Registro exitoso. ID generado: ' + response.data.party_id;
            this.messageClass = 'success';
            this.formDesactivado = true;

            if (!this.party_id) {
              this.party_id = response.data.party_id;
            }
          })
          .catch((error) => {
            const msg = error.response && error.response.data && error.response.data.error
              ? error.response.data.error
              : 'Error al registrar';
            this.message = msg;
            this.messageClass = 'error';
          });
      },
      guardarEdicion() {
        // Validación
        if (!this.geo_id) {
          this.message = 'La zona geográfica es obligatoria.';
          this.messageClass = 'error';
          return;
        }

        const formData = {
          party_id: this.party_id,
          geo_id: this.geo_id,
          puesto: this.puesto
        };

        // Enviar datos para editar
        axios.post('http://localhost:3000/editar', formData)
          .then((response) => {
            this.message = 'Cambios guardados correctamente.';
            this.messageClass = 'success';
            this.formDesactivado = true;

            // Redirigir al perfil
            if (this.party_id) {
              setTimeout(() => {
                window.location.href = `http://localhost/partymgr/control/viewprofile?partyId=${this.party_id}`;
              }, 2000);
            } else {
              this.message = 'No se pudo redirigir: party_id inválido.';
              this.messageClass = 'error';
            }
          })
          .catch((error) => {
            this.message = 'Error al guardar los cambios.';
            this.messageClass = 'error';
          });
      }
    },
    mounted() {
      this.cargarDatosUsuario(); // Llamar la función cuando se monta el componente
    }
  });
</script>
</body>
</html>
