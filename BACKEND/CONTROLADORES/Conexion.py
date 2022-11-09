import mysql.connector

# CÓDIGO PARA INICIALIZAR SESIÓN:

try: 
    conexion = mysql.connector.connect(
        host = 'localhost',
        port = 3306,
        user = 'root',
        password = 'ConectarAMySQL777',
        db = 'backend_quecomemos'
        )
        
    if conexion.is_connected():
        print('Enhorabuena. Su conexion ha sido exitosa.')
        cursor = conexion.cursor()
        seleccionar_tabla = 'select * from usuarios'
        cursor.execute(seleccionar_tabla)
        registros = cursor.fetchall()
        
        for registro in registros:
            print(registro)
        

except:
    print('Lo sentimos, no pudimos conectarnos a la base de datos.')


finally:
    if conexion.is_connected():
        print('Gracias por usar nuestros servicios de búsqueda en la BBDD.')
        cursor.close()
        conexion.close()