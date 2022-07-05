CREATE DATABASE EXAM1
USE EXAM1

CREATE TABLE CARS(
ID INT IDENTITY,
BRAND NVARCHAR(50),
PRICE MONEY,
CARTYPE NVARCHAR(50)
)

CREATE TABLE CLIENTS(
ID INT IDENTITY,
SURNAME NVARCHAR(50),
NAME NVARCHAR(50),
FATHERNAME NVARCHAR(50),
ADRESS NVARCHAR(50),
PHONE INT,
MAIL NVARCHAR(50),
DATEOFISSUE DATE,
RETURNDATE DATE
)

CREATE TABLE MATUKI(
ID INT IDENTITY,
MAT NVARCHAR(MAX)
)

SELECT SURNAME, NAME, FATHERNAME, PHONE FROM CLIENTS
WHERE SURNAME = 'HE%'

SELECT BRAND, CARTYPE, PRICE FROM CARS
WHERE PRICE = MAX(PRICE)

SELECT BRAND, DATEOFISSUE FROM CARS
JOIN CLIENTS ON CARS.ID = CLIENTS.ID
WHERE DATEOFISSUE = AVG(DATEOFISSUE)


UPDATE CARS
SET PRICE = PRICE * 1.15


Create procedure insertClient(@Name nvarchar(50),@Surname nvarchar(50),@Patronymic nvarchar(50),@Adress nvarchar(50),@Email nvarchar(50),@PhoneNumber nvarchar(20))
as
begin
IF(@Email not in (SELECT MAIL from CLIENTS))
begin
insert into CLIENTS values (@Name,@@Name)
end
end


create trigger NotInsertClient
on CLIENTS
instead of Insert
as
begin
declare @Name nvarchar(50) = (select Name from inserted)
if(@Name not in (select * from MATUKI))
begin
insert CLIENTS select NAME,SURNAME,FATHERNAME ,ADRESS ,MAIL ,PHONE from inserted
end
else
print ('Name is not available')
end



