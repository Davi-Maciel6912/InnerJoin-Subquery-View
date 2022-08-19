CREATE DATABASE bdEscolaIdiomas2
go


USE bdEscolaIdiomas2



CREATE TABLE tbAluno(
	codAluno INT PRIMARY KEY IDENTITY (1,1)
	,nomeAluno VARCHAR (50) NOT NULL
	,dataNascAluno SMALLDATETIME NOT NULL
	,rgAluno char (14) NOT NULL
	,naturalidadeAluno VARCHAR (2) NOT NULL
)

CREATE  TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY (1,1)
	,nomeCurso VARCHAR (20)NOT NULL
	,cargahorariaCurso INT NOT NULL
	,valorCurso SMALLMONEY  NOT NULL
)

CREATE TABLE tbTurma(
	codTurma INT PRIMARY KEY IDENTITY (1,1)
	,nomeTurma VARCHAR (50) NOT NULL
	,horarioTurma SMALLDATETIME NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso) 
)

CREATE TABLE  tbMatricula(
	codMatricula INT PRIMARY KEY IDENTITY (1,1)
	,dataMatricula SMALLDATETIME NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma (codTurma)
)
