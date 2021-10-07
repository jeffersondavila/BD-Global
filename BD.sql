SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE SCHEMA IF NOT EXISTS `empresarial` DEFAULT CHARACTER SET utf8;
USE `empresarial`;

  -- -----------------------------------------------------
  -- Table `hoteleria`.`Piso`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_piso` (
    `PK_id_piso` INT NOT NULL,
    `cantidad_habitaciones_piso` INT NULL DEFAULT NULL,
    `descripcion_piso` VARCHAR(200) NULL DEFAULT NULL,
    `estado_piso` TINYINT NULL DEFAULT NULL,
    PRIMARY KEY (`PK_id_piso`)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
INSERT INTO 
`empresarial`.`tbl_piso` (
`PK_id_piso`, 
`cantidad_habitaciones_piso`, 
`descripcion_piso`, 
`estado_piso`) 
VALUES ('1', '100', 'Habitaciones grandes', '1'),
('2', '200', 'Habitaciones mediana', '1'),
('3', '300', 'Habitaciones pequeña', '1'),
('4', '50', 'Habitaciones VIP', '1');

  -- -----------------------------------------------------
  -- Table `hoteleria`.`horario`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_horario` (
    `PK_id_horario` INT NOT NULL,
    `entrada_horario` VARCHAR(10) NULL DEFAULT NULL,
    `salida_horario` VARCHAR(10) NULL DEFAULT NULL,
    `horas_extras_horario` INT NULL DEFAULT NULL,
    `descripcion_horario` VARCHAR(200) NULL DEFAULT NULL,
    `estado_horario` TINYINT NULL DEFAULT NULL,
    PRIMARY KEY (`PK_id_horario`)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
  INSERT INTO 
`empresarial`.`tbl_horario` (
`PK_id_horario`, 
`entrada_horario`, 
`salida_horario`, 
`horas_extras_horario`, 
`descripcion_horario`, 
`estado_horario`) 
VALUES ('1', '8 am', '8 pm', '8', 'Horario matutino', '1'),
('2', '12 am', '12 pm', '1', 'Horario de tarde', '1'),
('3', '9 am', '9 pm', '5', 'Horario nocturno', '1');

 -- -----------------------------------------------------
  -- Table `hoteleria`.`impuesto`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_impuesto` (
    `PK_id_impuesto` INT NOT NULL,
    `nombre_impuesto` VARCHAR(45) NULL DEFAULT NULL,
    `valor_impuesto` DECIMAL NULL DEFAULT NULL,
    `descripcion_impuesto` VARCHAR(200) NULL DEFAULT NULL,
    `estado_impuesto` TINYINT NULL DEFAULT NULL,
    PRIMARY KEY (`PK_id_impuesto`)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
  -- Table `hoteleria`.`tbl_metodo_de_pago`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_metodo_de_pago` (
    `PK_id_metodo` INT NOT NULL,
    `nombre_metodo` VARCHAR(50) NULL DEFAULT NULL,
    `descripcion_metodo` VARCHAR(100) NULL DEFAULT NULL,
    `estado_metodo` TINYINT NULL DEFAULT NULL,
    PRIMARY KEY (`PK_id_metodo`)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
INSERT INTO
  `empresarial`.`tbl_metodo_de_pago` (
    `PK_id_metodo`,
    `nombre_metodo`,
    `descripcion_metodo`,
    `estado_metodo`
  )
VALUES
  ('1', 'Tarjeta', 'Pago con tarjeta', '1'),
  ('2', 'Efectivo', 'Pago en efectivo', '1'),
  ('3','Criptomoneda Ethereum','Fase beta del método de prueba con CriptoMoneda Ethereum','0'),
  ('4','PAYPAL','Forma de pago PayPal a nuestra cuenta en brasil','0'),
  ('5','MovilPay','Pago en fase alpha para pagar mediante el celular.','0');
  
  -- -----------------------------------------------------
  -- Table `hoteleria`.`tbl_servicios`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_servicio` (
    `PK_id_servicio` INT NOT NULL,
    `nombre_servicio` VARCHAR(50) NULL DEFAULT NULL,
    `descripcion_servicio` VARCHAR(100) NULL DEFAULT NULL,
    `precio_servicio` INT NOT NULL,
    `tipo_servicio` TINYINT NOT NULL,
    `estado_servicio` TINYINT NOT NULL,
    PRIMARY KEY (`PK_id_servicio`)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
INSERT INTO
  `tbl_servicio` (
    `PK_id_servicio`,
    `nombre_servicio`,
    `descripcion_servicio`,
    `precio_servicio`,
    `tipo_servicio`,
    `estado_servicio`
  )
VALUES
  ('1', 'Internet', '50mg', '150', '1', '1'),
  ('2','Niñera','Cuido de niños menores de 10 años','250','2','1'),
  ('3','Acceso VIP del Restaurante','acceso VIP del restaurante durante una noche','375','2','1'),
  ('4','SPA','SPA para un máximo de 10 personas','500','2','2'),
  ('5','Sector para Fumadores','Amplio sector para personas puedan fumar tranquilamente','150','2','1');

-- -----------------------------------------------------
  -- Table `hoteleria`.`tbl_mantenimiento_habitacion`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_mantenimiento_habitacion` (
    `PK_id_habitacion` INT NOT NULL,
    `precio_habitacion` INT(45) NULL DEFAULT NULL,
    `PK_id_piso` INT NULL DEFAULT NULL,
    `estado_habitacion` TINYINT NULL DEFAULT NULL,
    `estado_limpieza` TINYINT NULL DEFAULT NULL,
    `tipo_de_habitacion` INT(5) NULL DEFAULT NULL,
    `cantidad_maxima_persona` INT(5) NULL DEFAULT NULL,
    PRIMARY KEY (`PK_id_habitacion`),
    FOREIGN KEY (`PK_id_piso`) REFERENCES `tbl_piso`(`PK_id_piso`)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
INSERT INTO
  `tbl_mantenimiento_habitacion` (
    `PK_id_habitacion`,
    `precio_habitacion`,
    `PK_id_piso`,
    `estado_habitacion`,
    `estado_limpieza`,
    `tipo_de_habitacion`,
    `cantidad_maxima_persona`
  )
VALUES
  ('1', '250', '1', '0', '1', '1', '5'),
  ('2', '250', '4', '1', '2', '1', '6'),
  ('3', '250', '1', '0', '1', '2', '7'),
  ('4', '250', '4', '1', '2', '2', '8'),
  ('5', '250', '1', '0', '1', '2', '9');

  -- -----------------------------------------------------
  -- Table `hoteleria`.`tbl_huespedes`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_huesped` (
    `PK_no_identificacion` INT NOT NULL,
    `nombre_huesped` VARCHAR(50) NULL DEFAULT NULL,
    `apellido_huesped` VARCHAR(100) NULL DEFAULT NULL,
    `nacionalidad_huesped` VARCHAR(100) NULL DEFAULT NULL,
    `direccion_huesped` VARCHAR(100) NULL DEFAULT NULL,
    `sexo_huesped` VARCHAR(5) NULL DEFAULT NULL,
    `telefono_huesped` INT DEFAULT NULL,
    `cumpleaños_huesped` DATE NULL DEFAULT NULL,
    PRIMARY KEY (`PK_no_identificacion`)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
INSERT INTO
  `empresarial`.`tbl_huesped` (
    `PK_no_identificacion`,
    `nombre_huesped`,
    `apellido_huesped`,
    `nacionalidad_huesped`,
    `direccion_huesped`,
    `sexo_huesped`,
    `telefono_huesped`,
    `cumpleaños_huesped`
  )
VALUES
  ('1','Alberto','Suarez','Mexicano','alberto@gmail.com','M','12345678','2000-6-28'),
  ('12','Luis Carlos','lee','Guatemalteco','leeluis@gmail.com','M','87654321','2000-6-28'),
  ('123','Leonel','Dominguez','Guatemalteco','leo@gmail.com','M','123456789','2000-6-28'),
  ('1234','Jefferson','Davila','Jamaiquino','jeff@gmail.com','M','612345678','2000-6-28'),
  ('12345','Gerson','Meda','Español','meda@gmail.com','M','1234585678','2000-6-28');

  -- -----------------------------------------------------
  -- Table `hoteleria`.`tbl_menu_restaurante`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_menu_restaurante` (
    `PK_codigo_correlativo` INT NOT NULL,
    `nombre_plato` VARCHAR(100) NULL DEFAULT NULL,
    `descripcion_plato` VARCHAR(100) NULL DEFAULT NULL,
    `precio_plato` INT NOT NULL,
    `estado_plato` TINYINT NULL DEFAULT NULL,
    PRIMARY KEY (`PK_codigo_correlativo`)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
INSERT INTO
  `empresarial`.`tbl_menu_restaurante` (
    `PK_codigo_correlativo`,
    `nombre_plato`,
    `descripcion_plato`,
    `precio_plato`,
    `estado_plato`
  )
VALUES
  ('1', 'pizza', 'pizza clasica', '50', '1'),
  ('12', 'burrito', 'burrito clasico', '20', '1'),
  ('123','hamburguesa','hamburguesa clasica','30','0'),
  ('1234', 'lasaña', 'lasaña clasica', '20', '0'),
  ('12345', 'tacos', 'tacos clasicos', '10', '0');
  
  -- -----------------------------------------------------
  -- Table `hoteleria`.`tbl_tarifa`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_tarifa` (
    `PK_id_tarifa` INT NOT NULL,
    `id_habitacion_tarifa` INT NOT NULL,
    `nombre_tarifa` VARCHAR(60) NULL DEFAULT NULL,
    `sub_total_tarifa` FLOAT DEFAULT NULL,
    PRIMARY KEY (`PK_id_tarifa`),
    FOREIGN KEY (id_habitacion_tarifa) REFERENCES tbl_mantenimiento_habitacion(PK_id_habitacion)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
  -- Table `hoteleria`.`tbl_paquete_servicio`
  -- -----------------------------------------------------
  CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_paquete` (
    `PK_correlativo_paquete` INT AUTO_INCREMENT NOT NULL,
    `id_tarifa_paquete` INT NOT NULL,
    `id_servicio_paquete` INT NOT NULL,
    `sub_total_paquete` FLOAT DEFAULT NULL,
    PRIMARY KEY (`PK_correlativo_paquete`),
    FOREIGN KEY (id_tarifa_paquete) REFERENCES tbl_tarifa(PK_id_tarifa),
    FOREIGN KEY (id_servicio_paquete) REFERENCES tbl_servicio(PK_id_servicio)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

  -- -----------------------------------------------------
  -- Table `hoteleria`.`tbl_reservacion`
  -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_reservacion` (
    `PK_id_reservacion` INT NOT NULL,
    `fecha_entrada_reservacion` DATE NOT NULL,
    `fecha_salida_reservacion` DATE NOT NULL,
    `identificacion_huesped_reservacion` INT NOT NULL,
    `cantidad_personas_reservacion` INT NOT NULL,
    `total_reservacion` INT NOT NULL,
    `estado_reservacion` TINYINT NULL DEFAULT NULL,
    PRIMARY KEY (`PK_id_reservacion`),   
    FOREIGN KEY (identificacion_huesped_reservacion) REFERENCES tbl_huesped(PK_no_identificacion)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

  -- -----------------------------------------------------
  -- Table `hoteleria`.`tbl_detalle_reservacion`
  -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_detalle_reservacion` (
    `Pk_correlativo_detalle` INT AUTO_INCREMENT NOT NULL,
    `id_reservacion_detalle` INT NOT NULL,
    `id_tarifa_detalle` INT NOT NULL,
    `sub_total_detalle` FLOAT NOT NULL,
    PRIMARY KEY (`Pk_correlativo_detalle`),
    FOREIGN KEY (id_tarifa_detalle) REFERENCES tbl_tarifa(PK_id_tarifa),
    FOREIGN KEY (id_reservacion_detalle) REFERENCES tbl_reservacion(PK_id_reservacion)
  ) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `hoteleria`.`tbl_solicitud_viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_solicitud_viaje`(
	`PK_id_solicitud` INT NOT NULL,
    `PK_id_reservacion` INT NOT NULL,
    `id_destino`INT NOT NULL,
    `id_transporte` INT NOT NULL,
    `precio_viaje` INT NOT NULL,
    PRIMARY KEY (`Pk_id_solicitud`),
    FOREIGN KEY (PK_id_reservacion) REFERENCES tbl_reservacion(PK_id_reservacion)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `hoteleria`.`tbl_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_factura`(
	`PK_id_factura` INT NOT NULL,
    `fecha_emision_factura` DATE NOT NULL,
    `PK_id_reservacion` INT NOT NULL,
    `PK_id_asignar_servicio` INT NOT NULL,
    `PK_id_impuesto` INT NOT NULL,
    PRIMARY KEY (`PK_id_factura`),
    FOREIGN KEY (PK_id_reservacion) REFERENCES tbl_reservacion(PK_id_reservacion)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `hoteleria`.`tbl_menu_orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_menu_orden`(
	`PK_id_orden` INT NOT NULL,
    `PK_id_menu` INT NOT NULL,
    `cantidad_orden` INT NOT NULL,
    `no_mesa` INT NOT NULL,
    `horario_orden` VARCHAR(10) NOT NULL,
    `fecha_orden` DATE NOT NULL,
    `PK_id_metodo_pago` INT NOT NULL,
    `PK_id_habitacion` INT DEFAULT NULL,
    `total_orden` INT NOT NULL,
    PRIMARY KEY (`PK_id_orden`),
    FOREIGN KEY (PK_id_menu) REFERENCES tbl_menu_restaurante(PK_codigo_correlativo)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `empresarial`.`linea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_linea` (
 `PK_codigo_linea` INT NULL DEFAULT NULL,
   `nombre_linea` VARCHAR(35) NULL DEFAULT NULL,
  `estatus_linea` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_linea`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_marca` (
 `PK_codigo_marca` INT NULL DEFAULT NULL,
   `nombre_marca` VARCHAR(35) NULL DEFAULT NULL,
  `estatus_marca` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_marca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`bodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_bodega` (
 `PK_codigo_bodega` INT NULL DEFAULT NULL,
   `nombre_bodega` VARCHAR(35) NULL DEFAULT NULL,
  `estatus_bodega` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_bodega`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`unidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_unidad` (
 `PK_codigo_unidad` INT NULL DEFAULT NULL,
   `unidad_entrada` VARCHAR(35) NULL DEFAULT NULL,
  `unidad_salida` VARCHAR(35) NULL DEFAULT NULL,
  PRIMARY KEY (`PK_codigo_unidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`transporte_fecha`
-- -----------------------------------------------------
 CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_transportefecha` (
	`PK_codigo_transportefecha` INT NULL DEFAULT NULL,
    `nombre_transportefecha` VARCHAR(35) NULL DEFAULT NULL,
    `fecha_transportefecha` VARCHAR(35) NULL DEFAULT NULL,
    `estatus_transportefecha` TINYINT(2) NOT NULL,
	PRIMARY KEY (`PK_codigo_transportefecha`))
	ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `administracion`.`transporte_tipo`
-- -----------------------------------------------------
 CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_transportetipo` (
	`PK_codigo_transporte_tipo` INT NULL DEFAULT NULL,
    `nombre_transportetipo` VARCHAR(35) NULL DEFAULT NULL,
    `tipo_transportetipo` VARCHAR(35) NULL DEFAULT NULL,
    `estatus_transportefecha` TINYINT(2) NOT NULL,
	PRIMARY KEY (`PK_codigo_transporte_tipo`))
	ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`transporte_ruta`
-- -----------------------------------------------------
 CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_transporteruta` (
	`PK_codigo_transporteruta` INT NULL DEFAULT NULL,
    `nombre_transporteruta` VARCHAR(35) NULL DEFAULT NULL,
    `direccion_transporteruta` VARCHAR(35) NULL DEFAULT NULL,
    `costo_transporteruta` TINYINT(2) NOT NULL,
	PRIMARY KEY (`PK_codigo_transporteruta`))
	ENGINE = InnoDB
	DEFAULT CHARACTER SET = utf8;











-- -----------------------------------------------------
-- Table `administracion`.`transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_transporte` (
 `PK_codigo_transporte` INT NULL DEFAULT NULL,
   `nombre_transporte` VARCHAR(35) NULL DEFAULT NULL,
  `tipo_transporte` VARCHAR(35) NULL DEFAULT NULL,
  `estatus_transporte` TINYINT(2) NOT NULL,
  `PK_codigo_transportefecha` INT NULL DEFAULT NULL,
  `PK_codigo_transporte_tipo` INT NULL DEFAULT NULL,
  `PK_codigo_transporte_ruta` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_codigo_transporte`
  ,`PK_codigo_transportefecha`
  , `PK_codigo_transporte_tipo`
  , `PK_codigo_transporte_ruta`
  ),
  CONSTRAINT `PK_codigo_transportefecha`
  FOREIGN KEY (`PK_codigo_transportefecha`)
REFERENCES `empresarial`.`tbl_transportefecha` (`PK_codigo_transportefecha`),
    CONSTRAINT `PK_codigo_transporte_tipo`
  FOREIGN KEY (`PK_codigo_transporte_tipo`)
REFERENCES `empresarial`.`tbl_transportetipo` (`PK_codigo_transporte_tipo`),
  CONSTRAINT `tbl_transporteruta1`
  FOREIGN KEY (`PK_codigo_transporte_ruta`)
REFERENCES `empresarial`.`tbl_transporteruta` (`PK_codigo_transporteruta`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;





-- -----------------------------------------------------
-- Table `administracion`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_producto` (
 `PK_codigo_producto` INT NULL DEFAULT NULL,
   `nombre_producto` VARCHAR(35) NULL DEFAULT NULL,
  `descripcion_producto` VARCHAR(35) NULL DEFAULT NULL,
  `precio_producto` INT(10) DEFAULT NULL,
  `costo_producto` INT (10) DEFAULT NULL,
  `estatus_producto` TINYINT(2) NOT NULL,
  `codigo_linea` INT NULL DEFAULT NULL,
  `codigo_marca` INT NULL DEFAULT NULL,
  `codigo_bodega` INT NULL DEFAULT NULL,
  `codigo_unidad` INT NULL DEFAULT NULL,
  
  PRIMARY KEY (
  `PK_codigo_producto`,
  `codigo_linea`,
  `codigo_marca`,
  `codigo_bodega`,
  `codigo_unidad`
),
  CONSTRAINT `fk_codigo_linea`
  FOREIGN KEY (`codigo_linea`)
REFERENCES `empresarial`.`tbl_linea` (`PK_codigo_linea`),

CONSTRAINT `fk_codigo_marca`
FOREIGN KEY (`codigo_marca`)
REFERENCES `empresarial`.`tbl_marca` (`PK_codigo_marca`),   
  
CONSTRAINT `fk_codigo_bodega` 
FOREIGN KEY (`codigo_bodega`)
REFERENCES `empresarial`.`tbl_bodega` (`PK_codigo_bodega`),
 
 CONSTRAINT `fk_codigo_unidad1` 
 FOREIGN KEY (`codigo_unidad`)
REFERENCES `empresarial`.`tbl_unidad` (`PK_codigo_unidad`)
   
  
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`existencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_existencia` (

`Pk_codigo_producto` INT NULL DEFAULT NULL,
`Pk_codigo_bodega` INT NULL DEFAULT NULL,
`existencia_cantidad`INT NULL DEFAULT NULL,
  PRIMARY KEY (
 
  `Pk_codigo_producto` ,
  `Pk_codigo_bodega`

),
CONSTRAINT `fk_PK_codigo_producto1` 
  FOREIGN KEY (`Pk_codigo_producto`)
REFERENCES `empresarial`.`tbl_producto` (`PK_codigo_producto`),
CONSTRAINT `fk_PK_codigo_bodega1` 
FOREIGN KEY (`PK_codigo_bodega`)
REFERENCES `empresarial`.`tbl_bodega` (`PK_codigo_bodega`)   
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_proveedor` (
 `PK_codigo_proveedor` INT NULL DEFAULT NULL,
   `nombre_proveedor` VARCHAR(35) NULL DEFAULT NULL,
   `direccion_proveedor` VARCHAR(35) NULL DEFAULT NULL,
   `telefono_proveedor` VARCHAR(35) NULL DEFAULT NULL,
   `nit_proveedor` INT(10) DEFAULT NULL,
   `email_proveedor` VARCHAR(35) NULL DEFAULT NULL,
   `saldo_proveedor` FLOAT DEFAULT NULL,
   `estatus_proveedor` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_proveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`forma_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_pago` (
 `PK_codigo_pago` INT NULL DEFAULT NULL,
   `tipo_pago` VARCHAR(35) NULL DEFAULT NULL,
   `descripcion_pago` VARCHAR(35) NULL DEFAULT NULL,
   `fecha_pago` VARCHAR(35) NULL DEFAULT NULL,
   `estatus_pago` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_pago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`compra_factura_encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_compra_factura_encabezado` (
 `PK_codigo_factura` INT NULL DEFAULT NULL,
  `PK_codigo_bodega` INT NULL DEFAULT NULL,
 `codigo_proveedor` INT NULL DEFAULT NULL,
   `fecha_emision` VARCHAR(35) NULL DEFAULT NULL,
   `fecha_vencimiento` VARCHAR(35) NULL DEFAULT NULL,
   `codigo_pago` INT NULL DEFAULT NULL,
   `subtotal_encabezado` INT NULL DEFAULT NULL,
   `estatus_factura` TINYINT(2) NOT NULL,

  PRIMARY KEY (
  `PK_codigo_factura`,
  `Pk_codigo_bodega`,
   `codigo_pago`,
  `codigo_proveedor`
  ),
  
  CONSTRAINT `fk_codigo_proveedor1llll` 
  FOREIGN KEY (`codigo_proveedor`)
REFERENCES `empresarial`.`tbl_proveedor` (`PK_codigo_proveedor`),

CONSTRAINT `fk_codigo_pago0000000` 
  FOREIGN KEY (`codigo_pago`)
REFERENCES `empresarial`.`tbl_pago` (`PK_codigo_pago`)

  )
  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`compra_factura_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_compra_factura_detalle` (
`correlativo` INT AUTO_INCREMENT,
 `PK_codigo_factura` INT NULL DEFAULT NULL,
 `PK_codigo_producto` INT NULL DEFAULT NULL,
 `PK_codigo_bodega` INT NULL DEFAULT NULL,
 `cantidad_detalle` INT(20) NULL DEFAULT NULL,
`costo_detalle` INT(20) NULL DEFAULT NULL,
	 	
  PRIMARY KEY (
  `correlativo`,
  `PK_codigo_factura`,
 `PK_codigo_producto` ,
 
  `Pk_codigo_bodega`
  ),
  
  CONSTRAINT `fk_PK_codigo_factura10` 
  FOREIGN KEY (`Pk_codigo_factura`)
REFERENCES `empresarial`.`tbl_compra_factura_encabezado` (`PK_codigo_factura`),

CONSTRAINT `fk_PK_codigo_producto2` 
  FOREIGN KEY (`Pk_codigo_producto`)
REFERENCES `empresarial`.`tbl_producto` (`PK_codigo_producto`),

CONSTRAINT `fk_PK_codigo_bodega2` 
FOREIGN KEY (`PK_codigo_bodega`)
REFERENCES `empresarial`.`tbl_bodega` (`PK_codigo_bodega`)   
  )
  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `administracion`.`ordencompra_encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_ordencompra_encabezado` (
 `PK_codigo_ordenCompra` INT NULL DEFAULT NULL,
 `codigo_proveedor` INT NULL DEFAULT NULL,
 `PK_codigo_bodega` INT NULL DEFAULT NULL,
   `fecha_emision` VARCHAR(35) NULL DEFAULT NULL,
   `fecha_entrega` VARCHAR(35) NULL DEFAULT NULL,
   `subtotal_encabezado` INT NULL DEFAULT NULL,
   `estatus_ordecompra` TINYINT(2) NOT NULL,

  PRIMARY KEY (
  `PK_codigo_ordenCompra`,
  `codigo_proveedor`,
  `Pk_codigo_bodega`
  ),
  
  CONSTRAINT `fk_PK_codigo_proveedor2` 
  FOREIGN KEY (`codigo_proveedor`)
REFERENCES `empresarial`.`tbl_proveedor` (`PK_codigo_proveedor`)

  )
  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`ordencompra_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_ordencompra_detalle` (
`correlativo` INT AUTO_INCREMENT,
`PK_codigo_ordenCompra` INT NULL DEFAULT NULL,
 `PK_codigo_producto` INT NULL DEFAULT NULL,
 `PK_codigo_bodega` INT NULL DEFAULT NULL,
 `cantidad_detalle` INT NULL DEFAULT NULL,
 `costo_detalle` INT NULL DEFAULT NULL,

	 	
  PRIMARY KEY (
 `correlativo` ,
 `PK_codigo_ordenCompra`,
 `PK_codigo_producto` ,
  `Pk_codigo_bodega`
  ),
  
  CONSTRAINT `fk_PK_codigo_ordenCompra1` 
  FOREIGN KEY (`PK_codigo_ordenCompra`)
REFERENCES `empresarial`.`tbl_ordencompra_encabezado` (`PK_codigo_ordenCompra`),

CONSTRAINT `fk_PK_codigo_producto21` 
  FOREIGN KEY (`Pk_codigo_producto`)
REFERENCES `empresarial`.`tbl_producto` (`PK_codigo_producto`),

CONSTRAINT `fk_PK_codigo_bodega12` 
FOREIGN KEY (`PK_codigo_bodega`)
REFERENCES `empresarial`.`tbl_bodega` (`PK_codigo_bodega`)   
  )
  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_cliente` (
 `PK_codigo_cliente` INT NULL DEFAULT NULL,
   `nombre_cliente` VARCHAR(35) NULL DEFAULT NULL,
  `direccion_cliente` VARCHAR(35) NULL DEFAULT NULL,
    `telefono_cliente` VARCHAR(35) NULL DEFAULT NULL,
  `nit_cliente` INT(10) DEFAULT NULL,
    `email_cliente` VARCHAR(35) NULL DEFAULT NULL,
  `saldo_cliente` INT DEFAULT NULL,
  `cuenta_cliente` INT DEFAULT NULL,
  `estatus_cliente` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`cobrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_cobrador` (
 `PK_codigo_cobrador` INT NULL DEFAULT NULL,
   `nombre_cobrador` VARCHAR(35) NULL DEFAULT NULL,
  `estatus_cobrador` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_cobrador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `administracion`.`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_vendedor` (
 `PK_codigo_vendedor` INT NULL DEFAULT NULL,
   `nombre_vendedor` VARCHAR(35) NULL DEFAULT NULL,
  `estatus_vendedor` TINYINT(2) NOT NULL,
  PRIMARY KEY (`PK_codigo_vendedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `administracion`.`control_precio_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_control_precio_detalle` (
 `PK_codigo_producto_precio_detalle` INT NULL DEFAULT NULL,
   `PK_codigo_producto`INT NULL DEFAULT NULL,
  PRIMARY KEY (
  `PK_codigo_producto_precio_detalle`,
  `PK_codigo_producto`
),
    CONSTRAINT `fk_PK_codigo_producto_precio` 
  FOREIGN KEY (`PK_codigo_producto`)
REFERENCES `empresarial`.`tbl_producto` (`PK_codigo_producto`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `administracion`.`control_cotizacion_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_control_cotizacion_encabezado` (
 `PK_codigo_cotizacion_encabezado` INT NULL DEFAULT NULL,
   `PK_codigo_cliente`INT NULL DEFAULT NULL,
   `PK_codigo_vendedor`INT NULL DEFAULT NULL,
   `fecha_emision` VARCHAR(35) NULL DEFAULT NULL,
  PRIMARY KEY (
 `PK_codigo_cotizacion_encabezado`,
   `PK_codigo_cliente`,
   `PK_codigo_vendedor`
),
    CONSTRAINT `Fk_PK_codigo_clienteq` 
  FOREIGN KEY (`PK_codigo_cliente`)
REFERENCES `empresarial`.`tbl_cliente` (`PK_codigo_cliente`),
CONSTRAINT `FK_PK_codigo_vendedorq` 
  FOREIGN KEY ( `PK_codigo_vendedor`)
REFERENCES `empresarial`.`tbl_vendedor` (`PK_codigo_vendedor`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_control_pedido_encabezado` (
 `PK_codigo_cotizacion_encabezado` INT NULL DEFAULT NULL,
   `PK_codigo_cliente`INT NULL DEFAULT NULL,
   `PK_codigo_vendedor`INT NULL DEFAULT NULL,
   `fecha_emision` VARCHAR(35) NULL DEFAULT NULL,
  PRIMARY KEY (
 `PK_codigo_cotizacion_encabezado`,
   `PK_codigo_cliente`,
   `PK_codigo_vendedor`
),
    CONSTRAINT `Fk_PK_codigo_clientew` 
  FOREIGN KEY (`PK_codigo_cliente`)
REFERENCES `empresarial`.`tbl_cliente` (`PK_codigo_cliente`),
CONSTRAINT `FK_PK_codigo_vendedorw` 
  FOREIGN KEY ( `PK_codigo_vendedor`)
REFERENCES `empresarial`.`tbl_vendedor` (`PK_codigo_vendedor`)

  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_control_factura_encabezado` (
 `PK_codigo_cotizacion_encabezado` INT NULL DEFAULT NULL,
   `PK_codigo_cliente`INT NULL DEFAULT NULL,
   `PK_codigo_cobrador`INT NULL DEFAULT NULL,
   `PK_codigo_vendedor`INT NULL DEFAULT NULL,
   `fecha_emision` VARCHAR(35) NULL DEFAULT NULL,
  PRIMARY KEY (
 `PK_codigo_cotizacion_encabezado`,
   `PK_codigo_cliente`,
   `PK_codigo_vendedor`,
	
      `PK_codigo_cobrador`
),
    CONSTRAINT `Fk_PK_codigo_clienter` 
  FOREIGN KEY (`PK_codigo_cliente`)
REFERENCES `empresarial`.`tbl_cliente` (`PK_codigo_cliente`),
CONSTRAINT `FK_PK_codigo_vendedorr` 
  FOREIGN KEY ( `PK_codigo_vendedor`)
REFERENCES `empresarial`.`tbl_vendedor` (`PK_codigo_vendedor`),
CONSTRAINT  `FK_PK_codigo_cobradorr`
 FOREIGN KEY ( `PK_codigo_cobrador`)
REFERENCES `empresarial`.`tbl_cobrador` ( `PK_codigo_cobrador`)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_cotizacion_detalle` (
 `PK_codigo_cotizacion_detalle` INT NULL DEFAULT NULL,
   `cantidad_detalle` FLOAT(15) NULL DEFAULT NULL,
    `iva_detalle` FLOAT(15) NULL DEFAULT NULL,
   `subtotal_detalle` FLOAT(15) NULL DEFAULT NULL,
  PRIMARY KEY (
 `PK_codigo_cotizacion_detalle` 
   
)
   
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_pedido_detalle` (
 `PK_codigo_pedido_detalle` INT NULL DEFAULT NULL,
  `PK_codigo_cotizacion_detalle` INT NULL DEFAULT NULL,
   `cantidad_detalle` FLOAT(15) NULL DEFAULT NULL,
    `iva_detalle` FLOAT(15) NULL DEFAULT NULL,
   `subtotal_detalle` FLOAT(15) NULL DEFAULT NULL,
  PRIMARY KEY (
 `PK_codigo_pedido_detalle` ,
 `PK_codigo_cotizacion_detalle` ),
 
CONSTRAINT `FK_PK_codigo_cotizacion_detalleZ` 
  FOREIGN KEY ( `PK_codigo_cotizacion_detalle`)
REFERENCES `empresarial`.`tbl_cotizacion_detalle` (`PK_codigo_cotizacion_detalle`) 
  )
  ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_factura_detalle` (
 `PK_codigo_factura_detalle` INT NULL DEFAULT NULL,
  `PK_codigo_pedido_detalle` INT NULL DEFAULT NULL,
   `cantidad_detalle` FLOAT(15) NULL DEFAULT NULL,
    `iva_detalle` FLOAT(15) NULL DEFAULT NULL,
   `subtotal_detalle` FLOAT(15) NULL DEFAULT NULL,
  PRIMARY KEY (
 `PK_codigo_factura_detalle`,
 `PK_codigo_pedido_detalle` 
   
),
  CONSTRAINT `FK_PK_codigo_pedido_detalleZ` 
  FOREIGN KEY ( `PK_codigo_pedido_detalle`)
REFERENCES `empresarial`.`tbl_pedido_detalle` (`PK_codigo_pedido_detalle`) 

  
  )
  ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_pedido_detalle` (
 `PK_codigo_pedido_detalle` INT NULL DEFAULT NULL,
  `PK_codigo_cotizacion_detalle` INT NULL DEFAULT NULL,
   `cantidad_detalle` FLOAT(15) NULL DEFAULT NULL,
    `iva_detalle` FLOAT(15) NULL DEFAULT NULL,
   `subtotal_detalle` FLOAT(15) NULL DEFAULT NULL,
  PRIMARY KEY (
 `PK_codigo_pedido_detalle` ,
 `PK_codigo_cotizacion_detalle` 
),
  
 CONSTRAINT `FK_PK_codigo_cotizacion_detalleo` 
  FOREIGN KEY ( `PK_codigo_cotizacion_detalle`)
REFERENCES `empresarial`.`tbl_cotizacion_detalle` (`PK_codigo_cotizacion_detalle`) 
  
  )
  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
CREATE TABLE IF NOT EXISTS `empresarial`.`tbl_factura` (
 `PK_codigo_factura` INT NULL DEFAULT NULL,
  `PK_codigo_existencia` INT NULL DEFAULT NULL,
   `PK_codigo_producto`  INT NULL DEFAULT NULL,
    `PK_codigo_precio`  INT NULL DEFAULT NULL,
   `PK_cantidad` INT  NULL DEFAULT NULL,
  PRIMARY KEY (
 `PK_codigo_factura`,
 `PK_codigo_existencia`,
 `PK_codigo_producto`,
 `PK_codigo_precio`
),
  CONSTRAINT `FK_PK_codigo_existenciax` 
  FOREIGN KEY ( `PK_codigo_existencia`)
REFERENCES `empresarial`.`tbl_pedido_existencia` (`PK_codigo_existencia`) ,

 CONSTRAINT `FK_PK_codigo_productox`
  FOREIGN KEY ( `PK_codigo_producto`)
REFERENCES `empresarial`.`tbl_producto` (`PK_codigo_producto`) 
 
  )
  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `empresarial`.`tbl_bodega` (`PK_codigo_bodega`, `nombre_bodega`, `estatus_bodega`)
 VALUES ('1', 'zona1', '1');
INSERT INTO `empresarial`.`tbl_bodega` (`PK_codigo_bodega`, `nombre_bodega`, `estatus_bodega`) 
VALUES ('2', 'zona3', '1');
INSERT INTO `empresarial`.`tbl_bodega` (`PK_codigo_bodega`, `nombre_bodega`, `estatus_bodega`)
 VALUES ('3', 'zona10', '1');
INSERT INTO `empresarial`.`tbl_bodega` (`PK_codigo_bodega`, `nombre_bodega`, `estatus_bodega`) 
VALUES ('4', 'central', '1');

INSERT INTO `empresarial`.`tbl_marca` (`PK_codigo_marca`, `nombre_marca`, `estatus_marca`) 
VALUES ('1', 'cocacola', '1');
INSERT INTO `empresarial`.`tbl_marca` (`PK_codigo_marca`, `nombre_marca`, `estatus_marca`) 
VALUES ('2', 'señorial', '1');
INSERT INTO `empresarial`.`tbl_marca` (`PK_codigo_marca`, `nombre_marca`, `estatus_marca`) 
VALUES ('3', 'lala', '1');
INSERT INTO `empresarial`.`tbl_marca` (`PK_codigo_marca`, `nombre_marca`, `estatus_marca`)
 VALUES ('4', 'sears', '1');
INSERT INTO `empresarial`.`tbl_marca` (`PK_codigo_marca`, `nombre_marca`, `estatus_marca`) 
VALUES ('5', 'kerns', '1');

INSERT INTO `empresarial`.`tbl_linea` (`PK_codigo_linea`, `nombre_linea`, `estatus_linea`) 
VALUES ('1', 'blanca', '1');
INSERT INTO `empresarial`.`tbl_linea` (`PK_codigo_linea`, `nombre_linea`, `estatus_linea`) 
VALUES ('2', 'electronica', '1');
INSERT INTO `empresarial`.`tbl_linea` (`PK_codigo_linea`, `nombre_linea`, `estatus_linea`) 
VALUES ('3', 'deportiva', '1');
INSERT INTO `empresarial`.`tbl_linea` (`PK_codigo_linea`, `nombre_linea`, `estatus_linea`) 
VALUES ('4', 'cosmeticos', '1');

INSERT INTO `empresarial`.`tbl_pago` (`PK_codigo_pago`, `tipo_pago`, `descripcion_pago`, `fecha_pago`, `estatus_pago`) 
VALUES ('1', 'cheque', 'vence el dia', '12/08/2021', '1');
INSERT INTO `empresarial`.`tbl_pago` (`PK_codigo_pago`, `tipo_pago`, `descripcion_pago`, `fecha_pago`, `estatus_pago`) 
VALUES ('2', 'tarjeta', 'banco banrural', '16/08/2021', '1');
INSERT INTO `empresarial`.`tbl_pago` (`PK_codigo_pago`, `tipo_pago`, `descripcion_pago`, `fecha_pago`, `estatus_pago`) 
VALUES ('3', 'efectivo', 'exactos', '20/09/2021', '1');

INSERT INTO `empresarial`.`tbl_unidad` (`PK_codigo_unidad`, `unidad_entrada`, `unidad_salida`) 
VALUES ('1', 'onz', '12');
INSERT INTO `empresarial`.`tbl_unidad` (`PK_codigo_unidad`, `unidad_entrada`, `unidad_salida`) 
VALUES ('2', 'lt', '10');
INSERT INTO `empresarial`.`tbl_unidad` (`PK_codigo_unidad`, `unidad_entrada`, `unidad_salida`) 
VALUES ('3', 'cm', '5');


INSERT INTO `empresarial`.`tbl_producto` (`PK_codigo_producto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `costo_producto`, `estatus_producto`, `codigo_linea`, `codigo_marca`, `codigo_bodega`, `codigo_unidad`) 
VALUES ('1', 'planchas', 'ingreso 17/08/2021', '120', '120', '1', '2', '4', '4', '2');
INSERT INTO `empresarial`.`tbl_producto` (`PK_codigo_producto`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `costo_producto`, `estatus_producto`, `codigo_linea`, `codigo_marca`, `codigo_bodega`, `codigo_unidad`) 
VALUES ('2', 'jugos', 'ingreso 12/09/2021', '12', '12', '1', '1', '5', '4', '1');

INSERT INTO `empresarial`.`tbl_proveedor` (`PK_codigo_proveedor`, `nombre_proveedor`, `direccion_proveedor`, `telefono_proveedor`, `nit_proveedor`, `email_proveedor`, `saldo_proveedor`, `estatus_proveedor`) 
VALUES ('1', 'serveceria gallo', 'zona 2 3-00', '51169327', '456789', 'gallo@gmial.com', '0', '1');
INSERT INTO `empresarial`.`tbl_proveedor` (`PK_codigo_proveedor`, `nombre_proveedor`, `direccion_proveedor`, `telefono_proveedor`, `nit_proveedor`, `email_proveedor`, `saldo_proveedor`, `estatus_proveedor`) 
VALUES ('2', 'cañareal', 'zona12 8-00', '2200800', '7890', 'cañareal@gmail.com', '0', '1');





