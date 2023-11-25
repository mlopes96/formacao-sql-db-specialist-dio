use ecommerce;
show tables;
select * from produtos;

-- estrutura básica de uma procedure
delimiter \\
create procedure procedure_test()
begin
	-- procedimento;
    -- instrução sql;
end \\
delimiter ;


-- Início da criação da procedure_produtos
delimiter \\
create procedure procedure_produtos(
	in opcao_p int,
    in id_prod_p int,
	in desc_p varchar(255),
    in valor_p float,
    in categ_p enum('Alimentos','Brinquedos','Livros','Móveis','Eletrônicos','Limpeza','Vestuário')
)
begin
	-- opcao 1 = insert
	if opcao_p = 1 then
		if (length(desc_p) > 0) and (length (valor_p) > 0) and (length(categ_p) > 0) then 
			insert into produtos (descricao, categoria, valor) values (desc_p, categ_p, valor_p);
			select 'Produto inserido!' as Message;
		else
			select 'Os dados fornecidos não podem estar vazios!' as Message_error;
		end if;
	-- opcao 2 = update
	elseif opcao_p = 2 then
		if id_prod_p IS NOT NULL AND id_prod_p <> '' then
			if (length(desc_p) > 0) or (length (valor_p) > 0) or (length(categ_p) > 0) then 
				UPDATE produtos SET 
				descricao = IF(desc_p IS NOT NULL AND desc_p <> '', desc_p, descricao),
				categoria = IF(categ_p IS NOT NULL AND categ_p <> '', categ_p, categoria),
				valor = IF(valor_p IS NOT NULL AND valor_p <> '', valor_p, valor)
				WHERE id_produto = id_prod_p;
				select 'Produto atualizado!' as Message, descricao, valor, categoria from produtos where id_produto = id_prod_p;
			else
				select 'Pelo menos uma informação precisa ser atualizada!' as Message_error;
			end if;
		else
			select 'O ID do Produto não pode estar vazio!' as Message_error;
		end if;
	-- opcao 3 = delete
    elseif opcao_p = 3 then
		if id_prod_p IS NOT NULL AND id_prod_p <> '' then
			delete from produtos where id_produto = id_prod_p;
			select 'Produto deletado!' as Message;
		else
			select 'O ID do Produto não pode estar vazio!' as Message_error;
		end if;            
    else
		select 'Opção inválida!' as Message_error;
    end if;
end \\
delimiter ;

drop procedure procedure_produtos;

/*
Parâmetros esperados pela procedure_produtos
in opcao_p int,
in id_prod_p int,
in desc_p varchar(255),
in valor_p float,
in categ_p enum('Alimentos','Brinquedos','Livros','Móveis','Eletrônicos','Limpeza','Vestuário')
*/
-- Execução da chamada  e testes da procedure para insert
CALL procedure_produtos(1, NULL, 'Produto de Exemplo', 10.5, 'Brinquedos');
CALL procedure_produtos(1, NULL, NULL, 10.5, 'Brinquedos');
CALL procedure_produtos(1, NULL, 'Produto', NULL, 'Brinquedos');
CALL procedure_produtos(1, NULL, 'Produto', 10, NULL);

-- Execução da chamada e testes da procedure para update
CALL procedure_produtos(2, 19, 'Produto de Exemplo', 20.5, 'Brinquedos');
CALL procedure_produtos(2, null, 'Produto de Exemplo', 20.5, 'Brinquedos');
CALL procedure_produtos(2, 19, null, null, 'Móveis');
CALL procedure_produtos(2, 19, 'Produto', null, null);
CALL procedure_produtos(2, 19, 'Produto 3', null, 'Brinquedos');
CALL procedure_produtos(2, 19, null, 25, null);
CALL procedure_produtos(2, 19, null, null, null);

-- Execução da chamada e testes da procedure para delete
CALL procedure_produtos(3, 19, null, null, null);
CALL procedure_produtos(3, null, null, null, null);
CALL procedure_produtos(3, 20, null, null, null);

-- Execução da chamada e testes da procedure com opção inválida
CALL procedure_produtos(4, 19, null, 25, null);

select * from produtos;