--STORED PROCEDURE
--FİRMALAR

create proc FirmaIsIlanlari
@FirmaAdi varchar(255)
as
select i.ilanAdı,i.pozisyon from işİlanları as i inner join firmalar as f on i.firmaID=f.firmaID where firmaAdı=@FirmaAdi;

create proc IlgiGorenSektor
@MinGoruntulenme int,
@MinBasvuru int
as
select f.firmaSektörü from işİlanları as i inner join firmalar as f on i.firmaID=f.firmaID 
where görüntülenmeSayısı>=@MinGoruntulenme and başvuranSayısı>=@MinBasvuru;


--STORED PROCEDURE
--İNSAN KAYNAKLARI

create proc IstenilenUnvanDepartman
@unvan varchar(20),
@departman varchar(30)
as
select i.ikID, i.firmaID, i.kullanıcıAdı, i.kullanıcıŞifresi, 
i.profilResmi, i.adı, i.soyadı, i.unvan, i.eposta, i.telefon, d.departmanAdı 
from insanKaynakları as i inner join departman as d on i.departmanID=d.departmanID 
where i.unvan=@unvan and d.departmanAdı=@departman;

--STORED PROCEDURE
--İŞ ARAYAN

create proc IlanYasSiniri
@yasSiniri int
as
select işArayanID,adı,soyadı 
from işArayan where DATEDIFF(YEAR,doğumTarihi,GETDATE()) >= @yasSiniri;

create proc ReferansınıBul
@IsArayanId int
as
select r.referansAdı, r.referansSoyadı 
from işArayan as i 
inner join referanslar as r on i.işArayanID=r.işArayanID 
where i.işArayanID=@IsArayanId;

create proc ToplamDeneyimSertifikaAra
@MinToplamDeneyim as int,
@SertifikaAdı varchar(255)
as
select i.işArayanID,i.adı,i.soyadı ,
sum(DATEDIFF(YEAR,id.başlangıçTarihi,id.bitişTarihi)) as 'Toplam Deneyim Yılı',s.sertifikaAdı 
from işArayan as i 
inner join işDeneyimleri as id on i.işArayanID=id.işArayanID 
inner join sertifikaBilgileri as s 
on s.işArayanID=i.işArayanID 
where DATEDIFF(YEAR,id.başlangıçTarihi,id.bitişTarihi)>=@MinToplamDeneyim and s.sertifikaAdı=@SertifikaAdı
group by i.işArayanID,i.adı,i.soyadı,s.sertifikaAdı;

create proc YabancıDilKriter
@YabanciDilAdi varchar(255),
@Seviyesi varchar(20)
as
select * 
from işArayan as i 
inner join yabancıDil as y on i.işArayanID=y.işArayanID 
where y.yabancıDilAdı=@YabanciDilAdi and y.seviyesi=@Seviyesi; 









