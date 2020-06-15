CREATE TABLE tabelaFaculdade(
	codigoFaculdade integer NOT NULL,
	sigla_fac varchar (10) NOT NULL,
	nome varchar (30) NOT NULL,
	cidade varchar (20) NOT NULL,
	endereco varchar (30) NOT NULL,
	dataImplant varchar (10) NOT NULL,
	
constraint pktabelaFaculdade primary key (codigoFaculdade,sigla_fac)
)

CREATE TABLE cadFaculdades(

	cod_fac integer NOT NULL,
	nome_fac varchar(50) NOT NULL,
	cidade_fac varchar (30) NOT NULL,
	end_fac varchar(50) NOT NULL,
	sigla_fac varchar(5) NOT NULL,
	
constraint pkcadFaculdades primary key (cod_fac),
constraint fktabelaFaculdade foreign key (sigla_fac) references tabelaFaculdade(sigla_fac)
)

CREATE TABLE bloco_fac(

	cod_indentificacao_bloco integer NOT NULL,
	tipoBloco_did_adm varchar(15) NOT NULL,
	area decimal NOT NULL,

constraint pkbloco_fac primary key (cod_indentificacao_bloco)

)
CREATE TABLE salas_bloco(
	codigo_sala integer NOT NULL,
	numero_sala integer NOT NULL,
	area decimal,

constraint pksala_bloco primary key (codigo_sala)
)

CREATE TABLE bloco_didatico(
	codigo_bloco_dida integer NOT NULL,
	tipoBLOCO varchar(15) NOT NULL -- um bloco didatico pode ter uma sala administrativa 
	numSala integer NOT NULL,
	area_blocodida decimal NOT NULL,
	codigo_sala integer NOT NULL, -- salas do bloco
	
constraint pkbloco_didatico primary key (codigo_bloco_dida),
constraint fksalas_bloco foreign key (codigo_sala) references salas_bloco(codigo_sala)
)

CREATE TABLE bloco_adm(
	codigo_bloco_adm integer NOT NULL,
	n_sala int NOT NULL, 
	area_blocoadm decimal NOT NULL,
	codigo_sala integer NOT NULL, -- salas do bloco

constraint pkbloco_adm primary key (codigo_bloco_adm),
constraint fksalas_bloco foreign key (codigo_sala) references salas_bloco(codigo_sala)	
)

CREATE TABLE cad_prof (
	matricula_prof integer NOT NULL,
	nome_prof varchar(50) NOT NULL,
	cpf_prof varchar(15) NOT NULL,
	end_prof varchar(50),
	fone_prof varchar(15) NOT NULL,

constraint pkcad_prof primary key (matricula_prof, cpf_prof)

)

CREATE TABLE tel_prof(
	cpfprofessor varchar (15) NOT NULL,
	fone_prof varchar (15) NOT NULL,
constraint pktel_prof (cpfprofessor),
constraint fkcad_prof foreign key(cpf_prof,fone_prof) references cad_prof(cpf_prof, fone_prof)

)
CREATE TABLE conteudo_disciplina(
	codigoconteudo integer NOT NULL,
	item_disciplina varchar(50) NOT NULL,
	carga_horaria varchar(5),

constraint pkconteudo_disciplina primary key (codigoconteudo)

)	

CREATE TABLE disciplina(
	cod_disciplina integer NOT NULL,
	nome_disciplina varchar(30) NOT NULL,
	carga_horaria varchar(5),
	matricula_prof integer NOT NULL,
	codigoconteudo integer NOT NULL, -- uma disciplina pode ter varios conteudos

	
constraint pkdisciplina primary key (cod_disciplina),
constraint fkcad_prof foreign key (matricula_prof) references cad_prof (matricula_prof),
constraint fkconteudo_disciplina foreign key (codigoconteudo) references conteudo_disciplina (codigoconteudo)

)

CREATE TABLE cadAluno(

	matricula_aluno integer NOT NULL,
	nome_Aluno varchar(50) NOT NULL,
	cpf_aluno varchar(11) NOT NULL,
	end_aluno varchar(50) NOT NULL,
	fone_aluno varchar(15) NOT NULL,
	cod_curso integer NOT NULL,
	
constraint pkcadAluno primary key (matricula_aluno),
constraint fkcurso foreign key (cod_curso) references curso (cod_curso),
)

CREATE TABLE coordenacao_curso( 
	codigo_coord integer NOT NULL,
	sala int NOT NULL,
	ramal int NOT NULL,
	siglacoordeacao varchar (10),
	cod_indentificacao_bloco integer NOT NULL,
	
constraint pkcoordenacao_curso primary key (codigo_coord),
constraint fkbloco_fac foreign key (cod_indentificacao_bloco) bloco_fac (cod_indentificacao_bloco) 
)

CREATE TABLE curso(
	nome_curso varchar(30) NOT NULL,
	cod_curso INTEGER NOT NULL,
	duracao_curso varchar(5),
	sigla_curso varchar(5),
	matricula_aluno integer NOT NULL,-- aluno matriculado no curso
	cod_disciplina integer NOT NULL, -- disciplina do curso
	codigo_coord integer NOT NULL, -- codigo da cordenação
	
constraint pkcurso primary key (cod_curso, sigla_curso),
constraint fkcadAluno foreign key (matricula_aluno) references cadAluno (matricula_aluno),
constraint fkdisciplina foreign key (cod_disciplina) references disciplina (cod_disciplina),
constraint fkcoordenacao_curso foreign key (codigo_coord) references coordenacao_curso (codigo_coord)

)

CREATE TABLE turma (
	cod_turma integer NOT NULL,
	anocriado_turma varchar(12) NOT NULL,
	sala_turma varchar(5),
	matricula_aluno integer NOT NULL,
	
constraint pkturma primary key (cod_turma),
constraint fkcadAluno foreign key (matricula_aluno) references cadAluno (matricula_aluno)

)

CREATE TABLE recurso_didaticos(
	nome_recursos varchar(20) NOT NULL, 
	cod_recursos integer NOT NULL,
	descricao_recursos char(100),
	
constraint pkrecursos_didaticos primary key (cod_recursos)

)

CREATE TABLE reservas_rec(
	codigo_reserva integer NOT NULL,
	data_reserva varchar (10) NOT NULL,
	horario_reserva varchar (5) NOT NULL,
	cod_recursos integer NOT NULL,
	
constraint pkreservas_rec primary key (codigo_reserva),
constraint fkrecursos_didaticos foreign key (cod_recursos) references recurso_didaticos(cod_recursos)
)


