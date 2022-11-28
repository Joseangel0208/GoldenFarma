Create Database GOLDENFARMADB
USE GOLDENFARMADB

CREATE TABLE Medicina (
  ID_Producto int NOT NULL ,
  descripcion varchar(30) NOT NULL,
  precio_venta int NOT NULL,
  precio_costo int NOT NULL,
  stock int NOT NULL,
  cod_tipo_articulo int NOT NULL,
  cod_proveedor varchar(20) NOT NULL,
  fecha_ingreso varchar(15) NOT NULL,
  PRIMARY KEY (ID_Producto),
 
)

INSERT INTO [dbo].[Medicina] (ID_Producto,descripcion,precio_venta,precio_costo,stock,cod_tipo_articulo,cod_proveedor,fecha_ingreso)
values (1,'Acetaminofen',6,4,40,001,2022,'2022-11-23')
select *from Medicina

CREATE TABLE Ciudad (
  Codigo_ciudad int NOT NULL ,
  Nombre_ciudad varchar(30) NOT NULL,
  PRIMARY KEY (Codigo_ciudad)
)

insert into Ciudad(Codigo_ciudad,Nombre_ciudad)
values (1,'Managua'),
(2,'Granada')
select *from Ciudad

CREATE TABLE cliente (
  Documento varchar(15) NOT NULL,
  cod_tipo_documento int NOT NULL,
  Nombres varchar(30) NOT NULL,
  Apellidos varchar(30) NOT NULL,
  Direccion varchar(20) DEFAULT NULL,
  cod_ciudad int NOT NULL,
  Telefono varchar(20) DEFAULT NULL,
  PRIMARY KEY (Documento),
) 
insert into cliente(Documento,cod_tipo_documento,Nombres,Apellidos,Direccion,cod_ciudad,Telefono)
values (00031,1,'Jose','Lopez','Managua',1,'88339413')
select *from cliente

CREATE TABLE Venta (
  cod_factura varchar(20) NOT NULL,
  cod_articulo int NOT NULL,
  cantidad int NOT NULL,
  total decimal(10,0) NOT NULL,
  PRIMARY KEY (cod_factura,cod_articulo),
  
)
insert into Venta(cod_factura,cod_articulo,cantidad,total)
values ('Fact-001',1,2,12)
select *from Venta

CREATE TABLE devolucion (
  cod_detallefactura varchar(20) NOT NULL,
  cod_detallearticulo int NOT NULL,
  Motivo varchar(15) NOT NULL,
  Fecha_devolucion varchar(10) NOT NULL,
  cantidad int NOT NULL,
  PRIMARY KEY (cod_detallefactura,cod_detallearticulo),
) 
INSERT INTO devolucion(cod_detallefactura,cod_detallearticulo,Motivo,Fecha_devolucion,cantidad)
values ('Fact-001',1,'Malo','2022-11-23',1)
SELECT *FROM devolucion

CREATE TABLE factura (
  Nnm_factura varchar(20) NOT NULL,
  cod_cliente varchar(15) NOT NULL,
  Nombre_empleado varchar(30) NOT NULL,
  Fecha_facturacion varchar(15) NOT NULL,
  cod_formapago int NOT NULL,
  total_factura decimal(10,0) DEFAULT NULL,
  IVA decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (Nnm_factura),
)
INSERT INTO factura(Nnm_factura,cod_cliente,Nombre_empleado,Fecha_facturacion,cod_formapago,total_factura,IVA)
values ('Fact-001','1','Jose','2022-11-22',1,4321,40)
select *from factura

CREATE TABLE forma_de_pago (
  id_formapago int NOT NULL,
  Descripcion_formapago varchar(20) NOT NULL,
  PRIMARY KEY (id_formapago)
)
insert into forma_de_pago(id_formapago,Descripcion_formapago)
values (1,'Efectivo'),(2,'Tarjeta'),(3,'Cheque')
select *from forma_de_pago

CREATE TABLE proveedor (
  No_documento varchar(20) NOT NULL,
  cod_tipo_documento int NOT NULL,
  Nombre varchar(20) NOT NULL,
  Apellido varchar(20) NOT NULL,
  Nombre_comercial varchar(20) NOT NULL,
  direccion varchar(20) DEFAULT NULL,
  cod_ciudad int NOT NULL,
  Telefono varchar(15) DEFAULT NULL,
  PRIMARY KEY (No_documento),
)
insert into proveedor(No_documento,cod_tipo_documento,Nombre,Apellido,Nombre_comercial,direccion,cod_ciudad,Telefono)
values (001,2,'Carlos','Gurdian','MK','Managua',1,22654387)
select *from proveedor


CREATE TABLE tipo_articulo (
  id_tipoarticulo int NOT NULL ,
  descripcion_articulo varchar(30) NOT NULL,
  PRIMARY KEY (id_tipoarticulo)
)

insert into tipo_articulo(id_tipoarticulo,descripcion_articulo)
values (1,'Antibioticos')

CREATE TABLE tipo_de_documento (
  id_tipo_documento int NOT NULL ,
  Descripcion varchar(10) NOT NULL,
  PRIMARY KEY (id_tipo_documento)
) 
insert into tipo_de_documento(id_tipo_documento,Descripcion)
values (1,'Cedula')
select *from tipo_de_documento

ALTER TABLE Medicina
  --ADD CONSTRAINT ref_prov_art FOREIGN KEY (cod_proveedor) REFERENCES proveedor (No_documento) ON DELETE CASCADE ON UPDATE CASCADE
  --ADD CONSTRAINT ref_tipo_articulo FOREIGN KEY (cod_tipo_articulo) REFERENCES tipo_articulo (id_tipoarticulo) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE cliente
  --ADD CONSTRAINT ref_ciudad FOREIGN KEY (cod_ciudad) REFERENCES ciudad (Codigo_ciudad) ON DELETE CASCADE ON UPDATE CASCADE
  --ADD CONSTRAINT ref_tipo_doc FOREIGN KEY (cod_tipo_documento) REFERENCES tipo_de_documento (id_tipo_documento) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE detalle_factura
 -- ADD CONSTRAINT ref_ar_fact FOREIGN KEY (cod_articulo) REFERENCES articulo (id_articulo) ON DELETE CASCADE ON UPDATE CASCADE
 -- ADD CONSTRAINT ref_facturacion FOREIGN KEY (cod_factura) REFERENCES factura (Nnm_factura) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE devolucion
  --ADD CONSTRAINT ref_detallefactu FOREIGN KEY (cod_detallefactura) REFERENCES detalle_factura (cod_factura) ON DELETE CASCADE ON UPDATE CASCADE
  --ADD CONSTRAINT ref_deta_art FOREIGN KEY (cod_detallearticulo) REFERENCES detalle_factura (cod_articulo) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE factura
  --ADD CONSTRAINT ref_cli FOREIGN KEY (cod_cliente) REFERENCES cliente (Documento) ON DELETE CASCADE ON UPDATE CASCADE,
  --ADD CONSTRAINT ref_formapago FOREIGN KEY (cod_formapago) REFERENCES forma_de_pago (id_formapago) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE proveedor 
  --ADD CONSTRAINT proveedor_ibfk_1 FOREIGN KEY (cod_tipo_documento) REFERENCES tipo_de_documento (id_tipo_documento) ON DELETE CASCADE ON UPDATE CASCADE,
  --ADD CONSTRAINT ref_prov_ciudad FOREIGN KEY (cod_ciudad) REFERENCES ciudad (Codigo_ciudad) ON DELETE NO ACTION ON UPDATE NO ACTION;

