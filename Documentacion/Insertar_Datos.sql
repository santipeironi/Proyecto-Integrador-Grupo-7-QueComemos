USE quecomemos;
INSERT INTO categoria (id_cate,descr_cate)
VALUES
(1,'Menu Fijo'),
(2,'Plato del dia'),
(3,'Menu Saludable'),
(4,'Menu Vegetariano'),
(5,'Menu Celiacos'),
(6,'Menu Vegano'),
(7,'Menu Diabeticos'),
(8,'Menu Infantil'),
(9,'Desayuno/Merienda'),
(10,'Especial Navidad'),
(11,'Especial Ano Nuevo'),
(12,'Especial Dia del Amigo');


INSERT INTO formapago (descr_forpago)
VALUES ('Efectivo'),('Tarjeta Debito'),('Tarjeta Credito'),('Transferencia bancaria'),('Codigo QR');


INSERT INTO restaurante (id_rest, nombre_rest,domicilio_rest,redes_rest,cant_tenedores)
VALUES
(1, 'El Baqueano', '9 de julio 2550', 'facebook  twitter ', '4'),
(2, 'Bros Comedor', 'Calle 27 de abril 568', 'facebook  twitter ', '5'),
(3, 'Al-Malek', 'Calle Lima 265 - Barrio Gral Paz', 'instagram  twitter ', '4'),
(4, 'República Restaurant', 'Av Recta Martinoli 5631', 'facebook  twitter ', '3'),
(5, 'Pizza Italia', 'Lavalleja 1388 Barrio Cofico', 'facebook  instagram ', '3'),
(6, 'El Gran Vidrio Restaurante', 'Humberto Primo 497 Esq. Jujuy', 'facebook  twitter ', '5'),
(7, 'El Parrillon de Don Zoilo', 'San Martin 674', 'facebook  twitter ', '3');


INSERT INTO menu (id_menu,descr_menu,id_cate,id_promo,id_rest) VALUES
(1, 'Milanesa de carne c/fritas/pure/ensalada', 1,1 ,5 ),
(2, 'Milanesa de pollo c/fritas/pure/ensalada', 1,2 ,5 ),
(3, 'Hamburguesa simple', 1,3 ,5 ),
(4, 'Hamburguesa Triple', 1,4 ,5 ),
(5, 'Milanesa c/fritas/pure/ensalada', 1,5,5),
(6, 'Risotto de arroz con champignon a la crema', 4,99,6),
(7, 'Risotto de arroz con vegetales', 6,99 ,6 ),
(8, 'Falafel  4 bolitas de garbanzo frito con pasta de sesamo, tomate, perejil', 1,99 ,3 ),
(9, 'Arroz Al Cordero  Arroz con tiras de cordero, regado con nueces', 2,99 ,4 ),
(10, 'Pizza Especial', 1,6 ,5 ),
(11, 'Parrillada completa', 1,99,7),
(12, 'Tarta de esparragos con chips de remolacha', 6,99,4),
(13, 'Fritatta de espinaca', 6,99 ,6 ),
(14, 'Hamburguesa vegetariana de porotos negros y cebada', 6,99 ,6 ),
(15, 'Nuguets de pollo y fritas', 8,7 ,2 ),
(16, 'Tallarines a la bolognesa', 2,8,2),
(17, 'Cafe con medialunas',9,99,6);
