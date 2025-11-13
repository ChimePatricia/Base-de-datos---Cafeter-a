CREATE DATABASE IF NOT EXISTS PIA_cafeteria_ximena;
CREATE SCHEMA IF NOT EXISTS Cafeteria_schema;
USE PIA_cafeteria_ximena;

-- TABLAS
CREATE TABLE area (
    id_area INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    ubicacion VARCHAR(20)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    telefono VARCHAR(15),
    email VARCHAR(20)
);

CREATE TABLE gato (
    id_gato INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    raza VARCHAR(20),
    edad INT,
    fecha_nacimiento DATE
);

CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    apellidos VARCHAR(40),
    puesto VARCHAR(20),
    fecha_nacimiento DATE,
    id_area INT,
    FOREIGN KEY (id_area) REFERENCES area(id_area)
);

CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    platillo VARCHAR(20),
    precio DECIMAL(10, 2)
);

CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    hora TIME,
    fecha DATE,
    cantidad_personas INT,
    id_cliente INT,
    id_area INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_area) REFERENCES area(id_area)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_pedido DATE,
    id_menu INT,
    id_empleado INT,
    id_cliente INT,
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE adopta (
    id_adopta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_adopcion DATE,
    id_cliente INT,
    id_gato INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_gato) REFERENCES gato(id_gato)
);

-- INSERTS
-- Area
insert into area (id_area, nombre, ubicacion) values (1, 'mesa1', 'Terraza');
insert into area (id_area, nombre, ubicacion) values (2, 'mesa2', 'Terraza');
insert into area (id_area, nombre, ubicacion) values (3, 'mesa1', 'Principal');
insert into area (id_area, nombre, ubicacion) values (4, 'mesa2', 'Principal');
insert into area (id_area, nombre, ubicacion) values (5, 'mesa1', 'Patio');
insert into area (id_area, nombre, ubicacion) values (6, 'mesa2', 'Patio');

-- Cliente
insert into cliente (id_cliente, nombre, telefono, email) values (1, 'Ximena', 8125369544, 'ximena@gmail.com');
insert into cliente (id_cliente, nombre, telefono, email) values (2, 'Barbara', 5551234567, 'barbara@gmail.com');
insert into cliente (id_cliente, nombre, telefono, email) values (3, 'Carlos', 5559876543, 'carlos@gmail.com');
insert into cliente (id_cliente, nombre, telefono, email) values (4, 'Mauricio', 5552461357, 'mauricio@gmail.com');
insert into cliente (id_cliente, nombre, telefono, email) values (5, 'Juan', 5558642098, 'juan@gmail.com');
insert into cliente (id_cliente, nombre, telefono, email) values (6, 'Armando', 5553571594, 'armando@gmail.com');

-- Empleado
insert into empleado (id_empleado, nombre, apellidos, puesto, fecha_nacimiento, id_area) values (1, 'Ariadne', 'Gonzales Rincon', 'gerente', '1998-04-21', 3);
insert into empleado (id_empleado, nombre, apellidos, puesto, fecha_nacimiento, id_area) values (2, 'Jorge', 'Gonzales Rodriguez', 'gerente', '2000-12-01', 4);
insert into empleado (id_empleado, nombre, apellidos, puesto, fecha_nacimiento, id_area) values (3, 'Erick', 'Perez Fernandez', 'mesero', '2001-03-12', 1);
insert into empleado (id_empleado, nombre, apellidos, puesto, fecha_nacimiento, id_area) values (4, 'Jose', 'Castillo Mayorga', 'mesero', '2003-09-30', 2);
insert into empleado (id_empleado, nombre, apellidos, puesto, fecha_nacimiento, id_area) values (5, 'Fernando', 'Cantu Reyes', 'mesero', '2004-08-09',5);

-- Gato
insert into gato (id_gato, nombre, raza, edad, fecha_nacimiento) values (1, 'Nino', 'Siames', 2, '2022-01-09');
insert into gato (id_gato, nombre, raza, edad, fecha_nacimiento) values (2, 'Kira', 'Persa', 3, '2021-07-12');
insert into gato (id_gato, nombre, raza, edad, fecha_nacimiento) values (3, 'Lucy', 'Maine Coon', 1, '2023-09-10');
insert into gato (id_gato, nombre, raza, edad, fecha_nacimiento) values (4, 'Kitty', 'Bengala', 5, '2019-12-05');
insert into gato (id_gato, nombre, raza, edad, fecha_nacimiento) values (5, 'Michi', 'Sphynx', 8, '2016-07-11');

-- menu
insert into menu (id_menu, platillo, precio) values (1, 'Cafe basico', 35.90);
insert into menu (id_menu, platillo, precio) values (2, 'Capuchino', 64.85);
insert into menu (id_menu, platillo, precio) values (3, 'frappe', 45.78);
insert into menu (id_menu, platillo, precio) values (4, 'Cafe frio', 39.50);
insert into menu (id_menu, platillo, precio) values (5, 'ice cap', 40.98);

-- adopta
insert into adopta (id_adopta, fecha_adopcion, id_cliente, id_gato) values (1, '2024-01-15', 1, 2);
insert into adopta (id_adopta, fecha_adopcion, id_cliente, id_gato) values (2, '2024-03-10', 3, 5);
insert into adopta (id_adopta, fecha_adopcion, id_cliente, id_gato) values (3, '2024-08-20', 5, 1);
insert into adopta (id_adopta, fecha_adopcion, id_cliente, id_gato) values (4, '2024-10-02', 2, 3);
insert into adopta (id_adopta, fecha_adopcion, id_cliente, id_gato) values (5, '2024-04-12', 6, 4);

-- pedido
insert into pedido (id_pedido, fecha_pedido, id_menu, id_empleado, id_cliente) values (1, '2024-10-11', 1, 3, 3);
insert into pedido (id_pedido, fecha_pedido, id_menu, id_empleado, id_cliente) values (2, '2024-10-11', 1, 4, 2);
insert into pedido (id_pedido, fecha_pedido, id_menu, id_empleado, id_cliente) values (3, '2024-10-12', 3, 4, 1);
insert into pedido (id_pedido, fecha_pedido, id_menu, id_empleado, id_cliente) values (4, '2024-10-12', 4, 5, 5);
insert into pedido (id_pedido, fecha_pedido, id_menu, id_empleado, id_cliente) values (5, '2024-10-13', 4, 3, 6);

-- reserva
insert into reserva (id_reserva, hora, fecha, cantidad_personas, id_cliente, id_area) values (1, '14:30:00', '2024-11-01', 3, 1,2);
insert into reserva (id_reserva, hora, fecha, cantidad_personas, id_cliente, id_area) values (2, '12:34:00', '2024-12-08', 3, 1,4);
insert into reserva (id_reserva, hora, fecha, cantidad_personas, id_cliente, id_area) values (3, '08:00:00', '2024-12-15', 1, 2,3);
insert into reserva (id_reserva, hora, fecha, cantidad_personas, id_cliente, id_area) values (4, '16:30:00', '2024-10-15', 2, 3,5);
insert into reserva (id_reserva, hora, fecha, cantidad_personas, id_cliente, id_area) values (5, '19:00:00', '2024-10-14', 4, 5,1);

-- VISTAS
-- Seleccionar a todos los clientes que no cuentan con reserva
CREATE VIEW clientes_sin_reserva AS
    SELECT c.id_cliente, c.nombre
    FROM cliente c
    WHERE c.id_cliente NOT IN (
        SELECT r.id_cliente FROM reserva r
    );

-- SELECT * FROM clientes_sin_reserva;

CREATE VIEW cliente_no_adopta AS
    SELECT *
    FROM cliente
    WHERE id_cliente NOT IN (
    SELECT id_cliente
    FROM adopta
    );
    
-- SELECT * FROM cliente_no_adopta;

-- PROCEDIMIENTOS ALMACENADOS
-- Incluir un nuevo gato en la tabla de gatos
DELIMITER //
CREATE PROCEDURE Insertar_gato(
    IN g_nombre VARCHAR(20),
    IN g_raza VARCHAR(20),
    IN g_edad INT,
    IN g_fecha_nacimiento DATE)
BEGIN
    INSERT INTO gato (nombre, raza, edad, fecha_nacimiento)
    VALUES (g_nombre, g_raza, g_edad, g_fecha_nacimiento);
END //
DELIMITER ;

-- CALL Insertar_gato('Moshi', 'Siames', 4, '2020-06-19');
 -- SELECT * FROM gato;

-- Eliminar gato en la tabla de gatos
DELIMITER //
CREATE PROCEDURE eliminar_gato(IN g_id_gato INT)
BEGIN
    DELETE FROM gato
    WHERE id_gato = g_id_gato;
END //
DELIMITER ;

 -- CALL eliminar_gato(6);
 -- SELECT * FROM gato;

-- FUNCIONES
-- Obtener la raza del gato por medio de su id
DELIMITER //
CREATE FUNCTION raza_gato(p_id_gato INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE raza_gato VARCHAR(20);
    SELECT raza INTO raza_gato
    FROM gato
    WHERE id_gato = p_id_gato;
    RETURN raza_gato;
END //
DELIMITER ;

 -- SELECT raza_gato(3);

-- Fecha de adopcion de tal gato
DELIMITER //
CREATE FUNCTION fecha_adopcion_gato(p_id_gato INT)
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE  fecha DATE;
    SELECT fecha_adopcion INTO fecha
    FROM adopta
    WHERE id_gato = p_id_gato;
    RETURN fecha;
END //
DELIMITER ;

 -- SELECT fecha_adopcion_gato(2);

-- DISPARADORES
-- Guarda el registro de un cliente cada vez que se inserta en la tabla cliente. 
-- Crea una tabla de auditoría donde se almacenará información básica del cliente
-- y la fecha de registro.
CREATE TABLE cliente_auditoria (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    nombre VARCHAR(20),
    telefono VARCHAR(15),
    email VARCHAR(20),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_insert_cliente
AFTER INSERT ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO cliente_auditoria (id_cliente, nombre, telefono, email)
    VALUES (NEW.id_cliente, NEW.nombre, NEW.telefono, NEW.email);
END //
DELIMITER ;

 -- insert into cliente (id_cliente, nombre, telefono, email) values (11, 'Ariadne', 5553571595, 'ariadneo@gmail.com');
-- SELECT * FROM cliente_auditoria;

-- Se activa antes de eliminar un registro de la tabla gato,
-- si el gato está registrado en la tabla adopta, 
-- bloquea la eliminación para evitar pérdida de datos.
DELIMITER //
CREATE TRIGGER before_delete_gato
BEFORE DELETE ON gato
FOR EACH ROW
BEGIN
    DECLARE adopcion_existente INT;
    SELECT COUNT(*) INTO adopcion_existente
    FROM adopta
    WHERE id_gato = OLD.id_gato;
    IF adopcion_existente > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar este gato porque está registrado en la tabla adopta.';
    END IF;
END //
DELIMITER ;

-- DELETE FROM gato WHERE id_gato = 2;
