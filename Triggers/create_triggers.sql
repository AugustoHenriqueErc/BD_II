CREATE TRIGGER Tgr_ItensVenda_Insert AFTER INSERT
ON ItensVenda
FOR EACH ROW
	UPDATE Produtos SET Estoque = Estoque - NEW.Quantidade
    WHERE Referencia = NEW.Produto;

DROP TRIGGER Trg_ItensVenda_Insert;

CREATE TRIGGER Tgr_ItensVenda_Insert BEFORE INSERT
ON ItensVenda
FOR EACH ROW
	UPDATE Produtos SET Estoque = Estoque - NEW.Quantidade
    WHERE Referencia = NEW.Produto;
    
DROP TRIGGER Tgr_ItensVenda_Delete ;

CREATE TRIGGER Tgr_ItensVenda_Delete BEFORE DELETE
ON ItensVenda
FOR EACH ROW
	UPDATE Produtos SET Estoque = Estoque + OLD.Quantidade
    WHERE Referencia = OLD.Produto;