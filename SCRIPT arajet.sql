CREATE TABLE PASSAGEM (
    passagemid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    passageiroid NVARCHAR(100) NOT NULL,
    aeronaveid NVARCHAR(100) NOT NULL,
    origem NVARCHAR(100) NOT NULL,
    destino NVARCHAR(160) NOT NULL,
    datahora DATETIME NOT NULL,
    FOREIGN KEY (passageiroid) REFERENCES PASSAGEIRO(passageiroID), 
    FOREIGN KEY (aeronaveid) REFERENCES AERONAVE(aeronaveID) 
);

CREATE TABLE AERONAVE
(
	aeronaveID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	modelo NVARCHAR(160) NOT NULL,
	tipo   NVARCHAR(160) NOT NULL,
	combustivel NVARCHAR(160) NOT NULl,
	autonomia  NVARCHAR (80) NOT NULL
	
);
CREATE TABLE PASSAGEIRO(
passageiroID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
nome NVARCHAR(160) NOT NULL,
CPF NVARCHAR(160) NOT NULL,
TELEFONE INT NOT NULL
);

CREATE TABLE PRODUTOS_PASSAGEM
(
produtos_passagemID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
produtoID NVARCHAR(160) NOT NULL,
passagemid NVARCHAR(160) NOT NULL,
FOREIGN KEY	(produtoID) REFERENCES PRODUTO(produtoID),
FOREIGN KEY(passagemid) REFERENCES PASSAGEM(passagemid)
);


CREATE TABLE PRODUTO
(
produtoID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
TIPO NVARCHAR(160) NOT NULL,
CATEGORIA NVARCHAR(160) NOT NULL,
QUANTIDADE INT NOT NULL,
PREÇO INT NOT NULL

);
CREATE TABLE ASSENTO(
assentoID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
categoria NVARCHAR(160) NOT NULL,
valor INT NOT NULL
);
CREATE TABLE ASSENTO_PASSAGEM(
assento_passagemID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
assento NVARCHAR(160),
valor INT NOT NULL,
FOREIGN KEY(assento) REFERENCES ASSENTO(assentoID)
);
CREATE TABLE ESCALA_PASSAGEM
(
escala_passagemID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
passagem NVARCHAR(160) NOT NULL,
local_escala NVARCHAR(160)NOT NULL,
Quantidade INT NOT NULL,
FOREIGN KEY(passagem) REFERENCES PASSAGEM(passagemid)
);
CREATE TABLE TRIPULACAO_ESCALA(
tripulação_escalaID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
passagem NVARCHAR(160) NOT NULL,
funcionarioID INT NOT NULL,
FOREIGN KEY(passagem) REFERENCES PASSAGEM(passagemid)
FOREIGN KEY(funcionarioID) REFERENCES FUNCIONARIO(funcionarioID)
);

CREATE TABLE FUNCIONARIO
(
funcionarioID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
nome NVARCHAR(80) NOT NULL,
email NVARCHAR(80) NOT NULL,
funcao NVARCHAR(80) NOT NULL
);