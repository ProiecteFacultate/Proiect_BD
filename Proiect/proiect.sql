CREATE SEQUENCE Secventa
START WITH 1
INCREMENT BY 1
MAXVALUE 100
NOCYCLE
NOCACHE;

DROP SEQUENCE Secventa;

CREATE TABLE INFORMATII_CLIENTI(
cod_informatii_client NUMBER(4) NOT NULL,
nume VARCHAR2(50) NOT NULL,
prenume VARCHAR2(50) NOT NULL,
cnp VARCHAR2(50) NOT NULL,
numar_telefon VARCHAR2(50) NOT NULL,
CONSTRAINT PK_Informatii_Clienti PRIMARY KEY(cod_informatii_client),
CONSTRAINT UC_Cnp UNIQUE(cnp),
CONSTRAINT UC_Numar_Telefon UNIQUE(numar_telefon));


INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Marian', 'Andrei', '5020413150634', '0734135426');
INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Ion', 'Vasile', '5026262782345', '0774357120');
INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Ioana', 'Cristina', '5022494157062', '0732584214');
INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Buzatu', 'Ionut', '5021395602456', '0712690369');
INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Ana', 'Cosmina', '5021049258568', '0725790632');
INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Gigel', 'Frone', '5021256073548', '0724679520');
INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Andreea', 'Maria', '5021249056732', '0724905687');
INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Cristi', 'Sebastian', '5042458037893', '0738952469');
INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Dragos', 'Andrei', '5015730458972', '0739503182');
INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Ionut', 'Dima', '5072490567120', '0719023567');
INSERT INTO Informatii_Clienti 
VALUES (Secventa.nextval, 'Ion', 'Matei', '5073905481235', '0709326784');

SELECT * 
FROM Informatii_Clienti;


DELETE FROM Informatii_Clienti;
------------------------------------------------------------------------------


CREATE TABLE CLIENTI(
cod_client NUMBER(4) NOT NULL,
cod_informatii_client NUMBER(4),
nume_utilizator VARCHAR2(50) NOT NULL,
parola VARCHAR2(50) NOT NULL,
email VARCHAR2(50) NOT NULL, 
CONSTRAINT PK_Clienti PRIMARY KEY(cod_client),
CONSTRAINT FK_Cod_Informatii_Client FOREIGN KEY(cod_informatii_client) REFERENCES Informatii_Clienti(cod_informatii_client),
CONSTRAINT UC_Cod_Informatii_Client UNIQUE(cod_informatii_client),
CONSTRAINT UC_Nume_Utilizator UNIQUE(nume_utilizator),
CONSTRAINT UC_Email UNIQUE(email));

DELETE
FROM CliENTI;


INSERT INTO Clienti 
VALUES (Secventa.nextval, 1, 'marian08', 'parolamarian', 'marian08@yahoo.com');
INSERT INTO Clienti 
VALUES (Secventa.nextval, NULL, 'john_vasy', '12345678', 'vasy_john@outlook.ro');
INSERT INTO Clienti 
VALUES (Secventa.nextval, 3, 'Icris', 'crispass', 'criss@gmail.com');
INSERT INTO Clienti 
VALUES (Secventa.nextval, 4, 'buzion', 'parola', 'buzion23@s.unibuc.ro');
INSERT INTO Clienti 
VALUES (Secventa.nextval, 5, 'anacos', 'cos04322', 'ana@gmail.com');
INSERT INTO Clienti 
VALUES (Secventa.nextval, NULL, 'dimaI', 'A45fFD43', 'ion004@yahoo.com');
INSERT INTO Clienti 
VALUES (Secventa.nextval, 9, 'dragos244', 'parolaMea', 'dragos244@s.unibuc.ro');
INSERT INTO Clienti 
VALUES (Secventa.nextval, 8, 'seby', 'sebyyy435', 'seb@yahoo.com');
INSERT INTO Clienti 
VALUES (Secventa.nextval, 7, 'andreeaMaria', '987654321', 'maria_andreea@gmail.ro');
INSERT INTO Clienti 
VALUES (Secventa.nextval, NULL, 'kingFrone', 'gigel34', 'frone34@outlook.com');
INSERT INTO Clienti 
VALUES (Secventa.nextval, 2, 'mexicanu', 'meml34', 'mexicanu@outlook.com');
INSERT INTO Clienti 
VALUES (Secventa.nextval, 11, 'MAtei321', '43mat', 'matei@outlook.com');


SELECT * 
FROM Clienti;

DELETE FROM Clienti;

----------------------------------------------------------------------------------------------------------


CREATE TABLE INFORMATII_BANCARE(
cod_informatii_bancare NUMBER(4) NOT NULL,
cod_client NUMBER(4) NOT NULL,
sold_curent NUMBER(6) DEFAULT 0 NOT NULL,
suma_cheltuita NUMBER(6) DEFAULT 0 NOT NULL,
CONSTRAINT PK_Informatii_Bancare PRIMARY KEY(cod_informatii_bancare, cod_client),
CONSTRAINT FK_Cod_Clienti FOREIGN KEY(cod_client) REFERENCES Clienti(cod_client),
CONSTRAINT UC_Cod_Client UNIQUE(cod_client));



INSERT INTO informatii_bancare 
VALUES (1, 1, 200, 150);
INSERT INTO informatii_bancare 
VALUES (2, 2, 300, 200);
INSERT INTO informatii_bancare (cod_informatii_bancare, cod_client)
VALUES (3, 3);
INSERT INTO informatii_bancare 
VALUES (4, 10, 100, 400);
INSERT INTO informatii_bancare 
VALUES (5, 9, 500, 270);
INSERT INTO informatii_bancare (cod_informatii_bancare, cod_client)
VALUES (6, 8);
INSERT INTO informatii_bancare 
VALUES (7, 7, 850, 1300);
INSERT INTO informatii_bancare 
VALUES (8, 6, 2500, 2000);
INSERT INTO informatii_bancare (cod_informatii_bancare, cod_client)
VALUES (9, 5);
INSERT INTO informatii_bancare 
VALUES (10, 4, 2700, 4000);
INSERT INTO informatii_bancare 
VALUES (11, 12, 2400, 3500);

SELECT *
FROM Informatii_Bancare;


--------------------------------------------------------------------------------


CREATE TABLE CARDURI_BANCARE(
cod_card_bancar NUMBER(4) NOT NULL,
cod_informatii_bancare NUMBER(4) NOT NULL,
cod_client NUMBER(4) NOT NULL,
numar_card VARCHAR2(50) NOT NULL,
data_expirare_card DATE NOT NULL,
cod_securitate_card NUMBER(4) NOT NULL,
CONSTRAINT PK_Carduri_Bancare PRIMARY KEY(cod_card_bancar, cod_informatii_bancare, cod_client),
CONSTRAINT FK_Cod_Informatii_Bancare FOREIGN KEY(cod_informatii_bancare, cod_client) REFERENCES Informatii_Bancare(cod_informatii_bancare, cod_client));



INSERT INTO Carduri_Bancare 
VALUES (1, 1, 1, '4053123405931285', TO_DATE('23-MAR-2027', 'DD-MON-YYYY'), 643);
INSERT INTO Carduri_Bancare 
VALUES (2, 2, 2, '5902345967102923', TO_DATE('03-APR-2028', 'DD-MON-YYYY'), 346);
INSERT INTO Carduri_Bancare 
VALUES (3, 3, 3, '5678765321426541', TO_DATE('14-DEC-2025', 'DD-MON-YYYY'), 964);
INSERT INTO Carduri_Bancare 
VALUES (4, 4, 10, '876541234765423', TO_DATE('18-FEB-2024', 'DD-MON-YYYY'), 245);
INSERT INTO Carduri_Bancare 
VALUES (5, 5, 9, '2134357568505663', TO_DATE('22-AUG-2029', 'DD-MON-YYYY'), 325);
INSERT INTO Carduri_Bancare 
VALUES (6, 6, 8, '7809675421345633', TO_DATE('27-SEP-2025', 'DD-MON-YYYY'), 234);
INSERT INTO Carduri_Bancare 
VALUES (7, 7, 7, '1242365406784353', TO_DATE('22-DEC-2025', 'DD-MON-YYYY'), 641);
INSERT INTO Carduri_Bancare 
VALUES (8, 8, 6, '1234326347314746', TO_DATE('06-OCT-2030', 'DD-MON-YYYY'), 123);
INSERT INTO Carduri_Bancare 
VALUES (9, 9, 5, '7437217457897523', TO_DATE('08-NOV-2023', 'DD-MON-YYYY'), 435);
INSERT INTO Carduri_Bancare 
VALUES (10, 10, 4, '3242356343473442', TO_DATE('17-APR-2028', 'DD-MON-YYYY'), 543);
INSERT INTO Carduri_Bancare 
VALUES (11, 11, 12, '3202356343473569', TO_DATE('26-DEC-2030', 'DD-MON-YYYY'), 206);


SELECT *
FROM Carduri_Bancare;


-------------------------------------------------------------------------------------------------------------------------


CREATE TABLE ADRESE(
cod_adresa NUMBER(4) NOT NULL,
cod_client NUMBER(4) NOT NULL,
tara VARCHAR2(50) NOT NULL,
oras VARCHAR2(50) NOT NULL,
strada VARCHAR2(50) NOT NULL,
numar NUMBER(4) NOT NULL,
CONSTRAINT PK_Adrese PRIMARY KEY(cod_adresa, cod_client),
CONSTRAINT FK_Cod_Client FOREIGN KEY(cod_client) REFERENCES Clienti(cod_client));



INSERT INTO Adrese 
VALUES (1, 1, 'Romania', 'Craiova', 'Brestei', 56);
INSERT INTO Adrese 
VALUES (2, 1, 'Romania', 'Bucuresti', 'Drumul Taberei', 23);
INSERT INTO Adrese 
VALUES (3, 1, 'Olanda', 'Amsterdam', 'Amsterdam Street', 4535);
INSERT INTO Adrese 
VALUES (1, 4, 'Romania', 'Iasi', 'Strada Iasului', 654);
INSERT INTO Adrese 
VALUES (2, 4, 'Romania', 'Timisioara', 'Aleea Actorilor', 547);
INSERT INTO Adrese 
VALUES (1, 7, 'Republica Moldova', 'Chisinau', 'Strada Mosilor', 234);
INSERT INTO Adrese 
VALUES (1, 8, 'Franta', 'Paris', 'Sans Elise', 1235);
INSERT INTO Adrese 
VALUES (1, 10, 'Anglia', 'Londra', 'Fournier Street', 12);
INSERT INTO Adrese 
VALUES (2, 10, 'Romania', 'Constanta', 'Faleza Marii', 634);
INSERT INTO Adrese 
VALUES (3, 10, 'Romania', 'Cluj', 'Strada Clujului', 8765);
INSERT INTO Adrese 
VALUES (1, 2, 'Romania', 'Arad', 'Strda Aradului', 65);
INSERT INTO Adrese 
VALUES (2, 2, 'Romania', 'Bucuresti', 'Crangasi', 654);
INSERT INTO Adrese 
VALUES (1, 9, 'Romania', 'Buzau', 'Strda Buzaului', 23);
INSERT INTO Adrese 
VALUES (1, 11, 'Romania', 'Botosani', 'Strda Botosani', 653);
INSERT INTO Adrese 
VALUES (1, 12, 'Romania', 'Vaslui', 'Strda Vslui', 13);

SELECT *
FROM Adrese;


-------------------------------------------------------------------------------------


CREATE TABLE FACTURI(
cod_factura NUMBER(4) NOT NULL,
cod_adresa NUMBER(4) NOT NULL,
cod_client NUMBER(4) NOT NULL,
total NUMBER(4) NOT NULL,
data_eliberare DATE DEFAULT TO_CHAR(SYSDATE, 'DD-MON-YYYY') NOT NULL,
termen_plata DATE NOT NULL,
status VARCHAR(50) DEFAULT 'Neplatit' NOT NULL,
CONSTRAINT PK_Facturi PRIMARY KEY(cod_factura, cod_adresa, cod_client),
CONSTRAINT FK_Cod_Adresa FOREIGN KEY(cod_adresa, cod_client) REFERENCES Adrese(cod_adresa, cod_client),
CONSTRAINT CH_Date CHECK (data_eliberare < termen_plata));



INSERT INTO Facturi
VALUES (1, 1, 1, 200, TO_DATE('18-FEB-2024', 'DD-MON-YYYY'), TO_DATE('23-FEB-2025', 'DD-MON-YYYY'), 'Platit');
INSERT INTO Facturi
VALUES (2, 1, 1, 350, TO_DATE('04-MAR-2023', 'DD-MON-YYYY'), TO_DATE('15-APR-2024', 'DD-MON-YYYY'), 'In procesare');
INSERT INTO Facturi
VALUES (3, 1, 1, 570, TO_DATE('20-SEP-2022', 'DD-MON-YYYY'), TO_DATE('01-APR-2026', 'DD-MON-YYYY'), 'Platit');
INSERT INTO Facturi (cod_factura, cod_adresa, cod_client, total, data_eliberare, termen_plata)
VALUES (1, 2, 4, 700, TO_DATE('13-DEC-2022', 'DD-MON-YYYY'), TO_DATE('17-APR-2024', 'DD-MON-YYYY'));
INSERT INTO Facturi (cod_factura, cod_adresa, cod_client, total, data_eliberare, termen_plata)
VALUES (2, 2, 4, 620, TO_DATE('07-AUG-2024', 'DD-MON-YYYY'), TO_DATE('15-APR-2028', 'DD-MON-YYYY'));
INSERT INTO Facturi
VALUES (1, 1, 7, 200, TO_DATE('23-FEB-2023', 'DD-MON-YYYY'), TO_DATE('27-OCT-2027', 'DD-MON-YYYY'), 'Neplatit');
INSERT INTO Facturi
VALUES (2, 1, 7, 850, TO_DATE('20-AUG-2023', 'DD-MON-YYYY'), TO_DATE('27-APR-2025', 'DD-MON-YYYY'), 'In procesare');
INSERT INTO Facturi
VALUES (1, 2, 10,340, TO_DATE('14-JAN-2023', 'DD-MON-YYYY'), TO_DATE('19-NOV-2023', 'DD-MON-YYYY'), 'Platit');
INSERT INTO Facturi (cod_factura, cod_adresa, cod_client, total, data_eliberare, termen_plata)
VALUES (2, 2, 10, 890, TO_DATE('27-DEC-2024', 'DD-MON-YYYY'), TO_DATE('08-APR-2027', 'DD-MON-YYYY'));
INSERT INTO Facturi (cod_factura, cod_adresa, cod_client, total, data_eliberare, termen_plata)
VALUES (3, 2, 10, 510, TO_DATE('03-APR-2023', 'DD-MON-YYYY'), TO_DATE('22-APR-2025', 'DD-MON-YYYY'));
INSERT INTO Facturi
VALUES (1, 1, 2, 280, TO_DATE('24-SEP-2020', 'DD-MON-YYYY'), TO_DATE('27-APR-2022', 'DD-MON-YYYY'), 'Neplatit');
INSERT INTO Facturi
VALUES (1, 1, 9, 320, TO_DATE('14-DEC-2022', 'DD-MON-YYYY'), TO_DATE('25-MAR-2025', 'DD-MON-YYYY'), 'Neplatit');
INSERT INTO Facturi
VALUES (1, 1, 11, 765, TO_DATE('05-FEB-2022', 'DD-MON-YYYY'), TO_DATE('02-MAY-2024', 'DD-MON-YYYY'), 'Neplatit');
INSERT INTO Facturi
VALUES (1, 1, 12, 180, TO_DATE('19-APR-2021', 'DD-MON-YYYY'), TO_DATE('02-APR-2022', 'DD-MON-YYYY'), 'Neplatit');


SELECT *
FROM Facturi;


--------------------------------------------------------------------------------------------------------------------------


CREATE TABLE PLANGERI(
cod_plangere NUMBER(4) NOT NULL,
cod_client NUMBER(4) NOT NULL,
data_plangere DATE DEFAULT TO_CHAR(SYSDATE, 'DD-MON-YYYY') NOT NULL,
adresa VARCHAR(200) NOT NULL,
mesaj VARCHAR(2000) NOT NULL,
CONSTRAINT PK_Plangeri PRIMARY KEY(cod_plangere, cod_client),
CONSTRAINT FK_Cod_Client_for_Plangere FOREIGN KEY(cod_client) REFERENCES Clienti(cod_client));


INSERT INTO Plangeri
VALUES (1, 1, TO_DATE('03-APR-2023', 'DD-MON-YYYY'), 'Romania, Bucuresti, Strada Giulesti, Nr 20', 'S-a spart o teava de gaz');
INSERT INTO Plangeri
VALUES (2, 1, TO_DATE('12-AUG-2023', 'DD-MON-YYYY'), 'Romania, Craiova, Strada Brestei, Nr 35', 'Curge apa din perete');
INSERT INTO Plangeri
VALUES (1, 3, TO_DATE('22-SEP-2020', 'DD-MON-YYYY'), 'Olanda, Amsterdam, Strada Lalelelor, Nr 44', 'S-a luat curentul');
INSERT INTO Plangeri (cod_plangere, cod_client, adresa, mesaj)
VALUES (2, 3, 'Romania, Cluj, Strada Florilor, Nr 120', 'A sarit o siguranta');
INSERT INTO Plangeri
VALUES (1, 4, TO_DATE('02-JUN-2020', 'DD-MON-YYYY'), 'Romania, Bucuresti, Strada Unirii, Nr 67', 'Nu este lumina pe strada');
INSERT INTO Plangeri
VALUES (1, 6, TO_DATE('14-FEB-2022', 'DD-MON-YYYY'), 'Romania, Timisoara, Strada Palatului, Nr 123', 'Nu functioneaza internetul');
INSERT INTO Plangeri
VALUES (2, 6, TO_DATE('17-DEC-2021', 'DD-MON-YYYY'), 'Romania, Oradea, Strada Moldovei, Nr 45', 'Nu avem apa calda');
INSERT INTO Plangeri (cod_plangere, cod_client, adresa, mesaj)
VALUES (1, 9, 'Romania, Craiova, Strada Craiovita, Nr 56', 'S-a ars siguranta pe bloc');
INSERT INTO Plangeri (cod_plangere, cod_client, adresa, mesaj)
VALUES (2, 9, 'Romania, Oradea, Strada Raului, Nr 12', 'S-a luat apa de 3 zile');
INSERT INTO Plangeri
VALUES (1, 10, TO_DATE('23-NOV-2020', 'DD-MON-YYYY'), 'Romania, Oradea, Strada Marii, Nr 67', 'Nu avem apa');


SELECT *
FROM Plangeri;


------------------------------------------------------------------------------------------------------------------------------



CREATE TABLE INFORMATII_MUNCITORI(
cod_informatii_muncitor NUMBER(4) NOT NULL,
nume VARCHAR(50) NOT NULL,
prenume VARCHAR(50) NOT NULL,
cnp VARCHAR(50) NOT NULL,
numar_telefon VARCHAR(50) NOT NULL,
CONSTRAINT PK_Informatii_Muncitori PRIMARY KEY(cod_informatii_muncitor),
CONSTRAINT UC_Cnp_for_Inf_Munc UNIQUE(cnp),
CONSTRAINT UC_Numar_Telefon_for_Inf_Munc UNIQUE(numar_telefon));


INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Ion', 'Andrei', '5021256073548', '0724679520');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Mincu', 'Ionut', '5023490567123', '0730941278');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Ioana', 'Maria', '5034091285674', '0710923856');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Cosmin', 'Marian', '5021092375834', '0730923857');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Loredana', 'Mariana', '5039054673120', '0745093285');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Sebastian', 'Marius', '5021093457835', '0749012356');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Oana', 'Floarea', '5038902135672', '0709431846');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Ion', 'Antonescu', '5024095689123', '0756908323');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Marius', 'Lica', '5021905623895', '0701938567');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Sorin', 'Mircea', '5023095671834', '0789042175');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Miruna', 'Mircea', '5023095671309', '0789042111');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Ionut', 'Ionel', '5010495671309', '0709342111');
INSERT INTO Informatii_Muncitori
VALUES (SECVENTA.nextval, 'Vasile', 'Vasilievici', '5023095673091', '0789043331');


SELECT *
FROM Informatii_Muncitori;


--------------------------------------------------------------------------------


CREATE TABLE MUNCITORI(
cod_muncitor NUMBER(4) NOT NULL,
cod_informatii_muncitor NUMBER(4),
salariu NUMBER(4) NOT NULL,
data_angajare DATE DEFAULT TO_CHAR(SYSDATE, 'DD-MON-YYYY') NOT NULL,
rating NUMBER(4),
CONSTRAINT PK_Muncitori PRIMARY KEY(cod_muncitor),
CONSTRAINT FK_Informatii_Muncitori FOREIGN KEY(cod_informatii_muncitor) REFERENCES Informatii_Muncitori(cod_informatii_muncitor),
CONSTRAINT UC_Cod_Informatii_Muncitor UNIQUE(cod_informatii_muncitor));



INSERT INTO Muncitori
VALUES (1, 1, 2300, TO_DATE('23-NOV-2019', 'DD-MON-YYYY'), 20);
INSERT INTO Muncitori
VALUES (2, 2, 1800, TO_DATE('10-SEP-2020', 'DD-MON-YYYY'), 50);
INSERT INTO Muncitori
VALUES (3, NULL, 1000, TO_DATE('27-DEC-2021', 'DD-MON-YYYY'), 10);
INSERT INTO Muncitori
VALUES (4, 6, 3000, TO_DATE('15-JAN-2018', 'DD-MON-YYYY'), 200);
INSERT INTO Muncitori
VALUES (5, 8, 8000, TO_DATE('01-OCT-2012', 'DD-MON-YYYY'), 800);
INSERT INTO Muncitori
VALUES (6, 5, 4000, TO_DATE('14-AUG-2017', 'DD-MON-YYYY'), 400);
INSERT INTO Muncitori
VALUES (7, NULL, 2300, TO_DATE('20-FEB-2020', 'DD-MON-YYYY'), NULL);
INSERT INTO Muncitori
VALUES (8, 7, 3300, TO_DATE('19-JUL-2020', 'DD-MON-YYYY'), 70);
INSERT INTO Muncitori
VALUES (9, 9, 1700, TO_DATE('08-MAR-2021', 'DD-MON-YYYY'), 30);
INSERT INTO Muncitori
VALUES (10, 3, 1600, TO_DATE('25-MAY-2017', 'DD-MON-YYYY'), NULL);
INSERT INTO Muncitori
VALUES (11, 11, 1200, TO_DATE('13-DEC-2020', 'DD-MON-YYYY'), 456);
INSERT INTO Muncitori
VALUES (12, 12, 2000, TO_DATE('24-SEP-2020', 'DD-MON-YYYY'), 555);
INSERT INTO Muncitori
VALUES (13, 13, 1300, TO_DATE('13-DEC-2017', 'DD-MON-YYYY'), 456);

SELECT *
FROM Muncitori;


--------------------------------------------------------------------------------------------------


CREATE TABLE SPECIALIZARI(
cod_specializare NUMBER(4) NOT NULL,
nume_specializare VARCHAR2(50) NOT NULL,
descriere VARCHAR2(2000) NOT NULL,
CONSTRAINT PK_Specializari PRIMARY KEY(cod_specializare),
CONSTRAINT UC_Nume_Specializare UNIQUE(nume_specializare));



INSERT INTO Specializari
VALUES (Secventa.nextval, 'Sudor', 'Sudeaza tevile sparte');
INSERT INTO Specializari
VALUES (Secventa.nextval, 'Sofer', 'Conduce masina pana la locul interventiei');
INSERT INTO Specializari
VALUES (Secventa.nextval, 'Instalator', 'Se ocupa cu montatul diverselor instalatii');
INSERT INTO Specializari
VALUES (Secventa.nextval, 'Supervizor', 'Se ocupa cu coordonarea interventiilor');
INSERT INTO Specializari
VALUES (Secventa.nextval, 'Verificator gaze', 'Verifica tevile si instalatiile de gaze');
INSERT INTO Specializari
VALUES (Secventa.nextval, 'Stivuitorist', 'Manevreaza stivuitoare');
INSERT INTO Specializari
VALUES (Secventa.nextval, 'Electrician', 'Repara si inspecteaza instalatiile electrice');
INSERT INTO Specializari
VALUES (Secventa.nextval, 'Retelist', 'Se ocupa cu intretinerea echipamentelor de internet');
INSERT INTO Specializari
VALUES (Secventa.nextval, 'Tinichigiu', 'Repara si indreapta tevile de apa sparte si fisurate');
INSERT INTO Specializari
VALUES (Secventa.nextval, 'Buldozerist', 'Manevreaza buldozere');


SELECT *
FROM Specializari;

DELETE FROM Specializari;

--------------------------------------------------------------------------------------------------------------------------



CREATE TABLE SPECIALIZARI_MUNCITORI(
cod_muncitor NUMBER(4) NOT NULL,
cod_specializare NUMBER(4) NOT NULL,
CONSTRAINT PK_Specializari_Muncitori PRIMARY KEY(cod_muncitor, cod_specializare),
CONSTRAINT FK_Cod_Muncitor FOREIGN KEY(cod_muncitor) REFERENCES Muncitori(cod_muncitor),
CONSTRAINT FK_Cod_Specializare FOREIGN KEY(cod_specializare) REFERENCES Specializari(cod_specializare));



INSERT INTO Specializari_Muncitori
VALUES (1, 1);
INSERT INTO Specializari_Muncitori
VALUES (1, 9);
INSERT INTO Specializari_Muncitori
VALUES (2, 2);
INSERT INTO Specializari_Muncitori
VALUES (3, 6);
INSERT INTO Specializari_Muncitori
VALUES (3, 10);
INSERT INTO Specializari_Muncitori
VALUES (4, 8);
INSERT INTO Specializari_Muncitori
VALUES (5, 4);
INSERT INTO Specializari_Muncitori
VALUES (6, 3);
INSERT INTO Specializari_Muncitori
VALUES (6, 5);
INSERT INTO Specializari_Muncitori
VALUES (6, 7);
INSERT INTO Specializari_Muncitori
VALUES (8, 2);
INSERT INTO Specializari_Muncitori
VALUES (9, 5);
INSERT INTO Specializari_Muncitori
VALUES (10, 2);
INSERT INTO Specializari_Muncitori
VALUES (10, 8);
INSERT INTO Specializari_Muncitori
VALUES (1, 2);
INSERT INTO Specializari_Muncitori
VALUES (11, 2);
INSERT INTO Specializari_Muncitori
VALUES (12, 2);
INSERT INTO Specializari_Muncitori
VALUES (13, 2);

SELECT *
FROM Specializari_Muncitori;

DELETE FROM Specializari_Muncitori;

--------------------------------------------------------------------------------------------------



CREATE TABLE INTERVENTII(
cod_interventie NUMBER(4) NOT NULL,
data_incepere DATE NOT NULL,
nume_defectiune VARCHAR(50) NOT NULL,
status VARCHAR(50) DEFAULT 'Neinceputa' NOT NULL,
CONSTRAINT PK_Interventii PRIMARY KEY(cod_interventie));



INSERT INTO Interventii
VALUES (Secventa.nextval, TO_DATE('01-OCT-2021', 'DD-MON-YYYY'), 'Teava de apa sparta', 'In lucuru');
INSERT INTO Interventii
VALUES (Secventa.nextval, TO_DATE('12-DEC-2022', 'DD-MON-YYYY'), 'Scurgere de gaze', 'Neinceputa');
INSERT INTO Interventii
VALUES (Secventa.nextval, TO_DATE('25-NOV-2025', 'DD-MON-YYYY'), 'Teava de gaze sparte', 'Finalizata');
INSERT INTO Interventii (cod_interventie, data_incepere, nume_defectiune)
VALUES (Secventa.nextval, TO_DATE('15-MAY-2022', 'DD-MON-YYYY'), 'Cablu de electricitate intrerupt');
INSERT INTO Interventii
VALUES (Secventa.nextval, TO_DATE('20-SEP-2021', 'DD-MON-YYYY'), 'Internet picat', 'Finalizata');
INSERT INTO Interventii
VALUES (Secventa.nextval, TO_DATE('05-MAY-2022', 'DD-MON-YYYY'), 'Apa nefunctionala', 'In lucru');
INSERT INTO Interventii
VALUES (Secventa.nextval, TO_DATE('19-APR-2021', 'DD-MON-YYYY'), 'Siguranta sarita', 'In lucru');
INSERT INTO Interventii (cod_interventie, data_incepere, nume_defectiune)
VALUES (Secventa.nextval, TO_DATE('20-JUN-2025', 'DD-MON-YYYY'), 'Teava de apa fisurata');
INSERT INTO Interventii
VALUES (Secventa.nextval, TO_DATE('23-APR-2023', 'DD-MON-YYYY'), 'Siguranta sarita', 'Neinceputa');
INSERT INTO Interventii
VALUES (Secventa.nextval, TO_DATE('25-APR-2020', 'DD-MON-YYYY'), 'Scurgere de gaze', 'Finalizata');

SELECT *
FROM Interventii;


------------------------------------------------------------------------------------------------------


CREATE TABLE DOCUMENTE(
cod_plangere NUMBER(4) NOT NULL,
cod_client NUMBER(4) NOT NULL,
cod_muncitor NUMBER(4) NOT NULL,
cod_interventie NUMBER(4) NOT NULL,
nume_semnatar VARCHAR(50) NOT NULL,
prenume_semnatar VARCHAR(50) NOT NULL,
CONSTRAINT PK_Documente PRIMARY KEY(cod_plangere, cod_client, cod_muncitor, cod_interventie),
CONSTRAINT FK_Cod_Plangere FOREIGN KEY(cod_plangere, cod_client) REFERENCES Plangeri(cod_plangere, cod_client),
CONSTRAINT FK_Cod_Muncitor_for_Documente FOREIGN KEY(cod_muncitor) REFERENCES Muncitori(cod_muncitor),
CONSTRAINT FK_Cod_Interventie FOREIGN KEY(cod_interventie) REFERENCES Interventii(cod_interventie));



INSERT INTO Documente
VALUES (1, 3, 6, 4, 'Dumitrescu', 'Marian');
INSERT INTO Documente
VALUES (1, 3, 2, 4, 'Dumitrescu', 'Marian');
INSERT INTO Documente
VALUES (1, 3, 5, 4, 'Dumitrescu', 'Marian');
INSERT INTO Documente
VALUES (1, 9, 6, 9, 'Andrei', 'Constantin');
INSERT INTO Documente
VALUES (1, 10, 1, 1, 'Andrei', 'Constantin');
INSERT INTO Documente
VALUES (1, 10, 6, 6, 'Dumitrescu', 'Marian');
INSERT INTO Documente
VALUES (1, 10, 3, 6, 'Dumitrescu', 'Marian');
INSERT INTO Documente
VALUES (1, 10, 10, 6, 'Dumitrescu', 'Marian');
INSERT INTO Documente
VALUES (1, 1, 9, 3, 'Andrei', 'Constantin');
INSERT INTO Documente
VALUES (2, 9, 1, 8, 'Andrei', 'Constantin');
INSERT INTO Documente
VALUES (2, 9, 6, 8, 'Andrei', 'Constantin');
INSERT INTO Documente
VALUES (2, 9, 3, 8, 'Andrei', 'Constantin');
INSERT INTO Documente
VALUES (2, 6, 1, 8, 'Andrei', 'Constantin');
INSERT INTO Documente
VALUES (2, 6, 6, 8, 'Andrei', 'Constantin');
INSERT INTO Documente
VALUES (2, 6, 3, 8, 'Andrei', 'Constantin');

SELECT *
FROM Documente;





ALTER TABLE Informatii_Bancare
DROP CONSTRAINT FK_Cod_Clienti;
DROP TABLE Informatii_Clienti;
DROP TABLE Clienti;
DROP TABLE Informati_Bancare;
DROP TABLE Carduri_Bancare;
DROP TABLE Adrese;
DROP TABLE Facturi;
DROP TABLE Plangeri;
DROP TABLE Muncitori;
DROP TABLE Informatii_Muncitori;


DELETE FROM Specializari;
DELETE FROM Specializari_Muncitori;
DELETE FROM Documente;
DELETE FROM Interventii;
DELETE FROM Muncitori;
DELETE FROM Informatii_Muncitori;
DELETE FROM Plangeri;
DELETE FROM Carduri_Bancare;
DELETE FROM Informatii_Bancare;
DELETE FROM Facturi;
DELETE FROM Adrese;
DELETE FROM Clienti;
DELETE FROM Informatii_Clienti;


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


SELECT *
FROM FACTURI;

--CERERE 1
--Afisati numele, prenumele, cnp-ul si numarul de telefon al clientilor care au facturi neplatite si care au cel putin un card bancar pentru care ziua de luni ce urmeaza dupa
--data de expirare este inainte sau egala cu ziua de 30 a lunii. Ordonati rezultatele crescator dupa nume, apoi descrescator dupa prenume. Daca pentru un client se respecta 
--conditiile de mai sus, dar nu se cunosc informatii personale despre acesta (cod_informatii_client pentru respectivul client este NULL), atunci clientul nu va fi afisat. 
--4 rezultate
SELECT DISTINCT ic.nume, ic.prenume, ic.cnp, ic.numar_telefon
FROM Informatii_clienti ic
JOIN Clienti c ON ic.cod_informatii_client = c.cod_informatii_client
JOIN Informatii_bancare ib ON c.cod_client = ib.cod_client
JOIN Carduri_Bancare cb ON cb.cod_informatii_bancare = ib.cod_informatii_bancare
                        AND cb.cod_client = ib.cod_client
JOIN Adrese a ON a.cod_client = c.cod_client
JOIN Facturi f ON a.cod_adresa = f.cod_adresa
               AND a.cod_client = f.cod_client
WHERE f.status = 'Neplatit'
AND TO_NUMBER(EXTRACT(DAY FROM (NEXT_DAY(cb.data_expirare_card, 'Monday')))) <= 30
ORDER BY ic.nume ASC, ic.prenume DESC;

--


--CERERE 2

--Afisati numele, prenumele, salariul si data angajarii muncitorilor care au participat la interventiile survenite in urma plangerilor
--depuse de clientul al carui nume se termina cu 'A' si prenumele incepe cu 'm'. Daca nu se cunosc informatii despre muncitorul afisat (cod_informatii_muncitor pentru 
--respectivul muncitor este NULL) se vor afisa NULL in locul numelui si prenumelui
--3 rezultate
WITH 
cod_mun_cautati AS (SELECT DISTINCT d.cod_muncitor
                    FROM Documente d, Clienti c, Plangeri p
                    WHERE d.cod_client = p.cod_client
                    AND p.cod_client = c.cod_client
                    AND c.cod_informatii_client = (SELECT cod_informatii_client
                                                   FROM Informatii_clienti
                                                   WHERE UPPER(nume) LIKE('%A')
                                                   AND LOWER(prenume) LIKE('m%'))),
cod_inf_munc_cautati AS (SELECT m.cod_muncitor, im.cod_informatii_muncitor
                         FROM Muncitori m, Informatii_muncitori im
                         WHERE m.cod_muncitor in (SELECT cod_muncitor
                                                  FROM cod_mun_cautati)
                         AND m.cod_informatii_muncitor = im.cod_informatii_muncitor)
SELECT DECODE((SELECT cod_informatii_muncitor
               FROM cod_inf_munc_cautati
               WHERE cod_inf_munc_cautati.cod_muncitor = m.cod_muncitor), NULL, NULL, (SELECT nume
                                                                                       FROM Informatii_muncitori im, cod_inf_munc_cautati imc
                                                                                       WHERE im.cod_informatii_muncitor = imc.cod_informatii_muncitor
                                                                                       AND imc.cod_muncitor = m.cod_muncitor)) AS "Nume",              DECODE((SELECT cod_informatii_muncitor
                                                                                                                                                               FROM cod_inf_munc_cautati
                                                                                                                                                               WHERE cod_inf_munc_cautati.cod_muncitor = m.cod_muncitor), NULL, NULL, (SELECT prenume
                                                                                                                                                                                                                                       FROM Informatii_muncitori im, cod_inf_munc_cautati imc
                                                                                                                                                                                                                                       WHERE im.cod_informatii_muncitor = imc.cod_informatii_muncitor
                                                                                                                                                                                                                                       AND imc.cod_muncitor = m.cod_muncitor)) AS "Prenume",              m.salariu, m.data_angajare
FROM Muncitori m
WHERE m.cod_muncitor in (SELECT *
                         FROM cod_mun_cautati);
                         
                         
--CERERE 3

--Afisati numele, prenumele, salariul si data angajarii muncitorilor care au salariul mai mare decat media salariilor celor ce au fost angajati in acelasi an cu ei si care au printre
--specializari si specializarea de 'Sofer' (specializarea de 'Sofer'nu trebuie sa le apartina muncitorilor afisati, ci muncitorilor angajati in acelasi an cu muncitorul afisat, iar
--daca nu exista niciun Sofer angajat in acelasi an cu angajatul respectiv atunci media salariilor va fi 0). Se vor afisa datele precizate mai sus numai daca avem informatii complete 
--despre muncitorul respectiv (adica daca cod_informatii_muncitor pentru respectivul muncitor nu este NULL)
--6 rezultate
SELECT im.nume, im.prenume, extern.salariu, extern.data_angajare
FROM Muncitori extern, Informatii_Muncitori im
WHERE extern.salariu > NVL((SELECT AVG(m.salariu)
                            FROM Muncitori m, Specializari_Muncitori sp, Specializari s
                            WHERE EXTRACT(YEAR FROM extern.data_angajare) = EXTRACT(YEAR FROM m.data_angajare)
                            AND m.cod_muncitor = sp.cod_muncitor
                            AND sp.cod_specializare = s.cod_specializare
                            AND s.nume_specializare = 'Sofer'), 0)
AND extern.cod_informatii_muncitor IS NOT NULL 
AND extern.cod_informatii_muncitor = im.cod_informatii_muncitor;



--CERERE 4
--Afisati denumirea, salariul minim, mediu, maxim si numarul angajatilor pentru fiecare specializare care are minim 2 angajati
--3 rezultate
SELECT DISTINCT s.nume_specializare AS "Nume specializare", MIN(salariu) AS "Salariu minim", MAX(salariu) AS "Salariu maxim", ROUND(AVG(salariu)) AS "Salariu mediu", COUNT(*) AS "Numar angajati"
FROM Muncitori m, Specializari_Muncitori sp, Specializari s
WHERE m.cod_muncitor = sp.cod_muncitor
AND sp.cod_specializare = s.cod_specializare
GROUP BY s.cod_specializare, s.nume_specializare
HAVING COUNT(*) > 1
ORDER BY COUNT(*) ASC, ROUND(AVG(salariu)) DESC;


--CERERE 5
--Sa se afiseaze numele, prenumele, data angajarii, ratingul, salariul actual si salariul dupa marire a primilor 5 angajati cu cel mai mare rating. Salariul urmeaza sa se 
--mareasca numai angajatilor care se afla in top 5 dupa rating astfel: deloc daca este angajat dupa 2021 (inclusiv), cu 10% daca este angajat din 2020, cu 20% daca este
--angajat din 2019, cu 30% daca este angajat din 2018, cu 40% daca este angajat din 2017, cu 50% daca este angajat inainte de 2017
--5 rezultate
WITH 
aux AS (SELECT cod_muncitor, cod_informatii_muncitor, salariu, data_angajare, rating
        FROM Muncitori 
        WHERE rating IS NOT NULL
        ORDER BY rating DESC)
SELECT DECODE(a.cod_informatii_muncitor, NULL, NULL, (SELECT im.nume
                                                      FROM Informatii_Muncitori im
                                                      WHERE im.cod_informatii_muncitor = a.cod_informatii_muncitor)) AS "Nume",
                                                      
DECODE(a.cod_informatii_muncitor, NULL, NULL, (SELECT im.prenume
                                               FROM Informatii_Muncitori im
                                               WHERE im.cod_informatii_muncitor = a.cod_informatii_muncitor)) AS "Prenume", 
                                               
data_angajare AS "Data Angajare", rating AS "Rating", salariu AS "Salariu actual",
CASE TO_NUMBER(EXTRACT (YEAR FROM data_angajare))
WHEN 2020
THEN salariu 
WHEN 2021 
THEN salariu 
WHEN 2020
THEN salariu * 1.1
WHEN 2019
THEN salariu * 1.2
WHEN 2018
THEN salariu * 1.3
WHEN 2017
THEN salariu * 1.4
ELSE salariu * 1.5
END AS "Salariu dupa marire"
FROM aux a
WHERE ROWNUM <= 5;



