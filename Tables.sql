create database işİlanlarıWebSitesi
use işİlanlarıWebSitesi

create table firmalar
(firmaID int primary key identity(1,1),
firmaAdı varchar(255) NOT NULL,
firmaSektörü varchar(30) NOT NULL,
firmaÖzellikleri varchar(255),
ilanID int NOT NULL,
ikID int NOT NULL
)


create table firmaİletişimBilgileri
(firmaİletişimID int primary key identity(1,1),
firmaID  int NOT NULL,
firmaAdresi varchar(255) NOT NULL,
firmaTelefonu nvarchar(11) NOT NULL
)


create table firmaLogosu
(firmaLogoID int primary key identity(1,1),
firmaID int NOT NULL,
firmaLogo image
)


create table işİlanları
(ilanID int primary key identity(1,1),
firmaID int NOT NULL,
ilanAdı varchar(255) NOT NULL,
adres varchar(255) NOT NULL,
telefon nvarchar(11) NOT NULL,
kategori varchar(30) NOT NULL,
pozisyon varchar(30) NOT NULL,
pozisyonSeviyesi varchar(20),
departman varchar(20),
çalışmaŞekli varchar(20),
eğitimSeviyesi varchar(20) NOT NULL,
işTecrübesi varchar(20),
engelliİlanı bit,
başvuranSayısı int NOT NULL,
görüntülenmeSayısı int NOT NULL,
işvereninFirmaBilgileri varchar(255) NOT NULL
)


create table insanKaynakları
(ikID int primary key identity(1,1),
firmaID int NOT NULL,
kullanıcıAdı varchar(255) NOT NULL,
kullanıcıŞifresi varchar(255) NOT NULL,
profilResmi image,
adı varchar(30) NOT NULL,
soyadı varchar(30) NOT NULL,
unvan varchar(20),
eposta varchar(255) NOT NULL,
telefon nvarchar(11) NOT NULL,
departmanID int NOT NULL
)

create table departman
(departmanID int primary key identity(1,1),
departmanAdı varchar (30)
)

create table işArayan
(işArayanID int primary key identity(1,1),
kullanıcıAdı varchar(255) NOT NULL,
kullanıcıŞifresi varchar(255) NOT NULL,
unvan varchar(20) ,
adı varchar(30) NOT NULL,
soyadı varchar(30) NOT NULL,
cinsiyet bit,
doğumTarihi date NOT NULL,
doğumYeri varchar(20),
eposta varchar(255) NOT NULL,
telefon nvarchar(11) NOT NULL,
adres varchar(255),
uyruk varchar(20) NOT NULL,
sürücüBelgesi varchar(20),
askerlikDurumu varchar(20),
özet varchar(255),
profilFotoğrafı image
)

create table eğitimBilgileri
(eğitimBilgileriID int primary key identity(1,1),
işArayanID int NOT NULL,
eğitimDurumu varchar(255) NOT NULL,
başlangıçTarihi date NOT NULL,
bitişTarihi date NOT NULL,
diplomaNotu float,
okulAdı varchar(255) NOT NULL,
okulŞehri varchar(20),
bölümü varchar(30) NOT NULL,
öğrenimTipi varchar(20),
öğrenimDili varchar(20),
burs bit,
ekBilgi text
)

create table işDeneyimleri 
(işDeneyimID int primary key identity(1,1),
işArayanID int NOT NULL,
firmaAdı varchar(255) NOT NULL,
pozisyon varchar(30) NOT NULL,
başlangıçTarihi date NOT NULL,
bitişTarihi date NOT NULL ,
firmaSektörü varchar(30) NOT NULL,
çalışmaŞekLİ varchar(20),
firmaAdresi varchar(255),
ekBilgi text
)

create table yabancıDil
(yabancıDilID int primary key identity(1,1),
işArayanID int NOT NULL,
yabancıDilAdı varchar(255) NOT NULL,
seviyesi varchar(20)
)

create table sertifikaBilgileri 
(sertifikaID int primary key identity(1,1),
işArayanID int NOT NULL,
sertifikaAdı varchar(255) NOT NULL,
aldıgıKurum varchar(30) NOT NULL,
sertifikaTarihi date,
ekBilgi text
)

create table yetenekler
(yetenekID int primary key identity(1,1),
işarayanID int NOT NULL,
yetenekAdı varchar(30) NOT NULL,
ekBilgi text
)

create table referanslar
(referansID int primary key identity(1,1),
işArayanID int NOT NULL,
referansTipi varchar(30) NOT NULL,
referansAdı varchar(30) NOT NULL,
referansSoyadı varchar(30)NOT NULL ,
çalıştığıFirmaAdı varchar(255) NOT NULL,
pozisyonu varchar(30) NOT NULL,
eposta varchar(255)NOT NULL,
telefon nvarchar(11)
)

create table hobiler
(hobiID int primary key identity(1,1),
işArayanID int NOT NULL,
hobiAdı varchar(30) NOT NULL,
ekBilgi text
)

create table sosyalAğSiteleri
(sosyalAğSiteleriID int primary key identity(1,1),
işArayanID int NOT NULL,
sosyalMedyaAdı varchar(255) NOT NULL,
siteAdresi varchar(255) NOT NULL
)

create table logKayıtları
(logID int primary key identity(1,1),
tarih date NOT NULL,
saat time NOT NULL,
ikID int NOT NULL ,
işArayanID int NOT NULL,
işlemTürü varchar(30) NOT NULL,
işlem varchar(255) NOT NULL,
veri varchar(255) NOT NULL,
açıklama text
)

create table başvurular
(başvuruID  int primary key identity(1,1),
işArayanID int NOT NULL,
ilanID int NOT NULL,
başvuruTarihi date NOT NULL,
önyazı varchar (255),
ilanaBaşvuruSırası int NOT NULL,
firmaID int NOT NULL,
özgeçmiş varchar (255) NOT NULL
)

alter table işDeneyimleri add constraint işDeneyimleri_işArayan
foreign key (işArayanID) references işArayan(işArayanID)

alter table eğitimBilgileri add constraint eğitimBilgileri_işArayan
foreign key (işArayanID) references işArayan(işArayanID)

alter table yabancıDil add constraint yabancıDil_işArayan
foreign key (işArayanID) references işArayan(işArayanID)

alter table sertifikaBilgileri add constraint sertifikaBilgileri_işArayan
foreign key (işArayanID) references işArayan(işArayanID)

alter table yetenekler add constraint yetenekler_işArayan
foreign key (işArayanID) references işArayan(işArayanID)

alter table referanslar add constraint referanslar_işArayan
foreign key (işArayanID) references işArayan(işArayanID)

alter table sosyalAğSiteleri add constraint sosyalAğSiteleri_işArayan
foreign key (işArayanID) references işArayan(işArayanID)

alter table hobiler add constraint hobiler_işArayan
foreign key (işArayanID) references işArayan(işArayanID)

alter table firmaLogosu add constraint firmaLogosu_firmalar
foreign key (firmaID) references firmalar(firmaID)

alter table firmaİletişimBilgileri add constraint firmaİletişimBilgileri_firmalar
foreign key (firmaID) references firmalar(firmaID)

alter table insanKaynakları add constraint insanKaynakları_departman
foreign key (departmanID) references departman(departmanID)

alter table firmalar add ilanID int
alter table firmalar add ikID int
alter table firmalar drop column firmaİletişimID

alter table firmalar add constraint firmalar_insanKaynakları
foreign key (ikID) references insanKaynakları(ikID)

alter table firmalar add constraint firmalar_işİlanları
foreign key (ilanID) references işİlanları(ilanID)

alter table logKayıtları add constraint logKayıtları_insanKaynakları
foreign key (ikID) references insanKaynakları(ikID)

alter table logKayıtları add constraint logKayıtları_işArayan
foreign key (işArayanID) references işArayan(işArayanID)

alter table başvurular add constraint başvurular_işArayan
foreign key (işArayanID) references işArayan(işArayanID)

alter table başvurular add constraint başvurular_işİlanları
foreign key (ilanID) references işİlanları(ilanID)