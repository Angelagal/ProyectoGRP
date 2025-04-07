<?php
$servername = "localhost";
$username = "postgres";
$password = "1234";
$dbname = "contableA1";

// Crear conexión a PostgreSQL
$conn = pg_connect("host=$servername dbname=$dbname user=$username password=$password");

// Verificar conexión
if (!$conn) {
    die("Conexión fallida: " . pg_last_error());
}

// Obtener datos de la API
$api_url = "https://api.twelvedata.com/quote?symbol=USD/MXN&apikey=e0717f6194e14316ae75539ea5b51498";
$response = file_get_contents($api_url);
$data = json_decode($response, true);

if (isset($data["close"]) && isset($data["datetime"])) {
    $tasa = $data["close"];
    $fecha = $data["datetime"];
    
    // Insertar en la base de datos
    $sql = "INSERT INTO historico_cambio (de_moneda, a_moneda, tasa, fecha) VALUES ('PESO', 'DOLAR', $1, $2)";
    $result = pg_query_params($conn, $sql, array($tasa, $fecha));
    
    if ($result) {
        echo "Registro insertado correctamente";
    } else {
        echo "Error: " . pg_last_error($conn);
    }
}
else {
    echo "Error al obtener datos de la API";
}

pg_close($conn);
?>
