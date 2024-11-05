CREATE DATABASE hotel;

\c hotel;

CREATE TABLE hospedes (
id_hospede SERIAL PRIMARY KEY,
email VARCHAR(200) UNIQUE NOT NULL
idade INT NOT NULL,
);

SELECT * FROM hospedes;

CREATE TABLE quartos (
    id_quarto SERIAL PRIMARY KEY,
    ocupado VARCHAR(100) NOT NULL,
    numero_quarto INT NOT NULL,
);

CREATE TABLE reservas (
    id_hospede SERIAL PRIMARY KEY,
    id_quarto SERIAL PRIMARY KEY,
    preco_reserva DECIMAL (10,2),
    data_entrada DATE NOT NULL DEFAULT CURRENT_DATE,
    data_saida DATE NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO hospedes (nome, email, idade)
