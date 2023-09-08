use TortuStudioProyecto;

-- Tabla Usuarios
CREATE TABLE Usuarios (
    nom_usu VARCHAR(30) not null,
    contrasena VARCHAR(8) not null,
    tipo VARCHAR(20) not null CHECK(tipo IN ('Administrador', 'Administrativo')) not null default ('Administrativo'),
    apellido VARCHAR(255) not null,
    ci VARCHAR(8) PRIMARY KEY,
    baja BOOLEAN not null,
    estado BOOLEAN not null
);

-- Tabla Usuarios_tel
CREATE TABLE Usuarios_tel (
    ci VARCHAR(8),
    tel VARCHAR(12),
    PRIMARY KEY (ci, tel),
    FOREIGN KEY (ci) REFERENCES Usuarios(ci)
);

-- Tabla Administrador
CREATE TABLE Administrador (
    ci VARCHAR(8) PRIMARY KEY,
    FOREIGN KEY (ci) REFERENCES Usuarios(ci)
);

-- Tabla Administrativo
CREATE TABLE Administrativo (
    ci VARCHAR(8) PRIMARY KEY,
    FOREIGN KEY (ci) REFERENCES Usuarios(ci)
);

-- Tabla Empresa
CREATE TABLE Empresa (
    RUT VARCHAR(12) PRIMARY KEY,
    nom_ficticio VARCHAR(255) not null,
    razon_social VARCHAR(255) not null,
    baja BOOLEAN not null,
    lista_negra BOOLEAN not null
);

-- Tabla Empresa_direccion
CREATE TABLE Empresa_direccion (
    RUT VARCHAR(12) PRIMARY KEY,
    calle VARCHAR(255) not null,
    n_puerta VARCHAR(10) not null,
    Esquina VARCHAR(255) not null,
    FOREIGN KEY (RUT) REFERENCES Empresa(RUT)
);

-- Tabla Reserva
CREATE TABLE Reserva (
    cod_reserva INT PRIMARY KEY auto_increment,
    comentario TEXT,
    destino VARCHAR(255) not null,
    origen VARCHAR(255) not null,
    hora TIME not null,
    fecha DATE not null,
    costo INT not null,
    baja BOOLEAN not null
);

-- Tabla Reserva_pasajero
CREATE TABLE Reserva_pasajero (
    cod_reserva INT,
    Nombre VARCHAR(255) not null,
    Apellido VARCHAR(255) not null,  
    tel VARCHAR(11) not null,
    Lista_Negra BOOLEAN not null,
    PRIMARY KEY (cod_reserva, tel),
    FOREIGN KEY (cod_reserva) REFERENCES Reserva(cod_reserva)
);

-- Tabla chofer
CREATE TABLE chofer (
    CI VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(255) not null,
    apellido VARCHAR(255) not null,
    c_salud DATE not null,
    tipo VARCHAR(20) CHECK(tipo IN ('particular', 'contratado')) not null,
    fecha_de_vencimiento_libreta_conducir DATE not null,
    matricula VARCHAR(20) not null,
    baja BOOLEAN
);

DELIMITER //
CREATE TRIGGER CheckFechasVencimiento BEFORE INSERT ON chofer
FOR EACH ROW
BEGIN
    IF NEW.c_salud <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de vencimiento del carnet de salud debe ser mayor a la fecha actual.';
    END IF;

    IF NEW.fecha_de_vencimiento_libreta_conducir <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de vencimiento de la libreta de conducción debe ser mayor a la fecha actual.';
    END IF;
END;
//
DELIMITER ;

-- Tabla chofer_tel
CREATE TABLE chofer_tel (
    CI VARCHAR(8),
    tel VARCHAR(11),
    PRIMARY KEY (CI, tel),
    FOREIGN KEY (CI) REFERENCES chofer(CI)
);

-- Tabla coche
CREATE TABLE coche (
    matricula VARCHAR(9) PRIMARY KEY,
    marca VARCHAR(255),
    modelo VARCHAR(255),
    c_pasajeros INT,
    n_padron VARCHAR(20),
    seguro_coche VARCHAR(255) CHECK(seguro_coche IN ('total', 'parcial', 'por terceros'))
);

-- Tabla mantenimiento_coche
CREATE TABLE mantenimiento_coche (
    cod INT PRIMARY KEY auto_increment,
    concepto ENUM('GASOIL', 'CAMBIO ACEITE', 'ELECTRICISTA', 'ALINEACIÓN Y BALANCEO', 'CAMBIO DE CUBIERTA', 'GOMERÍA', 'CAMBIO DE CORREA', 'FRENOS', 'EMBRAGUE', 'CHAPISTA', 'OTROS')
);

-- Tabla metodo_de_pago
CREATE TABLE metodo_de_pago (
    cod_pago INT PRIMARY KEY auto_increment
);

-- Tabla Transferencia
CREATE TABLE Transferencia (
    cod_pago INT,
    num_cuenta VARCHAR(20) ,
    PRIMARY KEY (cod_pago, num_cuenta),
    FOREIGN KEY (cod_pago) REFERENCES metodo_de_pago(cod_pago)
);

-- Tabla Contado
CREATE TABLE Contado (
    cod_pago INT PRIMARY KEY,
    FOREIGN KEY (cod_pago) REFERENCES metodo_de_pago(cod_pago)
);

-- Tabla Tarjeta
CREATE TABLE Tarjeta (
    cod_pago INT,
    num_tarjeta VARCHAR(22),
    PRIMARY KEY (cod_pago, num_tarjeta),
    FOREIGN KEY (cod_pago) REFERENCES metodo_de_pago(cod_pago)
);

-- Tabla Cuenta_corriente
CREATE TABLE Cuenta_corriente(
    cod_pago INT,
    cod_cuenta INT,
    PRIMARY KEY (cod_pago, cod_cuenta),
    FOREIGN KEY (cod_pago) REFERENCES metodo_de_pago(cod_pago)
);

-- Tabla poseen
CREATE TABLE poseen(
RUT varchar(12) primary key,
cod_cuenta INT,
cod_pago int,
saldo int default 0,
foreign key (cod_pago, cod_cuenta) references Cuenta_corriente(cod_pago, cod_cuenta),
foreign key (RUT) references Empresa(RUT)
);

-- Tabla Crea
CREATE TABLE Crea (
    cod_Usu VARCHAR(8),
    cod_Admin VARCHAR(8) not null,
    PRIMARY KEY (cod_Usu),
    FOREIGN KEY (cod_Usu) REFERENCES Usuarios(ci),
    FOREIGN KEY (cod_Admin) REFERENCES Administrador(ci) on update cascade
);

-- Tabla Controla
CREATE TABLE Controla (
    cod varchar (8),
    cod_reserva INT,
    PRIMARY KEY (cod, cod_reserva),
    FOREIGN KEY (cod_reserva) REFERENCES Reserva(cod_reserva),
    foreign key (cod) references Usuarios(ci)
);

-- Tabla Genera
CREATE TABLE Genera (
    RUT VARCHAR(12),
    cod_reserva INT,
    PRIMARY KEY (RUT, cod_reserva),
    FOREIGN KEY (RUT) REFERENCES Empresa(RUT),
    FOREIGN KEY (cod_reserva) REFERENCES Reserva(cod_reserva)
);

-- Tabla Precisa
CREATE TABLE Precisa (
    cod_reserva INT,
    CI_chofer VARCHAR(8),
    PRIMARY KEY (cod_reserva, CI_chofer),
    FOREIGN KEY (cod_reserva) REFERENCES Reserva(cod_reserva),
    FOREIGN KEY (CI_chofer) REFERENCES chofer(CI)
);

-- Tabla Maneja
CREATE TABLE Maneja (
    CI VARCHAR(8),
    matricula VARCHAR(9),
    PRIMARY KEY (CI),
    FOREIGN KEY (CI) REFERENCES chofer(CI),
    FOREIGN KEY (matricula) REFERENCES coche(matricula)
);

-- Tabla tienen
CREATE TABLE tienen (
    matricula VARCHAR(9),
    cod INT not null,
    fecha DATE not null,
    importe int not null,
    descripcion varchar (255) not null,
    PRIMARY KEY (matricula, cod),
    FOREIGN KEY (matricula) REFERENCES coche(matricula),
    FOREIGN KEY (cod) REFERENCES mantenimiento_coche(cod)
);

-- Tabla necesita
CREATE TABLE necesita (
    cod_reserva INT,
    cod INT,
    PRIMARY KEY (cod_reserva),
    FOREIGN KEY (cod_reserva) REFERENCES Genera(cod_reserva),
    FOREIGN KEY (cod) REFERENCES metodo_de_pago(cod_pago)
);

-- Inserciones en la tabla Usuarios
-- Insert para la tabla Usuarios
INSERT INTO Usuarios (tipo, nom_usu, apellido, ci, contrasena, baja, estado) 
VALUES 
('Administrativo', 'Facundo', 'Vastakas', '56191043', 'facu123', false, true),
('Administrador', 'Emiliano', 'Mandacen', '55319765', '12345', false, true),
('Administrador', 'Marta', 'Capretti', '23145678', 'marta987', false, true),
('Administrativo', 'Natalia', 'Torres', '98752645', 'chilena1', false, true);

INSERT INTO Usuarios (tipo, nom_usu, apellido, ci, contrasena, baja, estado) 
VALUES ('Administrativo', 'Fernando', 'Pertierra', '55774272', 'tortu123', false, true);

-- Insert para la tabla Usuarios_tel
INSERT INTO Usuarios_tel (ci, tel) 
VALUES 
('56191043', '555-123-4567'),
('55319765', '555-234-5678'),
('55774272', '555-345-6789'),
('23145678', '555-456-7890'),
('98752645', '555-567-8901');

-- Insert para la tabla Administrador
INSERT INTO Administrador (ci)
VALUES
('55319765'),
('23145678');


-- Insert para la tabla Administrativo
INSERT INTO Administrativo (ci)
VALUES
('55774272'),
('56191043'),
('98752645');

-- Inserciones en la tabla Empresa
INSERT INTO Empresa (RUT, nom_ficticio, razon_social, baja, lista_negra)
VALUES
    ('123456789012', 'Empresa1', 'RazonSocial1', FALSE, FALSE),
    ('234567890123', 'Empresa2', 'RazonSocial2', TRUE, FALSE),
    ('345678901234', 'Empresa3', 'RazonSocial3', FALSE, TRUE),
    ('456789012345', 'Empresa4', 'RazonSocial4', TRUE, TRUE),
    ('567890123456', 'Empresa5', 'RazonSocial5', FALSE, FALSE),
    ('678901234567', 'Empresa6', 'RazonSocial6', TRUE, FALSE),
    ('789012345678', 'Empresa7', 'RazonSocial7', FALSE, TRUE),
    ('890123456789', 'Empresa8', 'RazonSocial8', TRUE, TRUE),
    ('901234567890', 'Empresa9', 'RazonSocial9', FALSE, FALSE),
    ('012345678901', 'Empresa10', 'RazonSocial10', TRUE, FALSE);

-- Inserciones en la tabla Empresa_direccion
INSERT INTO Empresa_direccion (RUT, calle, n_puerta, Esquina)
VALUES
    ('123456789012', 'Calle1', '123', 'Esquina1'),
    ('234567890123', 'Calle2', '456', 'Esquina2'),
    ('345678901234', 'Calle3', '789', 'Esquina3'),
    ('456789012345', 'Calle4', '101', 'Esquina4'),
    ('567890123456', 'Calle5', '112', 'Esquina5'),
    ('678901234567', 'Calle6', '131', 'Esquina6'),
    ('789012345678', 'Calle7', '415', 'Esquina7'),
    ('890123456789', 'Calle8', '616', 'Esquina8'),
    ('901234567890', 'Calle9', '719', 'Esquina9'),
    ('012345678901', 'Calle10', '820', 'Esquina10');

-- Inserciones en la tabla Reserva
INSERT INTO Reserva (comentario, destino, origen, hora, fecha, costo, baja)
VALUES
    ('Comentario1', 'Destino1', 'Origen1', '12:00:00', '2023-01-01', 100, FALSE),
    ('Comentario2', 'Destino2', 'Origen2', '14:30:00', '2023-08-02', 150, FALSE),
    ('Comentario3', 'Destino3', 'Origen3', '16:45:00', '2023-08-03', 120, TRUE),
    ('Comentario4', 'Destino4', 'Origen4', '09:15:00', '2023-08-04', 200, FALSE),
    ('Comentario5', 'Destino5', 'Origen5', '11:30:00', '2023-08-04', 180, TRUE),
    ('Comentario6', 'Destino6', 'Origen6', '13:20:00', '2022-12-06', 130, FALSE),
    ('Comentario7', 'Destino7', 'Origen7', '15:10:00', '2022-05-07', 170, TRUE),
    ('Comentario8', 'Destino8', 'Origen8', '17:00:00', '2023-12-08', 190, FALSE),
    ('Comentario9', 'Destino9', 'Origen9', '18:30:00', '2024-08-09', 140, TRUE),
    ('Comentario10', 'Destino10', 'Origen10', '20:15:00', '2333-08-10', 160, FALSE);

-- Inserciones en la tabla Reserva_pasajero
INSERT INTO Reserva_pasajero (cod_reserva, Nombre, Apellido, tel, Lista_Negra)
VALUES
    (1, 'Pasajero1', 'Apellido1', '1111111111', FALSE),
    (2, 'Pasajero2', 'Apellido2', '1111111111', TRUE),
    (3, 'Pasajero3', 'Apellido3', '3333333333', FALSE),
    (4, 'Pasajero4', 'Apellido4', '4444444444', TRUE),
    (5, 'Pasajero5', 'Apellido5', '5555555555', FALSE),
    (6, 'Pasajero6', 'Apellido6', '6666666666', TRUE),
    (7, 'Pasajero7', 'Apellido7', '7777777777', FALSE),
    (8, 'Pasajero8', 'Apellido8', '8888888888', TRUE),
    (9, 'Pasajero9', 'Apellido9', '9999999999', FALSE),
    (10, 'Pasajero10', 'Apellido10', '0000000000', TRUE);

-- Inserciones en la tabla chofer
INSERT INTO chofer (CI, nombre, apellido, c_salud, tipo, fecha_de_vencimiento_libreta_conducir, matricula, baja)
VALUES
    ('12345678', 'Chofer1', 'Apellido1', '2024-012-01', 'particular', '2024-012-01', 'ABC123XYZ', FALSE),
    ('23456789', 'Chofer2', 'Apellido2', '2024-012-01', 'contratado', '2024-06-15', 'DEF456UVW', TRUE),
    ('34567890', 'Chofer3', 'Apellido3', '2024-012-01', 'particular', '2024-05-20', 'GHI789TUV', FALSE),
    ('45678901', 'Chofer4', 'Apellido4', '2024-012-01', 'contratado', '2024-04-10', 'JKL012XYZ', TRUE),
    ('56789012', 'Chofer5', 'Apellido5', '2024-012-01', 'particular', '2024-03-05', 'MNO123UVW', FALSE),
    ('67890123', 'Chofer6', 'Apellido6', '2024-012-01', 'contratado', '2024-02-25', 'PQR234TUV', TRUE),
    ('78901234', 'Chofer7', 'Apellido7', '2024-012-01', 'particular', '2024-01-30', 'STU345XYZ', FALSE),
    ('89012345', 'Chofer8', 'Apellido8', '2024-012-01', 'contratado', '2023-12-22', 'VWX456UVW', TRUE),
    ('90123456', 'Chofer9', 'Apellido9', '2024-012-01', 'particular', '2023-11-15', 'YZA567TUV', FALSE),
    ('01234567', 'Chofer10', 'Apellido10', '2024-012-01', 'contratado', '2023-10-05', 'BCD678XYZ', TRUE);

-- Inserciones en la tabla chofer_tel
INSERT INTO chofer_tel (CI, tel)
VALUES
    ('12345678', '1111111111'),
    ('23456789', '2222222222'),
    ('34567890', '3333333333'),
    ('45678901', '4444444444'),
    ('56789012', '5555555555'),
    ('67890123', '6666666666'),
    ('78901234', '7777777777'),
    ('89012345', '8888888888'),
    ('90123456', '9999999999'),
    ('01234567', '0000000000');

-- Inserciones en la tabla coche
INSERT INTO coche (matricula, marca, modelo, c_pasajeros, n_padron, seguro_coche)
VALUES
    ('ABC123XYZ', 'Marca1', 'Modelo1', 4, '123ABC', 'total'),
    ('DEF456UVW', 'Marca2', 'Modelo2', 5, '456DEF', 'parcial'),
    ('GHI789TUV', 'Marca3', 'Modelo3', 6, '789GHI', 'por terceros'),
    ('JKL012XYZ', 'Marca4', 'Modelo4', 4, '012JKL', 'total'),
    ('MNO123UVW', 'Marca5', 'Modelo5', 5, '123MNO', 'parcial'),
    ('PQR234TUV', 'Marca6', 'Modelo6', 6, '234PQR', 'por terceros'),
    ('STU345XYZ', 'Marca7', 'Modelo7', 4, '345STU', 'total'),
    ('VWX456UVW', 'Marca8', 'Modelo8', 5, '456VWX', 'parcial'),
    ('YZA567TUV', 'Marca9', 'Modelo9', 6, '567YZA', 'por terceros'),
    ('BCD678XYZ', 'Marca10', 'Modelo10', 4, '678BCD', 'total');

-- Inserciones en la tabla mantenimiento_coche
INSERT INTO mantenimiento_coche (concepto)
VALUES
    ('GASOIL'),
    ('CAMBIO ACEITE'),
    ('ELECTRICISTA'),
    ('ALINEACIÓN Y BALANCEO'),
    ('CAMBIO DE CUBIERTA'),
    ('GOMERÍA'),
    ('CAMBIO DE CORREA'),
    ('FRENOS'),
    ('EMBRAGUE'),
    ('CHAPISTA'),
    ('OTROS');

-- Inserciones en la tabla metodo_de_pago
INSERT INTO metodo_de_pago (cod_pago)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10);

-- Inserciones en la tabla Transferencia
INSERT INTO Transferencia (cod_pago, num_cuenta)
VALUES
    (1, '1111111111'),
    (2, '2222222222'),
    (3, '3333333333'),
    (4, '4444444444'),
    (5, '5555555555'),
    (6, '6666666666'),
    (7, '7777777777'),
    (8, '8888888888'),
    (9, '9999999999'),
    (10, '0000000000');

-- Inserciones en la tabla Contado
INSERT INTO Contado (cod_pago)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10);

-- Inserciones en la tabla Tarjeta
INSERT INTO Tarjeta (cod_pago, num_tarjeta)
VALUES
    (1, '1111111111111111111111'),
    (2, '2222222222222222222222'),
    (3, '3333333333333333333333'),
    (4, '4444444444444444444444'),
    (5, '5555555555555555555555'),
    (6, '6666666666666666666666'),
    (7, '7777777777777777777777'),
    (8, '8888888888888888888888'),
    (9, '9999999999999999999999'),
    (10, '0000000000000000000000');

-- Inserciones en la tabla Cuenta_corriente
INSERT INTO Cuenta_corriente (cod_pago, cod_cuenta)
VALUES
    (1, 101),
    (2, 102),
    (3, 103),
    (4, 104),
    (5, 105),
    (6, 106),
    (7, 107),
    (8, 108),
    (9, 109),
    (10, 110);

-- Inserciones en la tabla Crea
INSERT INTO Crea (cod_Usu, cod_Admin)
VALUES
    ('56191043', '55319765'),
    ('98752645', '23145678');
    
INSERT INTO Crea (cod_Usu, cod_Admin)
VALUES ('55774272', '55319765');
    
-- Inserciones en la tabla Controla
INSERT INTO Controla (cod, cod_reserva)
VALUES
    ('56191043', 1),
    ('55319765', 2),
    ('55774272', 3),
    ('23145678', 4),
    ('98752645', 5),
    ('56191043', 6),
    ('55319765', 7),
    ('55774272', 8),
    ('23145678', 9),
    ('98752645', 10);

-- Inserciones en la tabla Genera
INSERT INTO Genera (RUT, cod_reserva)
VALUES
    ('123456789012', 1),
    ('234567890123', 2),
    ('345678901234', 3),
    ('456789012345', 4),
    ('567890123456', 5),
    ('678901234567', 6),
    ('789012345678', 7),
    ('890123456789', 8),
    ('901234567890', 9),
    ('012345678901', 10);

-- Inserciones en la tabla Precisa
INSERT INTO Precisa (cod_reserva, CI_chofer)
VALUES
    (1, '12345678'),
    (2, '12345678'),
    (3, '34567890'),
    (4, '45678901'),
    (5, '56789012'),
    (6, '67890123'),
    (7, '78901234'),
    (8, '89012345'),
    (9, '90123456'),
    (10, '01234567');

-- Inserciones en la tabla Maneja
INSERT INTO Maneja (CI, matricula)
VALUES
    ('12345678', 'ABC123XYZ'),
    ('23456789', 'DEF456UVW'),
    ('34567890', 'GHI789TUV'),
    ('45678901', 'JKL012XYZ'),
    ('56789012', 'MNO123UVW'),
    ('67890123', 'PQR234TUV'),
    ('78901234', 'STU345XYZ'),
    ('89012345', 'VWX456UVW'),
    ('90123456', 'YZA567TUV'),
    ('01234567', 'BCD678XYZ');

-- Inserciones en la tabla tienen
INSERT INTO tienen (matricula, cod, fecha, importe, descripcion)
VALUES
    ('ABC123XYZ', 1, '2023-08-01', 2000, 'Mantenimiento 1'),
    ('DEF456UVW', 2, '2023-08-02', 3000, 'Mantenimiento 2'),
    ('GHI789TUV', 3, '2023-08-03', 2500, 'Mantenimiento 3'),
    ('JKL012XYZ', 4, '2023-08-04', 3500, 'Mantenimiento 4'),
    ('MNO123UVW', 5, '2023-08-05', 2800, 'Mantenimiento 5'),
    ('PQR234TUV', 6, '2023-08-06', 2600, 'Mantenimiento 6'),
    ('STU345XYZ', 7, '2023-08-07', 3200, 'Mantenimiento 7'),
    ('VWX456UVW', 8, '2023-08-08', 3100, 'Mantenimiento 8'),
    ('YZA567TUV', 9, '2023-08-09', 2700, 'Mantenimiento 9'),
    ('BCD678XYZ', 10, '2023-08-10', 2900, 'Mantenimiento 10');

-- Inserciones en la tabla necesita
INSERT INTO necesita (cod_reserva, cod)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Inserciones en la tabla poseen
INSERT INTO poseen (RUT, cod_cuenta, cod_pago, saldo)
VALUES
    ('123456789012', 101, 1, 50000),
    ('234567890123', 102, 2, 60000),
    ('345678901234', 103, 3, 70000),
    ('456789012345', 104, 4, 80000),
    ('567890123456', 105, 5, 90000),
    ('678901234567', 106, 6, 100000),
    ('789012345678', 107, 7, 110000),
    ('890123456789', 108, 8, 120000),
    ('901234567890', 109, 9, 130000),
    ('012345678901', 110, 10, 140000);



-- CREATE USER 'superuser'@'localhost' IDENTIFIED BY 'password';
-- GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'localhost' WITH GRANT OPTION;

-- CREATE USER 'db_admin'@'localhost' IDENTIFIED BY 'password';
-- GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, CREATE TEMPORARY TABLES ON *.* TO 'db_admin'@'localhost';

-- CREATE USER 'security_user'@'localhost' IDENTIFIED BY 'password';
-- GRANT CREATE USER, ALTER, DROP ON *.* TO 'security_user'@'localhost';
-- GRANT GRANT OPTION ON *.* TO 'security_user'@'localhost';

-- CREATE USER 'backup_user'@'localhost' IDENTIFIED BY 'password';
-- GRANT BACKUP_ADMIN, RELOAD, PROCESS, LOCK TABLES, EVENT, RELOAD, SHOW databases, SELECT ON *.* TO 'backup_user'@'localhost';

-- CREATE USER 'lectura_user'@'localhost' IDENTIFIED BY 'password';
-- GRANT SELECT ON `app_database`.* TO 'lectura_user'@'localhost';

-- CONSULTAS
-- Empleados

select * from Usuarios u
ORDER BY u.tipo,u.nom_usu,u.apellido,u.ci;

SELECT u.tipo, u.nom_usu, u.apellido, u.ci, u.contrasena, t.tel
FROM Usuarios u
JOIN Usuarios_tel t ON u.ci = t.ci
ORDER BY u.tipo,u.nom_usu,u.apellido,u.ci,t.tel;


-- Facturación por auto
select sum(r.costo) as facturacion, m.matricula from Maneja m
join Precisa p on m.CI = p.CI_chofer
join Reserva r on p.cod_reserva = r.cod_reserva
group by m.matricula
order by facturacion desc;

-- Facturación por chofer
select sum(r.costo) as facturacion, m.CI from Maneja m
join Precisa p on m.CI = p.CI_chofer
join Reserva r on p.cod_reserva = r.cod_reserva
group by m.CI
order by facturacion desc;

-- Datos de los viajes de un cliente determinado
select r.cod_reserva, r.comentario, r.destino, r.hora, r.fecha, r.hora, p.Nombre, p.Apellido, p.tel from Reserva r
join Reserva_pasajero p on r.cod_reserva = p.cod_reserva
where p.tel = '1111111111';

-- Datos de un viaje determinado
select r.cod_reserva, r.comentario, r.destino, r.hora, r.fecha, r.hora, p.Nombre, p.Apellido, p.tel  from Reserva r
join Reserva_pasajero p on r.cod_reserva = p.cod_reserva
where r.cod_reserva = '5';

-- Datos de los últimos 5 viajes realizados
select r.cod_reserva, r.comentario, r.destino, r.hora, r.fecha, r.hora, p.Nombre, p.Apellido, p.tel  from Reserva r
join Reserva_pasajero p on r.cod_reserva = p.cod_reserva
order by r.fecha desc
limit 5;

-- Búsqueda de viajes por fecha
select r.cod_reserva, r.comentario, r.destino, r.hora, r.fecha, r.hora, p.Nombre, p.Apellido, p.tel  from Reserva r
join Reserva_pasajero p on r.cod_reserva = p.cod_reserva
where r.fecha = '2023-08-04';

-- Consultas realizadas para hacer un login efectivo
-- SELECT * FROM Usuarios WHERE ci = '$ci' AND contrasena = '$contrasena";

-- Total de facturación diario, mensual y anual.
SELECT fecha, SUM(costo) AS facturacion_diaria
FROM Reserva
WHERE baja = FALSE
GROUP BY fecha
ORDER BY fecha;

-- Total de facturación mensual
SELECT DATE_FORMAT(fecha, '%Y-%m') AS mensual, SUM(costo) AS facturacion_mensual
FROM Reserva
WHERE baja = FALSE
GROUP BY mensual
ORDER BY mensual;

-- Total de facturación anual
SELECT DATE_FORMAT(fecha, '%Y') AS anual, SUM(costo) AS facturacion_anual
FROM Reserva
WHERE baja = FALSE
GROUP BY anual
ORDER BY anual;

-- Cantidad de viajes realizados por cada chofer entre dos fechas.
select count(cod_reserva) as cantidad from Reserva r
where r.fecha BETWEEN '2022-01-01' AND '2024-01-01';