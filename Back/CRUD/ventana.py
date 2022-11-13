from tkinter import *
from tkinter import ttk
from tkinter.ttk import Label, Style
from tkinter import messagebox
from usuarios import *

class Ventana(Frame):
    
    usuarios = Usuario()
    
    def __init__(self, master=None):
        super().__init__(master, width=930, height=320)
        self.master = master
        self.pack()
        self.style = Style(self.master)
        self.create_widgets()
        self.llenarDatos()
        self.habilitarCajas("disabled")
        self.habilitarBotonesOperaciones("normal")
        self.habilitarBotonGuardar("disabled")
        self.id = -1
        
        
    # Llenar los Datos y mostrarlos en el Treeview
    def llenarDatos(self):
        datos = self.usuarios.consulta_usuarios()
        for row in datos:
                    self.grid.insert("", END, text=row[0], values=(row[0], row[1], row[2], row[3], row[4], row[5]))
        print(self.usuarios)
                    
    # Habilitar y Deshabilitar Cajas de Texto
    def habilitarCajas(self, estado):
        self.textDNI.configure(state = estado)
        self.textNombre.configure(state = estado)
        self.textApellido.configure(state = estado)
        self.textDomicilio.configure(state = estado)
        self.textMail.configure(state = estado)
        self.textNumero.configure(state = estado)
        
    def limpiarCajas(self):
        self.textDNI.delete(0, END)
        self.textNombre.delete(0, END)
        self.textApellido.delete(0, END)
        self.textDomicilio.delete(0, END)
        self.textMail.delete(0, END)
        self.textNumero.delete(0, END)   
    
    
    def limpiarGrid(self):
        grid_usuarios = self.grid.get_children()
        for item in grid_usuarios:
            self.grid.delete(item)
        
    
    # Habilitar y Deshabilitar Cajas de Texto
    def habilitarBotonesOperaciones(self, estado):
        self.btnCrear.configure(state = estado)
        self.btnModificar.configure(state = estado)
        self.btnEliminar.configure(state = estado)

    def habilitarBotonGuardar(self, estado):
        self.btnGuardar.configure(state = estado)
        self.btnCancelar.configure(state = estado)
    
    
    # Métodos de los Botones
    def fCrear(self):
        self.habilitarCajas("normal")
        self.limpiarCajas()
        self.textDNI.focus()
        self.habilitarBotonesOperaciones("disabled")
        self.habilitarBotonGuardar("normal")
                
    def fModificar(self):
        selected = self.grid.focus()
        clave = self.grid.item(selected, 'text')
        
        if clave == '':
            messagebox.showwarning('Modificar: ', 'Debe seleccionar primero un elemento. Gracias.')
        else:
            self.id = clave
            self.habilitarCajas('normal')
            valores = self.grid.item(selected, 'values')
            self.limpiarCajas()
            self.textDNI.insert(0, valores[0])
            self.textNombre.insert(0, valores[1])
            self.textApellido.insert(0, valores[2])
            self.textDomicilio.insert(0, valores[3])
            self.textMail.insert(0, valores[4])
            self.textNumero.insert(0, valores[5])
            self.habilitarBotonesOperaciones("disabled")
            self.habilitarBotonGuardar("normal")
            self.textDNI.focus()
            
    
    def fEliminar(self):
        selected = self.grid.focus()
        clave = self.grid.item(selected, 'text')
        
        if clave == '':
            messagebox.showwarning('Eliminar: ', 'Debe seleccionar primero un elemento. Gracias.')
        else:
            valores = self.grid.item(selected, 'values')
            data = ' DNI:' + ' ' + str(clave) + ' , ' + valores[0] + ' ' + valores[1] + ' , ' + valores[2]
            respuesta = messagebox.askquestion('Eliminar: ', '¿Realmente desea eliminar el registro seleccionado? \n' + data)
            
            if respuesta == messagebox.YES:
                n = self.usuarios.elimina_usuario(clave)
                if n == 1:
                    messagebox.showinfo('Eliminar: ', 'Su registro fue eliminado correctamente.')
                    self.limpiarGrid()
                    self.llenarDatos()
                else:
                    messagebox.showinfo('Eliminar: ', 'Lo sentimos. No fue posible borrar su registro.')
    
    def fGuardar(self):
        DNI = self.textDNI.get()
        nombre = self.textNombre.get()
        apellido = self.textApellido.get()
        domicilio = self.textDomicilio.get()
        mail = self.textMail.get()
        telefono = self.textNumero.get()
        selected = self.grid.focus()
        clave = self.grid.item(selected, 'text')
        self.id = clave
        
        if self.id == -1:
            self.usuarios.insertar_usuario(DNI, nombre, apellido, domicilio, mail, telefono)
            messagebox.showinfo('Insertar: ', 'Su registro fue insertado correctamente.')
        else:
            self.usuarios.modificar_usuario(self.id, nombre, apellido, domicilio, mail, telefono, DNI)
            self.id = -1
            messagebox.showinfo('Modificar: ', 'Su registro fue modificado correctamente.')
        self.limpiarGrid()
        self.llenarDatos()
        self.limpiarCajas()
        self.habilitarBotonGuardar('disabled')
        self.habilitarBotonesOperaciones('normal')
        self.habilitarCajas("disabled")
    
    def fCancelar(self):
        respuesta = messagebox.askquestion('Cancelar: ', '¿Realmente desea cancelar la operación? \n')
        
        if respuesta == messagebox.YES:
            self.limpiarCajas()
            self.habilitarBotonGuardar('disabled')
            self.habilitarBotonesOperaciones('normal')
            self.habilitarCajas("disabled")
        
    
    # Se crean los botones/controles para CREAR, MODIFICAR O ELIMINAR.
    def create_widgets(self):
        
        # Menú de Opciones:
        frame1 = Frame(self, bg='#ef5555')
        frame1.place(x=0, y=0, width=93, height=319)
        
        # Logo Grupo 7 Que Comemos
        
        # Formulario de Consulta:
        frame2 = Frame(self, bg='#e78181')
        frame2.place(x=95, y=0, width=150, height=319)
        
        # Botones de Opciones:
        # Botón de Crear
        self.btnCrear = Button(frame1, text='Crear', command=self.fCrear, bg='red', fg='white')
        self.btnCrear.place(x=7, y=90, width=80, height=30)
        
        # Botón de Modificar
        self.btnModificar = Button(frame1, text='Modificar', command=self.fModificar, bg='red', fg='white')
        self.btnModificar.place(x=7, y=130, width=80, height=30)
        
        # Botón de Eliminar
        self.btnEliminar = Button(frame1, text='Eliminar', command=self.fEliminar, bg='red', fg='white')
        self.btnEliminar.place(x=7, y=170, width=80, height=30)
        
        # Labels que van dentro del Formulario de Consulta:
        label1 = Label(frame2, text='DNI: ')
        label1.place(x=3, y=5)
        
        self.textDNI=Entry(frame2)
        self.textDNI.place(x=3, y=25, width=100, height=20)
        
        label2 = Label(frame2, text='Nombre: ')
        label2.place(x=3, y=50)
        
        self.textNombre=Entry(frame2)
        self.textNombre.place(x=3, y=70, width=100, height=20)
        
        
        label3 = Label(frame2, text='Apellido: ')
        label3.place(x=3, y=95)
        
        self.textApellido=Entry(frame2)
        self.textApellido.place(x=3, y=115, width=100, height=20)
        
        label4 = Label(frame2, text='Domicilio: ')
        label4.place(x=3, y=140)
        
        self.textDomicilio=Entry(frame2)
        self.textDomicilio.place(x=3, y=160, width=100, height=20)
        
        label5 = Label(frame2, text='Mail: ')
        label5.place(x=3, y=185)
        
        self.textMail=Entry(frame2)
        self.textMail.place(x=3, y=205, width=100, height=20)
        
        label6 = Label(frame2, text='Número: ')
        label6.place(x=3, y=230)
        
        self.textNumero=Entry(frame2)
        self.textNumero.place(x=3, y=250, width=100, height=20)
        
        # Botones para Guardar y Cancelar:
        self.btnGuardar = Button(frame2, text='Guardar', command=self.fGuardar, bg='green', fg='white')
        self.btnGuardar.place(x=7, y=285, width=60, height=30)
        
        self.btnCancelar = Button(frame2, text='Cancelar', command=self.fCancelar, bg='#f80909', fg='white')
        self.btnCancelar.place(x=80, y=285, width=60, height=30)
        
        # Grid para visualizar los registros de una BBDD:
        
        # Ventana del Grid
        frame3 = Frame(self, bg='#ffd3d3')
        frame3.place(x=247, y=0, width=900, height=319)
        
        label7 = Label(frame3, text='QueComemos - Tabla de Usuarios: ')
        label7.place(x=260, y=12)
        
        #label8 = Label(frame3, text='CRUD Elaborado por: Romero Moreno, Oscar Alfonso ')
        #label8.place(x=210, y=275)
        
        label9 = Label(frame3, text='#BACKEND Development Team: Méndez, Andrés; Monzón, Silvia; Romero, Lucas Emanuel;Romero Moreno, Oscar Alfonso')
        label9.place(x=10, y=285)
        
        self.grid = ttk.Treeview(frame3, columns=('col1','col2','col3','col4','col5'))
        
        self.grid.column("#0", width=100)
        self.grid.column("col1", width=100, anchor=CENTER)
        self.grid.column("col2", width=120, anchor=CENTER)
        self.grid.column("col3", width=120, anchor=CENTER)
        self.grid.column("col4", width=120, anchor=CENTER)
        self.grid.column("col5", width=100, anchor=CENTER)
        
        self.grid.heading("#0", text='DNI', anchor=CENTER)
        self.grid.heading("col1", text='Nombre', anchor=CENTER)
        self.grid.heading("col2", text='Apellido', anchor=CENTER)
        self.grid.heading("col3", text='Domicilio', anchor=CENTER)
        self.grid.heading("col4", text='Mail', anchor=CENTER)
        self.grid.heading("col5", text='Teléfono', anchor=CENTER)
        
        self.grid.pack(side=LEFT)
        
        scrollbar = Scrollbar(frame3, orient=VERTICAL)
        scrollbar.place(x=664, y=0, height=320)
        self.grid.config(yscrollcommand=scrollbar.set)
        scrollbar.config(command=self.grid.yview)
        
        self.grid['selectmode'] = 'browse'