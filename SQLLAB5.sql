
--- 1. Hãy xây dựng hàm đưa ra tên hangsx khi nhập vào masp từ bàn phím
create function fn_Timhang(@masp nvarchar(10))
returns nvarchar(20)
as
begin
declare @ten nvarchar(20)
set @ten = (select tenhang from Hangsx inner join sanpham on hangsx.mahangsx = sanpham.mahangsx
where masp = @masp)
return @ten
end

select dbo.fn_Timhang('SP01')
 
 ---2. Hãy xây dựng hàm đưa ra tổng giá trị nhập từ năm nhập x đên năm nhập y, với x, y được nhập từ bàn phím
create function fn_thongkenhaptheonam(@x int,@y int) returns int
as
begin
declare @tongtien int
select @tongtien = sum(soluongN*dongiaN)
from nhap
where year(ngaynhap) between @x and @y
return @tongtien
end

SELECT dbo.fn_thongkenhaptheonam('2019', '2020')
---3. hãy viết hàm thống kê số lượng thay đổi nhập xuất của tên sp x trong năm y, với x, y nhập từ bàn phím
create function fn_thongkenhapxuat(@x int,@y int)
returns int
as
begin
declare @tongsoluongnx int
select @tongsoluongnx = sum(soluongN*soluongX)
from xuat,Sanpham
where year(Nhap.Ngaynhap*Xuat.ngayxuat)=@y
return @tongsoluongnx
end

---4. Hãy xây dựng hàm đưa ra tổng giá trị nhập từ ngày nhập x đên ngày nhập y, với x, y được nhập từ bàn phím
create function fn_thongkenhaptheongay(@x int,@y int) returns int
as
begin
declare @tongtien int
select @tongtien = sum(soluongN*dongiaN)
from nhap
where day(ngaynhap) between @x and @y
return @tongtien 
end

SELECT dbo.fn_thongkenhaptheongay('07', '14')

---5.

---6. hãy xây dựng hàm thống kê nhân viên mỗi phòng với tên phòng nhập từ bàn phím

create function fn_Thongkesoluongnhanvien(@Phong nvarchar(10))
returns int
as
begin
declare @ten nvarchar(20)
select @ten = count(NV.Phong)
from Nhanvien NV
where NV.Phong = @Phong
return @ten
end

select dbo.fn_Thongkesoluongnhanvien('Kế toán')

---8. Hãy viết hàm trả về sđt của nhân viên đã xuất số hóa đơn x, với x nhập từ bàn phím
create function fn_Sodtnhanvien(@sohd nvarchar(20))
returns nvarchar(20)
as
begin
declare @sdt nvarchar(20)
select @sdt = count(NV.Sodt)
from Nhanvien NV
where NV.Sodt = @sohd
return @sdt
end

drop function fn_Sodtnhanvien

select dbo_Sodtnhanvien('N01')

---10.
create function fn_tốngluong(@Tenhang nvarchar(10))
returns int
as
begin
declare @ten nvarchar(20)
set @ten = (select Tenhang from Hangsx inner join Mahangsx
on Hangsx.Mahangsx = Nhanvien.Phong
where Phong = @Tenhang)
return @ten
end

 

