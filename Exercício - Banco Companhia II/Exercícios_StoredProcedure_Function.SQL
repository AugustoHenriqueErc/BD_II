USE companhia;
SHOW TABLES;
DROP PROCEDURE diminuir_salario;
DROP PROCEDURE aumentar_salario;
DROP PROCEDURE alterar_salario;
DELIMITER $$
CREATE PROCEDURE aumentar_salario(IN vcpf char(11))
BEGIN
	UPDATE funcionario
    SET salario = salario + 300 WHERE funcionario.cpf = vcpf;
END $$
DELIMITER ;

SELECT * FROM funcionario;
CALL aumentar_salario('12345678966');
SELECT * FROM funcionario;

DELIMITER $$
CREATE PROCEDURE diminuir_salario(IN vcpf char(11))
BEGIN
	UPDATE funcionario
    SET salario = salario - 500 WHERE funcionario.cpf = vcpf;
END $$
DELIMITER ;

SELECT * FROM funcionario;
CALL diminuir_salario('12345678966');
SELECT * FROM funcionario;

DELIMITER $$
CREATE PROCEDURE alterar_salario(IN value decimal(10,2), IN vcpf char(11), IN opcao INT)
BEGIN
	UPDATE funcionario
	SET salario = CASE
		WHEN opcao = 1 THEN salario = salario + value  
		WHEN opcao = 2 THEN salario = salario - value 
        ELSE salario = salario
    END
    WHERE funcionario.cpf = vcpf;
END $$
DELIMITER ;

SELECT * FROM funcionario;
CALL alterar_salario(7000,'12345678966', 1);
SELECT * FROM funcionario;
