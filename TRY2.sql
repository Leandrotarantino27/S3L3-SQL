CREATE TABLE STUDENTE (
    Matricola INTEGER PRIMARY KEY NOT NULL,
    Nome TEXT NOT NULL,
    Citta TEXT NOT NULL
);
CREATE TABLE CORSO (
    Codice VARCHAR(255) NOT NULL,
    Nome TEXT NOT NULL,
    MatricolaDocente VARCHAR(255) NOT NULL
);

CREATE TABLE DOCENTE (
    Matricola INTEGER PRIMARY KEY NOT NULL,
    Nome TEXT NOT NULL
);

CREATE TABLE ESAME (
    Codice VARCHAR(255) NOT NULL,
    MatricolaStudente VARCHAR(255)  NOT NULL,
   data VARCHAR(255) NOT NULL,
    Voto INTEGER NOT NULL,
    SettoreScientifico TEXT NOT NULL
);

INSERT INTO STUDENTE (Matricola, Nome, Citta) VALUES
('0034', 'Leandro', 'Palermo'),
('0035', 'Max', 'Catania');

INSERT INTO CORSO (Codice, Nome, MatricolaDocente) VALUES
('04', 'Musica', '0001'),
('09', 'Arte', '0023');

INSERT INTO DOCENTE (Matricola, Nome) VALUES
('0001', 'Bart'),
('0023', 'Asia');

INSERT INTO ESAME (Codice, MatricolaStudente, data, Voto, SettoreScientifico) VALUES
('LM04', '0034', '30/11/23', '30', 'Umanistico'),
('LM09', '0034', '03/12/23', '30', 'Umanistico'),
('LM04', '0035', '30/11/23', '22', 'Umanistico'),
('LM09', '0035', '03/12/23', '18', 'Umanistico');




SELECT *
FROM STUDENTE
INNER JOIN ESAME ON STUDENTE.Matricola = ESAME.MatricolaStudente;



SELECT STUDENTE.Matricola, ESAME.Codice, ESAME.Voto, DOCENTE.Nome
FROM STUDENTE
INNER JOIN ESAME ON STUDENTE.Matricola = ESAME.MatricolaStudente
INNER JOIN CORSO ON ESAME.Codice = CORSO.Codice
INNER JOIN DOCENTE ON CORSO.MatricolaDocente = DOCENTE.Matricola
WHERE ESAME.Voto >'28';
