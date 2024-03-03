SELECT * FROM users;

-- EJEMPLOS DE VIEW
-- 1.
CREATE VIEW usuario AS
SELECT nombres, apellidos, edad FROM users;

SELECT * FROM usuario;

-- 2.
ALTER VIEW colombianos_menores AS
SELECT nombres, pais, edad FROM users 
WHERE pais = "colombia" AND edad < 18;

SELECT * FROM colombianos_menores;

-- 3.
CREATE VIEW correo_net AS
SELECT nombres, correo FROM users 
WHERE correo LIKE "%.net";

SELECT * FROM correo_net;

-- 4.
CREATE VIEW apellicos_f AS
SELECT nombres, apellidos FROM users
WHERE apellidos LIKE "F%" 
AND apellidos LIKE "f%";

SELECT * FROM apellicos_f;

--5.
CREATE VIEW mujeres_mayores AS
SELECT nombres, pais, edad FROM users
WHERE edad > 50;

SELECT * FROM mujeres_mayores;


-- EJEMPLOS DE PROCEDIMIENTO ALMACENADO
-- 1.
DROP PROCEDURE personas_pais;
DELIMITER //
CREATE PROCEDURE personas_pais(IN paises VARCHAR(40))
BEGIN
    SELECT nombres, pais FROM users
    WHERE pais = paises;
END //
DELIMITER;

CALL personas_pais("colombia");

--2.
DROP PROCEDURE personas_net;
DELIMITER //
CREATE PROCEDURE personas_net (IN correo VARCHAR(20))
BEGIN
    SELECT nombres, correo FROM users
    WHERE correo LIKE CONCAT("%", correo);
END //
DELIMITER;

CALL personas_net(".net");

-- 3.
DROP PROCEDURE musica_genero;
DELIMITER //
CREATE PROCEDURE musica_genero(IN musica VARCHAR(40))
BEGIN
    SELECT nombres, pais, musica FROM users
    WHERE musica = musica;
END //
DELIMITER;

CALL musica_genero("reggaeton");

-- 4.
DELIMITER //
CREATE PROCEDURE genero_pais(IN genero CHAR, pais VARCHAR(20))
BEGIN
    SELECT nombres, genero, pais FROM users
    WHERE genero = genero
    AND pais = pais;
END //
DELIMITER;

CALL genero_pais("M", "costa rica");

-- 5.
DELIMITER //
CREATE PROCEDURE mayores_paises(IN pais VARCHAR(40))
BEGIN
    SELECT nombres, pais, edad FROM users
    WHERE edad > 50;
END //
DELIMITER;

CALL mayores_paises("costa rica");

