--Estos respaldos van en los jobs.

--Para el completo.
BACKUP DATABASE Proyecto
TO DISK = 'D:\Bases de datos\ProyectoBD\Completo_Proyecto.bak'
WITH FORMAT

--Para el diferencial
BACKUP DATABASE Proyecto
TO DISK = 'D:\Bases de datos\ProyectoBD\Diferencial_Proyecto.bak'
WITH DIFFERENTIAL

--Para los logs
BACKUP LOG Proyecto
TO DISK = 'D:\Bases de datos\ProyectoBD\Log_Proyecto.bak'
