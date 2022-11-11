class Local:
    __Id = 1
    Nombre = ""
    Descripcion = ""
    Direccion = ""

    def __init__(self, nombre, descripcion, direccion):
        self.Nombre = nombre
        self.Descripcion = descripcion
        self.Direccion = direccion

    def get_Id(self):
        return self.Id

    def set_Id(self, id):
        self.Id = id

    def get_Nombre(self):
        return self.Nombre

    def set_Nombre(self, nombre):
        self.Nombre = nombre

    def get_Descripcion(self):
        self.Descripcion

    def set_Descripcion(self, descripcion):
        self.Descripcion = descripcion

    def get_Direccion(self):
        self.Direccion

    def set_Direccion(self, direccion):
        self.Direccion = direccion