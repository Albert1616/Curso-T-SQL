
--Pessoa
CREATE TABLE Rev_Pessoa (
	idPessoa INT PRIMARY KEY,
	idEndereco INT,
	CPF VARCHAR(11),
	Nome VARCHAR(100)
)
GO

INSERT INTO Rev_Pessoa (idPessoa, idEndereco, CPF, Nome) VALUES
(1, 100, '12345678901', 'Ana Silva'),
(2, 101, '23456789012', 'Bruno Oliveira'),
(3, 102, '34567890123', 'Carla Souza'),
(4, 103, '45678901234', 'Diego Costa'),
(5, 104, '56789012345', 'Elisa Fernandes'),
(6, 105, '67890123456', 'Fabio Santos'),
(7, 106, '78901234567', 'Gabriela Lima'),
(8, 107, '89012345678', 'Henrique Almeida'),
(9, 108, '90123456789', 'Isabela Rocha'),
(10, 109, '01234567890', 'Jo�o Pereira'),
(11, 110, '11234567890', 'Larissa Martins'),
(12, 111, '12234567890', 'Marcos Silva'),
(13, 112, '13234567890', 'Nat�lia Souza'),
(14, 113, '14234567890', 'Ot�vio Costa'),
(15, 114, '15234567890', 'Patr�cia Fernandes'),
(16, 115, '16234567890', 'Rafael Santos'),
(17, 116, '17234567890', 'Sabrina Lima'),
(18, 117, '18234567890', 'Thiago Almeida'),
(19, 118, '19234567890', 'Vanessa Rocha'),
(20, 119, '20234567890', 'Wagner Pereira')
GO

CREATE TABLE Rev_Veiculo (
	idVeiculo INT PRIMARY KEY,
	idPessoa INT,
	Placa VARCHAR(7),
	MarcaModelo VARCHAR(100),
	Cor VARCHAR(100),
	AnoModelo INT,
	AnoFabricacao INT,
	Valor MONEY
)
GO 

INSERT INTO Rev_Veiculo (idVeiculo, idPessoa, Placa, MarcaModelo, Cor, AnoModelo, AnoFabricacao, Valor) VALUES
(1, 1, 'ABC1234', 'Ford Ka', 'Prata', 2019, 2019, 45000.00),
(2, 1, 'DEF5678', 'Chevrolet Onix', 'Branco', 2020, 2020, 50000.00),
(3, 2, 'GHI9012', 'Volkswagen Gol', 'Preto', 2018, 2018, 40000.00),
(4, 3, 'JKL3456', 'Fiat Uno', 'Vermelho', 2017, 2017, 35000.00),
(5, 4, 'MNO7890', 'Renault Sandero', 'Azul', 2021, 2021, 55000.00),
(6, 5, 'PQR1234', 'Hyundai HB20', 'Cinza', 2019, 2019, 46000.00),
(7, 6, 'STU5678', 'Toyota Corolla', 'Branco', 2022, 2022, 90000.00),
(8, 6, 'VWX9012', 'Honda Civic', 'Preto', 2018, 2018, 70000.00),
(9, 6, 'YZA3456', 'Nissan March', 'Vermelho', 2017, 2017, 37000.00),
(10, 7, 'BCD7890', 'Peugeot 208', 'Azul', 2020, 2020, 52000.00),
(11, 7, 'EFG1234', 'Chevrolet Prisma', 'Prata', 2018, 2019, 42000.00),
(12, 8, 'HIJ5678', 'Ford Fiesta', 'Cinza', 2019, 2019, 48000.00),
(13, 9, 'KLM9012', 'Toyota Etios', 'Branco', 2025, 2025, 39000.00),
(14, 10, 'NOP3456', 'Volkswagen Polo', 'Preto', 2021, 2022, 62000.00),
(15, 11, 'QRS7890', 'Fiat Palio', 'Vermelho', 2022, 2022, 53000.00),
(16, 12, 'TUV1234', 'Renault Logan', 'Azul', 2019, 2019, 46000.00),
(17, 13, 'WXY5678', 'Hyundai Creta', 'Branco', 2020, 2020, 70000.00),
(18, 14, 'ZAB9012', 'Honda Fit', 'Preto', 2018, 2018, 50000.00),
(19, 15, 'CDE3456', 'Nissan Versa', 'Vermelho', 2017, 2019, 42000.00),
(20, 16, 'FGH7890', 'Peugeot 2008', 'Azul', 2019, 2019, 55000.00),
(21, 17, 'IJK1234', 'Chevrolet Spin', 'Cinza', 2021, 2021, 60000.00),
(22, 18, 'LMN5678', 'Ford EcoSport', 'Prata', 2018, 2018, 52000.00),
(23, 19, 'OPQ9012', 'Toyota Yaris', 'Branco', 2017, 2017, 45000.00),
(24, 20, 'RST3456', 'Volkswagen Virtus', 'Preto', 2020, 2022, 65000.00),
(25, 20, 'UVW7890', 'Fiat Mobi', 'Vermelho', 2023, 2023, 40000.00),
(26, 2, 'XYZ1234', 'Renault Kwid', 'Azul', 2019, 2019, 43000.00),
(27, 3, 'ABC5678', 'Hyundai Tucson', 'Branco', 2020, 2020, 75000.00),
(28, 4, 'DEF9012', 'Honda HR-V', 'Preto', 2018, 2018, 60000.00),
(29, 5, 'GHI3456', 'Nissan Kicks', 'Vermelho', 2017, 2017, 47000.00),
(30, 6, 'JKL7890', 'Peugeot 3008', 'Azul', 2024, 2025, 80000.00)


--endere�o
CREATE TABLE Rev_Endereco (
	idEndereco INT PRIMARY KEY,
	Logradouro VARCHAR(60),
	Numero VARCHAR(20),
	Complemento VARCHAR(20),
	Bairro VARCHAR(20),
	Cidade VARCHAR(50),
	UF CHAR(2)
)
GO
INSERT INTO Rev_Endereco (idEndereco, Logradouro, Numero, Complemento, Bairro, Cidade, UF) VALUES
(100, 'Av. Paulista', '123', 'Apto 101', 'Bela Vista', 'S�o Paulo', 'SP'),
(101, 'Rua das Flores', '456', 'Casa', 'Centro', 'Curitiba', 'PR'),
(102, 'Av. Atl�ntica', '789', 'Cobertura', 'Copacabana', 'Rio de Janeiro', 'RJ'),
(103, 'Rua XV de Novembro', '101', 'Sala 5', 'Centro', 'Florian�polis', 'SC'),
(104, 'Av. Afonso Pena', '202', 'Loja 2', 'Centro', 'Belo Horizonte', 'MG'),
(105, 'Rua Oscar Freire', '303', 'Apto 202', 'Jardins', 'S�o Paulo', 'SP'),
(106, 'Av. Beira Mar', '404', 'Casa', 'Meireles', 'Fortaleza', 'CE'),
(107, 'Rua Sete de Setembro', '505', 'Apto 303', 'Centro', 'Porto Alegre', 'RS'),
(108, 'Av. Brasil', '606', 'Sala 6', 'Centro', 'Curitiba', 'PR'),
(109, 'Rua Augusta', '707', 'Apto 404', 'Consola��o', 'S�o Paulo', 'SP'),
(110, 'Av. Santos Dumont', '808', 'Cobertura', 'Centro', 'Aracaju', 'SE'),
(111, 'Rua das Palmeiras', '909', 'Casa', 'Jardim Bot�nico', 'Rio de Janeiro', 'RJ'),
(112, 'Av. Independ�ncia', '111', 'Loja 3', 'Centro', 'Recife', 'PE'),
(113, 'Rua do Com�rcio', '222', 'Apto 505', 'Centro', 'Manaus', 'AM'),
(114, 'Av. das Am�ricas', '333', 'Sala 7', 'Barra da Tijuca', 'Rio de Janeiro', 'RJ'),
(115, 'Rua Jo�o Pessoa', '444', 'Casa', 'Cidade Alta', 'Natal', 'RN'),
(116, 'Av. Amazonas', '555', 'Apto 606', 'Centro', 'Belo Horizonte', 'MG'),
(117, 'Rua Marechal Deodoro', '666', 'Cobertura', 'Centro', 'Campo Grande', 'MS'),
(118, 'Av. Goi�s', '777', 'Sala 8', 'Centro', 'Goi�nia', 'GO'),
(119, 'Rua Padre C�cero', '888', 'Apto 707', 'Centro', 'Juazeiro do Norte', 'CE')


--Orgao Autuador
CREATE TABLE Rev_OrgaoAutuador (
	idOrgaoAutuador INT PRIMARY KEY,
	Nome VARCHAR(100)
)
GO

INSERT INTO Rev_OrgaoAutuador (idOrgaoAutuador, Nome) VALUES (1, 'Detran')
INSERT INTO Rev_OrgaoAutuador (idOrgaoAutuador, Nome) VALUES (2, 'PRF')
INSERT INTO Rev_OrgaoAutuador (idOrgaoAutuador, Nome) VALUES (3, 'STTU')


/* Natureza

Valores base nas naturezas e pontua��o na CNH
Multas leves: R$88,38 (3 pontos na CNH)
Multas m�dias: R$130,16 (4 pontos)
Multas graves: R$195,23 (5 pontos)
Multas grav�ssimas: R$293,47 (7 pontos)
*/

CREATE TABLE Rev_Natureza (
	idNatureza INT PRIMARY KEY,
	Descricao VARCHAR(100)
)
GO

INSERT INTO Rev_Natureza VALUES
(1, 'LEVE'),
(2, 'M�DIA'),
(3, 'GRAVE') ,
(4, 'GRAV�SSIMA')
GO

--Tipo Infracao
CREATE TABLE Rev_TipoInfracao (
	CodigoInfracao INT PRIMARY KEY,
	idNatureza INT,
	Descricao VARCHAR(100)
)
GO 

INSERT INTO Rev_TipoInfracao (CodigoInfracao, idNatureza, Descricao)
VALUES 
(1, 2, 'Estacionamento em local proibido'),
(2, 3, 'Condu��o sem cinto de seguran�a'),
(3, 3, 'Uso de celular ao volante'),
(4, 2, 'Velocidade at� 20% acima do limite'),
(5, 3, 'Estacionar na cal�ada'),
(6, 4, 'Avan�ar sinal vermelho'),
(7, 4, 'Conduzir ve�culo sem CNH'),
(8, 3, 'N�o dar prefer�ncia a pedestres na faixa'),
(9, 4, 'Conduzir sob efeito de �lcool'),
(10, 4, 'Excesso de velocidade acima de 50%'),
(11, 4, 'Participar de racha'),
(12, 1, 'Estacionar em vaga reservada sem autoriza��o'),
(13, 1, 'Luz alta ligada durante o dia'),
(14, 2, 'Transporte de carga sem sinaliza��o adequada'),
(15, 2, 'Conduzir ve�culo com farol queimado'),
(16, 3, 'Ultrapassagem em faixa cont�nua'),
(17, 3, 'Conduzir ve�culo com pneu careca'),
(18, 4, 'Fugir de blitz policial'),
(19, 1, 'Conduzir o ve�culo com vidros ou pel�cula muito escura'),
(20, 1, 'Deixar de usar a seta ao mudar de dire��o')

--Infra��o
CREATE TABLE Rev_Infracao (
	idInfracao INT PRIMARY KEY,
	Endereco VARCHAR(60),
	UF CHAR(2),
	NumeroAuto VARCHAR(10),
	idOrgaoAutuador INT, 
	CodigoInfracao INT, 
	Placa VARCHAR(10),
	idDebito INT,
	DataInfracao DATETIME,
	DataVencimento DATETIME
)

GO

INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (1, N'Rua Aleat�ria 1', N'ES', N'1', 2, 18, N'QRS7890', 1, '20240827 00:00:00', '20241026 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (2, N'Rua Aleat�ria 2', N'PI', N'2', 1, 20, N'WXY5678', 2, '20241128 00:00:00', '20250127 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (3, N'Rua Aleat�ria 3', N'AL', N'3', 1, 6, N'YZA3456', 3, '20240222 00:00:00', '20240422 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (4, N'Rua Aleat�ria 4', N'MG', N'4', 3, 15, N'MNO7890', 4, '20240703 00:00:00', '20240901 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (5, N'Rua Aleat�ria 5', N'PA', N'5', 4, 2, N'VWX9012', 5, '20241105 00:00:00', '20250104 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (6, N'Rua Aleat�ria 6', N'SE', N'6', 3, 1, N'HIJ5678', 6, '20240101 00:00:00', '20240301 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (7, N'Rua Aleat�ria 7', N'RJ', N'7', 3, 6, N'IJK1234', 7, '20240413 00:00:00', '20240612 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (8, N'Rua Aleat�ria 8', N'RJ', N'8', 1, 13, N'WXY5678', 8, '20240323 00:00:00', '20240522 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (9, N'Rua Aleat�ria 9', N'ES', N'9', 2, 15, N'CDE3456', 9, '20241114 00:00:00', '20250113 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (10, N'Rua Aleat�ria 10', N'MS', N'10', 4, 7, N'FGH7890', 10, '20240308 00:00:00', '20240507 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (11, N'Rua Aleat�ria 11', N'MS', N'11', 1, 3, N'GHI9012', 11, '20240816 00:00:00', '20241015 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (12, N'Rua Aleat�ria 12', N'SC', N'12', 2, 14, N'WXY5678', 12, '20240802 00:00:00', '20241001 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (13, N'Rua Aleat�ria 13', N'AC', N'13', 3, 1, N'DEF9012', 13, '20240422 00:00:00', '20240621 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (14, N'Rua Aleat�ria 14', N'RR', N'14', 1, 18, N'JKL7890', 14, '20240131 00:00:00', '20240331 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (15, N'Rua Aleat�ria 15', N'RN', N'15', 3, 3, N'QRS7890', 15, '20240101 00:00:00', '20240301 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (16, N'Rua Aleat�ria 16', N'AL', N'16', 1, 11, N'DEF5678', 16, '20241216 00:00:00', '20250214 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (17, N'Rua Aleat�ria 17', N'BA', N'17', 1, 5, N'MNO7890', 17, '20240810 00:00:00', '20241009 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (18, N'Rua Aleat�ria 18', N'GO', N'18', 3, 16, N'WXY5678', 18, '20240509 00:00:00', '20240708 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (19, N'Rua Aleat�ria 19', N'TO', N'19', 3, 11, N'YZA3456', 19, '20240708 00:00:00', '20240906 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (20, N'Rua Aleat�ria 20', N'SP', N'20', 3, 14, N'XYZ1234', 20, '20241216 00:00:00', '20250214 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (21, N'Rua Aleat�ria 21', N'PR', N'21', 4, 17, N'QRS7890', 21, '20240621 00:00:00', '20240820 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (22, N'Rua Aleat�ria 22', N'RN', N'22', 3, 8, N'YZA3456', 22, '20240608 00:00:00', '20240807 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (23, N'Rua Aleat�ria 23', N'CE', N'23', 1, 16, N'EFG1234', 23, '20240413 00:00:00', '20240612 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (24, N'Rua Aleat�ria 24', N'RO', N'24', 3, 11, N'ABC1234', 24, '20240105 00:00:00', '20240305 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (25, N'Rua Aleat�ria 25', N'SC', N'25', 3, 7, N'ABC5678', 25, '20240625 00:00:00', '20240824 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (26, N'Rua Aleat�ria 26', N'MG', N'26', 4, 6, N'XYZ1234', 26, '20240122 00:00:00', '20240322 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (27, N'Rua Aleat�ria 27', N'MG', N'27', 3, 1, N'WXY5678', 27, '20241109 00:00:00', '20250108 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (28, N'Rua Aleat�ria 28', N'PR', N'28', 3, 18, N'BCD7890', 28, '20240622 00:00:00', '20240821 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (29, N'Rua Aleat�ria 29', N'CE', N'29', 2, 9, N'RST3456', 29, '20241208 00:00:00', '20250206 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (30, N'Rua Aleat�ria 30', N'ES', N'30', 3, 14, N'STU5678', 30, '20241001 00:00:00', '20241031 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (31, N'Rua Aleat�ria 31', N'GO', N'31', 4, 2, N'BCD7890', 31, '20240813 00:00:00', '20241012 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (32, N'Rua Aleat�ria 32', N'RN', N'32', 2, 20, N'PQR1234', 32, '20241220 00:00:00', '20250218 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (33, N'Rua Aleat�ria 33', N'DF', N'33', 1, 9, N'ZAB9012', 33, '20240303 00:00:00', '20240502 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (34, N'Rua Aleat�ria 34', N'DF', N'34', 2, 10, N'UVW7890', 34, '20241222 00:00:00', '20250220 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (35, N'Rua Aleat�ria 35', N'RR', N'35', 1, 1, N'STU5678', 35, '20241110 00:00:00', '20250109 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (36, N'Rua Aleat�ria 36', N'MT', N'36', 2, 18, N'ABC1234', 36, '20241204 00:00:00', '20250202 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (37, N'Rua Aleat�ria 37', N'RR', N'37', 2, 16, N'UVW7890', 37, '20240403 00:00:00', '20240602 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (38, N'Rua Aleat�ria 38', N'BA', N'38', 4, 19, N'FGH7890', 38, '20240122 00:00:00', '20240322 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (39, N'Rua Aleat�ria 39', N'PR', N'39', 3, 10, N'ZAB9012', 39, '20240808 00:00:00', '20241007 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (40, N'Rua Aleat�ria 40', N'MT', N'40', 1, 8, N'CDE3456', 40, '20240524 00:00:00', '20240723 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (41, N'Rua Aleat�ria 41', N'BA', N'41', 3, 14, N'QRS7890', 41, '20241010 00:00:00', '20241209 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (42, N'Rua Aleat�ria 42', N'AP', N'42', 1, 12, N'OPQ9012', 42, '20240820 00:00:00', '20241019 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (43, N'Rua Aleat�ria 43', N'PE', N'43', 2, 13, N'KLM9012', 43, '20240901 00:00:00', '20241031 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (44, N'Rua Aleat�ria 44', N'RO', N'44', 1, 15, N'LMN5678', 44, '20240114 00:00:00', '20240314 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (45, N'Rua Aleat�ria 45', N'PR', N'45', 4, 14, N'HIJ5678', 45, '20240429 00:00:00', '20240628 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (46, N'Rua Aleat�ria 46', N'SP', N'46', 1, 17, N'BCD7890', 46, '20240524 00:00:00', '20240723 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (47, N'Rua Aleat�ria 47', N'RR', N'47', 3, 5, N'IJK1234', 47, '20240810 00:00:00', '20241009 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (48, N'Rua Aleat�ria 48', N'SE', N'48', 1, 11, N'VWX9012', 48, '20240320 00:00:00', '20240519 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (49, N'Rua Aleat�ria 49', N'RR', N'49', 2, 6, N'FGH7890', 49, '20241227 00:00:00', '20250225 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (50, N'Rua Aleat�ria 50', N'PB', N'50', 4, 20, N'JKL7890', 50, '20240827 00:00:00', '20241026 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (51, N'Rua Aleat�ria 51', N'CE', N'51', 2, 2, N'DEF5678', 51, '20240401 00:00:00', '20240531 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (52, N'Rua Aleat�ria 52', N'ES', N'52', 2, 5, N'LMN5678', 52, '20240302 00:00:00', '20240501 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (53, N'Rua Aleat�ria 53', N'AC', N'53', 4, 19, N'STU5678', 53, '20241013 00:00:00', '20241212 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (54, N'Rua Aleat�ria 54', N'SE', N'54', 1, 2, N'UVW7890', 54, '20240912 00:00:00', '20241111 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (55, N'Rua Aleat�ria 55', N'AM', N'55', 3, 8, N'OPQ9012', 55, '20240520 00:00:00', '20240719 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (56, N'Rua Aleat�ria 56', N'PE', N'56', 1, 20, N'TUV1234', 56, '20241008 00:00:00', '20241207 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (57, N'Rua Aleat�ria 57', N'RJ', N'57', 2, 19, N'LMN5678', 57, '20240113 00:00:00', '20240313 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (58, N'Rua Aleat�ria 58', N'SC', N'58', 1, 16, N'DEF5678', 58, '20240321 00:00:00', '20240520 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (59, N'Rua Aleat�ria 59', N'AM', N'59', 4, 20, N'KLM9012', 59, '20241228 00:00:00', '20250226 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (60, N'Rua Aleat�ria 60', N'MT', N'60', 1, 9, N'DEF5678', 60, '20240905 00:00:00', '20241104 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (61, N'Rua Aleat�ria 61', N'MS', N'61', 4, 20, N'DEF5678', 61, '20240803 00:00:00', '20241002 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (62, N'Rua Aleat�ria 62', N'SC', N'62', 3, 10, N'HIJ5678', 62, '20241213 00:00:00', '20250211 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (63, N'Rua Aleat�ria 63', N'GO', N'63', 1, 4, N'NOP3456', 63, '20240923 00:00:00', '20241122 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (64, N'Rua Aleat�ria 64', N'MA', N'64', 2, 14, N'TUV1234', 64, '20240610 00:00:00', '20240809 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (65, N'Rua Aleat�ria 65', N'ES', N'65', 3, 3, N'ABC1234', 65, '20240728 00:00:00', '20240926 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (66, N'Rua Aleat�ria 66', N'SE', N'66', 3, 1, N'EFG1234', 66, '20241223 00:00:00', '20250221 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (67, N'Rua Aleat�ria 67', N'TO', N'67', 3, 10, N'NOP3456', 67, '20240710 00:00:00', '20240908 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (68, N'Rua Aleat�ria 68', N'SE', N'68', 1, 19, N'MNO7890', 68, '20241229 00:00:00', '20250227 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (69, N'Rua Aleat�ria 69', N'PI', N'69', 4, 8, N'EFG1234', 69, '20240105 00:00:00', '20240305 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (70, N'Rua Aleat�ria 70', N'PR', N'70', 1, 10, N'XYZ1234', 70, '20240727 00:00:00', '20240925 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (71, N'Rua Aleat�ria 71', N'MS', N'71', 2, 12, N'ABC1234', 71, '20241209 00:00:00', '20250207 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (72, N'Rua Aleat�ria 72', N'SP', N'72', 4, 18, N'IJK1234', 72, '20240610 00:00:00', '20240809 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (73, N'Rua Aleat�ria 73', N'CE', N'73', 1, 17, N'CDE3456', 73, '20241023 00:00:00', '20241222 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (74, N'Rua Aleat�ria 74', N'RR', N'74', 4, 2, N'OPQ9012', 74, '20241004 00:00:00', '20241203 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (75, N'Rua Aleat�ria 75', N'SE', N'75', 3, 8, N'ABC1234', 75, '20240217 00:00:00', '20240417 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (76, N'Rua Aleat�ria 76', N'BA', N'76', 2, 9, N'PQR1234', 76, '20240313 00:00:00', '20240512 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (77, N'Rua Aleat�ria 77', N'MS', N'77', 1, 7, N'GHI3456', 77, '20240425 00:00:00', '20240624 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (78, N'Rua Aleat�ria 78', N'SE', N'78', 1, 7, N'YZA3456', 78, '20241027 00:00:00', '20241226 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (79, N'Rua Aleat�ria 79', N'AM', N'79', 3, 9, N'ABC5678', 79, '20241014 00:00:00', '20241213 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (80, N'Rua Aleat�ria 80', N'RJ', N'80', 2, 8, N'FGH7890', 80, '20240712 00:00:00', '20240910 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (81, N'Rua Aleat�ria 81', N'PA', N'81', 3, 20, N'ZAB9012', 81, '20240627 00:00:00', '20240826 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (82, N'Rua Aleat�ria 82', N'TO', N'82', 1, 15, N'BCD7890', 82, '20240223 00:00:00', '20240423 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (83, N'Rua Aleat�ria 83', N'SP', N'83', 1, 9, N'BCD7890', 83, '20240909 00:00:00', '20241108 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (84, N'Rua Aleat�ria 84', N'TO', N'84', 3, 16, N'BCD7890', 84, '20241027 00:00:00', '20241226 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (85, N'Rua Aleat�ria 85', N'DF', N'85', 1, 3, N'QRS7890', 85, '20240609 00:00:00', '20240808 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (86, N'Rua Aleat�ria 86', N'SE', N'86', 4, 8, N'IJK1234', 86, '20240524 00:00:00', '20240723 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (87, N'Rua Aleat�ria 87', N'PE', N'87', 2, 4, N'FGH7890', 87, '20240310 00:00:00', '20240509 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (88, N'Rua Aleat�ria 88', N'AM', N'88', 2, 13, N'GHI9012', 88, '20240717 00:00:00', '20240915 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (89, N'Rua Aleat�ria 89', N'MG', N'89', 3, 16, N'KLM9012', 89, '20240811 00:00:00', '20241010 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (90, N'Rua Aleat�ria 90', N'AM', N'90', 3, 3, N'PQR1234', 90, '20240220 00:00:00', '20240420 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (91, N'Rua Aleat�ria 91', N'DF', N'91', 1, 16, N'NOP3456', 91, '20240611 00:00:00', '20240810 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (92, N'Rua Aleat�ria 92', N'CE', N'92', 1, 17, N'ABC1234', 92, '20240720 00:00:00', '20240918 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (93, N'Rua Aleat�ria 93', N'ES', N'93', 2, 1, N'ABC1234', 93, '20240113 00:00:00', '20240313 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (94, N'Rua Aleat�ria 94', N'AP', N'94', 1, 19, N'DEF9012', 94, '20240318 00:00:00', '20240517 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (95, N'Rua Aleat�ria 95', N'MS', N'95', 2, 8, N'QRS7890', 95, '20240929 00:00:00', '20241128 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (96, N'Rua Aleat�ria 96', N'CE', N'96', 1, 13, N'XYZ1234', 96, '20240528 00:00:00', '20240727 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (97, N'Rua Aleat�ria 97', N'PE', N'97', 3, 16, N'JKL7890', 97, '20241010 00:00:00', '20241209 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (98, N'Rua Aleat�ria 98', N'RS', N'98', 1, 3, N'BCD7890', 98, '20240420 00:00:00', '20240619 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (99, N'Rua Aleat�ria 99', N'PB', N'99', 4, 11, N'IJK1234', 99, '20240109 00:00:00', '20240309 00:00:00')
INSERT Rev_Infracao (idInfracao, Endereco, UF, NumeroAuto, idOrgaoAutuador, CodigoInfracao, Placa, idDebito, DataInfracao, DataVencimento) VALUES (100, N'Rua Aleat�ria 100', N'RN', N'100', 3, 10, N'PQR1234', 100, '20241220 00:00:00', '20250218 00:00:00')
GO

-- Debito
CREATE TABLE Rev_Debito (
	idDebito INT PRIMARY KEY,
	idInfracao INT,
	Descricao VARCHAR(100),
	Valor MONEY,
	DataVencimento DATE,
	idStatus INT, -- Pago, A pagar, vencido, cancelado, isento
	Desconto MONEY
)

INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (1, 1, N'Descri��o do d�bito 1', NULL, '20250520', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (2, 2, N'Descri��o do d�bito 2', NULL, '20250420', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (3, 3, N'Descri��o do d�bito 3', NULL, '20250427', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (4, 4, N'Descri��o do d�bito 4', NULL, '20251018', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (5, 5, N'Descri��o do d�bito 5', NULL, '20250430', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (6, 6, N'Descri��o do d�bito 6', NULL, '20250301', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (7, 7, N'Descri��o do d�bito 7', NULL, '20250415', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (8, 8, N'Descri��o do d�bito 8', NULL, '20250808', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (9, 9, N'Descri��o do d�bito 9', NULL, '20250508', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (10, 10, N'Descri��o do d�bito 10', NULL, '20250604', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (11, 11, N'Descri��o do d�bito 11', NULL, '20250816', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (12, 12, N'Descri��o do d�bito 12', NULL, '20250505', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (13, 13, N'Descri��o do d�bito 13', NULL, '20250702', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (14, 14, N'Descri��o do d�bito 14', NULL, '20250723', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (15, 15, N'Descri��o do d�bito 15', NULL, '20250912', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (16, 16, N'Descri��o do d�bito 16', NULL, '20250208', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (17, 17, N'Descri��o do d�bito 17', NULL, '20251105', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (18, 18, N'Descri��o do d�bito 18', NULL, '20251109', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (19, 19, N'Descri��o do d�bito 19', NULL, '20251212', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (20, 20, N'Descri��o do d�bito 20', NULL, '20251109', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (21, 21, N'Descri��o do d�bito 21', NULL, '20250216', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (22, 22, N'Descri��o do d�bito 22', NULL, '20250602', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (23, 23, N'Descri��o do d�bito 23', NULL, '20250404', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (24, 24, N'Descri��o do d�bito 24', NULL, '20250921', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (25, 25, N'Descri��o do d�bito 25', NULL, '20250203', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (26, 26, N'Descri��o do d�bito 26', NULL, '20250901', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (27, 27, N'Descri��o do d�bito 27', NULL, '20250415', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (28, 28, N'Descri��o do d�bito 28', NULL, '20250707', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (29, 29, N'Descri��o do d�bito 29', NULL, '20250409', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (30, 30, N'Descri��o do d�bito 30', NULL, '20250516', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (31, 31, N'Descri��o do d�bito 31', NULL, '20250623', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (32, 32, N'Descri��o do d�bito 32', NULL, '20250416', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (33, 33, N'Descri��o do d�bito 33', NULL, '20250713', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (34, 34, N'Descri��o do d�bito 34', NULL, '20250422', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (35, 35, N'Descri��o do d�bito 35', NULL, '20251217', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (36, 36, N'Descri��o do d�bito 36', NULL, '20251201', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (37, 37, N'Descri��o do d�bito 37', NULL, '20250604', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (38, 38, N'Descri��o do d�bito 38', NULL, '20250329', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (39, 39, N'Descri��o do d�bito 39', NULL, '20250528', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (40, 40, N'Descri��o do d�bito 40', NULL, '20250115', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (41, 41, N'Descri��o do d�bito 41', NULL, '20250513', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (42, 42, N'Descri��o do d�bito 42', NULL, '20250426', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (43, 43, N'Descri��o do d�bito 43', NULL, '20250902', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (44, 44, N'Descri��o do d�bito 44', NULL, '20250823', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (45, 45, N'Descri��o do d�bito 45', NULL, '20250916', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (46, 46, N'Descri��o do d�bito 46', NULL, '20250805', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (47, 47, N'Descri��o do d�bito 47', NULL, '20250602', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (48, 48, N'Descri��o do d�bito 48', NULL, '20250504', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (49, 49, N'Descri��o do d�bito 49', NULL, '20251127', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (50, 50, N'Descri��o do d�bito 50', NULL, '20251224', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (51, 51, N'Descri��o do d�bito 51', NULL, '20250708', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (52, 52, N'Descri��o do d�bito 52', NULL, '20251016', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (53, 53, N'Descri��o do d�bito 53', NULL, '20250130', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (54, 54, N'Descri��o do d�bito 54', NULL, '20250710', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (55, 55, N'Descri��o do d�bito 55', NULL, '20250210', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (56, 56, N'Descri��o do d�bito 56', NULL, '20251211', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (57, 57, N'Descri��o do d�bito 57', NULL, '20250323', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (58, 58, N'Descri��o do d�bito 58', NULL, '20250128', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (59, 59, N'Descri��o do d�bito 59', NULL, '20250603', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (60, 60, N'Descri��o do d�bito 60', NULL, '20251211', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (61, 61, N'Descri��o do d�bito 61', NULL, '20250718', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (62, 62, N'Descri��o do d�bito 62', NULL, '20251208', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (63, 63, N'Descri��o do d�bito 63', NULL, '20250622', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (64, 64, N'Descri��o do d�bito 64', NULL, '20251009', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (65, 65, N'Descri��o do d�bito 65', NULL, '20250619', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (66, 66, N'Descri��o do d�bito 66', NULL, '20251108', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (67, 67, N'Descri��o do d�bito 67', NULL, '20250411', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (68, 68, N'Descri��o do d�bito 68', NULL, '20250603', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (69, 69, N'Descri��o do d�bito 69', NULL, '20250213', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (70, 70, N'Descri��o do d�bito 70', NULL, '20250128', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (71, 71, N'Descri��o do d�bito 71', NULL, '20250809', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (72, 72, N'Descri��o do d�bito 72', NULL, '20250127', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (73, 73, N'Descri��o do d�bito 73', NULL, '20250204', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (74, 74, N'Descri��o do d�bito 74', NULL, '20251205', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (75, 75, N'Descri��o do d�bito 75', NULL, '20250206', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (76, 76, N'Descri��o do d�bito 76', NULL, '20250502', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (77, 77, N'Descri��o do d�bito 77', NULL, '20250117', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (78, 78, N'Descri��o do d�bito 78', NULL, '20250910', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (79, 79, N'Descri��o do d�bito 79', NULL, '20250929', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (80, 80, N'Descri��o do d�bito 80', NULL, '20250930', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (81, 81, N'Descri��o do d�bito 81', NULL, '20250516', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (82, 82, N'Descri��o do d�bito 82', NULL, '20251030', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (83, 83, N'Descri��o do d�bito 83', NULL, '20250313', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (84, 84, N'Descri��o do d�bito 84', NULL, '20251205', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (85, 85, N'Descri��o do d�bito 85', NULL, '20251126', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (86, 86, N'Descri��o do d�bito 86', NULL, '20250722', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (87, 87, N'Descri��o do d�bito 87', NULL, '20250927', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (88, 88, N'Descri��o do d�bito 88', NULL, '20250117', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (89, 89, N'Descri��o do d�bito 89', NULL, '20250126', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (90, 90, N'Descri��o do d�bito 90', NULL, '20250524', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (91, 91, N'Descri��o do d�bito 91', NULL, '20251005', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (92, 92, N'Descri��o do d�bito 92', NULL, '20251202', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (93, 93, N'Descri��o do d�bito 93', NULL, '20250714', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (94, 94, N'Descri��o do d�bito 94', NULL, '20250309', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (95, 95, N'Descri��o do d�bito 95', NULL, '20250319', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (96, 96, N'Descri��o do d�bito 96', NULL, '20250618', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (97, 97, N'Descri��o do d�bito 97', NULL, '20250916', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (98, 98, N'Descri��o do d�bito 98', NULL, '20250307', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (99, 99, N'Descri��o do d�bito 99', NULL, '20250321', 2, NULL)
INSERT Rev_Debito (idDebito, idInfracao, Descricao, Valor, DataVencimento, idStatus, Desconto) VALUES (100, 100, N'Descri��o do d�bito 100', NULL, '20250521', 2, NULL)
GO




/*  Q U E S T � E S   */






/*1) Listar os 3 ve�culos com maior n�mero de multas leves ou m�dias no �ltimo trimestre de 2024 (Considerar apenas multas com d�bitos em aberto)

Resultado esperado (dados meramente ilustrativos)

Placa        | Quantidade |
-------------|------------|
ABC8752      | 3          |
WXY5678      | 2          |
XYZ1234      | 1          |

(Valor da quest�o 0,5 ponto)
*/

SELECT TOP 3 v.Placa, COUNT(r.idInfracao) AS Quantidade FROM Rev_Veiculo v
INNER JOIN Rev_Infracao r ON r.Placa = v.Placa
INNER JOIN Rev_Debito d ON d.idDebito = r.idDebito
INNER JOIN Rev_TipoInfracao t ON t.CodigoInfracao = r.CodigoInfracao
INNER JOIN Rev_Natureza n ON n.idNatureza = t.idNatureza
WHERE (n.Descricao = 'LEVE' OR n.Descricao = 'M�DIA') AND
MONTH(r.DataInfracao) IN (10,11,12) AND YEAR(r.DataInfracao) = 2024
AND d.idStatus = 2
GROUP BY v.Placa
ORDER BY Quantidade DESC




/* 2) Liste todos os motoristas que N�O TEM nenhum d�bito a pagar e ENCONTRAM-SE h� mais de 60 dias SEM SOFRER nenhuma multa.
(Valor da quest�o 0,5 ponto)
*/
SELECT * INTO #PessoaSemDebito FROM Rev_Pessoa
EXCEPT
SELECT p.* FROM Rev_Pessoa p
INNER JOIN Rev_Veiculo v ON v.idPessoa = p.idPessoa
INNER JOIN Rev_Infracao i ON i.Placa = v.Placa
INNER JOIN Rev_Debito d ON d.idDebito = i.idDebito
WHERE d.idStatus = 2

SELECT p.Nome FROM #PessoaSemDebito p
INNER JOIN Rev_Veiculo v ON v.idPessoa = p.idPessoa
INNER JOIN Rev_Infracao i ON i.Placa = v.Placa
GROUP BY p.Nome
HAVING DATEDIFF(DAY, MAX(i.DataInfracao), GETDATE()) > 60


/*3) Listar os motoristas que foram multados no �Rio Grande do Norte�, mas que n�o residem em cidade do �Rio Grande do Norte�.
Liste APENAS os motoristas que cometeram pelo menos 2 infra��es de tipos diferentes considerando QUALQUER localidade,
Exclua da lista as infra��es do tipo "Estacionamento em local proibido".
Liste o n�mero do auto de infra��o, descri��o da infra��o, o nome do motorista, a quantidade de pontos na carteira,
e endere�o no seguinte formato: Rua das estrelas, 123. Cond. Sol. Jardim do c�u. Natal/RN
Ordene os resultados pelo total de infra��es em ordem decrescente

Retorno esperado (dados meramente ilustrativos)

N�mero Auto | Descri��o             | Pontua��o CNH | idPessoa  | Nome           | Endere�o                                                | Quantidade	 |
----------- | --------------------- | ------------- | --------- | ---------------| ------------------------------------------------------- | ----------- |
12          | N�o dar prefer�ncia   | 7             | 1         | Jo�o Silva     | Av. Jardim das flores, 202. Centro. Belo Horizonte/MG   | 1			 |
15          | Excesso de velocidade | 5             | 1         | Jo�o Silva     | Av. Oscar Brito, 808. Cobertura. Centro. Aracaju/SE     | 1			 |

(Valor da quest�o 1,0 ponto)
*/
SELECT v.Placa, p.* INTO #MotoristasInfracoesRN FROM Rev_Pessoa p
INNER JOIN Rev_Endereco e ON e.idEndereco = p.idEndereco
INNER JOIN Rev_Veiculo v ON v.idPessoa = p.idPessoa
INNER JOIN Rev_Infracao i ON i.Placa = v.Placa
INNER JOIN Rev_TipoInfracao t ON t.CodigoInfracao = i.CodigoInfracao
INNER JOIN Rev_Natureza n ON n.idNatureza = t.idNatureza
WHERE i.UF = 'RN' AND e.UF <> 'RN'

SELECT m.idPessoa,m.Nome INTO #MotoristasNatureInfracao FROM #MotoristasInfracoesRN m
INNER JOIN Rev_Infracao i ON i.Placa = m.Placa
INNER JOIN Rev_TipoInfracao t ON t.CodigoInfracao = i.CodigoInfracao
GROUP BY m.idPessoa, m.Nome
HAVING COUNT(DISTINCT t.CodigoInfracao) >= 2
EXCEPT 
SELECT p.idPessoa,p.Nome FROM Rev_Pessoa p
INNER JOIN Rev_Veiculo v ON v.idPessoa = p.idPessoa
INNER JOIN Rev_Infracao i ON i.Placa = v.Placa
INNER JOIN Rev_TipoInfracao t ON t.CodigoInfracao = i.CodigoInfracao
WHERE t.Descricao = 'Estacionamento em local proibido'


SELECT 
i.NumeroAuto,
t.Descricao,
SUM(
 CASE
  WHEN n.Descricao = 'LEVE' THEN 3
  WHEN n.Descricao = 'M�DIA' THEN 4
  WHEN n.Descricao = 'GRAVE' THEN 5
  WHEN n.Descricao = 'GRAV�SSIMA' THEN 7
 END
) AS 'Pontua��o CNH',
p.idPessoa,
p.Nome,
e.Logradouro + ',' + e.Numero + '.' + e.Bairro + '.' + e.Cidade + '/' + e.UF AS Endere�o,
COUNT(i.idInfracao) AS Quantidade
FROM #MotoristasNatureInfracao m
INNER JOIN Rev_Pessoa p ON p.idPessoa = m.idPessoa
INNER JOIN Rev_Endereco e ON e.idEndereco = p.idEndereco
INNER JOIN Rev_Veiculo v ON v.idPessoa = p.idPessoa
INNER JOIN Rev_Infracao i ON i.Placa = v.Placa
INNER JOIN Rev_TipoInfracao t ON t.CodigoInfracao = i.CodigoInfracao
INNER JOIN Rev_Natureza n ON n.idNatureza = t.idNatureza
GROUP BY i.NumeroAuto,t.Descricao,p.idPessoa, p.Nome,
e.Logradouro, e.Numero, e.Bairro, e.Cidade, e.UF
ORDER BY Quantidade DESC



/* Natureza

Valores base nas naturezas e pontua��o na CNH
Multas leves: R$88,38 (3 pontos na CNH)
Multas m�dias: R$130,16 (4 pontos)
Multas graves: R$195,23 (5 pontos)
Multas grav�ssimas: R$293,47 (7 pontos)
*/




/*4) O valor de uma infra��o de tr�nsito � definido pelo valor base da natureza da infra��o
e multiplicado pela gravidade da infra��o, e incide um reajuste anual de 5%.

valor multa = valor base da natureza * fator multiplicador + 5%

Abaixo est�o listados os fatores multiplicadores de cada natureza:

Infra��o Leve: multa simples.
Infra��o M�dia: valor base multiplicado por 2.
Infra��o Grave: valor base multiplicado por 5.
Infra��o Grav�ssima: valor base multiplicado por 10.

Exemplos:

Se a infra��o for leve, o valor da multa ser� R$ 88,38 + 5% = R$ 92,80.
Se for m�dia, ser� R$ 130,16 x 2 + 5% = R$ 273,34.
Se for grave, ser� R$ 195,23 x 5 + 5% = R$ 1024,96.
Se for grav�ssima, ser� R$ 293,47 x 10 + 5% = R$ 3081,44.

Note que a tabela Rev_Debito est�o com as colunas valor e desconto nulas, sabendo disso, responda os itens a) e b) a seguir:

a) Escreva uma fun��o que que recebe o ID da infra��o e retorna o valor atualizado da infra��o e o desconto. 
O condutor que n�o cometeu a mesma multa no �ltimo ano (�ltimos 365 dias) � contemplado com uma redu��o de 20% do valor da multa.

Resultado esperado:

SELECT * FROM dbo.fn_ValorInfracao(5)

| Valor   | Desconto |
| ------- | -------  |
| 1024,96 | 204,99	 |
*/

CREATE FUNCTION fn_ValorInfracao(
 @id INT
) RETURNS TABLE AS
BEGIN
 DECLARE @TableValor TABLE (Valor MONEY, Desconto MONEY);
 DECLARE @Desconto BIT = 0;

 (SELECT 
 @Desconto = (
  CASE
   WHEN COUNT(*) = 0 THEN 1
   ELSE 0
  END
 ) FROM Rev_Infracao i
 INNER JOIN Rev_Veiculo v ON v.Placa = i.Placa
 WHERE (YEAR(i.DataInfracao) < YEAR(GETDATE()) AND MONTH(i.DataInfracao) >= 
 MONTH(GETDATE())) OR (YEAR(i.DataInfracao) = YEAR(GETDATE()) AND MONTH(i.DataInfracao) < 
 MONTH(GETDATE())))

 INSERT INTO @TableValor (Valor, Desconto)
 SELECT 
 (
  CASE
   WHEN n.Descricao = 'LEVE' THEN 88.38 * 1.05
   WHEN n.Descricao = 'M�DIA' THEN (130.16 * 2) * 1.05
   WHEN n.Descricao = 'GRAVE' THEN (195.23 * 5) * 1.05
   WHEN n.Descricao = 'GRAV�SSIMA' THEN (293+47 * 10) * 1.05
  END
 ) AS Valor,
 (
  CASE
   WHEN @Desconto = 1 THEN (
	  CASE
	   WHEN n.Descricao = 'LEVE' THEN 88.38 * 1.05
	   WHEN n.Descricao = 'M�DIA' THEN (130.16 * 2) * 1.05
	   WHEN n.Descricao = 'GRAVE' THEN (195.23 * 5) * 1.05
	   WHEN n.Descricao = 'GRAV�SSIMA' THEN (293+47 * 10) * 1.05
	  END
 ) * 0.2
 ELSE 0
  END
 ) AS Desconto
 FROM Rev_Pessoa p 
 INNER JOIN Rev_Veiculo v ON v.idPessoa = p.idPessoa
 INNER JOIN Rev_Infracao i ON i.Placa = v.Placa
 INNER JOIN Rev_TipoInfracao t ON t.CodigoInfracao = i.CodigoInfracao
 INNER JOIN Rev_Natureza n ON n.idNatureza = t.idNatureza
 WHERE i.idInfracao = @id


 RETURN @TableValor
END



/*


b) Utilize a fun��o para fazer uma carga dos d�bitos com os valores e os descontos das infra��es

(Valor da quest�o 1,0 ponto)
*/








/*5) Gerar um relat�rio de estat�sticas com os valores m�dios das multas dos ve�culos por idade, considerando o ano de fabrica��o,
nos seguintes grupos: 0-1 anos, at� 5 anos, 5+ anos. Mostrar o resultado ordenado pelos grupos de idade em ordem crescente.

Resultado esperado (dados meramente ilustrativos)

Idade        | Valor m�dio  |
------------ |------------- |
0-1 anos     | 500.00       |
at� 5 anos   | 450.00       |
5+ anos      | 200.00       |

(Valor da quest�o 1,0 ponto)
*/

DECLARE @TableDesc TABLE (Idade VARCHAR(20), Valor MONEY);

INSERT INTO @TableDesc (Idade, Valor)
SELECT '0-1 anos', AVG(IIF(d.Valor IS NULL, 0, d.Valor)) FROM Rev_Veiculo v
INNER JOIN Rev_Infracao i ON i.Placa = v.Placa
INNER JOIN Rev_Debito d ON d.idDebito = i.idDebito
WHERE DATEDIFF(YEAR, v.AnoFabricacao,GETDATE()) >= 0 AND
DATEDIFF(YEAR, v.AnoFabricacao,GETDATE()) < 1


INSERT INTO @TableDesc (Idade, Valor)
SELECT 'at� 5 anos', AVG(IIF(d.Valor IS NULL, 0, d.Valor)) FROM Rev_Veiculo v
INNER JOIN Rev_Infracao i ON i.Placa = v.Placa
INNER JOIN Rev_Debito d ON d.idDebito = i.idDebito
WHERE DATEDIFF(YEAR, v.AnoFabricacao,GETDATE()) >= 1 AND
DATEDIFF(YEAR, v.AnoFabricacao,GETDATE()) <= 5


INSERT INTO @TableDesc (Idade, Valor)
SELECT '5+ anos', AVG(IIF(d.Valor IS NULL, 0, d.Valor)) FROM Rev_Veiculo v
INNER JOIN Rev_Infracao i ON i.Placa = v.Placa
INNER JOIN Rev_Debito d ON d.idDebito = i.idDebito
WHERE DATEDIFF(YEAR, v.AnoFabricacao,GETDATE()) > 5

SELECT Idade, Valor AS 'Valor m�dio' FROM @TableDesc
ORDER BY Idade ASC


/*6) A Ouvidoria de determinado Detran tem entre suas atribui��es acompanhar os �rg�os autuadores
de forma a observar se n�o est� sendo cometido abusos. Dessa forma, o setor necessita de um relat�rio que liste,
a quantidade de multas de cada �rg�o em cada m�s, as quantidades de infra��es leves, m�dias, graves e grav�ssimas,
e a m�dia geral das infra��es registradas por todos os �rg�os.
Listar APENAS os �rg�os que tenham uma quantidade total de infra��es maior ou igual a 2.
Exibir o relatorio na ordem pelo nome do �rg�o e data.
Crie uma procedure que recebe as duas datas como par�metros e gere o relat�rio no seguinte formato.

Resultado esperado (meramente ilustrativo)

�rg�o        | MesAno   | Qtd de infra��es | M�dia das infra��es | MultasLeves | Qtd Medias   | Qtd Graves   | Qtd Grav�ssimas
-------------|----------|------------------|---------------------|-------------|--------------|--------------|--------------
Orgao A      | 01/2025  | 2                | 3                   | 1           | 0            | 1            | 0
Orgao A      | 02/2025  | 4                | 3                   | 1           | 3            | 0            | 0
Orgao B      | 01/2025  | 3                | 3                   | 0           | 2            | 1            | 0
Orgao C      | 02/2025  | 3                | 3                   | 1           | 1            | 0            | 1

(Valor da quest�o 1,0 ponto)
*/

ALTER PROCEDURE Relatorio(
 @data1 DATE,
 @data2 DATE
) AS BEGIN
 DECLARE @Info TABLE(Orgao VARCHAR(50), MesAno VARCHAR(20), qtd_infra INT,
 media_infra INT, MultasLeves INT,MultasMedias INT,MultasGraves INT,
 MultasGravissimas INT );

 INSERT INTO @info(Orgao, MesAno, qtd_infra, media_infra, MultasLeves,
 MultasMedias, MultasGraves, MultasGravissimas )
 SELECT 
 o.Nome,
 MONTH(i.DataInfracao),
 COUNT(DISTINCT i.idInfracao),
 AVG(i.idInfracao),
 COUNT(
  CASE
   WHEN n.Descricao = 'LEVE' THEN 1
  END
 ),
 COUNT(
  CASE
   WHEN n.Descricao = 'M�DIA' THEN 1
  END
 ),
 COUNT(
  CASE
   WHEN n.Descricao = 'GRAVE' THEN 1
  END
 ),
 COUNT(
  CASE
   WHEN n.Descricao = 'GRAV�SSIMA' THEN 1
  END
 )
 FROM Rev_Infracao i
 INNER JOIN Rev_OrgaoAutuador o ON o.idOrgaoAutuador = i.idOrgaoAutuador
 INNER JOIN Rev_TipoInfracao t ON t.CodigoInfracao = i.CodigoInfracao
 INNER JOIN Rev_Natureza n ON n.idNatureza = t.idNatureza
 WHERE MONTH(@data1) = MONTH(i.DataInfracao) AND YEAR(@data1) = YEAR(i.DataInfracao) AND
 o.idOrgaoAutuador NOT IN (
  SELECT o.idOrgaoAutuador FROM Rev_OrgaoAutuador o
  INNER JOIN Rev_Infracao i ON i.idOrgaoAutuador = o.idOrgaoAutuador
  GROUP BY o.idOrgaoAutuador
  HAVING COUNT(i.idInfracao) < 2
 )
 GROUP BY o.Nome, MONTH(i.DataInfracao)


 INSERT INTO @info(Orgao, MesAno, qtd_infra, media_infra, MultasLeves,
 MultasMedias, MultasGraves, MultasGravissimas )
 SELECT 
 o.Nome,
 MONTH(i.DataInfracao),
 COUNT(DISTINCT i.idInfracao),
 AVG(i.idInfracao),
 COUNT(
  CASE
   WHEN n.Descricao = 'LEVE' THEN 1
  END
 ),
 COUNT(
  CASE
   WHEN n.Descricao = 'M�DIA' THEN 1
  END
 ),
 COUNT(
  CASE
   WHEN n.Descricao = 'GRAVE' THEN 1
  END
 ),
 COUNT(
  CASE
   WHEN n.Descricao = 'GRAV�SSIMA' THEN 1
  END
 )
 FROM Rev_Infracao i
 INNER JOIN Rev_OrgaoAutuador o ON o.idOrgaoAutuador = i.idOrgaoAutuador
 INNER JOIN Rev_TipoInfracao t ON t.CodigoInfracao = i.CodigoInfracao
 INNER JOIN Rev_Natureza n ON n.idNatureza = t.idNatureza
 WHERE MONTH(i.DataInfracao) = MONTH(@data2) AND YEAR(i.DataInfracao) = YEAR(@data2)
 AND o.idOrgaoAutuador NOT IN (
  SELECT o.idOrgaoAutuador FROM Rev_OrgaoAutuador o
  INNER JOIN Rev_Infracao i ON i.idOrgaoAutuador = o.idOrgaoAutuador
  GROUP BY o.idOrgaoAutuador
  HAVING COUNT(i.idInfracao) < 2
 )
 GROUP BY o.Nome, MONTH(i.DataInfracao)



 SELECT 
 i.Orgao AS �rg�o,
 (
  CASE
   WHEN MONTH(i.MesAno) = MONTH(@data1) THEN i.MesAno
   ELSE i.MesAno
  END 
 ) AS MesAno,
 i.qtd_infra AS 'Qtd de infra��es',
 i.media_infra AS 'M�dia das infra��es',
 i.MultasLeves AS 'MultasLeves',
 i.MultasMedias AS 'Qtd Medias',
 i.MultasGraves AS 'Qtd Graves',
 i.MultasGravissimas AS 'Qtd Grav�ssimas' FROM @Info i
 ORDER BY i.Orgao, i.MesAno
END

EXEC Relatorio @data1 = '2024-08-01', @data2 = '2024-11-01'

SELECT * FROM Rev_Infracao

/* 7) Criar uma stored procedure para realizar uma consulta que retorna informa��es sobre ve�culos
envolvidos em ocorr�ncias policiais, baseada em um conjunto de par�metros fornecidos pelo usu�rio.


a) Criar uma fun��o de convers�o placa Mercosul, caso a placa seja cinza, converter para mercosul ou vice versa.
A placa cinza tem o seguinte padr�o AAA0000 e a placa mercosul AAA0A00.
Adicionar a fun��o na procedure para permitir consulta tanto para placas cinzas quanto para placas Mercosul
Na convers�o para Mercosul, considerar os valores abaixo, no quinto d�gito:
0 = A, 1 = B, 2 = C, 3 = D, 4 = E, 5 = F, 6 = G, 7 = H, 8 = I, 9 = J

Retorno esperado da fun��o de convers�o Mercosul
*/


ALTER FUNCTION ConvertPlaca(
 @placa NVARCHAR(MAX)
) RETURNS NVARCHAR(MAX) AS
BEGIN
 DECLARE @placa_convert NVARCHAR(MAX);
 DECLARE @digito CHAR(1) = ''
 DECLARE @posicoes VARCHAR(10) = 'ABCDEFGHIJ'

 DECLARE @letras VARCHAR(26) = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
 DECLARE @numeros VARCHAR(10) = '0123456789'



 IF CHARINDEX(SUBSTRING(@placa,1,1), @letras) > 0 AND CHARINDEX(SUBSTRING(@placa,2,1), @letras) > 0
 AND CHARINDEX(SUBSTRING(@placa,3,1), @letras) > 0 AND CHARINDEX(SUBSTRING(@placa,4,1), @numeros) > 0
 AND CHARINDEX(SUBSTRING(@placa,5,1), @numeros) > 0 AND CHARINDEX(SUBSTRING(@placa,6,1), @numeros) > 0
 AND CHARINDEX(SUBSTRING(@placa,7,1), @numeros) > 0
 BEGIN
  SET @digito = SUBSTRING(@placa, 5,1);
  SET @digito = SUBSTRING(@posicoes,CAST(@digito+1 AS INT),1)
  SET @placa = STUFF(@placa, 5,1,@digito)
 END
 ELSE
 BEGIN
  IF CHARINDEX(SUBSTRING(@placa,1,1), @letras) > 0 AND CHARINDEX(SUBSTRING(@placa,2,1), @letras) > 0
 AND CHARINDEX(SUBSTRING(@placa,3,1), @letras) > 0 AND CHARINDEX(SUBSTRING(@placa,4,1), @numeros) > 0
 AND CHARINDEX(SUBSTRING(@placa,5,1), @letras) > 0 AND CHARINDEX(SUBSTRING(@placa,6,1), @numeros) > 0
 AND CHARINDEX(SUBSTRING(@placa,7,1), @numeros) > 0
 BEGIN
  SET @digito = SUBSTRING(@placa, 5,1);
  SET @digito = CAST(CHARINDEX(@digito, @posicoes)-1 AS CHAR)
  SET @placa = STUFF(@placa, 5,1,@digito)
 END
 END

 RETURN @placa
END

SELECT dbo.ConvertPlaca('ABC1234') -- ABC1C34
SELECT dbo.ConvertPlaca('ABC1C34') -- ABC1234*/

/*


b) A stored procedure deve permitir a pesquisa de ve�culos considerando:

Endere�o (VARCHAR(100)): O endere�o ou partes onde o ve�culo est� avistado.
Marca (VARCHAR(50)): A marca do ve�culo.
Modelo (VARCHAR(50)): O modelo do ve�culo.
DigitoPlaca (CHAR(7)): Parte da placa do ve�culo, no formato *****76, onde * pode ser usado para representar qualquer valor desconhecido.

Exemplo de entrada da procedure (meramente ilustrativos)

@endereco = 'estrelas'
@digitoPlaca = '*****34'

Retorno esperado da execu��o da procedure (meramente ilustrativos)

CPF          | Nome          | Placa   | Marca  | Modelo  | Cor     | Ano Fabrica��o | Ano Modelo  | Endere�o                                                  |
------------ | ------------- |-------- | ------ | ------- | ------- | -------------- |------------ |---------------------------------------------------------- |
12345678909  | Jo�o Maria    | PQR1234 | Honda  | Biz     | Branca  | 2017           | 2018        | Rua das estrelas, 123. Cond. Sol. Jardim do c�u. Natal/RN |
									   

(Valor da quest�o 1,0 ponto)
*/

-- a) fun��o de convers�o placa Mercosul


-- b) stored procedure consulta fracionada

CREATE PROCEDURE RelatorioVeiculos(
 @endereco VARCHAR(100),
 @marca VARCHAR(50),
 @modelo VARCHAR(50),
 @digitoPlaca CHAR(7)
) AS
BEGIN
 SELECT 
 p.CPF, 
 p.Nome,
 v.Placa,
 SUBSTRING(v.MarcaModelo, CHARINDEX(' ', v.MarcaModelo)+1,
 LEN(v.MarcaModelo)) AS Marca,
 LEFT(v.MarcaModelo, CHARINDEX(' ',v.MarcaModelo)) AS Modelo,
 v.Cor,
 v.AnoModelo,
 e.Logradouro + ',' + e.Numero + '.' + e.Bairro + '.' + e.Cidade + '/' + e.UF AS Endere�o FROM Rev_Pessoa p
 INNER JOIN Rev_Veiculo v ON v.idPessoa = p.idPessoa
 INNER JOIN Rev_Endereco e ON e.idEndereco = p.idEndereco
 WHERE SUBSTRING(v.MarcaModelo, CHARINDEX(' ', v.MarcaModelo)+1,
 LEN(v.MarcaModelo)) = @marca AND LEFT(v.MarcaModelo, CHARINDEX(' ',v.MarcaModelo)) = @modelo
 AND RIGHT(v.Placa,2) = RIGHT(@digitoPlaca,2) AND 
 CHARINDEX(@endereco, e.Logradouro + ',' + e.Numero + '.' + e.Bairro + '.' + e.Cidade + '/' + e.UF) > 0
END

EXEC RelatorioVeiculos @endereco = 'estrelas',@modelo = 'Biz', @marca = 'Honda', @digitoPlaca = '*****34'


/*8) Listar as horas do dia e os dias da semana com maior incid�ncia de multas,
para equipe de controle de tr�fego propor melhoria na atua��o dos agentes

Resultado esperado (meramente ilustrativo)

Hora | Seg | Ter | Qua | Qui | Sex | Sab | Dom |
---- | --- | --- | --- | --- | --- | --- | --- |
09   | 10  | 71  | 98  | 77  | 41  | 32  | 23  |
10   | 9   | 25  | 14  | 54  | 47  | 23  | 17  |
11   | 16  | 54  | 14  | 57  | 14  | 20  | 15  |


(Valor da quest�o 1,0 ponto)
*/

SELECT RIGHT('00' + DATEPART(HOUR, i.DataInfracao),2) AS Hora,
COUNT(
 CASE
  WHEN DATEPART(WEEKDAY, i.DataInfracao) = 2 THEN 1
 END
) AS Seg,COUNT(
 CASE
  WHEN DATEPART(WEEKDAY, i.DataInfracao) = 3 THEN 1
 END
) AS Ter,COUNT(
 CASE
  WHEN DATEPART(WEEKDAY, i.DataInfracao) = 4 THEN 1
 END
) AS Qua,COUNT(
 CASE
  WHEN DATEPART(WEEKDAY, i.DataInfracao) = 5 THEN 1
 END
) AS Qui,COUNT(
 CASE
  WHEN DATEPART(WEEKDAY, i.DataInfracao) = 6 THEN 1
 END
) AS Sex,COUNT(
 CASE
  WHEN DATEPART(WEEKDAY, i.DataInfracao) = 7 THEN 1
 END
) AS Sab,COUNT(
 CASE
  WHEN DATEPART(WEEKDAY, i.DataInfracao) = 1 THEN 1
 END
) AS Dom
FROM Rev_Infracao i
GROUP BY DATEPART(HOUR, i.DataInfracao)

/*9) escreva uma consulta para retornar a infra��o que ocorre com mais frequ�ncia em cada dia.

Retorno esperado (meramente ilustrativo)

DataInfracao   | CodigoInfracao | Descricao                                          | Quantidade |
---------------|----------------|----------------------------------------------------|------------|
09/03/2025     | 1              | Dirigir sob efeito de �lcool ou drogas             | 5		  |
10/03/2025     | 2              | N�o usar capacete (para motociclistas)             | 6		  |
11/03/2025     | 7              | Falta de farol baixo durante o dia (nas rodovias)  | 7		  |
12/03/2025     | 5              | Ultrapassagem em local proibido                    | 5		  |
12/03/2025     | 3              | Avan�ar o sinal vermelho                           | 5		  |


(Valor da quest�o 1,0 ponto)
*/
SELECT i.DataInfracao AS Dia,t.Descricao ,COUNT(i.idInfracao) Quantidade 
INTO #TabelaDatas FROM Rev_Infracao i 
INNER JOIN Rev_TipoInfracao t ON t.CodigoInfracao = i.CodigoInfracao
INNER JOIN Rev_Natureza n ON n.idNatureza = t.idNatureza
GROUP BY i.DataInfracao, t.Descricao

SELECT DAY(t.dia), t.Descricao, MAX(t.Quantidade) FROM #TabelaDatas t
GROUP BY DAY(t.Dia), t.Descricao

/*10) escreva uma consulta que retorne o percentual das infra��es dos condutores nos seguintes grupos:
1. Apenas Leves ou M�dias
2. Apenas Graves ou grav�ssimas
3. Ambas
4. Nenhuma

Retorno esperado (meramente ilustrativo)

Leves ou m�dias | Graves ou grav�ssimas  | Ambas  | Nenhuma |
----------------|------------------------|--------|-------- |
0,2	            | 0,2                    | 0,2    |  0,4    |

(Valor da quest�o 1,0 ponto)
*/

SELECT 
CAST(SUM(
 CASE
  WHEN n.Descricao = 'LEVE' OR n.Descricao = 'M�DIA' THEN 1
 END
)AS MONEY)/100 AS 'Leves ou m�dias',
CAST(COUNT(
 CASE
  WHEN n.Descricao = 'GRAVE' OR n.Descricao = 'GRAV�SSIMA' THEN 1
 END
) AS MONEY)/100 AS 'Graves ou grav�ssimas',
CAST(COUNT(
 CASE
  WHEN (n.Descricao = 'LEVE' OR n.Descricao = 'M�DIA') AND
  (n.Descricao = 'GRAVE' OR n.Descricao = 'GRAV�SSIMA') THEN 1
 END
)AS MONEY)/100 AS Ambas,
CAST(COUNT(
 CASE
  WHEN n.Descricao <> 'LEVE' AND n.Descricao <> 'M�DIA' AND
  n.Descricao <> 'GRAVE' AND n.Descricao <> 'GRAV�SSIMA' THEN 1
 END
)AS MONEY)/100
AS Nenhuma
FROM Rev_Infracao i
INNER JOIN Rev_TipoInfracao t ON t.CodigoInfracao = i.CodigoInfracao
INNER JOIN Rev_Natureza n ON n.idNatureza = t.idNatureza



