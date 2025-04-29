<!-- Código de historial-cambio.html (ajustado) -->
<!DOCTYPE html>
<html>
<head>
  <title>Tipo de Cambio</title>
  <script src="/partymgr/static/js/vue.js"></script>
  <script src="/partymgr/static/js/axios.js"></script>
  <style>
    /* Estilos generales */
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      color: #333;
      margin: 0;
      padding: 0;
    }
    #app {
      max-width: 900px;
      margin: 50px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    label {
      font-size: 14px;
      margin-right: 10px;
    }

    input[type="date"] {
      padding: 8px;
      border-radius: 4px;
      border: 1px solid #ccc;
      margin-bottom: 10px;
    }

    button {
      background-color:#235B4E !important;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color:#235B4E !important;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      text-align: left;
    }

    th, td {
      padding: 12px 15px;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #f2f2f2;
      color: #333;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    td button {
      background-color:#235B4E !important;
      color: white;
      padding: 6px 12px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 12px;
      transition: background-color 0.3s ease;
    }

    td button:hover {
      background-color:#235B4E !important;
    }

    .pagination {
      margin-top: 20px;
      text-align: center;
    }

    .pagination button {
      background-color:#235B4E !important;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
      margin: 0 5px;
    }

    .pagination button:hover {
      background-color:#235B4E !important;
    }

    .pagination span {
      margin: 0 10px;
      font-size: 14px;
    }

    .no-results {
      text-align: center;
      color: #999;
      font-size: 16px;
    }

  </style>
</head>
<body>
  <div id="app">
    <h1><b>Hist&oacuterico de Cambio</b></h1>
    <br>
    <div>
        <h1>Cotizaci&oacute;n</h1>
          <p><strong>Precio Actual:</strong> {{ cotizacion.close }}
           <button style="font-size: 12px; padding: 3px 7px; margin-left: 10px;" @click="seleccionarDia">Seleccionar</button>
          </p>
          <p><strong>&Uacute;ltima Actualizaci&oacute;n:</strong> {{ cotizacion.datetime }}</p>
    </div>
    <br> 
    <label for="fechaInicio" style="font-weight: bold; display: inline-block; width: 100px; text-align: center; margin-right: 10px;">
      Fecha Inicio:
    </label>
    <input type="date" v-model="fechaInicio" id="fechaInicio" style="display: inline-block; margin-right: 20px;">

    <label for="fechaFin" style="font-weight: bold; display: inline-block; width: 100px; text-align: center; margin-right: 10px;">
      Fecha Fin:
    </label>
    <input type="date" v-model="fechaFin" id="fechaFin" style="display: inline-block;">

    <button @click="buscarPorRango">Buscar</button>

    <!-- Tabla con la nueva columna Seleccionar -->
    <table v-if="filasFiltradas.length > 0">
      <thead>
        <tr>
          <th>Fecha</th>
          <th>De Moneda</th>
          <th>A Moneda</th>
          <th>Tasa</th>
          <th>Seleccionar</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="fila in filasPaginadas" :key="fila.id">
          <td>{{ formatearFecha(fila.fecha) }}</td>
          <td>{{ fila.de_moneda }}</td>
          <td>{{ fila.a_moneda }}</td>
          <td>{{ fila.tasa }}</td>
          <td><button @click="seleccionarRenglon(fila)">Seleccionar</button></td>
        </tr>
      </tbody>
    </table>

    <div v-if="filasFiltradas.length === 0" class="no-results">
      No hay resultados para el rango seleccionado.
    </div>

    <div class="pagination" v-if="filasFiltradas.length > 0">
      <button @click="paginaAnterior" :disabled="paginaActual === 1">Anterior</button>
      <span>P&aacutegina {{ paginaActual }} de {{ totalPaginas }}</span>
      <button @click="paginaSiguiente" :disabled="paginaActual === totalPaginas">Siguiente</button>
    </div>
  </div>

  <script>
  new Vue({
    el: '#app',
    data: {
      cotizacion: {},
      fechaInicio: '',
      fechaFin: '',
      rows: [], // Datos reales de la API
      filasFiltradas: [],
      paginaActual: 1,
      filasPorPagina: 5,
      seleccionados: [] // Array para almacenar los elementos seleccionados
    },
    computed: {
      totalPaginas() {
        return Math.ceil(this.filasFiltradas.length / this.filasPorPagina) || 1;
      },
      filasPaginadas() {
        const inicio = (this.paginaActual - 1) * this.filasPorPagina;
        const fin = inicio + this.filasPorPagina;
        return this.filasFiltradas.slice(inicio, fin);
      }
    },
    methods: {
      async cargarDatos() {
        try {
          const respuesta = await axios.get("http://localhost:3000/historial-cambios");
          this.rows = respuesta.data;
          this.filasFiltradas = []; // Inicialmente no mostrar datos
        } catch (error) {
          console.error("Error cargando datos:", error);
        }
      },
  
      buscarPorRango() {
        if (!this.fechaInicio || !this.fechaFin) {
          this.filasFiltradas = []; // Asegurar que la tabla se mantenga vacía
          return;
        }

        const inicio = new Date(this.fechaInicio);
        const fin = new Date(this.fechaFin);

        const diferenciaDias = (fin - inicio) / (1000 * 60 * 60 * 24);

        // Validar que el rango no sea mayor a 15 días
        if (diferenciaDias >= 15) {
          alert('El rango seleccionado no puede ser mayor a 15 días.');
          return;
        }

        // Validar que la fecha de inicio no sea mayor que la fecha de fin
        if (inicio > fin) {
          alert('La fecha de inicio no puede ser mayor que la fecha de fin.');
          return;
        }

        // Si la diferencia es 0 (mismo día), también se permite la búsqueda
        if (diferenciaDias >= 0) {
          this.filasFiltradas = this.rows.filter(row => {
            const fechaRow = new Date(row.fecha);
            return fechaRow >= inicio && fechaRow <= fin;
          });

          this.paginaActual = 1;
        } else {
          alert('La fecha de fin debe ser igual o posterior a la fecha de inicio.');
        }
      },
      
      paginaAnterior() {
        if (this.paginaActual > 1) {
          this.paginaActual--;
        }
      },
      paginaSiguiente() {
        if (this.paginaActual < this.totalPaginas) {
          this.paginaActual++;
        }
      },
      formatearFecha(fecha) {
        if (!fecha) return '';
        return new Date(fecha).toISOString().slice(0, 10); // YYYY-MM-DD
      },
      seleccionarDia() {
    // Obtener el valor de la cotización
    const cotizacionValor = this.cotizacion.close;

    // Comprobar si el valor de la cotización está disponible
    if (!cotizacionValor) {
      alert('No hay valor de cotización disponible.');
      return;
    }

    // Asignar los valores a los campos 'uomId' y 'uomIdTo'
    document.getElementById('updateExchangeRate_uomId').value = 'MXN';  // Valor para 'De Moneda'
    document.getElementById('updateExchangeRate_uomIdTo').value = 'USD'; // Valor para 'A Moneda'

    // Comprobar si los valores de uomId y uomIdTo son los esperados
    const uomId = document.getElementById('updateExchangeRate_uomId').value;
    const uomIdTo = document.getElementById('updateExchangeRate_uomIdTo').value;

    if (uomId === 'MXN' && uomIdTo === 'USD') {
      // Solo si los valores son correctos, pegar la tasa en el campo correspondiente
      document.getElementById('updateExchangeRate_conversionFactor').value = cotizacionValor;

      // Guardar la tasa seleccionada en localStorage
      localStorage.setItem('tasaSeleccionada', cotizacionValor);
    } else {
      // Si los valores no son los esperados, no pegar la tasa y mostrar un mensaje
      alert('Los valores de moneda no son correctos.');
    }
  },

      seleccionarRenglon(fila) {
        // Asignar los valores a los campos 'uomId' y 'uomIdTo'
        document.getElementById('updateExchangeRate_uomId').value = 'MXN';  // Valor para 'De Moneda'
        document.getElementById('updateExchangeRate_uomIdTo').value = 'USD'; // Valor para 'A Moneda'

        // Comprobar si los valores de uomId y uomIdTo son los esperados
        const uomId = document.getElementById('updateExchangeRate_uomId').value;
        const uomIdTo = document.getElementById('updateExchangeRate_uomIdTo').value;

        if (uomId === 'MXN' && uomIdTo === 'USD') {
          // Solo si los valores son correctos, pegar la tasa en el campo correspondiente
          document.getElementById('updateExchangeRate_conversionFactor').value = fila.tasa;

          // Guardar la tasa seleccionada en localStorage
          localStorage.setItem('tasaSeleccionada', fila.tasa);

          // Redirigir a la página tasaSeleccionada.ftl
        } else {
          // Si los valores no son los esperados, no pegar la tasa y mostrar un mensaje
          alert('Los valores de moneda no son correctos.');
        }
      },
      async obtenerCotizacion() {
                    try {
                        const response = await axios.get("https://api.twelvedata.com/quote?symbol=USD/MXN&apikey=e0717f6194e14316ae75539ea5b51498");
                        this.cotizacion = response.data;
                    } catch (error) {
                        console.error("Error al obtener la cotización:", error);
                    }
      }
    },
    created() {
      this.cargarDatos();
    },
    mounted() {
                this.obtenerCotizacion();
    }
  });
</script>


</body>
</html>
