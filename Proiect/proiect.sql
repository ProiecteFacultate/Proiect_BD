CREATE TABLE CLIENTI(
cod_client number(4) primary key,
nume_utilizator varchar2(20) not null,
parola varchar2(20) not null);

DROP TABLE CLIENTI;

INSERT INTO Clienti 
VALUES (1, 'marian08', 'parolamarian', 'marian08@yahoo.com');
INSERT INTO Clienti 
VALUES (2, 'john_brown', '12345678', 'brown_john@outlook.ro');
INSERT INTO Clienti 
VALUES (3, 'SilviuAndrei', 'silviupass', 'andrei03@gmail.com');
INSERT INTO Clienti 
VALUES (4, 'mariusss', 'parola', 'marius09@s.unibuc.ro');
INSERT INTO Clienti 
VALUES (5, 'kingRaul', 'raul04322', 'king@gmail.com');
INSERT INTO Clienti 
VALUES (6, 'ion_004', 'A45fFD43', 'ion004@yahoo.com');
INSERT INTO Clienti 
VALUES (7, 'vasile244', 'parolaMea', 'vasile244@s.unibuc.ro');
INSERT INTO Clienti 
VALUES (8, 'cosmmmin', 'cosmmmin', 'cosmmmin@yahoo.com');
INSERT INTO Clienti 
VALUES (9, 'crasmaruSebi', '987654321', 'sebi_crasmaru@gmail.ro');
INSERT INTO Clienti 
VALUES (10, 'pospescu34', 'pop34', 'popescu34@outlook.com');