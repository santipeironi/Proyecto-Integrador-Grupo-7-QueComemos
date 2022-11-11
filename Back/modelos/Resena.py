class Resena:
    __Id = 1
    Valoracion = 2
    Titulo = ""
    Cuerpo = ""

    def __init__(self, valoracion, titulo, cuerpo):
        self.Valoracion = valoracion
        self.Titulo = titulo
        self.Cuerpo = cuerpo

    def get_Id(self):
        return self.Id

    def set_Id(self, id):
        self.Id = id

    def get_Valoracion(self):
        return self.Valoracion

    def set_Valoracion(self, valoracion):
        self.Valoracion = valoracion

    def get_Titulo(self):
        return self.Titulo

    def set_Titulo(self, titulo):
        self.Titulo = titulo

    def get_Cuerpo(self):
        return self.Cuerpo

    def set_Cuerpo(self, cuerpo):
        self.Cuerpo = cuerpo

    def __str__(self):
        return f'Resena({self.Valoracion},{self.Titulo},{self.Cuerpo})'

resena1 = Resena(10, "Muy buenos postres veganos", "Me comí cosas ricas con zanahoria, batidos de remolacha y una torta de algarroba, muy recomendable el lugar.")
print(resena1)

