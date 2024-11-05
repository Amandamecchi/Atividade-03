CREATE DATABASE hotel;

\c hotel;

CREATE TABLE hospedes (
id_hospede SERIAL PRIMARY KEY,
email VARCHAR(200) UNIQUE NOT NULL,
idade INT NOT NULL
);

SELECT * FROM hospedes;

CREATE TABLE quartos (
    id_quarto SERIAL PRIMARY KEY,
    ocupado BOOLEAN NOT NULL,
    numero_quarto INT NOT NULL
);

CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_hospede INT NOT NULL, 
    id_quarto INT,
    preco_reserva DECIMAL (10,2),
    data_entrada DATE NOT NULL DEFAULT CURRENT_DATE,
    data_saida DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT fk_hospede_quarto
    FOREIGN KEY (id_hospede) REFERENCES  hospedes (id_hospede)
);

INSERT INTO hospedes (id_hospede, email, idade) VALUES 
(1, 'flavia@gmail.com', 12),
(2, 'julia@gmail.com', 18),
(3, 'ana@gmail.com', 20),
(4, 'nino@gmail.com', 42);

INSERT INTO reservas (id_hospede, id_quarto, preco_reserva, data_entrada, data_saida)
VALUES 
(1, 106, '70.05', '2024/11/10', '2024/11/13'),
(2, 108, '90.05', '2024/11/13', '2024/11/20'),
(3, 109, '50.05', '2024/11/19', '2024/11/24'),
(4, 105, '100.00', '2024/12/25', '2024/11/20');

INSERT INTO quartos (id_quarto, ocupado, numero_quarto)
VALUES 
(1, TRUE, 106),
(2, FALSE, 108),
(3, TRUE, 109),
(4, FALSE, 105);


