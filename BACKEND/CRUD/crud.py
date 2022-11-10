from tkinter import *
from ventana import *


def principal():
    root = Tk()
    root.wm_title('CRUD QueComemos Grupo 7')
    app = Ventana(root)
    app.mainloop()


if __name__ == '__main__':
    principal()