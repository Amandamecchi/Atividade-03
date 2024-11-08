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
    ocupado BOOLEAN,
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

--INSERT's --

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
(4, 105, '100.00', '2024/11/19', '2024/11/24');

INSERT INTO quartos (id_quarto, ocupado, numero_quarto)
VALUES 
(1, TRUE, 106),
(2, FALSE, 108),
(3, TRUE, 109),
(4, FALSE, 105);

INSERT INTO reservas (id_hospede, id_reserva, id_quarto, preco_reserva, data_entrada, data_saida)
VALUES 
(2, 90, 1, '90.00', '2024/11/19', '2024/11/24'),
(3, 60, 3, '50.00', '2024/11/19', '2024/12/20'),
(4, 72, 2, '80.00', '2024/11/19', '2024/11/15');


(1, 109, 1, '100.00', '2024/11/19', '2024/11/24');

--CONSULTA JOIN - MOSTRA AS RESERVAS FINALIZADAS  

SELECT 
    r.id_reserva,
    h.email AS hospede,
    h.id_hospede,
    q.ocupado,
    q.numero_quarto,
    r.data_entrada,
    r.data_saida
FROM 
    reservas r
JOIN
    hospedes h ON r.id_hospede = h.id_hospede
JOIN 
    quartos q ON r.id_quarto = r.id_quarto
WHERE 
    h.id_hospede = 4;


--CONSULTA ... - MOSTRA AS RESERVAS ATIVAS--


SELECT 
       h.email AS hospede,
       q.numero_quarto AS quarto,
       r.data_entrada,
       r.data_saida
FROM
       Hospedes h
JOIN 
       Reservas r ON h.id_hospede = r.id_hospede
JOIN
       Quartos q ON r.id_quarto = q.id_quarto;

