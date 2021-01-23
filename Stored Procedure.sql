--STORED PROCEDURE
--F�RMALAR

create proc FirmaIsIlanlari
@FirmaAdi varchar(255)
as
select i.ilanAd�,i.pozisyon from i��lanlar� as i inner join firmalar as f on i.firmaID=f.firmaID where firmaAd�=@FirmaAdi;

create proc IlgiGorenSektor
@MinGoruntulenme int,
@MinBasvuru int
as
select f.firmaSekt�r� from i��lanlar� as i inner join firmalar as f on i.firmaID=f.firmaID 
where g�r�nt�lenmeSay�s�>=@MinGoruntulenme and ba�vuranSay�s�>=@MinBasvuru;


--STORED PROCEDURE
--�NSAN KAYNAKLARI

create proc IstenilenUnvanDepartman
@unvan varchar(20),
@departman varchar(30)
as
select i.ikID, i.firmaID, i.kullan�c�Ad�, i.kullan�c��ifresi, 
i.profilResmi, i.ad�, i.soyad�, i.unvan, i.eposta, i.telefon, d.departmanAd� 
from insanKaynaklar� as i inner join departman as d on i.departmanID=d.departmanID 
where i.unvan=@unvan and d.departmanAd�=@departman;

--STORED PROCEDURE
--�� ARAYAN

create proc IlanYasSiniri
@yasSiniri int
as
select i�ArayanID,ad�,soyad� 
from i�Arayan where DATEDIFF(YEAR,do�umTarihi,GETDATE()) >= @yasSiniri;

create proc Referans�n�Bul
@IsArayanId int
as
select r.referansAd�, r.referansSoyad� 
from i�Arayan as i 
inner join referanslar as r on i.i�ArayanID=r.i�ArayanID 
where i.i�ArayanID=@IsArayanId;

create proc ToplamDeneyimSertifikaAra
@MinToplamDeneyim as int,
@SertifikaAd� varchar(255)
as
select i.i�ArayanID,i.ad�,i.soyad� ,
sum(DATEDIFF(YEAR,id.ba�lang��Tarihi,id.biti�Tarihi)) as 'Toplam Deneyim Y�l�',s.sertifikaAd� 
from i�Arayan as i 
inner join i�Deneyimleri as id on i.i�ArayanID=id.i�ArayanID 
inner join sertifikaBilgileri as s 
on s.i�ArayanID=i.i�ArayanID 
where DATEDIFF(YEAR,id.ba�lang��Tarihi,id.biti�Tarihi)>=@MinToplamDeneyim and s.sertifikaAd�=@SertifikaAd�
group by i.i�ArayanID,i.ad�,i.soyad�,s.sertifikaAd�;

create proc Yabanc�DilKriter
@YabanciDilAdi varchar(255),
@Seviyesi varchar(20)
as
select * 
from i�Arayan as i 
inner join yabanc�Dil as y on i.i�ArayanID=y.i�ArayanID 
where y.yabanc�DilAd�=@YabanciDilAdi and y.seviyesi=@Seviyesi; 









