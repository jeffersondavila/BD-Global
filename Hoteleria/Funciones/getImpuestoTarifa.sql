CREATE DEFINER=`root`@`localhost` FUNCTION `getImpuestoTarifa`(no_tarifa INT) RETURNS float
BEGIN
DECLARE ImpuestoTarifa, totalServicios, totalHabitacion, noTarifa FLOAT;
SELECT 
tbl_tarifa.PK_id_tarifa, 
sum(tbl_servicio.precio_servicio) as total_servicios, 
max(tbl_mantenimiento_habitacion.precio_habitacion) as total_habitacion
INTO noTarifa, totalServicios, totalHabitacion
FROM empresarial.tbl_tarifa, empresarial.tbl_paquete_servicios, 
empresarial.tbl_servicio, empresarial.tbl_mantenimiento_habitacion

WHERE tbl_tarifa.PK_id_tarifa=no_tarifa AND tbl_paquete_servicios.id_tarifa_paquete = PK_id_tarifa
AND tbl_servicio.PK_id_servicio = tbl_paquete_servicios.id_servicio_paquete 
AND tbl_mantenimiento_habitacion.PK_id_habitacion = tbl_tarifa.id_habitacion_tarifa
GROUP BY PK_id_tarifa;

SELECT sum(totalServicios+totalHabitacion)*0.10 into ImpuestoTarifa;
RETURN ImpuestoTarifa;
END