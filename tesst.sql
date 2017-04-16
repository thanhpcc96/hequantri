CREATE Database quanlytiemcoffee
GO 
USE quanlytiemcoffee
GO



a.	Tạo bảng
CREATE TABLE  tblNHANVIEN( 
maNV varchar(10) Not null, 
hotenNV nvarchar(20),
sdtNV varchar(13),
mucluong float,
gioitinh nvarchar(10),
ngaysinh datetime,
quequan nvarchar(20),
)
GO

CREATE TABLE tblKHACHHANG(
maKH varchar(10) Not null,
hotenKH nvarchar(20),
sdtKH varchar(13),
diachi nvarchar(20),
)
GO 

CREATE TABLE tblHOADON(
maHD varchar(20) Not null,
ngaylap datetime,
maNV varchar(10),
maKH varchar(10),
)
GO

CREATE TABLE tblMATHANG(
maMH varchar(10) Not null ,
tenMH nvarchar(30),
mota nvarchar(40),
dongia float,
)
GO

CREATE TABLE NHANVIEN_NGOAINGU(
maNV varchar(10) not null,
ngoaingu nvarchar(20) not null,
)
GO

CREATE TABLE tblChitietHD(
maHD varchar(20) not null,
maMH varchar(10) not null,
soluong int,
)


b.	Tạo PK
ALTER TABLE tblNHANVIEN
ADD CONSTRAINT PK_NV PRIMARY KEY(manv)

GO
ALTER TABLE tblKHACHHANG
ADD CONSTRAINT PK_KH PRIMARY KEY (maKH)

GO
ALTER TABLE tblHOADON
ADD CONSTRAINT PK_HD PRIMARY KEY (maHD)

GO
ALTER TABLE tblMATHANG
ADD CONSTRAINT PK_MH PRIMARY KEY (maMH)


GO
ALTER TABLE NHANVIEN_NGOAINGU
ADD CONSTRAINT PK_NV_NN PRIMARY KEY(maNV,ngoaingu)

GO 
ALTER TABLE tblChitietHD
ADD CONSTRAINT PK_ChitietHD PRIMARY KEY(maHD,maMH)



c.	Tạo FK
ALTER TABLE tblHOADON
ADD CONSTRAINT FK_HOADON_NHANVIEN
FOREIGN KEY (maNV)
REFERENCES tblNHANVIEN (maNV)

GO

ALTER TABLE NHANVIEN_NGOAINGU
ADD CONSTRAINT FK_NHANVIEN_NGOAINGU_NHANVIEN
FOREIGN KEY (maNV)
REFERENCES tblNHANVIEN (maNV)

GO

ALTER TABLE tblHOADON
ADD CONSTRAINT FK_HOADON_KHACHHANG
FOREIGN KEY (maKH)
REFERENCES tblKHACHHANG (maKH)

GO

ALTER TABLE tblChitietHD
ADD CONSTRAINT FK_ChitietHD_HD
FOREIGN KEY (maHD)
REFERENCES tblHOADON (maHD)

GO

ALTER TABLE tblChitietHD
ADD CONSTRAINT FK_ChiTiet_MATHANG
FOREIGN KEY (maMH)
REFERENCES tblMATHANG(maMH)

d.	Tạo CK
ALTER TABLE tblNHANVIEN
ALTER COLUMN gioitinh nvarchar(3)

ALTER TABLE tblNHANVIEN
ADD CONSTRAINT CK_NV_GT CHECK(gioitinh in (N'Nam',N'Nữ'))


e.	Tạo các CONSTRAINT
ALTER TABLE tblMATHANG
ADD CONSTRAINT UNI_tblMATHANG UNIQUE(tenMH)

ALTER TABLE tblNHANVIEN
ADD CONSTRAINT UNI_tblNHANVIEN UNIQUE(hotenNV)


f.	Tạo Index
CREATE INDEX Idx_tenNV ON tblNHANVIEN(maNV)
CREATE INDEX Idx_tenKH ON tblKHACHHANG(hotenKH)
CREATE INDEX Idx_tenMH ON tblMATHANG(tenMH)
CREATE INDEX Idx_maHD  ON tblHOADON(maHD)
CREATE INDEX Idx_NV_NN ON NHANVIEN_NGOAINGU(maNV,ngoaingu)
CREATE INDEX Idx_ChitietHD ON tblChitietHD(maHD,maMH) 


g.	Xóa trường thứ hai ở mỗi bảng
ALTER TABLE tblNHANVIEN DROP COLUMN hotenNV
ALTER TABLE tblKHACHHANG DROP COLUMN hotenKH
ALTER TABLE tblHOADON DROP COLUMN ngaylap
ALTER TABLE tblMATHANG DROP COLUMN tenMH
ALTER TABLE NHANVIEN_NGOAINGU DROP CONSTRAINT PK_NV_NN
ALTER TABLE NHANVIEN_NGOAINGU DROP COLUMN ngoaingu
ALTER TABLE tblChitietHD DROP CONSTRAINT PK_ChitietHD
ALTER TABLE tblChitietHD DROP COLUMN maMH

h.	Thêm lại các trường vừa xóa vào mỗi bảng: 
ALTER TABLE tblNHANVIEN ADD hotenNV nvarchar(20)
ALTER TABLE tblKHACHHANG ADD hotenKH nvarchar(20) 
ALTER TABLE tblHOADON ADD ngaylap datetime
ALTER TABLE tblMATHANG ADD tenMH nvarchar(20)
ALTER TABLE NHANVIEN_NGOAINGU ADD ngoaingu nvarchar(20)
ALTER TABLE tblChitietHD ADD maMH varchar(10) 



 I+j. Nhập bản ghi
--1.Nhập bản ghi tblNHANVIEN:
INSERT INTO tblNHANVIEN(maNV,hotenNV,sdtNV,mucluong,gioitinh,ngaysinh,quequan) 
VALUES
('NV01',N'Thái Hoàng Linh','0925890228',2000000,N'Nam','12/03/1996',N'Hà Nội'),
('NV02',N'Thái Gia Huy','01636956081',3000000,N'Nam','01/02/2000',N'Hà Nội'),
('NV03',N'Nguyễn Thu Vân','0925890229',4000000,N'Nữ','12/03/1997',N'Hà Nội'),
('NV04',N'STEPHEN CURRY','0123456789',6000000,N'Nam','12/12/1984',N'Los Angeles'),
('NV05',N'KEVIN DURANT','0942457682',2500000,N'Nam','12/08/1978',N'Los Angeles')

--2.Nhập bản ghi NHANVIEN_NGOAINGU
INSERT INTO NHANVIEN_NGOAINGU(maNV,ngoaingu)
VALUES	('NV01',N'Tiếng Việt'),
		('NV01',N'Tiếng Anh'),
		('NV01',N'Tiếng Hàn'),
		('NV01',N'Tiếng Nhật'),
		('NV01',N'Tiếng Trung Quốc')
                      
		

INSERT INTO NHANVIEN_NGOAINGU(maNV,ngoaingu)
 VALUES	('NV02',N'Tiếng Việt'),
		('NV02',N'Tiếng Anh'),
		('NV02',N'Tiếng Hàn'),
		('NV02',N'Tiếng Ý'),
		('NV02',N'Tiếng Pháp')
		 

		
INSERT INTO NHANVIEN_NGOAINGU(maNV,ngoaingu)
VALUES	('NV03',N'Tiếng Việt'),
		('NV03',N'Tiếng Anh'),
		('NV03',N'Tiếng Trung Quốc'),
		('NV03',N'Tiếng Nhật'),
		('NV03',N'Tiếng Hàn')
		 

		
		
INSERT INTO NHANVIEN_NGOAINGU(maNV,ngoaingu)
VALUES	('NV04',N'Tiếng Việt'),
		('NV04',N'Tiếng Anh'),
		('NV04',N'Tiếng Đức'),
		('NV04',N'Tiếng Nhật'),
		('NV04',N'Tiếng Thái')
		 

INSERT INTO NHANVIEN_NGOAINGU(maNV,ngoaingu)
VALUES	('NV05',N'Tiếng Việt'),
		('NV05',N'Tiếng Anh'),
		('NV05',N'Tiếng Hàn'),
		('NV05',N'Tiếng Nhật'),
		('NV05',N'Tiếng Đức')
	




--3.Nhập bản ghi tblKHACHHANG
INSERT INTO tblKHACHHANG(maKH,hotenKH,sdtKH,diachi)
VALUES	('KH01',N'Nguyễn Quang Hợp','0123456806',N'Hai Bà Trưng'), 
		('KH02',N'Nguyễn Hải Long','0982462654',N'Hai Bà Trưng'),
		('KH03',N'Nguyễn Viết Toán','0986623732',N'Gia Lâm'),
		('KH04',N'Phương Xuân Hoàng','01242890567',N'Lò Đúc'),
		('KH05',N'Vũ Hoàng Phúc','0972580053',N'Cầu Giấy')	
		 



--4.Nhập bản ghi tblHOADON
INSERT INTO tblHOADON(maHD,ngaylap,maNV,maKH)
VALUES	('HD01','2016/01/23','NV01','KH01'),
		('HD02','2016/02/22','NV01','KH01'),
		('HD03','2016/11/26','NV01','KH01'),
		('HD04','2016/03/14','NV01','KH01'),
		('HD05','2016/04/24','NV01','KH01'),
		('HD06','2016/07/20','NV01','KH01')
		 

INSERT INTO tblHOADON(maHD,ngaylap,maNV,maKH)
VALUES
		('HD07','2016/02/22','NV02','KH02'),
		('HD08','2016/11/26','NV02','KH02'),
		('HD09','2016/03/14','NV02','KH02'),
		('HD10','2016/04/24','NV02','KH02')
		 

		

INSERT INTO tblHOADON(maHD,ngaylap,maNV,maKH)
VALUES	('HD11','2016/01/23','NV03','KH03'),
		('HD12','2016/02/22','NV03','KH03'),
		('HD13','2016/11/26','NV03','KH03'),
		('HD14','2016/03/14','NV03','KH03'),
		('HD15','2016/04/24','NV03','KH03'),
		('HD16','2016/02/10','NV03','KH03'),
		('HD17','2016/01/02','NV03','KH03')



INSERT INTO tblHOADON(maHD,ngaylap,maNV,maKH)
VALUES	
		('HD18','2016/11/26','NV04','KH04'),
		('HD19','2016/03/14','NV04','KH04'),
		('HD20','2016/04/24','NV04','KH04')
		 

		
INSERT INTO tblHOADON(maHD,ngaylap,maNV,maKH)
VALUES	('HD21','2016/01/23','NV05','KH05'),
		('HD22','2016/02/22','NV05','KH05'),
		('HD23','2016/11/26','NV05','KH05'),
		('HD24','2016/03/14','NV05','KH05'),
		('HD25','2016/04/24','NV05','KH05')
		 





--5.Nhập bản ghi tblMATHANG
INSERT INTO tblMATHANG(maMH,tenMH,mota,dongia)
VALUES	('MH01',N'Sữa chua đánh đá',N'Sữa chua vinamilk',25000),
        		('MH02',N'Sữa chua nếp cẩm',N'Sữa chua có rượu nếp',30000),
		('MH03',N'Chanh leo',N'Chanh leo tươi nhập khẩu',35000),
		('MH04',N'Coffee sữa',N'Cà phê sữa thơm ngon',27000),
		('MH05',N'Coffee đen',N'Cà phê hơi có vị đắng',30000),
		('MH06',N'Chocolate cookie',N'Trà sữa có bánh oreo',45000),
		('MH07',N'Nước ép bưởi',N'Nước bưởi thơm ngon dễ uống',37000),
		('MH08',N'Nước ép táo',N'Nước ép táo có táo miếng',37000),
		('MH09',N'Nước ép cóc',N'Nước ép cóc vị lạ',37000),
		('MH10',N'Nước ép dưa hấu',N'Nước ép dưa hấu giải khát',37000),
		('MH11',N'Nước ép cam',N'Nước ép cam có tép',37000),
		('MH12',N'Nước ép dâu',N'Nước ép dâu thơm ngon',37000),
		('MH13',N'Sinh tố bơ',N'Bơ ép thêm sữa đặc',40000),
		('MH14',N'Sinh tố mãng cầu',N'Mãng cầu giúp đẹp da',41000),
		('MH15',N'Sinh tố chuối',N'Thức uống dễ uống',36000),
		('MH16',N'Sinh tố me',N'Nước uống được ưa chuộng',42000),
		('MH17',N'Matcha trà xanh',N'Vị trà xanh thơm ngon',45000),
		('MH18',N'Matcha bạc hà ',N'Thơm mát tận họng',38000),
		('MH19',N'Trà chanh',N'Chanh tươi giải khát',12000),
		('MH20',N'Trà đào',N'Trà đào có đào miếng',15000),
		('MH21',N'Trà xanh bạc hà',N'Trà có vị bạc hà',28000),
		('MH22',N'Trà vị quất',N'Thơm ngon',32000),
		('MH23',N'Trà mật ong',N'Mật ong giúp chống ho',39000),
		('MH24',N'Trà sữa khoai môn',N'Thức uống được ưa chuộng',39000),
		('MH25',N'Trà sữa mật ong ',N'Thơm vị mật ong',42000),
		('MH26',N'Trà sữa socola',N'Socola thơm ngon',47000),
		('MH27',N'Trà sữa trân châu',N'Thức uống cổ điển',28000),
		('MH28',N'Trà sữa thạch rau câu',N'Thạch rau câu nhiều vị',39000),
		('MH29',N'Trà sữa thạch dừa',N'Thạch dừa nhiều hương vị',44000),
		('MH30',N'Trà sữa thạch pudding',N'Hạt pudding nhiều  vị',44000),
		('MH31',N'Trà sữa lô hội',N'Thơm ngon',44000),
		('MH32',N'Trà sữa nho',N'Vị nho thơm ngon',34000),
		('MH33',N'Trà sữa đào',N'Vị đào thơm ngon',45000),
		('MH34',N'Trà sữa dâu tây',N'Vị dâu truyền thống',44000),
		('MH35',N'Trà sữa dứa',N'Vị dừa đặc trưng',39000),
		('MH36',N'Trà sữa vải',N'Vị vải mới lạ',43000),
		('MH37',N'Trà sữa va-ni',N'Vị trà sữa béo ngậy',33000),
		('MH38',N'Trà sữa xoài',N'Hương vị mới có',47000),
		('MH39',N'Trà sữa đường đen',N'Hương vị đang hot',59000),
		('MH40',N'Trà sữa hạt dẻ',N'Hạt dẻ lạ miệng',35000)

--6.Nhập bản ghi tblChitietHD
INSERT INTO tblChitietHD(maHD,maMH,soluong) 
VALUES	('HD01','MH01',2),
		('HD01','MH02',1),
		('HD02','MH03',1),
		('HD03','MH04',2),
		('HD03','MH05',3),
		('HD04','MH06',1),
		('HD05','MH07',1),
		('HD05','MH08',2),
		('HD06','MH09',1),
		('HD07','MH10',1),
		('HD07','MH11',3),
		('HD08','MH12',1),
		('HD08','MH13',1),
		('HD09','MH14',2),
		('HD10','MH15',1),
		('HD10','MH16',1),
		('HD11','MH17',3),
		('HD11','MH18',1),
		('HD12','MH19',2),
		('HD13','MH20',1),
		('HD14','MH21',1),
		('HD15','MH22',2),
		('HD15','MH23',1),
		('HD15','MH24',2),
		('HD16','MH25',1),
		('HD16','MH26',1),
		('HD17','MH27',2),
		('HD17','MH28',1),
		('HD18','MH29',2),
		('HD18','MH30',2),
		('HD18','MH31',2),
		('HD19','MH32',1),
		('HD20','MH33',1),
		('HD21','MH34',1),
		('HD21','MH35',1),
		('HD22','MH36',1),
		('HD23','MH37',1),
		('HD23','MH38',1),
		('HD24','MH39',2),
		('HD25','MH40',1)
		 
 
		 
   
		
k. Đặt ra các yêu cầu sửa đổi dữ liệu có 1 và có nhiều điều kiện và viết truy vấn thực hiện
--Sửa quê quán thành Nam Định của nhân viên có mã NV03 
UPDATE tblNHANVIEN
SET quequan=N'Nam Định'
WHERE maNV='NV03' 

--Tăng giá mặt hàng có mã MH26 lên 50000
UPDATE tblMATHANG
SET dongia=dongia+3000
WHERE maMH='MH26'


--Tăng lương cho nhân viên thêm 300000 có quê quán ở Hà Nội và là giới tính nam:
UPDATE tblNHANVIEN
SET mucluong=mucluong+300000
WHERE quequan=N'Hà Nội'
AND gioitinh=N'Nam'


l. Đặt ra các yêu cầu xóa dữ liệu có điều kiện và viết truy vấn:
--Xóa mặt hàng có đơn giá là 30000
ALTER TABLE tblChitietHD 
DROP CONSTRAINT FK_Chitiet_MATHANG

DELETE FROM tblMATHANG
WHERE dongia=30000

--Xóa nhân viên có quê quán ở Los Angeles và có giới tính là nam:
ALTER TABLE tblHOADON
DROP CONSTRAINT FK_HOADON_NHANVIEN

ALTER TABLE NHANVIEN_NGOAINGU
DROP CONSTRAINT FK_NHANVIEN_NGOAINGU_NHANVIEN

DELETE FROM tblNHANVIEN
WHERE quequan=N'Los Angeles'
AND gioitinh=N'Nam'
 
m+n. Tạo các Stored Procedure và gọi thực thi
CREATE PROCEDURE SP_tblNHANVIEN_themNV
@maNV varchar(10) ,
@hotenNV nvarchar(20),
@sdtNV varchar (13),
@mucluong float,
@gioitinh nvarchar(10),
@ngaysinh datetime,
@quequan nvarchar(20)
WITH RECOMPILE,ENCRYPTION
AS
BEGIN
IFEXISTS(SELECT*FROM dbo.tblNHANVIEN WHERE dbo.tblNHANVIEN.maNV=@maNV)
BEGIN
		PRINT N'Nhân viên đã tồn tại'
		RETURN
END
	INSERT INTO dbo.tblNHANVIEN 
	VALUES(@maNV,@hotenNV,@sdtNV,@mucluong,@gioitinh,@ngaysinh,@quequan)
END 
EXEC SP_tblNHANVIEN_themNV@maNV='NV06', @hotenNV=N'Nguyễn Minh Hiền', @sdtNV='0927563486', @mucluong=2500000,@gioitinh=N'Nam' ,@ngaysinh='08/08/1996', @quequan=N'Đà Nẵng'
EXEC SP_tblNHANVIEN_themNV @maNV='NV07', @hotenNV=N'Lê Đức Anh' ,@sdtNV='0927563879', @mucluong=3500000, @gioitinh=N'Nam', @ngaysinh='03/04/1996' ,@quequan=N'Cần Thơ'

EXEC SP_tblNHANVIEN_themNV @maNV='NV08', @hotenNV=N'Lê Hoàn Trang', @sdtNV='0124876456', @mucluong=4000000,@gioitinh=N'Nữ', @ngaysinh='10/08/1996', @quequan=N'Hà Nội'

EXEC SP_tblNHANVIEN_themNV @maNV='NV09',@hotenNV=N'Nguyễn Bích Ngọc', @sdtNV='01227563486', @mucluong=4500000,@gioitinh=N'Nữ', @ngaysinh='08/01/1997', @quequan=N'Hải Phòng'       
                   
EXEC SP_tblNHANVIEN_themNV @maNV='NV10', @hotenNV=N'Nguyễn Cát Ngọc', @sdtNV='0927564586', @mucluong=1800000,@gioitinh=N'Nam', @ngaysinh='01/09/1996', @quequan=N'Hà Nam'
 
--Tạo procedure thêm khách hàng:
CREATE PROCEDURE SP_tblKHACHHANG_themKH
@maKH varchar(10),
@hotenKH nvarchar(20),
@sdtKH varchar(13),
@diachi nvarchar(20)
WITH RECOMPILE,ENCRYPTION
AS 
BEGIN
	IF EXISTS( SELECT * FROM dbo.tblKHACHHANG WHERE dbo.tblKHACHHANG.maKH=@maKH)
BEGIN 
	PRINT N'Khách hàng đã tồn tại'
	RETURN
END
	INSERT INTO dbo.tblKHACHHANG VALUES (@maKH,@hotenKH,@sdtKH,@diachi)
END





EXEC SP_tblKHACHHANG_themKH @maKH='KH06', @hotenKH=N'Hồ Trần Nhật', @sdtKH='0925892239', @diachi=N'Hà Nội'
EXEC SP_tblKHACHHANG_themKH @maKH='KH07', @hotenKH=N'Lê Đức Huy', @sdtKH='0925892239', @diachi=N'Hà Nội'
EXEC SP_tblKHACHHANG_themKH @maKH='KH08', @hotenKH=N'Phạm Hải Đăng', @sdtKH='01225892239', @diachi=N'Hà Nội'
EXEC SP_tblKHACHHANG_themKH @maKH='KH09', @hotenKH=N'Nguyễn Phan Vũ Quân', @sdtKH='0125892239', @diachi=N'New York'
EXEC SP_tblKHACHHANG_themKH @maKH='KH10', @hotenKH=N'Phạm Quang Tuấn Đức', @sdtKH='0924768839', @diachi=N'Hà Nội'

--Tạo procedure thêm hóa đơn:
CREATE PROCEDURE SP_tblHOADON_themHD
@maHD varchar(10),
@ngaylap datetime,
@maNV varchar(10),
@maKH varchar(10)
WITH RECOMPILE,ENCRYPTION
AS
BEGIN 
IF EXISTS(SELECT * FROM dbo.tblHOADON WHERE dbo.tblHOADON.maHD=@maHD)
BEGIN
	PRINT N'Hóa đơn đã tồn tại'
	RETURN
END
	INSERT INTO dbo.tblHOADON VALUES(@maHD,@ngaylap,@maNV,@maKH)
END
EXEC SP_tblHOADON_themHD @maHD='HD26', @ngaylap='09/05/2016', @maNV='NV06', @maKH='KH06'
EXEC SP_tblHOADON_themHD @maHD='HD27', @ngaylap='09/07/2015', @maNV='NV07', @maKH='KH07'
EXEC SP_tblHOADON_themHD @maHD='HD28', @ngaylap='02/01/2006', @maNV='NV08', @maKH='KH08'
EXEC SP_tblHOADON_themHD @maHD='HD29', @ngaylap='01/05/2016', @maNV='NV09', @maKH='KH09'
EXEC SP_tblHOADON_themHD @maHD='HD30', @ngaylap='01/09/2016', @maNV='NV10', @maKH='KH10'



--Tạo procedure thêm mặt hàng:
CREATE PROCEDURE SP_tblMATHANG_themMH
@maMH varchar(10),
@tenMH nvarchar(30),
@mota nvarchar(40),
@dongia float
WITH RECOMPILE,ENCRYPTION
AS
BEGIN
IF EXISTS ( SELECT * FROM dbo.tblMATHANG WHERE dbo.tblMATHANG.maMH=@maMH)
BEGIN
	PRINT N'Mặt hàng đã tồn tại' 
	RETURN
END
	INSERT INTO dbo.tblMATHANG VALUES(@maMH,@tenMH,@mota,@dongia)
END

EXEC SP_tblMATHANG_themMH @maMH='MH41', @tenMH=N'Trà gừng', @mota=N' Trà giúp ấm cơ thể', @dongia=33000
EXEC SP_tblMATHANG_themMH @maMH='MH42', @tenMH=N'Trà gừng long nhân', @mota=N'Trà có thêm trân châu', @dongia=35000
EXEC SP_tblMATHANG_themMH @maMH='MH43', @tenMH=N'Trà sữa gừng', @mota=N'Trà gừng thêm sữa đặc', @dongia=34000
EXEC SP_tblMATHANG_themMH @maMH='MH44', @tenMH=N'Trà sữa long nhân', @mota=N'Trà thanh lọc', @dongia=37000
EXEC SP_tblMATHANG_themMH @maMH='MH45', @tenMH=N'Trà long nhân', @mota=N'Trà truyền thống', @dongia=40000
EXEC SP_tblMATHANG_themMH @maMH='MH46', @tenMH=N'Cà phê Hokkaido', @mota=N'Cà phê công nghệ Nhật', @dongia=46000
EXEC SP_tblMATHANG_themMH @maMH='MH47', @tenMH=N'Cà phê Mocha', @mota=N'Cà phê mới', @dongia=45000
EXEC SP_tblMATHANG_themMH @maMH='MH48', @tenMH=N'Cà phê hạt dẻ', @mota=N'Cà phê hương vị Á', @dongia=48000
EXEC SP_tblMATHANG_themMH @maMH='MH48', @tenMH=N'Cà phê Vani', @mota=N'Cà phê Vani béo ngậy', @dongia=38000
		 
--Tạo procedure thêm ngôn ngữ cho nhân viên:
CREATE PROCEDURE SP_NHANVIEN_NGOAINGU
@maNV varchar(10) ,
@ngoaingu nvarchar(20)
AS 
BEGIN
	IF EXISTS( SELECT * FROM dbo.NHANVIEN_NGOAINGU WHERE 
	maNV = @maNV AND NHANVIEN_NGOAINGU.ngoaingu=@ngoaingu)
		PRINT N'Ngôn ngữ đã có'
	ELSE
		INSERT INTO dbo.NHANVIEN_NGOAINGU VALUES(@maNV,@ngoaingu)
END

drop procedure SP_NHANVIEN_NGOAINGU

EXEC SP_NHANVIEN_NGOAINGU @maNV='NV06', @ngoaingu=N'Tiếng Việt'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV06', @ngoaingu=N'Tiếng Anh'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV06', @ngoaingu=N'Tiếng Đức'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV06', @ngoaingu=N'Tiếng Thái'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV06', @ngoaingu=N'Tiếng Trung Quốc'
		 

EXEC SP_NHANVIEN_NGOAINGU @maNV='NV07', @ngoaingu=N'Tiếng Việt'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV07', @ngoaingu=N'Tiếng Ý'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV07', @ngoaingu=N'Tiếng TBN'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV07', @ngoaingu=N'Tiếng Hàn'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV07', @ngoaingu=N'Tiếng Nhật'
		 

EXEC SP_NHANVIEN_NGOAINGU @maNV='NV08', @ngoaingu=N'Tiếng Việt'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV08', @ngoaingu=N'Tiếng Anh'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV08', @ngoaingu=N'Tiếng Nga'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV08', @ngoaingu=N'Tiếng BĐN'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV08', @ngoaingu=N'Tiếng Thái'


EXEC SP_NHANVIEN_NGOAINGU @maNV='NV09', @ngoaingu=N'Tiếng Việt'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV09', @ngoaingu=N'Tiếng Anh'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV09', @ngoaingu=N'Tiếng Pháp'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV09', @ngoaingu=N'Tiếng Lào'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV09', @ngoaingu=N'Tiếng Hà Lan'
		 

EXEC SP_NHANVIEN_NGOAINGU @maNV='NV10', @ngoaingu=N'Tiếng Việt'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV10', @ngoaingu=N'Tiếng Anh'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV10', @ngoaingu=N'Tiếng Nhật'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV10', @ngoaingu=N'Tiếng Hàn'
EXEC SP_NHANVIEN_NGOAINGU @maNV='NV10', @ngoaingu=N'Tiếng Thái'
		 


--Tạo procedure thêm chi tiết hóa đơn:
CREATE PROCEDURE SP_tblChitietHD
@maHD varchar(20) ,
@maMH varchar(10) ,
@soluong int
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.tblChitietHD WHERE
		maHD=@maHD AND dbo.tblChitietHD.maHD=@maHD)
		PRINT N'Hóa đơn này đã có'
	ELSE	
	INSERT INTO dbo.tblChitietHD VALUES (@maHD,@maMH,@soluong)
END
drop procedure SP_tblChitietHD

EXEC SP_tblChitietHD @maHD='HD26', @maMH='MH41', @soluong=1
EXEC SP_tblChitietHD @maHD='HD26', @maMH='MH42', @soluong=1
EXEC SP_tblChitietHD @maHD='HD27', @maMH='MH43', @soluong=1
EXEC SP_tblChitietHD @maHD='HD27', @maMH='MH44', @soluong=1
EXEC SP_tblChitietHD @maHD='HD28', @maMH='MH45', @soluong=1
EXEC SP_tblChitietHD @maHD='HD28', @maMH='MH46', @soluong=1
EXEC SP_tblChitietHD @maHD='HD29', @maMH='MH47', @soluong=1
EXEC SP_tblChitietHD @maHD='HD30', @maMH='MH48', @soluong=1
	 

o. Đặt ra các yêu cầu lấy dữ liệu
--Hiện số lượng khách hàng nam và nữ
SELECT gioitinh,COUNT (maNV) AS N'Số lượng nhân viên'
FROM tblNHANVIEN
GROUP BY gioitinh	


--Lấy các nhân viên biết tiếng Đức:
SELECT hotenNV,NGOAINGU
FROM tblNHANVIEN,NHANVIEN_NGOAINGU
WHERE tblNHANVIEN.maNV=NHANVIEN_NGOAINGU.maNV
AND ngoaingu=N'Tiếng Đức'
 


--Hiện tên mặt hàng bán chạy:
SELECT TOP 1 WITH TIES tenMH,SUM(soluong) AS Ketqua
FROM tblMATHANG,tblChitietHD
WHERE tblMATHANG.maMH=tblChitietHD.maMH
GROUP BY tenMH,tblMATHANG.maMH
ORDER BY Ketqua DESC
 



--Hiện tên mặt hàng bán kém :
SELECT TOP 1 WITH TIES tblMATHANG.maMH, tenMH, SUM(soluong) AS KQ
FROM tblMATHANG INNER JOIN tblChitietHD ON (tblMATHANG.maMH = tblChitietHD.maMH)
GROUP BY tblMATHANG.maMH, tenMH
ORDER BY KQ ASC
 

-- Đưa ra các nhân viên có tuổi >= 20
SELECT hotenNV, YEAR(getdate())-YEAR(ngaysinh) AS Tuoi
FROM tblNHANVIEN
WHERE YEAR(getdate())-YEAR(ngaysinh)>=20
 



--Đưa ra danh sách các loại ngôn ngữ:
SELECT ngoaingu 
FROM NHANVIEN_NGOAINGU
GROUP BY ngoaingu


--Đưa ra hóa đơn lập gần nhất:
SELECT  TOP 1 WITH TIES maHD, 
ngaylap FROM tblHOADON 
ORDER BY ngaylap DESC
 

p. Tạo các View tương ứng với truy vấn SELECT đã viết
--Tạo view hiện số lượng khách hàng
CREATE VIEW VW_Soluongkhachhang
AS
SELECT gioitinh,COUNT (maNV) AS N'Số lượng nhân viên'
FROM tblNHANVIEN
GROUP BY gioitinh

--Tạo view hiện nhân viên biết tiếng Đức
CREATE VIEW VW_NHANVIENBIETTIENGDUC
AS
SELECT hotenNV,NGOAINGU
FROM tblNHANVIEN,NHANVIEN_NGOAINGU
WHERE tblNHANVIEN.maNV=NHANVIEN_NGOAINGU.maNV
AND ngoaingu=N'Tiếng Đức'

--Tạo view hiện tên các mặt hàng bán chạy nhất:
CREATE VIEW VW_MATHANGBANCHAY
AS
SELECT TOP 1 WITH TIES tenMH,SUM(soluong) AS Ketqua
FROM tblMATHANG,tblChitietHD
WHERE tblMATHANG.maMH=tblChitietHD.maMH
GROUP BY tenMH,tblMATHANG.maMH
ORDER BY Ketqua DESC

--Tạo view hiện tên mặt hàng bán kém nhất:
CREATE VIEW VW_MATHANGBANKEM
AS
SELECT TOP 1 WITH TIES tblMATHANG.maMH, tenMH, SUM(soluong) AS KQ
FROM tblMATHANG INNER JOIN tblChitietHD ON (tblMATHANG.maMH = tblChitietHD.maMH)
GROUP BY tblMATHANG.maMH, tenMH
ORDER BY KQ ASC

--Tạo view các nhân viên có tuổi >=20
CREATE VIEW VW_NVTUOI20trolen
AS
SELECT hotenNV, YEAR(getdate())-YEAR(ngaysinh) AS Tuoi
FROM tblNHANVIEN
WHERE YEAR(getdate())-YEAR(ngaysinh)>=20

--Tạo view đưa ra danh sach các ngôn ngữ:
CREATE VIEW VW_DANHSACHNGONNGU
AS
SELECT ngoaingu 
FROM NHANVIEN_NGOAINGU
GROUP BY ngoaingu

--Tạo view đưa ra hóa đơn lập gần nhất:
CREATE VIEW VW_HOADONGANNHAT
AS
SELECT  TOP 1 WITH TIES maHD, ngaylap 
FROM tblHOADON 
ORDER BY ngaylap DESC

q. Viết các stored procedure lấy dữ liệu từ mỗi bảng theo PK ứng với Parameter truyền vào
--Lấy thông tin nhân viên:
CREATE PROCEDURE SP_PK_NHANVIENPARAMETER
@maNV varchar(10)
AS
SELECT * FROM tblNHANVIEN 
WHERE maNV=@maNV

EXEC SP_PK_NHANVIENPARAMETER @maNV='NV01'


--Lấy thông tin khách hàng:
CREATE PROCEDURE SP_PK_KHACHHANGPARAMETER
@maKH varchar(10)
AS
SELECT * FROM tblKHACHHANG
WHERE maKH=@maKH

EXEC SP_PK_KHACHHANGPARAMETER @maKH='KH02'
--Lấy thông tin hóa đơn:
CREATE PROCEDURE SP_PK_HOADONPARAMETER
@maHD varchar(10)
AS
SELECT * FROM tblHOADON
WHERE maHD=@maHD

EXEC SP_PK_HOADONPARAMETER @maHD='HD03'
--Lấy thông tin mặt hàng:
CREATE PROCEDURE SP_PK_MATHANGPARAMETER
@maMH varchar(10)
AS
SELECT * FROM tblMATHANG
WHERE maMH=@maMH

EXEC SP_PK_MATHANGPARAMETER @maMH='MH04'

--Lấy thông tin nhân viên ngoại ngữ:
CREATE PROCEDURE SP_PK_NHANVIEN_NGOAINGUPARAMETER
@maNV varchar(10)
AS 
SELECT * FROM NHANVIEN_NGOAINGU
WHERE maNV=@maNV

EXEC SP_PK_NHANVIEN_NGOAINGUPARAMETER @maNV='NV05'

r. Viết các stored procedure lấy dữ liệu từ mỗi bảng theo FK ứng với Parameter truyền vào
--Lấy thông tin hóa đơn
CREATE PROCEDURE SP_FK_ChitietHDPARAMETER
	@maHD varchar(20)
	AS
	SELECT* FROM tblChitietHD
	where maHD=@maHD 
EXEC SP_FK_HOADONPARAMETER @maHD='HD05' 
--Lấy thông tin các hóa đơn mà nhân viên đã lập:
CREATE PROCEDURE SP_FK_HOADONPARAMETER
@maNV varchar(10)
AS
SELECT * FROM tblHOADON
WHERE maNV=@maNV

EXEC SP_FK_HOADONPARAMETER @maNV='NV03'

s. Viết các stored procedure lấy dữ liệu từ mỗi bảng theo CK ứng với Parameter truyền vào
--Lấy thông tin nhân viên theo giới tính:
CREATE PROCEDURE SP_CK_NHANVIENPARAMETER
@gioitinh nvarchar(3)
AS
SELECT * FROM tblNHANVIEN
WHERE gioitinh=@gioitinh

EXEC SP_CK_NHANVIENPARAMETER @gioitinh=N'Nam'


