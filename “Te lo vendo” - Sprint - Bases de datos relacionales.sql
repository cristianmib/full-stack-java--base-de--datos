-- “Te lo vendo” - Sprint - Bases de datos relacionales
/*
Integrantes:
NICOLÁS MUÑOZ
FRANCISCO CARREÑO
CRISTIAN MATURANA
ERICK DÍAZ
*/

-- Se crea y se asigna el uso de la base de datos "telovendo".
CREATE SCHEMA `telovendo` ;
use telovendo;

-- Se crea la tabla "cliente".
CREATE TABLE `telovendo`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`));

-- Se llena la tabla "cliente".
INSERT INTO `telovendo`.`cliente` (`nombre`, `apellido`, `direccion`) VALUES ('Raul', 'Soto', 'Las Dalias 376');
INSERT INTO `telovendo`.`cliente` (`nombre`, `apellido`, `direccion`) VALUES ('Marcos', 'Cornejo', 'Las Codornises 3945');
INSERT INTO `telovendo`.`cliente` (`nombre`, `apellido`, `direccion`) VALUES ('Claudia', 'Tapia', 'Recoleta 322');
INSERT INTO `telovendo`.`cliente` (`nombre`, `apellido`, `direccion`) VALUES ('Aurelio', 'Sanchez', 'Miraflores 510');
INSERT INTO `telovendo`.`cliente` (`nombre`, `apellido`, `direccion`) VALUES ('Pedro', 'Nuñez', 'Alameda 452');

-- Se crea la tabla "proveedor".
CREATE TABLE `telovendo`.`proveedor` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre_representante` VARCHAR(45) NOT NULL,
  `nombre_corporativo` VARCHAR(45) NOT NULL,
  `telefono_fijo` INT NOT NULL,
  `telefono_movil` INT NOT NULL,
  `contacto` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_proveedor`));

-- Se registran datos en la tabla "proveedor".
INSERT INTO `telovendo`.`proveedor` (`nombre_representante`, `nombre_corporativo`, `telefono_fijo`, `telefono_movil`, `contacto`, `categoria`, `email`) VALUES ('Felipe Muñoz', 'PC Factory', '327822246', '54795842', 'Raul Perez', 'Insumos computación', 'pcf@gmail.com');
INSERT INTO `telovendo`.`proveedor` (`nombre_representante`, `nombre_corporativo`, `telefono_fijo`, `telefono_movil`, `contacto`, `categoria`, `email`) VALUES ('Orlando Cardenas', 'Cintegral', '328925445', '24589671', 'Rita Marambio', 'Insumos computación', 'contacto@cintegral.cl');
INSERT INTO `telovendo`.`proveedor` (`nombre_representante`, `nombre_corporativo`, `telefono_fijo`, `telefono_movil`, `contacto`, `categoria`, `email`) VALUES ('Carla Gomez', 'WOM', '324875683', '87958645', 'María Gonzalez', 'Telecomunicaciones', 'womcomercial@wom.cl');
INSERT INTO `telovendo`.`proveedor` (`nombre_representante`, `nombre_corporativo`, `telefono_fijo`, `telefono_movil`, `contacto`, `categoria`, `email`) VALUES ('Andrés Jara', 'Radiovisión', '324589567', '85879452', 'Jose Jimenez', 'Electrónica', 'ventas@radiovision.cl');
INSERT INTO `telovendo`.`proveedor` (`nombre_representante`, `nombre_corporativo`, `telefono_fijo`, `telefono_movil`, `contacto`, `categoria`, `email`) VALUES ('Gonzalo Perez', 'Compunet', '325864788', '42525689', 'Marlene Olavarría', 'Insumos computación', 'marketing@compunet.cl');

-- El siguiente código crea la tabla "producto".
CREATE TABLE `telovendo`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `id_proveedor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_producto`));

-- Se modifica la tabla "producto" para agregar el campo "stock".
ALTER TABLE `telovendo`.`producto` 
ADD COLUMN `stock` INT NOT NULL AFTER `color`;

-- Se registran productos en la tabla creada anteriormente.
INSERT INTO `telovendo`.`producto` (`id_proveedor`, `nombre`, `precio`, `categoria`, `color`, `stock`) VALUES ('1', 'mouse rx-20', '22000', 'Insumos computación', 'azul', 10);
INSERT INTO `telovendo`.`producto` (`id_proveedor`, `nombre`, `precio`, `categoria`, `color`, `stock`) VALUES ('2', 'teclado gh-50', '30000', 'Insumos computación', 'gris', 5);
INSERT INTO `telovendo`.`producto` (`id_proveedor`, `nombre`, `precio`, `categoria`, `color`, `stock`) VALUES ('3', 'samsung galaxy s21', '950000', 'Telecomunicaciones', 'dorado', 3);
INSERT INTO `telovendo`.`producto` (`id_proveedor`, `nombre`, `precio`, `categoria`, `color`, `stock`) VALUES ('3', 'iphone x', '850000', 'Telecomunicaciones', 'negro', 4);
INSERT INTO `telovendo`.`producto` (`id_proveedor`, `nombre`, `precio`, `categoria`, `color`, `stock`) VALUES ('4', 'capacitor', '1050', 'Electrónica', 'negro', 100);
INSERT INTO `telovendo`.`producto` (`id_proveedor`, `nombre`, `precio`, `categoria`, `color`, `stock`) VALUES ('4', 'transformador 220 5v', '7000', 'Electrónica', 'azul', 10);
INSERT INTO `telovendo`.`producto` (`id_proveedor`, `nombre`, `precio`, `categoria`, `color`, `stock`) VALUES ('5', 'memoria ram 32 kingston', '150000', 'Insumos computación', 'negro', 10);
INSERT INTO `telovendo`.`producto` (`id_proveedor`, `nombre`, `precio`, `categoria`, `color`, `stock`) VALUES ('4', 'desoldador manual', '9000', 'Electrónica', 'azul', 5);
INSERT INTO `telovendo`.`producto` (`id_proveedor`, `nombre`, `precio`, `categoria`, `color`, `stock`) VALUES ('5', 'teclado inalámbrico', '20000', 'Insumos computación', 'negro', 4);
INSERT INTO `telovendo`.`producto` (`id_proveedor`, `nombre`, `precio`, `categoria`, `color`, `stock`) VALUES ('5', 'monitor 32\" samsung', '72000', 'Insumos computación', 'negro', 7);

-- Cuál es la categoría de productos que más se repite.
-- R: Insumos computación
select categoria, count(categoria) cantidad
from producto
group by categoria
order by cantidad desc;

-- Cuáles son los productos con mayor stock.
select nombre, stock
from producto
order by stock desc;

-- Qué color de producto es el más común en nuestra tienda.
select color, count(color) cantidad
from producto
group by color
order by cantidad desc;

-- Se define la llave foránea en la tabla "producto".
ALTER TABLE `telovendo`.`producto` 
ADD INDEX `fk_01_idx` (`id_proveedor` ASC) VISIBLE;
;
ALTER TABLE `telovendo`.`producto` 
ADD CONSTRAINT `fk_01`
  FOREIGN KEY (`id_proveedor`)
  REFERENCES `telovendo`.`proveedor` (`id_proveedor`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- Cual o cuales son los proveedores con menor stock de productos.
select nombre_corporativo, sum(producto.stock) as stock_total
from proveedor
inner join producto on (proveedor.id_proveedor = producto.id_proveedor)
group by nombre_corporativo
order by stock_total;

-- Cambien la categoría de productos más popular por ‘Electrónica y computación’.
select categoria, count(categoria) cantidad
from producto
group by categoria
order by cantidad desc;

update producto
set categoria = 'Electrónica y computación'
where categoria = 'Insumos computación';