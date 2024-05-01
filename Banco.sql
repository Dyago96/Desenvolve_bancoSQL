ATTACH DATABASE ':memory:' AS nutrihope;

CREATE TABLE IF NOT EXISTS nutrihope.pacientes (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    idade INTEGER,
    genero TEXT
);

CREATE TABLE IF NOT EXISTS nutrihope.consultas (
    id INTEGER PRIMARY KEY,
    paciente_id INTEGER,
    data DATE,
    descricao TEXT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

INSERT INTO nutrihope.pacientes (nome, idade, genero) VALUES
('João', 30, 'Masculino'),
('Maria', 25, 'Feminino'),
('Carlos', 40, 'Masculino');

INSERT INTO nutrihope.consultas (paciente_id, data, descricao) VALUES
(1, '2024-04-01', 'Consulta de rotina'),
(2, '2024-04-05', 'Exame de sangue'),
(3, '2024-04-10', 'Acompanhamento mensal');

SELECT pacientes.nome, pacientes.idade, consultas.data, consultas.descricao
FROM nutrihope.consultas
INNER JOIN nutrihope.pacientes ON consultas.paciente_id = pacientes.id;

SELECT pacientes.nome, pacientes.idade, COALESCE(consultas.data, 'Nenhuma consulta') AS data_consulta, COALESCE(consultas.descricao, '-') AS descricao
FROM nutrihope.pacientes
LEFT JOIN nutrihope.consultas ON pacientes.id = consultas.paciente_id;
