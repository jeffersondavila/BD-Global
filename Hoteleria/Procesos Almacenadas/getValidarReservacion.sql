CREATE DEFINER=`root`@`localhost` PROCEDURE `getValidarReservacion`(IN no_reservacion INT, IN no_tarifa INT, OUT validacion INT)
BEGIN
DECLARE fecha_inicio, fecha_fin DATE;
SELECT
tbl_reservacion.fecha_entrada_reservacion, tbl_reservacion.fecha_salida_reservacion
INTO
fecha_inicio, fecha_fin
FROM 
empresarial.tbl_reservacion
WHERE
tbl_reservacion.PK_id_reservacion=no_reservacion;

SELECT
SUM(if(tbl_detalle_reservacion.id_reservacion_detalle != no_reservacion 
OR tbl_detalle_reservacion.id_tarifa_detalle=no_tarifa, 1, 0)) INTO validacion
FROM 
empresarial.tbl_detalle_reservacion, empresarial.tbl_reservacion
WHERE
tbl_detalle_reservacion.id_tarifa_detalle=no_tarifa AND
tbl_detalle_reservacion.id_reservacion_detalle = tbl_reservacion.PK_id_reservacion AND
(tbl_reservacion.fecha_entrada_reservacion BETWEEN fecha_inicio AND fecha_fin) OR 
(tbl_reservacion.fecha_salida_reservacion BETWEEN fecha_inicio AND fecha_fin) AND
tbl_detalle_reservacion.id_tarifa_detalle=no_tarifa AND
tbl_detalle_reservacion.id_reservacion_detalle = tbl_reservacion.PK_id_reservacion
;
END