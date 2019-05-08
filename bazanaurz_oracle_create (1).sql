CREATE TABLE "Klienci" (
	"id_klienta" INT,
	"imie" TEXT,
	"nazwisko" TEXT,
	"nr_telefonu" INT,
	constraint KLIENCI_PK PRIMARY KEY ("id_klienta")
CREATE sequence "KLIENCI_SEQ"
/
CREATE trigger "BI_KLIENCI"
  before insert on "KLIENCI"
  for each row
begin
  select "KLIENCI_SEQ".nextval into :NEW."id_klienta" from dual;
end;
/

)
/
CREATE TABLE "Produkty" (
	"id_produktu" INT,
	"cena" INT,
	"typ" TEXT,
	"id_producenta" TEXT,
	constraint PRODUKTY_PK PRIMARY KEY ("id_produktu")
CREATE sequence "PRODUKTY_SEQ"
/
CREATE trigger "BI_PRODUKTY"
  before insert on "PRODUKTY"
  for each row
begin
  select "PRODUKTY_SEQ".nextval into :NEW."id_produktu" from dual;
end;
/

)
/
CREATE TABLE "Stan" (
	"id_produktu" INT,
	"id_sklepu" INT,
	"ilosc" INT
)
/
CREATE TABLE "Producenci" (
	"id_producenta" INT,
	"nazwa" TEXT,
	constraint PRODUCENCI_PK PRIMARY KEY ("id_producenta")
CREATE sequence "PRODUCENCI_SEQ"
/
CREATE trigger "BI_PRODUCENCI"
  before insert on "PRODUCENCI"
  for each row
begin
  select "PRODUCENCI_SEQ".nextval into :NEW."id_producenta" from dual;
end;
/

)
/
CREATE TABLE "Sprzedaz_szczegol" (
	"id_produktu" INT,
	"id_sprzedazy" INT,
	"ilosc" INT
)
/
CREATE TABLE "Sprzedaz" (
	"id_sprzedazy" INT,
	"id_klienta" INT,
	"id_sprzedawcy" INT,
	"id_sklepu" INT,
	"data" DATE,
	"kwota" INT,
	constraint SPRZEDAZ_PK PRIMARY KEY ("id_sprzedazy")
CREATE sequence "SPRZEDAZ_SEQ"
/
CREATE trigger "BI_SPRZEDAZ"
  before insert on "SPRZEDAZ"
  for each row
begin
  select "SPRZEDAZ_SEQ".nextval into :NEW."id_sprzedazy" from dual;
end;
/

)
/
CREATE TABLE "Sprzedawca" (
	"id_sprzedawcy" INT,
	"imie" TEXT,
	"nazwisko" TEXT,
	"nr_telefonu" INT,
	constraint SPRZEDAWCA_PK PRIMARY KEY ("id_sprzedawcy")
CREATE sequence "SPRZEDAWCA_SEQ"
/
CREATE trigger "BI_SPRZEDAWCA"
  before insert on "SPRZEDAWCA"
  for each row
begin
  select "SPRZEDAWCA_SEQ".nextval into :NEW."id_sprzedawcy" from dual;
end;
/

)
/
CREATE TABLE "Sklep" (
	"id_sklepu" INT,
	"adres" TEXT,
	constraint SKLEP_PK PRIMARY KEY ("id_sklepu")
CREATE sequence "SKLEP_SEQ"
/
CREATE trigger "BI_SKLEP"
  before insert on "SKLEP"
  for each row
begin
  select "SKLEP_SEQ".nextval into :NEW."id_sklepu" from dual;
end;
/

)
/

ALTER TABLE "Produkty" ADD CONSTRAINT "Produkty_fk0" FOREIGN KEY ("id_producenta") REFERENCES Producenci("id_producenta");

ALTER TABLE "Stan" ADD CONSTRAINT "Stan_fk0" FOREIGN KEY ("id_produktu") REFERENCES Produkty("id_produktu");
ALTER TABLE "Stan" ADD CONSTRAINT "Stan_fk1" FOREIGN KEY ("id_sklepu") REFERENCES Sklep("id_sklepu");


ALTER TABLE "Sprzedaz_szczegol" ADD CONSTRAINT "Sprzedaz_szczegol_fk0" FOREIGN KEY ("id_produktu") REFERENCES Produkty("id_produktu");
ALTER TABLE "Sprzedaz_szczegol" ADD CONSTRAINT "Sprzedaz_szczegol_fk1" FOREIGN KEY ("id_sprzedazy") REFERENCES Sprzedaz("id_sprzedazy");

ALTER TABLE "Sprzedaz" ADD CONSTRAINT "Sprzedaz_fk0" FOREIGN KEY ("id_klienta") REFERENCES Klienci("id_klienta");
ALTER TABLE "Sprzedaz" ADD CONSTRAINT "Sprzedaz_fk1" FOREIGN KEY ("id_sprzedawcy") REFERENCES Sprzedawca("id_sprzedawcy");
ALTER TABLE "Sprzedaz" ADD CONSTRAINT "Sprzedaz_fk2" FOREIGN KEY ("id_sklepu") REFERENCES Sklep("id_sklepu");



