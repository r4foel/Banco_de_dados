################## DDL
-- 1. Crie uma tabela chamada Fornecedor para armazenar informações sobre os fornecedores do sistema.
-- id, nome, endereço, telefone, email e uma observação (text)

CREATE TABLE IF NOT EXISTS Fornecedor (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereço VARCHAR(100) NOT NULL, 
    Telefone VARCHAR(16) NOT NULL,
    Email VARCHAR(80) NOT NULL,
    Observacao TEXT
);

-- 2. Adicione uma coluna chamada CNPJ à tabela Fornecedor para armazenar os números de CNPJ dos fornecedores.
ALTER TABLE Fornecedor
	ADD COLUMN CNPJ VARCHAR(10);

-- 3. Adicione uma chave estrangeira à tabela Fornecedor para relacioná-la à tabela Categoria, representando a categoria do fornecedor.
ALTER TABLE Fornecedor
	ADD COLUMN CategoriaID INT,
    ADD FOREIGN KEY (CategoriaId) REFERENCES Categoria(Id);

-- 4. Modifique o tipo da coluna Telefone na tabela Fornecedor para armazenar números de telefone com no máximo 15 caracteres.
ALTER TABLE Fornecedor
	CHANGE Telefone Telefone VARCHAR(15) NOT NULL;

-- 5. Remova a coluna Observacao da tabela Fornecedor, pois não é mais necessária.
ALTER TABLE Fornecedor DROP COLUMN Observacao;

-- 6. Remova a tabela Fornecedor do banco de dados, se existir.
DROP TABLE Fornecedor; 

#################### DML
-- 0. Crie ao menos 5 registros para cada tabela, ignorando o gerneciamento de usuários. Um dos clientes deverá ter o seu nome
-- Inserindo registros na tabela Categoria
INSERT INTO Categoria (Nome, Descricao, UsuarioAtualizacao) VALUES
('Eletrônicos', 'Produtos eletrônicos diversos', 1),
('Roupas', 'Diversos tipos de roupas', 1),
('Alimentos', 'Produtos alimentícios variados', 1),
('Acessórios', 'Acessórios para diversos fins', 1),
('Livros', 'Livros de diferentes gêneros', 1);

-- Inserindo registros na tabela FormaPagamento
INSERT INTO FormaPagamento (Nome, Descricao, UsuarioAtualizacao) VALUES
('Cartão de Crédito', 'Pagamento via cartão de crédito', 1),
('Dinheiro', 'Pagamento em espécie', 1),
('Transferência Bancária', 'Transferência eletrônica', 1),
('Pix', 'Pagamento via Pix', 1),
('Boleto Bancário', 'Pagamento via boleto', 1);

-- Inserindo registros na tabela Produto
INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID, UsuarioAtualizacao) VALUES
('Smartphone', 'Celular de última geração', 2000.00, 1, 1),
('Camiseta', 'Camiseta casual', 50.00, 2, 1),
('Arroz', 'Arroz integral', 10.00, 3, 1),
('Óculos de Sol', 'Óculos de sol estilo aviador', 150.00, 4, 1),
('Dom Casmurro', 'Romance clássico de Machado de Assis', 30.00, 5, 1);

-- Inserindo registros na tabela Cliente
INSERT INTO Cliente (Nome, Email, Telefone, UsuarioAtualizacao) VALUES
('João', 'joao@email.com', '123456789', 1),
('Maria', 'maria@email.com', '987654321', 1),
('Carlos', 'carlos@email.com', '456123789', 1),
('Ana', 'ana@email.com', '789123456', 1),
('Pedro', 'pedro@email.com', '321654987', 1);

-- Inserindo registros na tabela Pedido
INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamentoId, Status, UsuarioAtualizacao) VALUES
(1, '2024-03-01', 1, 'Em andamento', 1),
(2, '2024-03-02', 2, 'Em andamento', 1),
(3, '2024-03-03', 3, 'Em andamento', 1),
(4, '2024-03-04', 4, 'Em andamento', 1),
(5, '2024-03-05', 5, 'Em andamento', 1);

-- Inserindo registros na tabela ItemPedido
INSERT INTO ItemPedido (PedidoId, ProdutoId, Quantidade, UsuarioAtualizacao) VALUES
(1, 1, 2, 1),
(2, 2, 1, 1),
(3, 3, 3, 1),
(4, 4, 1, 1),
(5, 5, 2, 1);

-- Inserindo registros na tabela GrupoUsuario
INSERT INTO GrupoUsuario (Nome, Descricao, UsuarioAtualizacao) VALUES
('Administradores', 'Grupo com permissões de administrador', 1),
('Vendedores', 'Grupo com permissões de vendedor', 1),
('Clientes', 'Grupo para clientes cadastrados', 1);

-- Inserindo registros na tabela Permissao
INSERT INTO Permissao (Nome, Descricao, UsuarioAtualizacao) VALUES
('Criar Produto', 'Permissão para criar produtos', 1),
('Editar Produto', 'Permissão para editar produtos', 1),
('Excluir Produto', 'Permissão para excluir produtos', 1),
('Realizar Pedido', 'Permissão para realizar pedidos', 1),
('Cancelar Pedido', 'Permissão para cancelar pedidos', 1);

-- Inserindo registros na tabela PermissaoGrupo
INSERT INTO PermissaoGrupo (PermissaoID, GrupoUsuarioID) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2);

-- Inserindo registros na tabela Usuario
INSERT INTO Usuario (NomeUsuario, Senha, Email, GrupoUsuarioID, UsuarioAtualizacao) VALUES
('admin', 'admin123', 'admin@email.com', 1, 1),
('vendedor1', 'vend123', 'vendedor1@email.com', 2, 1),
('cliente1', 'cli123', 'cliente1@email.com', 3, 1);


-- 1. Atualizar o nome de um cliente:
UPDATE Cliente 
SET Nome = 'Carlos Eduardo' 
WHERE Id = 3;

-- 2. Deletar um produto:

-- Primeiro precisou ser criado um novo produto para ser deletado em seguida
INSERT INTO produto (Nome, Descricao, Preco, UsuarioAtualizacao) VALUES
	('Kit de Taças', 'Kit de Taças Critalizadas', 150.00, 1);

DELETE FROM produto 
WHERE Id = 6;

-- 3. Alterar a categoria de um produto:
-- Set esta definindo o valor e where aplicando a condição
UPDATE Produto 
SET CategoriaID = 2 
WHERE Id = 4;


-- 4. Inserir um novo cliente:
INSERT INTO cliente (Nome, Email, Telefone, UsuarioAtualizacao, Ativo) VALUES
	('Rafael Mesquita', 'rafinho@gmail.com', '11940028922', '2024-01-01', 1);

-- 5. Inserir um novo pedido:
INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamento, Status, UsuarioAtualizacao)
VALUES 
    (7, '2024-02-01 21:00:00', 2, 'Entregue', 2);

-- 6. Atualizar o preço de um produto:
UPDATE Produto 
SET Preco = 15.00 
WHERE Nome = 'Arroz';

############## DQL - Sem Joins
-- 1. Selecione todos os registros da tabela Produto:
SELECT * FROM produto;

-- 2. Selecione apenas o nome e o preço dos produtos da tabela Produto:
SELECT nome, preco FROM produto;

-- 3. Selecione os produtos da tabela Produto ordenados por preço, do mais barato para o mais caro:
SELECT * FROM produto
ORDER BY preco;

-- 4. Selecione os produtos da tabela Produto ordenados por preço, do mais caro para o mais barato:
-- função desc realiza a função
SELECT * FROM produto
ORDER BY preco DESC;

-- 5. Selecione os nomes distintos das categorias da tabela Categoria:
-- remove a visualização de valores iguais
SELECT DISTINCT Nome FROM Categoria;

-- 6. Selecione os produtos da tabela Produto cujo preço esteja entre $10 e $50:
SELECT * 
FROM produto
WHERE preco BETWEEN 10 AND 50;

-- 7. Selecione os produtos da tabela Produto, mostrando o nome como "Nome do Produto" e o preço como "Preço Unitário":
SELECT Nome AS Nome_do_produto, preco AS Preco_unitário
FROM produto;

-- 8. Selecione os produtos da tabela Produto, adicionando uma coluna calculada "Preço Total" multiplicando a quantidade pelo preço:


-- 9. Selecione os produtos da tabela Produto, mostrando apenas os 10 primeiros registros:
SELECT * 
FROM PRODUTO
LIMIT 10;

-- 10. Selecione os produtos da tabela Produto, pulando os primeiros 5 registros e mostrando os 10 seguintes:
-- offset delimita a ordem da visualização, a partir de
SELECT *
FROM PRODUTO
LIMIT 10 OFFSET 5;

############# DQL - Joins
-- 1. Selecione o nome do produto e sua categoria:
SELECT Produto.Nome , Categoria.Nome
FROM Produto
LEFT JOIN Categoria ON Produto.CategoriaID = Categoria.Id;

-- 2. Selecione o nome do cliente e o nome do produto que ele comprou:
SELECT Cliente.Nome, Produto.Nome
FROM cliente
JOIN Pedido ON Cliente.Id = Pedido.ClienteID
JOIN ItemPedido ON Pedido.Id = ItemPedido.PedidoID
JOIN Produto ON ItemPedido.ProdutoID = Produto.Id;

-- 3. Selecione todos os produtos, mesmo aqueles que não têm uma categoria associada:
SELECT Produto.Nome, Categoria.Nome
FROM Produto
LEFT JOIN Categoria ON Produto.CategoriaID = Categoria.Id;

-- 4. Selecione todos os clientes, mesmo aqueles que não fizeram nenhum pedido:
SELECT Cliente.Nome, Pedido.Status
FROM Cliente
LEFT JOIN Pedido ON Cliente.Id = Pedido.ClienteID; 

-- 5. Selecione todas as categorias, mesmo aquelas que não têm produtos associados:
SELECT Categoria.Nome, Produto.Nome
FROM Categoria
LEFT JOIN Produto ON Categoria.Id = Produto.CategoriaID;

-- 6. Selecione todos os produtos, mesmo aqueles que não foram pedidos:
SELECT Produto.Nome, Pedido.Status
FROM Produto
LEFT JOIN ItemPedido ON Produto.Id = ItemPedido.ProdutoID
LEFT JOIN Pedido ON ItemPedido.PedidoID = Pedido.Id;


############### DQL com joins e demais filtros
-- 1. Selecione o nome da categoria e o número de produtos nessa categoria, apenas para categorias com mais de 5 produtos:


-- 2. Selecione o nome do cliente e o total de pedidos feitos por cada cliente:
-- Fazendo a contagem a partir do numero de vezes do nome do cliente a partir da decisão do left aplicado
SELECT Cliente.Nome, COUNT(Pedido.Id) AS TotalPedidos
FROM Cliente
LEFT JOIN Pedido ON Cliente.Id = Pedido.ClienteID
GROUP BY Cliente.Id;


-- 3. Selecione o nome do produto, o nome da categoria e a quantidade total de vendas para cada produto:
SELECT Produto.Nome, Categoria.Nome AS NomeCategoria, SUM(ItemPedido.Quantidade) AS QuantidadeTotalVendas
FROM Produto
LEFT JOIN Categoria ON Produto.CategoriaID = Categoria.Id
LEFT JOIN ItemPedido ON Produto.Id = ItemPedido.ProdutoID
GROUP BY Produto.Id;

-- 4. Selecione o nome da categoria, o número total de produtos nessa categoria e o número de pedidos para cada categoria:

-- 5. Selecione o nome do cliente, o número total de pedidos feitos por esse cliente e a média de produtos por pedido, apenas para clientes que tenham feito mais de 3 pedidos:


##### Crie uma View qualquer para qualquer um dos joins desenvolvidos

##### Crie uma transaction que cadastra um cliente e faça uma venda
-- Início da transação

-- Inserir um novo cliente


-- Inserir um novo pedido para o cliente


-- Inserir itens no pedido


-- Commit da transação (confirmação das alterações)