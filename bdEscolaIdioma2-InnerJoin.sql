 USE bdEscolaIdiomas2

--1)Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;

SELECT nomeAluno 'Nome do Aluno',nomeCurso 'Nome do Curso' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno=tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma= tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso=tbTurma.codCurso

--2)Apresentar a quantidade de alunos matriculados por nome do curso;

SELECT COUNT (tbAluno.codAluno) 'quantidade de alunos matriculados',nomeCurso 'Nome do Curso' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno=tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma= tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso=tbTurma.codCurso
				GROUP BY tbCurso.nomeCurso

--3)Apresentar a quantidadede alunos matriculados por nome da turma;

SELECT COUNT (tbAluno.codAluno) 'quantidade de alunos matriculados', nometurma 'Nome da Turma' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno=tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma= tbMatricula.codTurma
			GROUP BY tbTurma.nomeTurma


--4)Apresentar a quantidadede alunos que fizeram matricula em março de 2016;

SELECT COUNT (tbAluno.codAluno) 'Quantidadde de Alunos', dataMatricula 'Data de Matricula' FROM tbAluno
		INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
			WHERE MONTH (dataMatricula) = '03' AND YEAR (dataMatricula) = 2016
				GROUP BY tbMatricula.dataMatricula

--5)Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas em que estão matriculados

SELECT (nomeAluno) 'Nome do Aluno' , nomeTurma 'Nome da Turma' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
			ORDER BY nomeAluno

-- 6)Apresentar o nome dos cursos e os horários em que eles são oferecidos

SELECT nomeCurso 'Curso',  horarioTurma 'Horário' FROM tbCurso
	INNER JOIN tbTurma
		ON tbTurma.codCurso = tbCurso.codCurso

--7)Apresentar a quantidade de alunos nascidos por estado

SELECT COUNT (codAluno) 'Alunos', naturalidadeAluno 'Estado' FROM tbAluno
	GROUP BY naturalidadeAluno

--8)Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa

SELECT nomeAluno 'Aluno', FORMAT(dataMatricula,'d','pt-br') 'Data da Matrícula' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codMatricula = tbAluno.codAluno

--9)Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês

SELECT nomeAluno 'Aluno',nomeCurso 'Curso' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno=tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma= tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso=tbTurma.codCurso
				WHERE nomeAluno LIKE 'A%' AND nomeCurso = 'Inglês'	

--10)Apresentar a quantidade de matriculas feitas no ano de 2016

SELECT COUNT(codMatricula) 'Matrícula', dataMatricula'Data da matrícula' FROM tbMatricula
	WHERE YEAR (dataMatricula) = 2016
		GROUP BY tbMatricula.dataMatricula