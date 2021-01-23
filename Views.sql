--VIEWS
--F�RMALAR
create view firmaTelefonlar�
as
select firmalar.firmaID,firmalar.firmaAd�,firma�leti�imBilgileri.firmaTelefonu from firmalar 
join firma�leti�imBilgileri
on firmalar.firmaID=firma�leti�imBilgileri.firmaID;

create view ilanOlanFirmalar
as
select firmalar.firmaAd�,i��lanlar�.* from firmalar 
right join i��lanlar�
on firmalar.firmaID=i��lanlar�.firmaID;

--VIEWS
--�NSAN KAYNAKLARI

create view unvalarVeLoglar� 
as
select insanKaynaklar�. unvan,logKay�tlar�.*  from insanKaynaklar� 
join logKay�tlar�
on insanKaynaklar�.ikID=logKay�tlar�.ikID

create view ik�lgiliDeparmanlar
as
select insanKaynaklar�.*,departman.departmanAd�  from insanKaynaklar� 
left join departman
on insanKaynaklar�.departmanID=departman.departmanID


--VIEWS
--�� ARAYAN

create view i�ArayanHobileri
as
select i�Arayan.kullan�c�Ad�,hobiler.* from i�Arayan 
left join hobiler
on i�Arayan.i�ArayanID=hobiler.i�ArayanID;


create view i�ArayanE�itim
as
select i�Arayan.kullan�c�Ad�,e�itimBilgileri.* from i�Arayan 
join e�itimBilgileri
on i�Arayan.i�ArayanID=e�itimBilgileri.i�ArayanID;








--VIEWS
--LOG KAYITLARI

create view basvurlanPozisyonlar
as
select i��lanlar�.pozisyon,ba�vurular.* from ba�vurular 
join i��lanlar�
on ba�vurular.ilanID=i��lanlar�.ilanID

create view adreslereG�reLogsay�lar�
as
select i�Arayan.adres,count(logKay�tlar�.i�ArayanID)as sayi from i�Arayan 
join logKay�tlar�
on i�Arayan.i�ArayanID=logKay�tlar�.i�ArayanID
group by i�Arayan.adres;







