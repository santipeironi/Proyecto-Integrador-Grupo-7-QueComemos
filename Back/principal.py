# import controlador
# import modelo
while True:
    print("===============================================")
    print("|         PROYECTO INTEGRADOR G7              |") 
    print("|              QUECOMEMOS                     |")
    print("===============================================")
    print("")
    print("============== MENÚ PRINCIPAL =================")
    print("|  1 - INGRESAR USUARIO                       |")
    print("|  2 - MODIFICAR USUARIO                      |")
    print("|  3 - ELIMINAR USUARIO                       |")
    print("|  4 - LISTADOS DE USUARIOS                   |")
    print("|  5 -                                        |")
    print("|  6 -                                        |")
    print("|  7 -                                        |")
    print("|  8 -                                        |")
    print("|  9 - SALIR                                  |")
    print("===============================================")

    print("")
    opcion = int(input("Seleccione una opcion: "))
    
    if opcion == 1:
        print("")
        #  controlador.InsertarUsuario()
       
    elif opcion == 2:  
        print("")
        #   controlador.ActualizarUsuario()

    elif opcion == 3:
        print("")
        #   controlador.EliminarUsuario()

    elif opcion == 4:  
        print("")
        #   controlador.ListarUsuario()

    elif opcion == 5:
        print("")
        #   controlador.Listar()

    elif opcion == 6:
        print("") 
        #   controlador.Listar()

    elif opcion == 7:
        print("")
        #   controlador.Listar()

    elif opcion == 8:
        print("")
      #  controlador.Listar()
 
    elif opcion == 9:
        print("")
        print("===============================================")
        print("===== ¡GRACIAS POR USAR NUESTRO SISTEMA! ======")
        print("===============================================")
        print("")
        break

    else:
            print("Opcion incorrecta, seleccionar entre 1 y 9.")
            print("")
            print("Ingrese nuevamente...")
            print("")