import os
import snowflake.connector
from snowflake.connector.errors import ProgrammingError
from dotenv import load_dotenv

# --- RUTAS Y ENV ---
script_dir = os.path.dirname(os.path.abspath(__file__))
project_root = script_dir
load_dotenv(os.path.join(project_root, '.env'))

def get_connection(schema="WORKSHOP"):
    print("🔌 Conectando a Snowflake...")
    return snowflake.connector.connect(
        user=os.getenv('SNOWFLAKE_USER'),
        password=os.getenv('SNOWFLAKE_PASSWORD'),
        account=os.getenv('SNOWFLAKE_ACCOUNT'),
        role=os.getenv('SNOWFLAKE_ROLE'),
        warehouse=os.getenv('SNOWFLAKE_WAREHOUSE'),
        database=os.getenv('SNOWFLAKE_DATABASE'),
        schema=schema
    )

def deploy_sql_file(conn, filename, folder_path):
    full_path = os.path.join(folder_path, filename)
    print(f"▶️ Ejecutando {filename} ...", end=" ")
    try:
        with open(full_path, 'r', encoding='utf-8') as f:
            sql_content = f.read()
            conn.execute_string(sql_content)
        print("✅ OK")
    except ProgrammingError as e:
        print(f"❌ ERROR SQL: {e.msg}")
    except Exception as e:
        print(f"❌ ERROR: {str(e)}")

def main():
    folder_path = project_root
    target_file = "01_setup_demo.sql"

    conn = None
    try:
        conn = get_connection()
        print(f"\n📂 Ejecutando script de setup: {target_file}\n")
        deploy_sql_file(conn, target_file, folder_path)
        print("\n✨ Setup finalizado con éxito.")
    except Exception as e:
        print(f"\n❌ Error General: {e}")
    finally:
        if conn:
            conn.close()

if __name__ == "__main__":
    main()