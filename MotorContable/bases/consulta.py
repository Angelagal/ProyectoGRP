import psycopg2
import json
from decimal import Decimal
from datetime import date

# Parámetros de conexión
usuario = 'postgres'
contraseña = '1234'
base_datos = 'contableA1'
host = 'localhost'

try:
    # Establecer la conexión a la base de datos
    conexion = psycopg2.connect(
        dbname=base_datos,
        user=usuario,
        password=contraseña,
        host=host
    )

    # Crear un cursor para ejecutar las consultas
    cursor = conexion.cursor()

    # Hacer la consulta
    cursor.execute("SELECT * FROM historico_cambio;")

    # Obtener los resultados
    resultados = cursor.fetchall()

    # Convertir los resultados en una lista de diccionarios
    columnas = [desc[0] for desc in cursor.description]
    data = []

    # Convertir los valores Decimal a float y las fechas a cadenas
    for fila in resultados:
        row_dict = dict(zip(columnas, fila))
        for key, value in row_dict.items():
            if isinstance(value, Decimal):  # Si el valor es Decimal
                row_dict[key] = float(value)  # Convertir a float
            elif isinstance(value, date):  # Si el valor es una fecha
                row_dict[key] = value.isoformat()  # Convertir la fecha a cadena (formato YYYY-MM-DD)
        data.append(row_dict)

    # Guardar los datos JSON en un archivo
    with open('historico_cambio.json', 'w', encoding='utf-8') as json_file:
        json_file.write(json.dumps(data, ensure_ascii=False))

    print("Datos guardados en historico_cambio.json")

except Exception as e:
    print(f"Error: {e}")

finally:
    # Asegurarse de cerrar la conexión y cursor
    if cursor:
        cursor.close()
    if conexion:
        conexion.close()


