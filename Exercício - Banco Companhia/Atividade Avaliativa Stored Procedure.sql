DROP DATABASE exer_procedure;
CREATE DATABASE exer_procedure;

USE exer_procedure;

CREATE TABLE t1 (
id int AUTO_INCREMENT PRIMARY KEY ,
Nome VARCHAR (50),
salario DOUBLE
);

DELIMITER $$
CREATE PROCEDURE inserir_funcionario (
	IN p_nome VARCHAR(50),
    IN p_salario DOUBLE,
    IN p_opcao INT
)
BEGIN
	IF p_opcao = 1 THEN
		INSERT INTO t1 (Nome, salario) VALUES (p_nome, p_salario);
	END IF;
END $$
DELIMITER ;

CALL inserir_funcionario ("JOÃO MARSHAL", 7654321, 1);
CALL inserir_funcionario ("DOUGLAS MARSHAL", 7654321, 1);
CALL inserir_funcionario ("MATHEUS CARNEIRO", 7654321, 1);
CALL inserir_funcionario ("JOÃO PEDRO", 7654321, 1);

DELIMITER $$
CREATE PROCEDURE listar_funcionarios ()
BEGIN 
	SELECT * FROM t1;
END $$
DELIMITER ;

CALL listar_funcionarios;

DELIMITER $$
CREATE PROCEDURE atualizar_salario(IN aumento DOUBLE) 
BEGIN
	UPDATE t1 SET salario  = salario + aumento WHERE p_opcao = 1;
END $$
DELIMITER ;

CALL atualizar_salario(300);

CALL listar_funcionarios;


DELIMITER $$
CREATE FUNCTION quadrado (numero INT) RETURNS INT
BEGIN
		SET numero = numero * numero;
        RETURN numero;
END $$
DELIMITER ;

SELECT quadrado(9);