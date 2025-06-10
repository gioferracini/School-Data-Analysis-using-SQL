CREATE DATABASE escola;

CREATE TABLE professor(
id_professor int not null primary key auto_increment,
nome_prof varchar(100) not null,
data_nasc_prof date not null,
idade_prof smallint not null,
sexo_prof char(2) not null,
telefone_prof varchar(20) not null,
endereco_prof varchar(200) not null,
bairro_prof varchar(100) not null,
cidade_prof varchar(100) not null,
uf_prof varchar(100) not null,
email_prof varchar(200) not null,
status_prof varchar(100) not null
);

CREATE TABLE turmas(
id_turma int not null primary key auto_increment,
nome_turma varchar(100) not null,
serie varchar(100) not null,
turno varchar(100) not null,
anoletivo int not null,
id_coordenador int not null,
FOREIGN KEY (id_coordenador) REFERENCES professor (id_professor)
);

CREATE TABLE alunos(
id_aluno int not null primary key auto_increment,
nome_aluno varchar(100) not null,
data_nasc_aluno date not null,
idade_aluno smallint not null,
sexo_aluno char(2) not null,
cpf_aluno bigint not null,
telefone_aluno varchar(20) not null,
endereco_aluno varchar(200) not null,
bairro_aluno varchar(100) not null,
cidade_aluno varchar(100) not null,
uf_aluno varchar(100) not null,
email_aluno varchar(200) not null,
id_turma int,
nome_mae varchar(200) not null,
nome_pai varchar(200),
data_matricula date not null,
data_termino date,
FOREIGN KEY (id_turma) REFERENCES turmas (id_turma)
);

CREATE TABLE disciplina(
id_disciplina int not null primary key auto_increment,
nome_disciplina varchar(100) not null,
carga_horaria int not null
);

CREATE TABLE professor_disciplina(
ID_PD int not null primary key auto_increment,
id_professor int not null,
id_disciplina int not null,
FOREIGN KEY (id_professor) REFERENCES professor (id_professor),
FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina)
);

CREATE TABLE historico(
id_historico int not null primary key auto_increment,
id_aluno int not null,
id_turma int not null,
id_disciplina int not null,
anoletivo int not null,
nota_1b float not null,
nota_2b float not null,
nota_3b float not null,
nota_4b float not null,
nota_final float not null,
presenca float not null,
status varchar(100) not null,
FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno),
FOREIGN KEY (id_turma) REFERENCES turmas (id_turma),
FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina)
)