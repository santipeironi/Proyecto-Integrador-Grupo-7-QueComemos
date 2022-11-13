import mysql.connector

class Usuario:
    def __init__(self):
        self.conexion = mysql.connector.connect(
                host = 'localhost',
                port = 3306,
                user = 'root',
                password = '',
                db = 'backend_quecomemos'
                )
        if self.conexion.is_connected():
            print('Enhorabuena, ud. se ha podido conectar a la BBDD.')
        else:
            print('Lo sentimos, no se ha podido acceder a la BBDD.')
            return
            
    def __str__(self):
        datos = self.consulta_usuarios()
        aux = ""
        for row in datos:
            aux = aux + str(row) + "\n"
        return aux
    
    def consulta_usuarios(self):
        cursor = self.conexion.cursor()
        seleccionar_tabla = 'SELECT * FROM usuarios'
        cursor.execute(seleccionar_tabla)
        datos = cursor.fetchall()
        cursor.close()    
        return datos
        
    def buscar_usuario(self, DNI):
        cursor = self.conexion.cursor()
        sql = "SELECT * FROM countries WHERE Id = {}".format(DNI)
        cursor.execute(sql)
        datos = cursor.fetchone()
        cursor.close()    
        return datos
    
    
    # REVISAR ACÁ, PORQUE NO INSERTA BIEN, PORQUE INSERTA DOS VECES EL DNI Y NO PASA CORRECTAMENTE LOS DATOS.
    # PUEDE SER UN ERROR POSICIONAL EN LOS PARÁMETROS.
    def insertar_usuario(self,dni, nombre, apellido, domicilio, mail, telefono):
        cursor = self.conexion.cursor()
        sql='''INSERT INTO usuarios (id_dni, nombre, apellido, domicilio, mail, telefono) 
        VALUES('{}', '{}', '{}', '{}', '{}', '{}')'''.format(dni, nombre, apellido, domicilio, mail, telefono)
        cursor.execute(sql)
        n = cursor.rowcount
        self.conexion.commit()    
        cursor.close()
        return n    

    def elimina_usuario(self, DNI):
        cursor = self.conexion.cursor()
        sql ='''DELETE FROM usuarios WHERE id_dni = {}'''.format(DNI)
        cursor.execute(sql)
        n = cursor.rowcount
        self.conexion.commit()    
        cursor.close()
        return n   

    def modificar_usuario(self, DNI, nombre, apellido, domicilio, mail, telefono):
        cursor = self.conexion.cursor()
        sql ='''UPDATE usuarios SET id_dni='{}', nombre='{}', apellido='{}',
        domicilio='{}',  mail='{}',  telefono='{}' WHERE id_dni={}'''.format(DNI, DNI, nombre, apellido, domicilio, mail, telefono, DNI)
        cursor.execute(sql)
        n = cursor.rowcount
        self.conexion.commit()    
        cursor.close()
        return n  
        