-- EX 01 - Recupere o valor do produto mais caro

SELECT MAX (preco)
	FROM produto;
--Selecionou o preço maximo dos produtos (produto mais caro)
 
-- EX 02 - Recupere a menor quantidade comprada

SELECT MIN (qtd)
	FROM compras;
-- selecionou a menor quantidade de produtos comprado(produto menos comprado)

-- EX 03 - Recupere a média de quantidade compradas

SELECT ROUND(AVG(qtd),2)
	FROM compras;

-- EX04 - Recupere a quantidade de clientes do estado do Rio de Janeiro

SELECT COUNT (*)
	FROM cliente
	WHERE estado = 'Rio de Janeiro';

-- EX05 – Recupere o valor médio dos produtos

SELECT ROUND(AVG(preco),2)
	FROM produto;

-- EX06 - Recupere a quantidade de vendas de produtos da marca bom prato

SELECT SUM(c.qtd) 
	FROM compras AS c
	JOIN produto AS p
	ON c.idproduto = p.idproduto
	JOIN marca AS m
	ON m.idmarca = p.idmarca
	WHERE m.nomemarca = 'Bom Prato';

-- EX07 – Recupere a quantidade de produtos comprados na loja Vale Verde
SELECT SUM (c.qtd)
	FROM compras AS c
	JOIN loja AS l
	ON c.idloja = l.idoloja
	WHERE l.idloja = 'Vale Verde';
	
-- EX08 – Recupere a soma dos produtos comprados em lojas localizadas em Minas Gerais
SELECT SUM (c.qtd)
	FROM compras AS c
	JOIN loja AS l
	ON c.idloja = l.idloja
	WHERE l.uf = 'MG';
	
-- EX09 – Recupere o quantidade total vendida de Macarrão
SELECT SUM (c.qtd)
	FROM compras AS c
	JOIN produto AS p
	ON c.idproduto = p.idproduto
	WHERE p.nomeproduto = 'Marcarrão';

-- EX10 – Recupere a quantidade total de todas as vendas
SELECT SUM (c.qtd)
FROM compras AS c;

-- EX11 – Recupere a quantidade de cliente por estado
SELECT estado, COUNT (*) as totclientes --SELECIONOU O ESTADO DEPOIS FEZ COM QUE O TOTAL DOS CLIENTES APARECESSE COMO TOTCLIENTES
FROM cliente
GROUP BY estado -- AGRUPOU POR ESTADO
ORDER BY totclientes DESC;

-- EX12 - Recupere a quantidade de lojas por estado
SELECT uf, COUNT(*) AS total
FROM loja
GROUP BY uf
ORDER BY total DESC;

-- EX13 - Recupere a quantidade de produtos por marca
SELECT m.nomemarca, COUNT(*) AS total
FROM marca AS m
JOIN produto AS p 
ON m.idmarca = p.idmarca
GROUP BY m.nomemarca; 

-- EX14 – Recupere o valor total de compras por marca
SELECT m.nomemarca, SUM(c.qtd*p.preco) AS total
FROM compras AS c
JOIN produto AS p
ON c.idproduto = p.idproduto
JOIN marca AS m
ON p.idmarca = m.idmarca
GROUP BY m.nomemarca;


-- EX15 – Recupere a quantidade média de vendas por produto

-- EX16 – Recupere o faturamento por loja

-- EX17 – Recupere a quantidade de produtos comprados por cliente

-- EX18 – Recupere a quantidade de clientes por cidade, exibindo as 5 cidades com mais clientes

-- EX19 – Recupere a quantidade total de produtos vendidos, em ordem de total de vendas por produto

-- Ex20 – Recupere os 5 clientes que mais gastaram comprando produtos no armazém

-- Ex21 – Recupere quantidade de clientes por estado, mas exiba apenas os estados com mais de 50 clientes

-- Ex22 – Recupere o total faturado por marca, mas apenas as empresas que faturaram mais de 25000 Reais

-- EX23 – Recupere a quantidade de compras por cliente, mas exiba apenas os clientes com menos de 5 compras realizadas

-- EX24 – Recupere o nome do produto mais caro
-- EX25 – Recupere o nome dos clientes que não realizaram nenhuma compra

-- PROVA ---------------------------------------------------------------

-- QUESTÃO 1 Insira os dados da tabela projeto
INSERT INTO projeto (codProjeto,nome,totalhoras)
values('p38','Comércio Eletrônico', '360')
	  ('p40','Comércio Eletrônico', '400')
	  ('p52','Comércio Eletrônico', '280');

-- QUESTÃO 2 Dê um aumento de 10% para todos os funcionarios de TI
UPDATE funcionario SET salario = salario + 1.10
	WHERE codsetor='S003';
-- QUESTÃO 3 Recupe o nome dos setores localizados no 3 ou 4 andar
SELECT nome 
FROM setor
WHERE localizacao = '3 andar' or localizacao = '4 andar'

-- QUESTÃO 4 Recupere o nome dos funcionarios que recebem salarios >= 2000
SELECT nome 
FROM funcionario
WHERE salario >=2000
-- QUESTÃO 5 Recupere o nome e o salario dos funcionarios que trabalham no RH
SELECT f.nome,f.salario
FROM funcionario AS f
JOIN setor AS s
ON f.codsetor = s.codsetor
WHERE s.nome = 'Recursos Humanos';
-- QUESTÃO 6 

-- QUESTÃO 7 Recupere o valor do maior salario da empresa
SELECT MAX (salario) 
FROM funcionario;

-- QUESTÃO 8 recupere o nome dos projetos que a funcionario priscila marques trabalha
SELECT p.nome
FROM projeto AS p
JOIN funcionario AS f
ON 

-- QUESTÃO 9 Recupere a quantidade de funcionarios por setor
SELECT count(*) AS total
FROM funcionario
GROUP BY codsetor;

-- QUESTÃO 10 
SELECT setor, SUM (salario) AS total
FROM funcionario
GROUP BY setor
HAVING SUM (salario) > 30000 --????????????????


-- OUTRA PROVA ------------------------------------------------------------

-- Questão 1 !!!!!!!!!!!!!!!!!!
--A) Recupere o código e o nome dos funcionarios que ganham 3k
SELECT codfunc, nome
FROM Funcionario
WHERE salario = 3000;
--B) Recupere o nome e o salário dos funcionarios que trabalham no setor Estoque
SELECT f.nome,f.salario
FROM funcionario AS f
JOIN setor AS s
WHERE f.codsetor = s.codsetor
ANO s.nome = 'Estoque';

--C) Recupere o nome dos funcionarios que se dedicaram menos de 100 horas em algum projeto

--D) Recupere o nome dos funcionarios que trabalham no projeto "Governança"
SELECT f.nome
FROM funcionario AS f, trabalha_em AS t,projeto AS p
WHERE f.codfunc = t.codfunc
AND p.codprojeto = t.codprojeto
AND p.nome = 'governança';

-- Questão 2 !!!!!!!!!!!!!!!!!!!!!!!!!!
--A) Insira o setor < S005,Contabilidade,1 andar> na tabela setor
INSERT INTO setor(codsetor,nome,localizacao)
	value('S005','Contabilidade','1 andar');

--B) aloque o funcionario Gilmar Melo no projeto Governança com 300 horas
INSERT INTO trabalha_em(codfunc,codprojeto,datainicio,datafim,dedicacao)
	value ('f100', 'p40','03/02/2010','15/11/2010','100');

--D) Atualize o salario de todos os funcionarios 10%
UPDATE funcionario SET salario = salario * 1.10;

-- Questão 3 !!!!!!!!!!!!!!!!!!!!!!!
--A) Recupere a quantidade de setores cadastrados
SELECT COUNT(*) AS qtd_setores
FROM setor;
--B) Recupere o valor total de horas de projetos
SELECT SUM(totalhoras) AS valor_total_horas
FROM Projeto;
--C) Recupe a média salarial dos funcionarios que trabalham no setor S003
SELECT AVG(salario) AS media_salarial
FROM funcionario
WHERE codsetor = 'S003';
--D) Recupere o valor do menor salário entre os funcionarios
SELECT MIN (salario) AS menor_salario
FROM funcionario;
