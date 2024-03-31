create schema bd_tienda_de_ropa_RiverSide;

use bd_tienda_de_ropa_RiverSide;

-- SECCION DE CREACION DE TABLAS
create table sucursales (
id_sucursal int not null auto_increment,
Dirección varchar (50) not null,
Teléfono varchar (50) not null,
primary key(id_sucursal));

create table empleados (
id_empleado int not null auto_increment,
Nombre varchar (50) not null,
Apellido varchar (50) not null,
Teléfono varchar (50) not null,
Fecha_de_ingreso date not null,
Cargo varchar (50) not null,
id_sucursal int not null,
Primary key (id_empleado));

create table clientes (
id_cliente int not null auto_increment,
Nombre varchar (50),
Apellido varchar (50),
Dirección varchar (50),
primary key (id_cliente));

create table productos (
id_producto int not null auto_increment,
Nombre varchar (200) default null,
Marca varchar (200) default null,
Estilo varchar (200) default null,
Talla varchar (10) default null,
Color  varchar (50) default null,
Precio_venta decimal(10,2) default null,
Precio_costo decimal(10,2) default null,
primary key(id_producto));

create table proveedores (
id_proveedor int not null auto_increment,
Nombre varchar (50),
Provincia varchar (50),
Ciudad varchar (50),
Dirección varchar (50),
Teléfono varchar (50),
primary key (id_proveedor));

create table ventas (
id_venta int not null auto_increment,
Fecha datetime not null,
id_empleado int not null,
id_cliente int not null,
primary key (id_venta));

create table puente_ventas_productos (
id_venta int not null,
id_producto int not null,
Número_de_unidades int not null,
primary key (id_venta,id_producto)
);


create table compras (
id_compra int not null auto_increment,
Fecha datetime not null,
id_sucursal int not null,
id_proveedor int not null,
primary key (id_compra));

create table puente_compras_productos (
id_compra int not null,
id_producto int not null,
Número_de_Unidades int not null,
primary key (id_compra,id_producto)
);

create table registro_de_ex_empleados(
id_empleado int not null,
Nombre varchar (50) not null,
Apellido varchar (50) not null,
Teléfono varchar (50) not null,
Fecha_de_ingreso date not null,
Cargo varchar (50) not null,
id_sucursal int not null,
Fecha_desvinculación date not null,
usuario varchar(200) not null);

create table control_de_registros_en_tabla_productos(
id_producto int not null,
Fecha_de_carga date not null,
usuario varchar(200)not null);



alter table empleados
add constraint FK_id_sucursal foreign key (id_sucursal) references sucursales (id_sucursal);

alter table ventas
add constraint FK_id_empleado foreign key (id_empleado) references empleados (id_empleado),
add constraint FK_id_cliente foreign key (id_cliente) references clientes (id_cliente);

alter table puente_ventas_productos
add constraint FK_id_venta foreign key (id_venta) references ventas (id_venta),
add constraint FK_id_producto_venta foreign key (id_producto) references productos (id_producto);

alter table compras
add constraint FK_id_proveedor foreign key (id_proveedor) references proveedores (id_proveedor),
add constraint FK_id_sucursal_compra foreign key (id_sucursal) references sucursales (id_sucursal);

alter table puente_compras_productos
add constraint FK_id_compra foreign key (id_compra) references compras  (id_compra),
add constraint FK_id_producto_compra foreign key (id_producto) references productos (id_producto);

-- SECCION DE INSERCIÓN DE DATOS

INSERT INTO sucursales (Dirección,Teléfono)
VALUES
('Street 348-Corrientes', '3794-99986-887555'),
('Street 8687-Resistencia', '3624 -497858-231123');



INSERT INTO  empleados (Nombre,Apellido,Teléfono,Fecha_de_ingreso,Cargo,id_sucursal) VALUES 
('Juan','Messi','3794-000001','2021-01-10','Venderor',1),
('Julia','Rodriguez','3794-000002','2021-01-10','Vendedora',2),
('Lucas','Ortega','3794-000003','2021-01-10','Vendedor',2),
('Luciana','Garcia','3794-000004','2021-01-10','Vendedora',1),
('Agustin','Pedro','3794-000014','2021-01-10','Vendedor',2),
('Ana','Sanchez','3794-000015','2021-01-10','Vendedora',1),
('Sandra','Bullok','3794-000007','2021-01-10','Vendedora',1),
('Ricardo','Lotero','3794-000008','2021-01-10','Vendedor',2),
('Alberto','Darin','3794-000005','2021-01-10','Administrativo',1),
('Estevan','Pérez','3794-000006','2021-01-10','Gerente',1),
('Max','Ortega','3794-000009','2021-01-10','Administrativo',2),
('Silvana','Meza','3794-000010','2021-01-10','Cajera',2),
('Claudia','Fandi','3794-000012','2021-01-10','Cajera',1),
('Alejo','Gindi','011-0000013','2021-01-10','Contador',1);


INSERT INTO Clientes (Nombre,Apellido,Dirección)
VALUES
  ("Pedro","Escobar","Spain 748-Corrientes"),
  ("Juan","Moran"," Diam. St.2585 -Resistencia"),
  ("Bernardo","Granata","P.O. Box 637 -Resistencia"),
  ("Octavio","Mcdonald","Proin Street 843 -Resistencia"),
  ("Clementino","Quiroz","Facilisis St. 977 -Corrientes"),
  ("Fito","Martinez","Consequat Ave 655- Resistencia"),
  ("Shon","Rossi","P.O. Box 237-Resistencia"),
  ("Madonna","Romano","Sed St. 388 - Corrientes"),
  ("Betania","Sanchez","Vel 345-Corrientes"),
  ("Susana","Garcia"," Id Rd 555-Corrientes"),
  ("Tatiana","Romano","Arcu. Rd.111-Corrientes"),
  ("Moses","Glover","Praesent Rd 622- Corrientes"),
  ("Julian","Batista","Elit Avenue 333- Resistencia"),
  ("Roman","Moretti","Elit Road 345- Resistencia"),
  ("Karly","Paladini","Consequat Rd. 787"),
  ("Constanza","Craft","Orci Ave 810 Resistencia"),
  ("Brian","Tullio","Egestas Avenue 787- Corrientes"),
  ("Ricardo","Potter","Fringilla Road 222 -Corrientes"),
  ("Ishmael","Stefano","Ap. Feugiat Rd 345- Corrientes"),
  ("Alejandro","Perez","Sapien Ave 747 -Corrientes"),
  ("Yasir","Condrado","Dui, Av. 198 -Corrientes"),
  ("Noelia","Fisher","Dignissim Ave 242 - Resistencia"),
  ("Miguel","Valenzuela","Tempor Av. 516 -Resistencia"),
  ("Sabrina","Kaufman","Lacus. Rd.858- Corrientes"),
  ("Logan","Lorenzo"," Ornare, Avenue 803- Resistencia");


INSERT INTO productos (Nombre, Marca, Estilo, Talla, Color, Precio_venta, Precio_costo)
VALUES
  ('Camisa', 'Marca1', 'Estilo1', 'M', 'Azul', 2900.99, 1500.00),
  ('Camisa', 'Marca1', 'Estilo1', 'L', 'Azul', 2900.99, 1500.00),
  ('Camisa', 'Marca1', 'Estilo1', 'X', 'Azul', 2900.99, 1500.00),
  ('Camisa', 'Marca1', 'Estilo1', 'XL', 'Azul', 2900.99, 1500.00),
  ('Pantalón', 'Marca2', 'Estilo2', 'L', 'Negro', 4900.99, 2500.00),
  ('Pantalón', 'Marca2', 'Estilo2', 'M', 'Negro', 4900.99, 2500.00),
  ('Pantalón', 'Marca2', 'Estilo2', 'L', 'Negro', 4900.99, 2500.00),
  ('Pantalón', 'Marca2', 'Estilo2', 'X', 'Negro', 4900.99, 2500.00),
  ('Pantalón', 'Marca2', 'Estilo2', 'XL', 'Negro', 4900.99, 2500.00),
  ('Chaqueta', 'Marca3', 'Estilo3', 'XL', 'Gris', 6900.99, 3500.00),
  ('Chaqueta', 'Marca3', 'Estilo3', 'L', 'Gris', 6900.99, 3500.00),
  ('Chaqueta', 'Marca3', 'Estilo3', 'X', 'Gris', 6900.99, 3500.00),
  ('Chaqueta', 'Marca3', 'Estilo3', 'M', 'Gris', 6900.99, 3500.00),
  ('Jeans', 'Marca5', 'Estilo5', 'S', 'Azul claro', 5900.99, 3000.00),
  ('Jeans', 'Marca5', 'Estilo5', 'M', 'Azul claro', 5900.99, 3000.00),
  ('Jeans', 'Marca5', 'Estilo5', 'X', 'Azul claro', 5900.99, 3000.00),
  ('Jeans', 'Marca5', 'Estilo5', 'L', 'Azul claro', 5900.99, 3000.00),
  ('Jeans', 'Marca5', 'Estilo5', 'XL', 'Azul claro', 5900.99, 3000.00),
  ('Suéter', 'Marca6', 'Estilo6', 'L', 'Rojo', 3900.99, 2000.00),
  ('Suéter', 'Marca6', 'Estilo6', 'S', 'Rojo', 3900.99, 2000.00),
  ('Suéter', 'Marca6', 'Estilo6', 'M', 'Rojo', 3900.99, 2000.00),
  ('Suéter', 'Marca6', 'Estilo6', 'L', 'Rojo', 3900.99, 2000.00),
  ('Suéter', 'Marca6', 'Estilo6', 'X', 'Rojo', 3900.99, 2000.00),
  ('Suéter', 'Marca6', 'Estilo6', 'XL', 'Rojo', 3900.99, 2000.00),
  ('Shorts', 'Marca7', 'Estilo7', 'S', 'Negro', 2400.99, 1200.00),
  ('Shorts', 'Marca7', 'Estilo7', 'M', 'Negro', 2400.99, 1200.00),
  ('Shorts', 'Marca7', 'Estilo7', 'L', 'Negro', 2400.99, 1200.00),
  ('Shorts', 'Marca7', 'Estilo7', 'X', 'Negro', 2400.99, 1200.00),
  ('Shorts', 'Marca7', 'Estilo7', 'XL', 'Negro', 2400.99, 1200.00),
  ('Blazer', 'Marca8', 'Estilo8', 'S', 'Gris oscuro', 7900.99, 4000.00),
  ('Blazer', 'Marca8', 'Estilo8', 'M', 'Gris oscuro', 7900.99, 4000.00),
  ('Blazer', 'Marca8', 'Estilo8', 'X', 'Gris oscuro', 7900.99, 4000.00),
  ('Blazer', 'Marca8', 'Estilo8', 'L', 'Gris oscuro', 7900.99, 4000.00),
  ('Blazer', 'Marca8', 'Estilo8', 'XL', 'Gris oscuro', 7900.99, 4000.00),
   ('Camisa', 'Marca10', 'Estilo10', 'S', 'Blanco', 2900.99, 1500.00),
  ('Camisa', 'Marca10', 'Estilo10', 'M', 'Blanco', 2900.99, 1500.00),
  ('Camisa', 'Marca10', 'Estilo10', 'L', 'Blanco', 2900.99, 1500.00),
  ('Camisa', 'Marca10', 'Estilo10', 'X', 'Blanco', 2900.99, 1500.00),
  ('Camisa', 'Marca10', 'Estilo10', 'XL', 'Blanco', 2900.99, 1500.00),
  ('Pantalón', 'Marca11', 'Estilo11', 'S', 'Gris claro', 4900.99, 2500.00),
  ('Pantalón', 'Marca11', 'Estilo11', 'M', 'Gris claro', 4900.99, 2500.00),
 ('Pantalón', 'Marca11', 'Estilo11', 'L', 'Gris claro', 4900.99, 2500.00),
('Pantalón', 'Marca11', 'Estilo11', 'X', 'Gris claro', 4900.99, 2500.00),
('Pantalón', 'Marca11', 'Estilo11', 'XL', 'Gris claro', 4900.99, 2500.00),
('Chaqueta', 'Marca12', 'Estilo12', 'X', 'Negro', 6900.99, 3500.00);        
  
 
INSERT INTO proveedores (Nombre, Provincia, Ciudad, Dirección, Teléfono)
VALUES
  ('Ropas man y más S.A', 'Buenos Aires', 'Bahía Blanca', 'Street 2', '011-28545-887555'),
  ('Febra SRL', 'Santa Fe', 'Rosario', 'Street 3', '03782 -44458 -2323'),
  ('Lake SA', 'Corrientes', 'Capital', 'Street 56','0379 - 4878686868686'),
  ('Navarro SA', 'Corrientes', 'Bella Vista', 'Street 86', '3794-858586868787'),
  ('Arfil SRL', 'Córdoba', 'Capital', 'Street 25', '3782-545289985555');

INSERT INTO ventas (Fecha,id_empleado,id_cliente)
VALUES
  ('2021-01-10', 1, 1),
  ('2021-01-10', 2, 1),
  ('2021-01-10', 8, 3),
  ('2021-01-10', 7, 3),
  ('2021-01-10', 5, 4),
  ('2021-01-10', 4, 5),
  ('2021-01-10', 6, 2),
  ('2021-01-10', 3, 2),
  ('2021-01-10', 3, 2),
  ('2021-01-10', 2, 6),
  ('2021-01-11', 3, 7),
  ('2021-01-11', 5, 8),
  ('2021-01-11', 7, 9),
  ('2021-01-11', 3, 10),
  ('2021-01-12', 2, 11),
  ('2021-01-12', 4, 11),
  ('2021-01-12', 6, 11),
  ('2021-01-12', 8, 12),
  ('2021-01-13', 1, 14),
  ('2021-01-13', 1, 14),
  ('2021-01-13', 2, 13),
  ('2021-01-14', 8, 15),
  ('2021-01-14', 1, 15),
  ('2021-01-14', 1, 16),
  ('2021-01-14', 2, 16),
  ('2021-01-15', 5, 17),
  ('2021-01-16', 1, 18),
  ('2021-01-16', 1, 18),
  ('2021-01-16', 2, 19),
  ('2021-01-16', 4, 20),
  ('2021-01-17', 4, 21),
  ('2021-01-17', 2, 22),
  ('2021-01-17', 7, 23),
  ('2021-01-17', 3, 24),
  ('2021-01-17', 3, 25);
  
insert into puente_ventas_productos (id_venta, id_producto,Número_de_unidades) values
(1,3,1),
(2,4,1),
(3,5,1),
(4,7,1),
(5,11,1),
(6,15,1),
(7,20,1),
(8,9,1),
(9,23,1),
(10,36,1),
(11,38,1),
(12,25,1),
(13,28,1),
(14,28,1),
(15,27,1),
(16,25,1),
(17,26,1),
(18,3,1),
(19,4,1),
(20,7,1),
(21,28,1),
(22,42,1),
(23,41,1),
(24,1,1),
(25,1,1),
(26,28,1),
(27,27,1),
(28,37,1),
(29,39,1),
(30,19,1),
(31,15,1),
(32,10,1),
(33,8,1),
(34,10,1),
(35,28,1);

INSERT INTO compras (Fecha, id_sucursal, id_proveedor)
VALUES
  ('2021-01-03', 1, 1),
  ('2021-01-04', 1, 2),
  ('2021-01-05', 1, 3),
  ('2021-01-06', 1, 4),
  ('2021-01-07', 1, 5),
  ('2021-01-03', 2, 1),
  ('2021-01-04', 2, 2),
  ('2021-01-05', 2, 3),
  ('2021-01-06', 2, 4),
  ('2021-01-07', 2, 5);
  
INSERT INTO puente_compras_productos (id_compra, id_producto, Número_de_Unidades)
VALUES
  (1, 1, 50), 
  (1, 2, 50), 
  (1, 3, 50), 
  (1, 4, 50),
  (1, 5, 50), 
  (1, 6, 50),
  (1, 7, 50), 
  (1, 8, 50),
  (1, 9, 50),
  (2, 10, 50), 
  (2, 11, 50), 
  (2, 12, 50), 
  (2, 13, 50),
  (2, 14, 50), 
  (2, 15, 50),
  (2, 16, 50), 
  (2, 17, 50),
  (2, 18, 50),
  (3, 19, 50), 
  (3, 20, 50), 
  (3, 21, 50), 
  (3, 22, 50),
  (3, 23, 50), 
  (3, 24, 50),
  (3, 25, 50), 
  (3, 26, 50),
  (3, 27, 50),
  (3, 28, 50),
  (3, 29, 50),
  (4, 30, 10), 
  (4, 31, 10), 
  (4, 32, 10), 
  (4, 33, 10),
  (4, 34, 10), 
  (4, 35, 50),
  (4, 36, 50), 
  (4, 37, 50),
  (4, 38, 50),
  (5, 39, 50),
  (5, 40, 50),
  (5, 41, 50),
  (5, 42, 50),
  (5, 43, 50),
  (5, 44, 50),
  (5, 45, 10),
  (6, 1, 50), 
  (6, 2, 50), 
  (6, 3, 50), 
  (6, 4, 50),
  (6, 5, 50), 
  (6, 6, 50),
  (6, 7, 50), 
  (6, 8, 50),
  (6, 9, 50),
  (7, 10, 50), 
  (7, 11, 50), 
  (7, 12, 50), 
  (7, 13, 50),
  (7, 14, 50), 
  (7, 15, 50),
  (7, 16, 50), 
  (7, 17, 50),
  (7, 18, 50),
  (8, 19, 50), 
  (8, 20, 50), 
  (8, 21, 50), 
  (8, 22, 50),
  (8, 23, 50), 
  (8, 24, 50),
  (8, 25, 50), 
  (8, 26, 50),
  (8, 27, 50),
  (8, 28, 50),
  (8, 29, 50),
  (9, 30, 10), 
  (9, 31, 10), 
  (9, 32, 10), 
  (9, 33, 10),
  (9, 34, 10), 
  (9, 35, 50),
  (9, 36, 50), 
  (9, 37, 50),
  (9, 38, 50),
  (10, 39, 50),
  (10, 40, 50),
  (10, 41, 50),
  (10, 42, 50),
  (10, 43, 50),
  (10, 44, 50),
  (10, 45, 10);
  
-- SECCIÓN VISTAS

-- Vista que nos permite obtener la lista de productos proporcionados por cada proveedor
create  or replace view vista_proveedores_productos as
select p.Nombre as Proveedor,pdto.Nombre as Nombre_de_producto, pdto.Marca, pdto.Estilo, pdto.Talla,pdto.Color
from proveedores  as p
inner join compras as c
on p.id_proveedor = c.id_proveedor
inner join puente_compras_productos as cp
on c.id_compra = cp.id_compra
inner join productos as pdto
on cp.id_producto= pdto.id_producto;
 
 -- Vista que nos permite obtener la lista de productos con los que cuenta cada sucursal
create  or replace view vista_sucursal_productos as
select s.id_sucursal,s.Dirección as Dirección_Sucursal, pdto.Nombre as Nombre_de_producto,pdto.Marca, pdto.Estilo, pdto.Talla,pdto.Color
from sucursales  as s
inner join compras as c
on s.id_sucursal = c.id_sucursal
inner join puente_compras_productos as cp
on c.id_compra = cp.id_compra
inner join productos as pdto
on cp.id_producto= pdto.id_producto;

-- Vista que nos permite obtener la lista de empleados en cada sucursal
create  or replace view vista_sucursal_empleados as
select s.id_sucursal as id_de_sucursal,  s.Dirección as Dirección_Sucursal, e.Nombre as Nombre_de_empleado,e.Apellido as Apellido_de_empleado, e.Cargo
from sucursales  as s
inner join empleados as e
on s.id_sucursal = e.id_sucursal;

-- Vista que nos permmite obtener la lista de productos cuya compra inicial fue menor a 50 unidades
create  or replace view vista_productos_compras_menor_50_unidades as
select distinct p.id_producto, p.Nombre, p.Marca,p.Estilo,p.Talla,cp.Número_de_Unidades
from productos  as p
inner join puente_compras_productos as cp
on p.id_producto = cp.id_producto
where cp.Número_de_Unidades<50;

-- Vista que nos permite obtener la lista de productos no vendidos hasta la ultima fecha de operación
create  or replace view productos_no_vendidos_hasta_2021_01_17 as
select distinct id_producto, Nombre, Marca, Estilo,Talla
from productos  
where id_producto not in (select id_producto 
                      from puente_ventas_productos 
                      where Número_de_unidades !=0);

-- SECCIÓN FUNCIONES

delimiter $$
-- Función que permite obtener el número de únidades en stock de cada producto de la sucursal 1
create function function_numero_de_unidades_en_stock_sucursal_1 (id_p int)
returns int  reads sql data
begin
declare unidades_iniciales int;
declare unidades_vendidas int;
declare unidades_en_stock int;

select Número_de_Unidades into unidades_iniciales
from puente_compras_productos
where id_compra  in (select id_compra 
					from compras 
					where id_sucursal=1) and id_producto =id_p;

select count(Número_de_unidades) into unidades_vendidas
from puente_ventas_productos
where id_venta  in (select id_venta 
					from ventas 
					where id_empleado in (select id_empleado 
					                     from empleados
					                      where id_sucursal=1)) and id_producto =id_p ;

set unidades_en_stock = unidades_iniciales - unidades_vendidas;
return unidades_en_stock;
end $$
delimiter ;

                                   
             

delimiter $$
-- Función que permite obtener el margen de ganancia de cada producto.
create function function_margen_de_ganancia_por_producto (id_p int)
returns decimal(10,2) reads sql data
begin

declare venta decimal(10,2);
declare costo decimal(10,2);
declare margen decimal(10,2);

select Precio_venta into venta
from productos
where id_producto =id_p ;

select Precio_costo into costo
from productos
where id_producto =id_p ;

set margen = venta-costo;

return margen;

end $$
delimiter ;




-- SECCION DE PROCEDIMIENTOS ALMACENADOS

delimiter $$
-- Procedimiento que permite insertar nuevos productos en la tabla productos
create procedure sp_insertar_productos (in p_nombre varchar (200),in p_marca varchar (200), in p_estilo varchar (200) ,in p_talla varchar (10) ,in p_color varchar (50), in p_precio_venta decimal(10,2), in p_precio_costo decimal (10,2)) 
begin

declare p_id int;
select (max(id_producto) + 1) into @p_id
from productos;

insert into productos (id_producto,Nombre,Marca,Estilo,Talla,Color,Precio_venta,Precio_costo)
values (@p_id,p_nombre,p_marca,p_estilo,p_talla,p_color,p_precio_venta,p_precio_costo);
 
select * from productos
order by id_producto;


end $$
delimiter ;

delimiter $$
-- Procedimiento  que permite obtener los datos de cada vendedor y el número de ventas que realizó
create procedure sp_numero_de_ventas_por_empleado (in id_e int) 
begin

 
select   v.id_empleado as Empleado_nùmero,
         e.Nombre as Nombre_Empleado,
         e.Apellido as Apellido_empleado,
         count(v.id_venta) as Total_ventas
from ventas as v
inner join empleados as e
on v.id_empleado =e.id_empleado
where v.id_empleado=id_e
group by v.id_empleado;



end $$
delimiter ;

delimiter $$
-- Procedimiento que permite obtener la lista del total de ventas realizadas por cada vendedor
create procedure sp_lista_de_numero_de_ventas_por_empleado () 
begin
select v.id_empleado,
       e.Nombre,
       e.Apellido,
       count(v.id_venta) as Total_ventas

from ventas as v
inner join empleados as e
on v.id_empleado =e.id_empleado
group by v.id_empleado
order by count(v.id_venta) desc;

end $$

delimiter ;


-- SECCION TRIGGER
delimiter $$
-- Trigger que nos permite capturar los datos de los empleados en la tabla registro_de_ex_empleados antes de borrar los datos en la tabla empleados
create trigger trb_registro_de_ex_empleados
before delete on empleados
for each row
begin
insert into registro_de_ex_empleados (id_empleado,Nombre, Apellido, Teléfono, Fecha_de_ingreso,
Cargo, id_sucursal, Fecha_desvinculación,usuario ) values 
(old.id_empleado,old.Nombre,old.Apellido,old.Teléfono,old.Fecha_de_ingreso,old.Cargo,old.id_sucursal,now(),session_user());
end $$
delimiter ;
  
delimiter $$
-- Trigger que permite registrar en la tabla control_de_registros_en_tabla_productos, el id del nuevo productos como también datos asociados al responsable del registro
create trigger tra_control_de_registros_en_tabla_productos
after insert on productos
for each row
begin
insert into control_de_registros_en_tabla_productos (id_producto,Fecha_de_carga,usuario ) values 
(new.id_producto,now(),session_user());
end $$
delimiter ; 
  
-- CONSULTAS Y PROCEDIMIENTOS PARA INFORMES

-- Consulta que permite ver el número de unidades vendidas por cada producto
select p.nombre, p.marca,p.estilo,p.talla,p.color, sum(pvp.Número_de_unidades),pvp.id_producto
from productos as p
inner join puente_ventas_productos as pvp
on p.id_producto=pvp.id_producto
group by (pvp.id_producto);

-- Consulta para determinar el nùmero de unidades compradas por cada cliente
select c.id_cliente,c.nombre,c.apellido,sum(pvp.Número_de_unidades)
from productos as p
inner join puente_ventas_productos as pvp
on p.id_producto=pvp.id_producto
inner join ventas as v
on pvp.id_venta=v.id_venta
inner join clientes as c
on v.id_cliente=c.id_cliente
group by (c.id_cliente);


-- Procedimiento que muestra el margen de ganancia obtenido por tipo de producto vendidos
delimiter $$

create procedure sp_P1()
begin
declare N  varchar(200);
declare M varchar(200);
declare E varchar(200);
declare T varchar(10);
declare C varchar(50);
declare venta decimal(10,2);
declare costo decimal (10,2);
declare margen decimal (10,2);


declare items cursor for select p.Nombre,p.Marca,p.Estilo,p.Talla,p.Color,p.Precio_venta,p.Precio_costo
 from productos p;
open items;
LOOP
fetch  items into N, M, E, T,C, venta, costo;

set margen = venta - costo;
select N AS nombre,
       M as marca,
       E as estilo,
       T as talla,
       C as color,
	   precio_venta,
	   precio_costo,
	   margen;
end LOOP;
close items;

end $$
delimiter ;




















