class Formulario:
    Mensaje = ""

    def __init__(self, mensaje):
        self.Mensaje = mensaje

    def get_Mensaje(self):
        return self.Mensaje

    def set_Mensaje(self, mensaje):
        self.Mensaje = mensaje
    
    def __str__(self):
        return f'Mensaje({self.Mensaje})'