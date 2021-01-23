--VIEWS
--FİRMALAR
create view firmaTelefonları
as
select firmalar.firmaID,firmalar.firmaAdı,firmaİletişimBilgileri.firmaTelefonu from firmalar 
join firmaİletişimBilgileri
on firmalar.firmaID=firmaİletişimBilgileri.firmaID;

create view ilanOlanFirmalar
as
select firmalar.firmaAdı,işİlanları.* from firmalar 
right join işİlanları
on firmalar.firmaID=işİlanları.firmaID;

--VIEWS
--İNSAN KAYNAKLARI

create view unvalarVeLogları 
as
select insanKaynakları. unvan,logKayıtları.*  from insanKaynakları 
join logKayıtları
on insanKaynakları.ikID=logKayıtları.ikID

create view ikılgiliDeparmanlar
as
select insanKaynakları.*,departman.departmanAdı  from insanKaynakları 
left join departman
on insanKaynakları.departmanID=departman.departmanID


--VIEWS
--İŞ ARAYAN

create view işArayanHobileri
as
select işArayan.kullanıcıAdı,hobiler.* from işArayan 
left join hobiler
on işArayan.işArayanID=hobiler.işArayanID;


create view işArayanEğitim
as
select işArayan.kullanıcıAdı,eğitimBilgileri.* from işArayan 
join eğitimBilgileri
on işArayan.işArayanID=eğitimBilgileri.işArayanID;








--VIEWS
--LOG KAYITLARI

create view basvurlanPozisyonlar
as
select işİlanları.pozisyon,başvurular.* from başvurular 
join işİlanları
on başvurular.ilanID=işİlanları.ilanID

create view adreslereGöreLogsayıları
as
select işArayan.adres,count(logKayıtları.işArayanID)as sayi from işArayan 
join logKayıtları
on işArayan.işArayanID=logKayıtları.işArayanID
group by işArayan.adres;







