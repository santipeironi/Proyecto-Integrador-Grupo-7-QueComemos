class Usuario:
    __Id = 1
    Nombre = ""
    Apellido = ""
    Email= ""

    def __init__(self, nombre, apellido, email):
        self.Nombre = nombre
        self.Apellido = apellido
        self.Email = email

    def get_Id(self):
        return self.Id

    def set_Id(self, id):
        self.Id = id

    def get_Nombre(self):
        return self.Nombre

    def set_Nombre(self, nombre):
        self.Nombre = nombre

    def get_Apellido(self):
        return self.Apellido

    def set_Apellido(self, apellido):
        self.Apellido = apellido

    def get_Email(self):
        return self.Email

    def set_Email(self, email):
        self.Email = email

    def contactarEmail(self):
        pass
