/* VERÝ TABANI  DERSÝ SORGULAR MODÜLÜ ÖRNEK ÇALIÞMALARI */
--VERÝ TABANI OLUÞTURMA
create database Pazarlama
--Veritabanýný Silme
--drop database Pazarlama

--Kullanýlacak Veritabaný Belirleme
use Pazarlama

--Tablo Oluþturma
create table tblMusteri(
ID int primary key identity(1,1),
AdSoyad nvarchar(50),
DogumTarihi date,
Tel varchar(20),
Adres nvarchar(150),
) 
--Tablo Silme
--drop table tblMusteri

--Tablo Kayýt Ekleme
insert into tblMusteri(AdSoyad,DogumTarihi,Tel,Adres)
values('Fatma Altay','1996-04-29','322 678 89 99','Ahmet Özcan Cad.'),
('Aynur Uluþan','1996-11-29','322 678 89 99','Nalçacý Cad.'),
('Hafize Güngör','1995-10-29','322 678 89 99','Alaadin  Cad.'),
('Kübra D. Kahya','1996-04-29','322 678 89 99','LaleBahçe Cad.'),
('Emine Kamacý','1995-05-29','322 678 89 99','Muhacir Cad.')

------ÝLÝÞKÝSEL TABLO YAPMA-----

create table tblBirim(
ID int primary key identity(1,1),
BirimAd nvarchar (20)

)
insert into tblBirim values('Satýþ')
,('Depo')
,('Muhasebe')
,('Bilgi Ýþlem')
,('Ýdare')

create table tblPersonel(
ID int primary key identity(1,1),
Ad nvarchar(30),
Soyad nvarchar(20),
Maas money,
Eposta nvarchar(150),
BirimID int references tblBirim(ID) 
)

insert into tblPersonel
values('Adem',' Yerebakan',2200,'aa@hotmail.com',1)
,('Ece',' Gün',1500,'aa@hotmail.com',3)
,('Murat',' Apak',3000,'aa@hotmail.com',5)
,('Deniz',' Gece',2400,'aa@hotmail.com',4)
,('Melek',' Kader',1800,'aa@hotmail.com',2)
,('Emre',' Çalan',2100,'aa@hotmail.com',1)


--Seçme Sorgusu----
select * from tblMusteri
select * from tblBirim
select * from tblPersonel
-------------------------------------
--Tek Bir Alan Seçme
select AdSoyad from tblMusteri
--Birden Alaný Seçme
select AdSoyad,DogumTarihi from tblMusteri
--Birden Alaný Yer Deðiþtirerek Seçme 
select DogumTarihi,AdSoyad from tblMusteri

--Ýstenilen Kaydý veya Kayýtlarý Getirme

--Id'si 1 olan kaydý getirir
select * from tblMusteri
where ID=18

--Id'si 3 ve 2 olan kayýtlarý getirir
select * from tblMusteri
where ID=18 or ID=17

--AdSoyadý 'Fatma Altay' olaný getirir
select *from tblMusteri
where AdSoyad='Fatma Altay'

--Id'si 1 olan kaydý siler
delete from tblMusteri
where ID=19

--Kayýt Güncelleme
update tblMusteri
set AdSoyad='Arif UYSAL'
where ID=16

select * from tblMusteri
update tblMusteri
set AdSoyad='Arif UYSAL',DogumTarihi='1976-10-01',Adres='Mut Mersin'
where ID=16
select * from tblMusteri


--tblPersonel de bulunan maaþý 2000 den düþük kayýtlarý getirir
select * from tblPersonel
where Maas<=2000

--tblPersonel de bulunan maaþý 2000 den yüksek ve 2500 den düþük kayýtlarý getirir
select * from tblPersonel
where Maas>2000 and Maas<2500

--tblPersonel de bulunan maaþý 2000 den yüksek ve 2500 den düþük kayýtlarý getirir
select * from tblPersonel
where Maas between 2000 and 2500

select * from tblMusteri
where DogumTarihi>'1900-1-1'

select Ad+''+Soyad as 'Personel Adý Soyadý',Maas
from tblPersonel 
where Maas between 1500 and 2500

--Adý e harfi ile biten personelin adýný ve soyadýný 
--ayný kolonda getiren sql sorgusu 
select Ad+''+Soyad AdSoyad
from tblPersonel
where Ad Like '%e'

--Adýn içinde  e harfi bulunan personelin adýný ve soyadýný 
--ayný kolonda getiren sql sorgusu 
select Ad+''+Soyad AdSoyad
from tblPersonel
where Ad Like '%e%'

--Adý e harfi ile baþlayan personelin adýný ve soyadýný 
--ayný kolonda getiren sql sorgusu 
select Ad+''+Soyad AdSoyad
from tblPersonel
where Ad Like 'e%'

--Personel Tablosunda maaþý 3000 eþit olaný çaðýrýr.
select * from tblPersonel 
where Maas=3000

--Personel Tablosunda maaþý 3000 eþit olmayanlarý çaðýrýr.
select * from tblPersonel 
where Maas!=3000
--Buda maasýn önüne gelir ve 3000 eþit olmayanlarý çaðýrýr.
select * from tblPersonel
where not Maas=3000

--Maaþý 2000 ýle 3000 arasýnda olmayan
select * from tblPersonel
where Maas not between 2000 and 3000

--Maasý 1500 olan personellerin listesini 1650.50 olarak 
--deðiþtiren sql sorgusunu yazýnýz
select * from tblPersonel
update tblPersonel
set Maas =1650.50
where Maas =1500.00


--Maasý .50 ile biten personellerin listesini veren sql sorgusunu yazýnýz
select * from tblPersonel
where Maas like '%.50'

--Personel Tablosuna Yeni bir Personel eklemek için:
insert into tblPersonel(Ad,Soyad)
values ('Abdurrezzak','Karatoprak')
select * from tblPersonel

--delete from tblPersonel
--where ID between 8 and 19

--PERSONEL TABLOSUNDA NULL YAZAN KAYITLARI GETÝRÝR
select * from tblPersonel 
where Maas is null

--PERSONEL TABLOSUNDA NULL YAZMAYAN KAYITLARI GETÝRÝR
select * from tblPersonel 
where Maas is not null

--KÜÇÜKTEN BÜYÜÐE DOÐRU SIRALAMA
select * from tblPersonel
order by Maas

--BÜYÜKTEN KÜÇÜÐE DOÐRU SIRALAMA
select * from tblPersonel
order by Maas desc

--MAASI AYNI OLANLARI ADLARINA GÖRE SIRALAMA
select * from tblPersonel
order by Maas desc,Ad asc

-----SQL SORGULARI------------

---UPPER()SOYADI BÜYÜK HARFE ÇEVÝRÝR
select p.Ad+' '+UPPER(p.Soyad)
from tblPersonel p

--LOWER()SOYADI KÜÇÜK HARFE ÇEVÝRÝR
select p.Ad+' '+LOWER(p.Soyad)
from tblPersonel p

--SUBSTRÝNG()SOYADIN 1 VE 3. KARAKTERLERÝNÝ ALIR.
select p.Ad+' '+SUBSTRING(p.Soyad,1,3)
from tblPersonel p

--LEFT()SOYADIN ÝLK 3 KARAKTERÝNÝ ALIR.
select p.Ad+' '+LEFT(p.Soyad,3)
from tblPersonel p

--RIGHT()SOYADIN SON 3 KARAKTERÝNÝ ALIR.
select p.Ad+' '+RIGHT(p.Soyad,3)
from tblPersonel p

--COUNT()BÝZE KAÇ KAYIT OLDUÐUNU DÖNDÜRÜR.
select COUNT(p.Soyad)
from tblPersonel p

--LEN()BÝZE KARAKTERLERÝ SAYAR DÖNDÜRÜR
select p.Ad,LEN(p.Soyad) as 'Soyad daki karakter sayýsý'
from tblPersonel p

--CHARINDEX()@ ÝÞARETÝNDEN SONRA KAÇ KARAKTER OLDUÐUNU BELÝRLER
select CHARINDEX('@',m.Eposta,1)
from tblPersonel m

----------METOTLARI ÝÇ ÝÇE KULLANMA--------

select UPPER(LEFT(p.Ad,2))
from tblPersonel p


select LEFT(p.Eposta,CHARINDEX('@',p.Eposta,1)-1)
from tblPersonel p

---SADECE HOTMAÝL.COM U ALIR
select RIGHT(Eposta,(LEN(Eposta)-(CHARINDEX('@',p.Eposta,1))))
from tblPersonel p


--ROUND()VÝRGÜLLÜ SAYILARI YUKARI YUVARLAR
--Virgülden sonra kaç haneye kadar yuvarlamamýzý saðlar
select ROUND(Maas,0)
from tblPersonel

--SAYISAL ALANDAKÝ VÝGÜLLÜ 5 VE ÜSTÜ SAYILARI YUKARI YUVARLAR
select ROUND(12345.56765756,1)
from tblPersonel

--FLOOR()KENDÝSÝNE VERÝLEN SAYILAN VÝRGÜLDEN SONRASAINI YOK SAYAR
select FLOOR(12345.56765756)
from tblPersonel

--------------------TARÝHSEL FONKSÝYONLAR---------------------------

--SÝSTEMÝN TARÝH VE SAATÝNÝ DÖNDÜRÜR
select GETDATE() as  GününTarihi
select *, CONVERT(VARCHAR, DogumTarihi, 104)  from tblMusteri

-----------------ÝNTERNETTTEN ALINTI--------------------------------

SELECT CONVERT(VARCHAR, GETDATE(), 0)     
--Sonuç : Jul 17 2009  4:43PM
SELECT CONVERT(VARCHAR, GETDATE(), 1)     
--Sonuç : 07/17/09
SELECT CONVERT(VARCHAR, GETDATE(), 2)     
--Sonuç : 09.07.17
SELECT CONVERT(VARCHAR, GETDATE(), 3)     
--Sonuç : 17/07/09
SELECT CONVERT(VARCHAR, GETDATE(), 4)     
--Sonuç : 17.07.09
SELECT CONVERT(VARCHAR, GETDATE(), 5)     
--Sonuç : 17-07-09
SELECT CONVERT(VARCHAR, GETDATE(), 6)     
--Sonuç : 17 Jul 09
SELECT CONVERT(VARCHAR, GETDATE(), 7)     
--Sonuç : Jul 17, 09
SELECT CONVERT(VARCHAR, GETDATE(), 8)     
--Sonuç : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 9)     
--Sonuç : Jul 17 2009  4:43:05:573PM
SELECT CONVERT(VARCHAR, GETDATE(), 10)    
--Sonuç : 07-17-09
SELECT CONVERT(VARCHAR, GETDATE(), 11)    
--Sonuç : 09/07/17
SELECT CONVERT(VARCHAR, GETDATE(), 12)    
--Sonuç : 090717
SELECT CONVERT(VARCHAR, GETDATE(), 13)    
--Sonuç : 17 Jul 2009 16:43:05:590
SELECT CONVERT(VARCHAR, GETDATE(), 14)    
--Sonuç : 16:43:05:590
SELECT CONVERT(VARCHAR, GETDATE(), 20)    
--Sonuç : 2009-07-17 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 21)    
--Sonuç : 2009-07-17 16:43:05.590
SELECT CONVERT(VARCHAR, GETDATE(), 22)    
--Sonuç : 07/17/09  4:43:05 PM
SELECT CONVERT(VARCHAR, GETDATE(), 23)    
--Sonuç : 2009-07-17
SELECT CONVERT(VARCHAR, GETDATE(), 24)    
--Sonuç : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 25)    
--Sonuç : 2009-07-17 16:43:05.590
SELECT CONVERT(VARCHAR, GETDATE(), 100)   
--Sonuç : Jul 17 2009  4:43PM
SELECT CONVERT(VARCHAR, GETDATE(), 101)   
--Sonuç : 07/17/2009
SELECT CONVERT(VARCHAR, GETDATE(), 102)   
--Sonuç : 2009.07.17
SELECT CONVERT(VARCHAR, GETDATE(), 103)   
--Sonuç : 17/07/2009
SELECT CONVERT(VARCHAR, GETDATE(), 104)   
--Sonuç : 17.07.2009
SELECT CONVERT(VARCHAR, GETDATE(), 105)   
--Sonuç : 17-07-2009
SELECT CONVERT(VARCHAR, GETDATE(), 106)   
--Sonuç : 17 Jul 2009
SELECT CONVERT(VARCHAR, GETDATE(), 107)   
--Sonuç : Jul 17, 2009
SELECT CONVERT(VARCHAR, GETDATE(), 108)   
--Sonuç : 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 109)   
--Sonuç : Jul 17 2009  4:43:05:607PM
SELECT CONVERT(VARCHAR, GETDATE(), 110)   
--Sonuç : 07-17-2009
SELECT CONVERT(VARCHAR, GETDATE(), 111)   
--Sonuç : 2009/07/17
SELECT CONVERT(VARCHAR, GETDATE(), 112)   
--Sonuç : 20090717
SELECT CONVERT(VARCHAR, GETDATE(), 113)   
--Sonuç : 17 Jul 2009 16:43:05:607
SELECT CONVERT(VARCHAR, GETDATE(), 114)   
--Sonuç : 16:43:05:620
SELECT CONVERT(VARCHAR, GETDATE(), 120)   
--Sonuç : 2009-07-17 16:43:05
SELECT CONVERT(VARCHAR, GETDATE(), 121)   
--Sonuç : 2009-07-17 16:43:05.620
SELECT CONVERT(VARCHAR, GETDATE(), 126)   
--Sonuç : 2009-07-17T16:43:05.620
SELECT CONVERT(VARCHAR, GETDATE(), 127)   
--Sonuç : 2009-07-17T16:43:05.620

------------------------------------------------------
------------------------------------------------------

--BÝR TARÝHÝN ÝÇÝNDEN YILI ALMAK ÝÇÝN KULLANILIR
select YEAR(GETDATE())
select YEAR(DogumTarihi) from tblMusteri

--BÝR TARÝHÝN ÝÇÝNDEN AY'I ALMAK ÝÇÝN KULLANILIR
select MONTH(DogumTarihi) from tblMusteri

--BÝR TARÝHÝN ÝÇÝNDEN GÜN ALMAK ÝÇÝN KULLANILIR
select DAY(DogumTarihi) from tblMusteri

--BÝR TARÝHE GÜN EKLEMEK ÝÇÝN KULLANILIR
select DATEADD(DD,10,GETDATE())

--BÝR TARÝHE AY EKLEMEK ÝÇÝN KULLANILIR
select DATEADD(MM,10,GETDATE())

--BÝR TARÝHE YIL EKLEMEK ÝÇÝN KULLANILIR
select DATEADD(YY,10,GETDATE())

-------------------------------------------------------
--VERÝLEN ÝKÝ TARÝH ARASINDAKÝ YIL FARKINI ALMAK
select DATEDIFF(YY,'1996-04-29',GETDATE())

--VERÝLEN ÝKÝ TARÝH ARASINDAKÝ AY FARKINI ALMAK
select DATEDIFF(MM,'1996-04-29',GETDATE())

--VERÝLEN ÝKÝ TARÝH ARASINDAKÝ GÜN FARKINI ALMAK
select DATEDIFF(DD,'1996-04-29',GETDATE())

--VERÝLEN ÝKÝ TARÝH ARASINDAKÝ SAAT FARKINI ALMAK
select DATEDIFF(HH,'1996-04-29',GETDATE())

--VERÝLEN ÝKÝ TARÝH ARASINDAKÝ DAKÝKA FARKINI ALMAK
select DATEDIFF(MI,'1996-04-29',GETDATE())

--VERÝLEN ÝKÝ TARÝH ARASINDAKÝ SANÝYE FARKINI ALMAK
select DATEDIFF(SS,'1996-04-29',GETDATE())


/******************GRUPLAMA FONKSÝYONLARI*******************/

--KAÇ KAYIT OLDUÐUNU SAYAR
select COUNT(BirimID)
from tblPersonel 

--BÝR ALANDAKÝ VERÝLERÝN TOPLAMI
select SUM(Maas)
from tblPersonel

--BirimID=1 OLANLARIN PERSONELLERÝN MAASLARININ TOPLAMI
select SUM(Maas) from tblPersonel
where BirimID=1

--AVG ORTALAMA ALIR
select AVG(Maas) from tblPersonel

--BirimID=1 OLANLARIN PERSONELLERÝN ORTALAMA MAASLARI
select AVG(Maas) from tblPersonel
where BirimID=1

--BÝR KAYIT KÜMESÝNDEKÝ EN BÜYÜK DEÐERÝ DÖNDÜRÜR
select MAX(Maas)from tblPersonel

--BÝR KAYIT KÜMESÝNDEKÝ EN KÜÇÜK DEÐERÝ DÖNDÜRÜR
select MIN(Maas) from tblPersonel

/**********************GRUPLAYARAK SORGULAMA********************/

--PERSONELLERÝN MAAÞ TOPLAMI BÝRÝME GÖRE GRUPLAYARAK GÖSTERME
select SUM(Maas) ,BirimID from tblPersonel
group by BirimID

--PERSONELLERÝN MAAÞ TOPLAMI BÝRÝME GÖRE GRUPLAYARAK ORTALAMALARINI GÖSTERME
select AVG(Maas) ,BirimID from tblPersonel
group by BirimID

--PERSONELLERÝN MAAÞ TOPLAMI BÝRÝME GÖRE 
--GRUPLAYARAK EN BÜYÜK ORTALAMAYI GÖSTERME
select MAX(Maas) ,BirimID from tblPersonel
group by BirimID

--PERSONELLERÝN MAAÞ TOPLAMI BÝRÝME GÖRE 
--GRUPLAYARAK EN KÜÇÜK ORTALAMAYI GÖSTERME
select MIN(Maas) ,BirimID from tblPersonel
group by BirimID

/**************************SORULAR****************************/
/***************************5.GRUP****************************/
--1.SORU)tblMusteri Tablosundaki kiþilerin hepsinin ayrý þekilde toplam yaþadýklarý gün sayýsýný bulunuz.
select DATEDIFF(DD,DogumTarihi,GETDATE()) GunSayisi from tblMusteri

--2.SORU)tblMusteri Tablosundaki kiþilerin hepsinin ayrý þekilde toplam yaþadýklarý ay sayýsýný bulunuz.
select DATEDIFF(MM,DogumTarihi,GETDATE()) AySayisi from tblMusteri

--3.SORU)tblMusteri Tablosundaki kiþilerin hepsinin ayrý þekilde toplam yaþadýklarý yýl sayýsýný bulunuz.
select DATEDIFF(YYYY,DogumTarihi,GETDATE()) YýlSayisi from tblMusteri

--4.SORU)tblMusteri Tablosundaki Müþterilerin doðduklarý yýllara 1 yýl ekleyiniz.
select DATEADD(YYYY,1,DogumTarihi) DogumTarihi from tblMusteri

--5.SORU)tblMusteri Tablosundaki Müþterilerin doðduklarý aylarýn toplamýný bulunuz.
select SUM(MONTH(DogumTarihi)) from tblMusteri

--6.SORU)tblPersonel tablosundaki Muhasebe biriminde çalýþan personel sayýsýný yazýnýz.
select BirimID from tblPersonel
where BirimID=4

--7.SORU)tblMusteri  Tablosunda kaç kayýt olduðunu gösteriniz.
select COUNT(ID) from tblMusteri

--8.SORU)tblMusteri Tablosunda yaþadýklarý günlerin ortalamasýný bulunuz.
select AVG(DATEDIFF(DD,DogumTarihi,GETDATE()))  from tblMusteri

--9.SORU))tblMusteri Tablosundaki 1996 yýlýnda doðanlarý çaðýrýnýz.
select * from tblMusteri where YEAR(DogumTarihi)=1996

--10.SORU)tblMusteri Tablosunda doðum günleri ayný olanlarý adlarýna göre sýralayýnýz.
select *  from tblMusteri
Order by DogumTarihi desc,AdSoyad asc

--11.SORU)tblMusteri Tablosunda müþterilerin yaþadýklarý gün sayýlarý arasýnda en büyük olaný bulunuz.
select MAX(DATEDIFF(DD,DogumTarihi,GETDATE())) from tblMusteri

--12.SORU)tblMusteri Tablosunda müþterilerin yaþadýklarý gün sayýlarý arasýnda en küçük olaný bulunuz.
select MIN(DATEDIFF(DD,DogumTarihi,GETDATE())) from tblMusteri

select top(5)* from tblMusteri
order by ID desc

select top(1)*from tblMusteri
order by NEWID() 

create view vwBirimPersonel as
select b.BirimAd,p.Ad,p.Soyad
from tblBirim b
join tblPersonel p on b.ID=p.BirimID