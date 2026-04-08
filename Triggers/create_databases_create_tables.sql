CREATE DATABASE IF NOT EXISTS gatilho;
USE gatilho;

CREATE TABLE IF NOT EXISTS Produtos 
(
	Referencia VARCHAR(3) PRIMARY KEY,
    Descricao VARCHAR(50),
    ESTOQUE INT NOT NULL DEFAULT 0
);


CREATE TABLE ItensVenda 
(
	Venda INT PRIMARY KEY,
    Produto VARCHAR(3),
    Quantidade INT,
    FOREIGN KEY(produto) REFERENCES Produtos (Referencia)
);

INSERT INTO Produtos VALUES ('001', 'Feijão', 10);
INSERT INTO Produtos VALUES ('002', 'Arroz',5);
INSERT INTO Produtos VALUES ('003', 'Farinha', 15);

INSERT INTO ItensVenda VALUES (1, '001', 5);
INSERT INTO ItensVenda VALUES(2, '001', 1);

SET SQL_SAFE_UPDATES = 0;
DELETE FROM ItensVenda WHERE Venda = 1;
