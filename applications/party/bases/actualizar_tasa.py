import requests
import psycopg2

# Configuración de la base de datos PostgreSQL
DB_CONFIG = {
    "dbname": "contableA1",
    "user": "postgres",
    "password": "1234",
    "host": "localhost",
    "port": "5432"
}

# API URL
API_URL = "https://api.twelvedata.com/quote?symbol=USD/MXN&apikey=e0717f6194e14316ae75539ea5b51498"

def obtener_tasa_cambio():
    """Obtiene la tasa de cambio desde la API"""
    try:
        response = requests.get(API_URL)
        data = response.json()
        if "close" in data and "datetime" in data:
            tasa = float(data["close"])
            fecha = data["datetime"].split(" ")[0]  # Tomamos solo la fecha
            return tasa, fecha
        else:
            print("⚠️ Error: La API no devolvió los datos esperados.")
            return None, None
    except Exception as e:
        print(f"❌ Error al obtener datos de la API: {e}")
        return None, None

def obtener_ultimo_id():
    """Obtiene el último ID de la tabla 'historico_cambio'"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cursor = conn.cursor()

        sql = "SELECT MAX(id) FROM historico_cambio"
        cursor.execute(sql)
        result = cursor.fetchone()

        cursor.close()
        conn.close()

        if result and result[0]:
            return result[0]
        else:
            return 479  # Si no hay registros, empezamos desde 479 para que el siguiente sea 480
    except Exception as e:
        print(f"❌ Error al obtener el último ID: {e}")
        return 479  # Retornar 479 si ocurre un error

def insertar_tasa_en_db(tasa, fecha):
    """Inserta la tasa en la base de datos PostgreSQL con un ID automático"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        cursor = conn.cursor()

        # Obtener el siguiente ID disponible
        ultimo_id = obtener_ultimo_id()
        nuevo_id = ultimo_id + 1  # Incrementamos el ID

        sql = """
        INSERT INTO historico_cambio (id, de_moneda, a_moneda, tasa, fecha)
        VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(sql, (nuevo_id, "PESO", "DOLAR", tasa, fecha))

        conn.commit()
        cursor.close()
        conn.close()
        print(f"✅ Tasa {tasa} insertada para la fecha {fecha} con ID {nuevo_id}")

    except Exception as e:
        print(f"❌ Error al insertar en la base de datos: {e}")

if __name__ == "__main__":
    tasa, fecha = obtener_tasa_cambio()
    if tasa and fecha:
        insertar_tasa_en_db(tasa, fecha)
