create database i��lanlar�WebSitesi
use i��lanlar�WebSitesi

create table firmalar
(firmaID int primary key identity(1,1),
firmaAd� varchar(255) NOT NULL,
firmaSekt�r� varchar(30) NOT NULL,
firma�zellikleri varchar(255),
ilanID int NOT NULL,
ikID int NOT NULL
)


create table firma�leti�imBilgileri
(firma�leti�imID int primary key identity(1,1),
firmaID  int NOT NULL,
firmaAdresi varchar(255) NOT NULL,
firmaTelefonu nvarchar(11) NOT NULL
)


create table firmaLogosu
(firmaLogoID int primary key identity(1,1),
firmaID int NOT NULL,
firmaLogo image
)


create table i��lanlar�
(ilanID int primary key identity(1,1),
firmaID int NOT NULL,
ilanAd� varchar(255) NOT NULL,
adres varchar(255) NOT NULL,
telefon nvarchar(11) NOT NULL,
kategori varchar(30) NOT NULL,
pozisyon varchar(30) NOT NULL,
pozisyonSeviyesi varchar(20),
departman varchar(20),
�al��ma�ekli varchar(20),
e�itimSeviyesi varchar(20) NOT NULL,
i�Tecr�besi varchar(20),
engelli�lan� bit,
ba�vuranSay�s� int NOT NULL,
g�r�nt�lenmeSay�s� int NOT NULL,
i�vereninFirmaBilgileri varchar(255) NOT NULL
)


create table insanKaynaklar�
(ikID int primary key identity(1,1),
firmaID int NOT NULL,
kullan�c�Ad� varchar(255) NOT NULL,
kullan�c��ifresi varchar(255) NOT NULL,
profilResmi image,
ad� varchar(30) NOT NULL,
soyad� varchar(30) NOT NULL,
unvan varchar(20),
eposta varchar(255) NOT NULL,
telefon nvarchar(11) NOT NULL,
departmanID int NOT NULL
)

create table departman
(departmanID int primary key identity(1,1),
departmanAd� varchar (30)
)

create table i�Arayan
(i�ArayanID int primary key identity(1,1),
kullan�c�Ad� varchar(255) NOT NULL,
kullan�c��ifresi varchar(255) NOT NULL,
unvan varchar(20) ,
ad� varchar(30) NOT NULL,
soyad� varchar(30) NOT NULL,
cinsiyet bit,
do�umTarihi date NOT NULL,
do�umYeri varchar(20),
eposta varchar(255) NOT NULL,
telefon nvarchar(11) NOT NULL,
adres varchar(255),
uyruk varchar(20) NOT NULL,
s�r�c�Belgesi varchar(20),
askerlikDurumu varchar(20),
�zet varchar(255),
profilFoto�raf� image
)

create table e�itimBilgileri
(e�itimBilgileriID int primary key identity(1,1),
i�ArayanID int NOT NULL,
e�itimDurumu varchar(255) NOT NULL,
ba�lang��Tarihi date NOT NULL,
biti�Tarihi date NOT NULL,
diplomaNotu float,
okulAd� varchar(255) NOT NULL,
okul�ehri varchar(20),
b�l�m� varchar(30) NOT NULL,
��renimTipi varchar(20),
��renimDili varchar(20),
burs bit,
ekBilgi text
)

create table i�Deneyimleri 
(i�DeneyimID int primary key identity(1,1),
i�ArayanID int NOT NULL,
firmaAd� varchar(255) NOT NULL,
pozisyon varchar(30) NOT NULL,
ba�lang��Tarihi date NOT NULL,
biti�Tarihi date NOT NULL ,
firmaSekt�r� varchar(30) NOT NULL,
�al��ma�ekL� varchar(20),
firmaAdresi varchar(255),
ekBilgi text
)

create table yabanc�Dil
(yabanc�DilID int primary key identity(1,1),
i�ArayanID int NOT NULL,
yabanc�DilAd� varchar(255) NOT NULL,
seviyesi varchar(20)
)

create table sertifikaBilgileri 
(sertifikaID int primary key identity(1,1),
i�ArayanID int NOT NULL,
sertifikaAd� varchar(255) NOT NULL,
ald�g�Kurum varchar(30) NOT NULL,
sertifikaTarihi date,
ekBilgi text
)

create table yetenekler
(yetenekID int primary key identity(1,1),
i�arayanID int NOT NULL,
yetenekAd� varchar(30) NOT NULL,
ekBilgi text
)

create table referanslar
(referansID int primary key identity(1,1),
i�ArayanID int NOT NULL,
referansTipi varchar(30) NOT NULL,
referansAd� varchar(30) NOT NULL,
referansSoyad� varchar(30)NOT NULL ,
�al��t���FirmaAd� varchar(255) NOT NULL,
pozisyonu varchar(30) NOT NULL,
eposta varchar(255)NOT NULL,
telefon nvarchar(11)
)

create table hobiler
(hobiID int primary key identity(1,1),
i�ArayanID int NOT NULL,
hobiAd� varchar(30) NOT NULL,
ekBilgi text
)

create table sosyalA�Siteleri
(sosyalA�SiteleriID int primary key identity(1,1),
i�ArayanID int NOT NULL,
sosyalMedyaAd� varchar(255) NOT NULL,
siteAdresi varchar(255) NOT NULL
)

create table logKay�tlar�
(logID int primary key identity(1,1),
tarih date NOT NULL,
saat time NOT NULL,
ikID int NOT NULL ,
i�ArayanID int NOT NULL,
i�lemT�r� varchar(30) NOT NULL,
i�lem varchar(255) NOT NULL,
veri varchar(255) NOT NULL,
a��klama text
)

create table ba�vurular
(ba�vuruID  int primary key identity(1,1),
i�ArayanID int NOT NULL,
ilanID int NOT NULL,
ba�vuruTarihi date NOT NULL,
�nyaz� varchar (255),
ilanaBa�vuruS�ras� int NOT NULL,
firmaID int NOT NULL,
�zge�mi� varchar (255) NOT NULL
)

alter table i�Deneyimleri add constraint i�Deneyimleri_i�Arayan
foreign key (i�ArayanID) references i�Arayan(i�ArayanID)

alter table e�itimBilgileri add constraint e�itimBilgileri_i�Arayan
foreign key (i�ArayanID) references i�Arayan(i�ArayanID)

alter table yabanc�Dil add constraint yabanc�Dil_i�Arayan
foreign key (i�ArayanID) references i�Arayan(i�ArayanID)

alter table sertifikaBilgileri add constraint sertifikaBilgileri_i�Arayan
foreign key (i�ArayanID) references i�Arayan(i�ArayanID)

alter table yetenekler add constraint yetenekler_i�Arayan
foreign key (i�ArayanID) references i�Arayan(i�ArayanID)

alter table referanslar add constraint referanslar_i�Arayan
foreign key (i�ArayanID) references i�Arayan(i�ArayanID)

alter table sosyalA�Siteleri add constraint sosyalA�Siteleri_i�Arayan
foreign key (i�ArayanID) references i�Arayan(i�ArayanID)

alter table hobiler add constraint hobiler_i�Arayan
foreign key (i�ArayanID) references i�Arayan(i�ArayanID)

alter table firmaLogosu add constraint firmaLogosu_firmalar
foreign key (firmaID) references firmalar(firmaID)

alter table firma�leti�imBilgileri add constraint firma�leti�imBilgileri_firmalar
foreign key (firmaID) references firmalar(firmaID)

alter table insanKaynaklar� add constraint insanKaynaklar�_departman
foreign key (departmanID) references departman(departmanID)

alter table firmalar add ilanID int
alter table firmalar add ikID int
alter table firmalar drop column firma�leti�imID

alter table firmalar add constraint firmalar_insanKaynaklar�
foreign key (ikID) references insanKaynaklar�(ikID)

alter table firmalar add constraint firmalar_i��lanlar�
foreign key (ilanID) references i��lanlar�(ilanID)

alter table logKay�tlar� add constraint logKay�tlar�_insanKaynaklar�
foreign key (ikID) references insanKaynaklar�(ikID)

alter table logKay�tlar� add constraint logKay�tlar�_i�Arayan
foreign key (i�ArayanID) references i�Arayan(i�ArayanID)

alter table ba�vurular add constraint ba�vurular_i�Arayan
foreign key (i�ArayanID) references i�Arayan(i�ArayanID)

alter table ba�vurular add constraint ba�vurular_i��lanlar�
foreign key (ilanID) references i��lanlar�(ilanID)