USE bdEscolaIdiomas2

--1.Crie uma visão “Preço_Baixo” que exiba o código, nome do curso, carga horária e o valor do curso de todos os cursos que tenha preço inferior ao preço médio.
CREATE VIEW Preço_Baixo as
 SELECT codCurso ,nomeCurso,cargahorariaCurso, valorCurso FROM tbCurso
	WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)

--2.Usando a visão “Preço_Baixo”, mostre todos os cursos ordenados por carga horária.
SELECT * FROM Preço_Baixo
	ORDER BY cargahorariaCurso

--3.Crie uma visão “Qtde_Aluno_Curso” que exiba o curso e a quantidade de alunos por turma
CREATE VIEW Qtde_Aluno_Curso as
SELECT nomeCurso, COUNT(tbAluno.codAluno) 'Aluno', tbTurma.nomeTurma FROM tbCurso
	INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
	INNER JOIN tbMatricula ON tbMatricula.codTurma = tbTurma.codTurma 
	INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
GROUP BY tbCurso.nomeCurso, tbTurma.nomeTurma

--4.Usando a visão “Qtde_Aluno_Curso” exiba a turma com maior número de alunos.
SELECT	nomeTurma, Aluno FROM Qtde_Aluno_Curso
 WHERE Aluno = (SELECT MAX(Aluno) FROM Qtde_Aluno_Curso)

--5.Crie uma visão “Curso_Qtde_Turmas” que exiba o curso e a quantidade de turmas.
CREATE VIEW Curso_Qtde_Turmas as
SELECT nomeCurso, COUNT (codTurma)'turma' FROM tbCurso
	INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
GROUP BY tbCurso.nomeCurso

--6.Usando a visão “Curso_Qtde_Turmas” exiba o curso com menor número de turmas.

SELECT * FROM Curso_Qtde_Turmas
	WHERE turma = (SELECT MIN(turma) FROM Curso_Qtde_Turmas)