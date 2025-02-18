CREATE DATABASE azienda_prova;
USE azienda_prova;
CREATE TABLE Store(
IDStore INT PRIMARY KEY,
Nome VARCHAR (30),
Data_Apertura DATE,
Settore VARCHAR (20)
);

CREATE TABLE Region(
IDRegion INT PRIMARY KEY,
Citta VARCHAR (20),
Region VARCHAR (20),	
Area_Geografica VARCHAR (15)
);

ALTER TABLE Store 
ADD IDRegion INT,  
ADD FOREIGN KEY (IDRegion) REFERENCES Region (IDRegion);

SELECT * FROM Store;
SELECT * FROM Region;

INSERT INTO Store 
VALUES
(1, 'La Bottega del Gusto', '2020-03-15', 'Alimentare', 1),
(2, 'Tech World', '2021-06-10', 'Elettronica', 2),
(3, 'Fashion Boutique', '2019-11-25', 'Abbigliamento', 1),
(4, 'Libri & Co.', '2018-01-20', 'Libreria', 3),
(5, 'Green Market', '2022-09-05', 'Biologico', 2);

INSERT INTO Region 
VALUES
(1, 'Roma', 'Lazio', 'Centro'),
(2, 'Milano', 'Lombardia', 'Nord'),
(3, 'Napoli', 'Campania', 'Sud'),
(4, 'Torino', 'Piemonte', 'Nord'),
(5, 'Catania', 'Sicilia', 'Sud');

-- modifico la città di Milano in Varese dopo aver visualizzato il risultato
START TRANSACTION; 

UPDATE Region
SET Citta = 'Varese'
WHERE IDRegion = 2;
-- se c'è un problema torno indietro 
ROLLBACK;
-- confermo la transazione 
COMMIT;

START TRANSACTION;
-- elimino ciò che corrisponde a IDRegion = 2 nella tabella Store poichè è fk 
DELETE FROM Store
WHERE IDRegion = 2;
-- elimino una delle pk di Region 
DELETE FROM Region 
WHERE IDRegion = 2;
ROLLBACK;
COMMIT;

SELECT s.Nome, r.Citta
FROM Store as s LEFT JOIN Region as r ON s.IDRegion = r.IDRegion;




















