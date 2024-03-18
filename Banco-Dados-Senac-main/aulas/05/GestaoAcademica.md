# Contexto Inicial: Sistema de Gestão Acadêmica em uma Instituição de Ensino

## Parte 1 - Modelo Conceitual

Em uma instituição de ensino inovadora, é essencial desenvolver um Sistema de Gestão Acadêmica para facilitar a administração eficiente de cursos, alunos, professores, disciplinas e matrículas. Este sistema visa proporcionar uma experiência mais fluida para todos os envolvidos no processo educacional.

Neste contexto, a instituição oferece diversos cursos, cada um composto por disciplinas ministradas por professores especializados. Os alunos têm a opção de se matricular em diferentes cursos, e cada curso pode conter um número variável de alunos. Além disso, um professor pode lecionar várias disciplinas, e uma disciplina pode ser ministrada por diferentes professores ao longo do tempo.

Exercício:

Com base no contexto apresentado, identifique as entidades e seus relacionamentos. Em seguida, elabore um modelo conceitual que represente as relações entre essas entidades.

Entidades:
- Curso
- Aluno
- Disciplina
- Professor
- Matrícula

Relacionamentos
- Um Aluno se matricula em um ou mais Cursos
- Um Curso pode conter vários Alunos
- Um Curso é composto por várias Disciplinas
- Uma Disciplina pode pertencer a diferentes Cursos
- Um Professor leciona uma ou mais Disciplinas
- Uma Disciplina pode ser lecionada por um ou mais Professores
- Um Aluno realiza uma ou mais Matrículas
- Uma Matrícula está associada a um Aluno e um Curso

Agora, com base nessas entidades e relacionamentos, desenvolva um modelo conceitual no DrawIO representando visualmente a estrutura e as interações entre esses elementos.

## Parte 2 - Modelo Lógico

A transição do modelo conceitual para o modelo lógico envolve a representação mais específica das entidades, atributos, relacionamentos e chaves no contexto de um Sistema de Gestão Acadêmica.

### Tabelas:

Aluno:
- Matricula (PK), Nome
Curso:
- ID (PK), Nome
Disciplina:
- ID (PK), Nome
Professor:
- ID (PK), Nome, Especializacao
Matricula:
- Aluno_ID (FK), Curso_ID (FK), Data
Cursos_Disciplinas:
- Curso_ID (FK), Disciplina_ID(FK)
Professor_Disciplina:
- Professor_ID (FK), Disciplina_ID (FK)

Chaves Primárias e Estrangeiras:
 - Relacionado nas tabelas!

Agora, com base nessas entidades e relacionamentos, desenvolva um modelo lógico no DrawIO representando visualmente a estrutura completas e as interações entre esses elementos, com seus campos chave refletindo essas interações e seus atributos definidos.


## Parte 3 - SQL

(Reservado para a Aula 06 - Introdução a SQL)