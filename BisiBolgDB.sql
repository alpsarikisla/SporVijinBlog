CREATE DATABASE SporVijin_DB
GO
USE SporVijin_DB
GO
CREATE TABLE YoneticiTurleri
(
	ID int IDENTITY(1,1),
	Isim nvarchar(50),
	CONSTRAINT pk_yoneticiTur PRIMARY KEY(ID)
)
GO
INSERT INTO YoneticiTurleri(Isim) VALUES('Admin')
INSERT INTO YoneticiTurleri(Isim) VALUES('Moderator')
GO
CREATE TABLE Yoneticiler
(
	ID int IDENTITY(1,1),
	YoneticiTurID int,
	Isim nvarchar(50),
	Soyisim nvarchar(50),
	KullaniciAdi nvarchar(50),
	Mail nvarchar(120),
	Sifre nvarchar(20),
	Durum bit,
	Silinmis bit,
	CONSTRAINT pk_yonetici PRIMARY KEY(ID),
	CONSTRAINT fk_yoneticiYoneticiTur FOREIGN KEY(YoneticiTurID)
	REFERENCES YoneticiTurleri(ID)
)
GO
INSERT INTO Yoneticiler(YoneticiTurID, Isim, Soyisim,KullaniciAdi,Mail,Sifre,Durum,Silinmis)
VALUES(1, 'Alp', 'Sarýkýþla','Admin','alpsarikisla@hotmail.com','1234',1,0)
GO
CREATE TABLE Kategoriler
(
	ID int IDENTITY(1,1),
	Isim nvarchar(50),
	Aciklama nvarchar(500),
	Durum bit,
	Silinmis bit,
	CONSTRAINT pk_Kategori PRIMARY KEY(ID)
)
GO
CREATE TABLE Makaleler
(
	ID int IDENTITY(1000,1),
	KategoriID int,
	YazarID int,
	Baslik nvarchar(250),
	Ozet nvarchar(500),
	Icerik ntext,
	EklemeTarihi Datetime,
	GoruntulemeSayisi bigint,
	KapakResim nvarchar(50),
	Durum bit,
	CONSTRAINT pk_makale PRIMARY KEY(ID),
	CONSTRAINT fk_makaleKategori FOREIGN KEY(KategoriID)
	REFERENCES Kategoriler(ID),
	CONSTRAINT fk_makaleYazar FOREIGN KEY(YazarID)
	REFERENCES Yoneticiler(ID)
)
GO
CREATE TABLE Uyeler
(
	ID int IDENTITY(1598756,1),
	Isim nvarchar(50),
	Soyisim nvarchar(50),
	KullaniciAdi nvarchar(50),
	Mail nvarchar(120),
	Sifre nvarchar(20),
	Durum bit,
	Silinmis bit,
	CONSTRAINT pk_Uye PRIMARY KEY(ID)
)
GO
CREATE TABLE Yorumlar
(
	ID int IDENTITY(1,1),
	MakaleID int,
	UyeID int,
	Icerik nvarchar(500),
	EklemeTarihi datetime,
	Durum bit,
	CONSTRAINT pk_Yorum PRIMARY KEY(ID),
	CONSTRAINT fk_yorumMakale FOREIGN KEY(MakaleID)
	REFERENCES Makaleler(ID),
	CONSTRAINT fk_yorumUye FOREIGN KEY(UyeID)
	REFERENCES Uyeler(ID)
)