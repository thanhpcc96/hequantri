CREATE Database BTL_QUANLYTIEMCOFFEE
GO

USE BTL_QUANLYTIEMCOFFEE
GO

--=================================================================================================================================
--==========										 TẠO CÁC BẢNG															=======
--=================================================================================================================================
CREATE TABLE  tblNHANVIEN(
PK_sNhanvienID VARCHAR(10) NOT NULL,
sHoten NVARCHAR(20),
sSDT VARCHAR(13),
FK_sChucvuID VARCHAR(10),
sGioitinh NVARCHAR(3),
dNgaysinh DATE,
sQuequan NVARCHAR(20),
);

CREATE TABLE tblKHACHHANG(
PK_sKhachhangID VARCHAR(10) NOT NULL,
sHoten NVARCHAR(20),
sSDT VARCHAR(13),
sDiachi NVARCHAR(20),
);

CREATE TABLE tblHOADON(
PK_sHoadonID VARCHAR(20) NOT NULL,
dNgaylap DATE,
FK_sNhanvienID VARCHAR(10),
FK_sKhachhangID VARCHAR(10),
FK_iSoban INT
);

CREATE TABLE tblCHITIETHOADON(
FK_sHoadonID VARCHAR(20) NOT NULL,
FK_sSanphamID VARCHAR(10) NOT NULL,
iSoluong INT,
);

CREATE TABLE tblSANPHAM(
PK_sSanphamID VARCHAR(10)NOT NULL,
sTensanpham NVARCHAR(30),
sMota NVARCHAR(40),
iDongia INT,
);
CREATE TABLE tblCONGTHUCCHE(
FK_sSanphamID VARCHAR(10) NOT NULL,
FK_sNguyenlieuID VARCHAR(10) NOT NULL,
iHamluong INT,
sDonvidoluong VARCHAR(10)
);
CREATE TABLE tblNGUYENLIEU(
PK_sNguyenlieuID VARCHAR(10) NOT NULL,
sTennguyenlieu NVARCHAR(50),
FK_sNhacungcapID VARCHAR(10),
iDongia INT,
sDonvidoluong NVARCHAR(10)
);
CREATE TABLE tblNHACUNGCAP(
PK_sNhaCCID VARCHAR(10) NOT NULL,
sTennhaCC NVARCHAR(50)
)
CREATE TABLE tblBAN(
PK_iSoban INT NOT NULL,
iSoghe INT
);
CREATE TABLE tblHOADONNHAP(
PK_sHoadonnhapID VARCHAR(10) NOT NULL,
dNgaylap DATE,
FK_sNhanvienID NCHAR(10)
);
CREATE TABLE tblCHITIETHOADONNHAP(
FK_HoadonnhapID VARCHAR(10) NOT NULL,
FK_sNguyenlieuID VARCHAR(10) NOT NULL,
iSoluong INT,
sDonvi VARCHAR(10) -- gam, kg, tá,  bịch,......
);
CREATE TABLE tblCHUCVU(
PK_sChucvuID VARCHAR(10) NOT NULL,
sTenchucvu NVARCHAR(50),
fHesoluong FLOAT
);




--=================================================================================================================================
--==========										 TẠO CÁC KHÓA CHÍNH														=======
--=================================================================================================================================

-- 1) Tạo PK bảng NHAVIEN
ALTER TABLE tblNHANVIEN
ADD CONSTRAINT PK_Nhanvien PRIMARY KEY(PK_sNhanvienID);

-- 2) Tạo PK bảng KHACHHANG
ALTER TABLE tblKHACHHANG
ADD CONSTRAINT PK_Khachhang PRIMARY KEY (PK_sKhachhangID);

-- 3) Tạo PK bảng HOADON
ALTER TABLE tblHOADON
ADD CONSTRAINT PK_Hoadon PRIMARY KEY (PK_sHoadonID);

-- 4) Tạo PK bảng SANPHAM
ALTER TABLE dbo.tblSANPHAM
ADD CONSTRAINT PK_Sanpham PRIMARY KEY (PK_sSanphamID);

-- 5)Tạo PK bảng CHITIETHOADON
ALTER TABLE dbo.tblCHITIETHOADON
ADD CONSTRAINT PK_ChitietHD PRIMARY KEY(FK_sHoadonID,FK_sMathangID);

-- 6) Tạo PK bảng Công thức chế
ALTER TABLE dbo.tblCONGTHUCCHE
ADD CONSTRAINT PK_CONGTHUCCHE PRIMARY KEY(FK_sSanphamID,FK_sNguyenlieuID);

-- 7) Tạo PK bảng NGUYENLIEU
ALTER TABLE dbo.tblNGUYENLIEU 
ADD CONSTRAINT PK_Nguyenlieu PRIMARY KEY(PK_sNguyenlieuID);

-- 8) Tạo PK bảng BÀN
ALTER TABLE dbo.tblBAN
ADD CONSTRAINT PK_Ban PRIMARY KEY(PK_iSoban);

-- 9) Tạo PK bảng Nhà cung cấp
ALTER TABLE dbo.tblNHACUNGCAP
ADD CONSTRAINT PK_NhaCC PRIMARY KEY(PK_sNhaCCID);

-- 10) tạo pk bảng hóa đơn nhập
ALTER TABLE dbo.tblCHITIETHOADONNHAP
ADD CONSTRAINT PK_CTHOADONNHAP PRIMARY KEY(FK_sChitiethdID,FK_sNguyenlieuID);

-- 11) tạo pk bảng HOADONNHAP
ALTER TABLE dbo.tblHOADONNHAP
ADD CONSTRAINT PK_HOADONNHAP PRIMARY KEY(PK_sHoadonnhapID);

--12) tạo PK bảng CHUCVU
ALTER TABLE dbo.tblCHUCVU
ADD CONSTRAINT PK_CHUCVU PRIMARY KEY(PK_sChucvuID);




--=================================================================================================================================
--==========										 TẠO CÁC KHÓA NGOẠI													===========
--=================================================================================================================================

-- 1) Tạo FK HÓA ĐƠN_ NHÂN VIÊN
ALTER TABLE tblHOADON
ADD CONSTRAINT FK_HOADON_NHANVIEN
FOREIGN KEY (FK_sNhanvienID)
REFERENCES tblNHANVIEN(PK_sNhanvienID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

-- 2) TẠO FK HÓA ĐƠN-KHÁCH HÀNG
ALTER TABLE tblHOADON
ADD CONSTRAINT FK_HOADON_KHACHHANG
FOREIGN KEY (FK_sKhachhangID)
REFERENCES tblKHACHHANG(PK_sKhachhangID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

-- 3) Tạo FK HOADON-BÀN
ALTER TABLE dbo.tblHOADON
ADD CONSTRAINT FK_HOADON_BAN
FOREIGN KEY(FK_iSoban) 
REFERENCES dbo.tblBAN(PK_iSoban)
ON DELETE CASCADE
ON UPDATE CASCADE
GO


--4) TẠO FK CHITIETHOADON- HOADON
ALTER TABLE dbo.tblCHITIETHOADON
ADD CONSTRAINT FK_ChitietHD_HD
FOREIGN KEY (FK_sHoadonID)
REFERENCES tblHOADON(PK_sHoadonID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

--5) tạo  FK CHITIETHOADON- SANPHAM
ALTER TABLE dbo.tblCHITIETHOADON
ADD CONSTRAINT FK_CTHD_SP
FOREIGN KEY (FK_sSanphamID)
REFERENCES dbo.tblSANPHAM(PK_sSanphamID)
ON DELETE CASCADE
ON  UPDATE CASCADE
GO
-- 6) tạo FK_ SANPHAM_CONGTHUCCHE
ALTER TABLE dbo.tblCONGTHUCCHE
ADD CONSTRAINT FK_CTPC_SANPHAM
FOREIGN KEY(FK_sSanphamID)
REFERENCES dbo.tblSANPHAM(PK_sSanphamID)
ON  DELETE CASCADE
ON UPDATE CASCADE
GO

-- 7) tạo FK_CONGTHUCCHE_NGUYENLIEU
ALTER TABLE dbo.tblCONGTHUCCHE
ADD CONSTRAINT FK_CTPC_NGUYENLIEU
FOREIGN KEY(FK_sNguyenlieuID)
REFERENCES dbo.tblNGUYENLIEU(PK_sNguyenlieuID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO



--8) Tạo FK NGUYENLIEU_NHACUNGCAP
ALTER TABLE dbo.tblNGUYENLIEU
ADD CONSTRAINT FK_NGUYENLIEU_NhaCC
FOREIGN KEY(FK_sNhacungcapID)
REFERENCES dbo.tblNHACUNGCAP(PK_sNhaCCID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

--9) tạo FK_NHANVIEN_CHUCVU
ALTER TABLE dbo.tblNHANVIEN
ADD CONSTRAINT FK_NHANVIEN_CHUCVU
FOREIGN KEY(FK_sChucvuID)
REFERENCES dbo.tblCHUCVU(PK_sChucvuID)
ON DELETE CASCADE
ON UPDATE CASCADE
GO

--10) tạo FK HOADONNHAP_NHANVIEN
ALTER TABLE dbo.tblHOADONNHAP
ADD CONSTRAINT FK_HOADONNHAP_NHANVIEN
FOREIGN KEY(FK_sNhanvienID)
REFERENCES dbo.tblNHANVIEN(PK_sNhanvienID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
--11) tạo FK_HOADONNHAP_CTHDNHAP
ALTER TABLE dbo.tblCHITIETHOADONNHAP
ADD CONSTRAINT FK_CTHDN_HOADONNHAP
FOREIGN KEY(FK_HoadonnhapID)
REFERENCES dbo.tblHOADONNHAP(PK_sHoadonnhapID)
ON DELETE CASCADE
ON UPDATE CASCADE
--12) tạo Fk_CHITIETHDNHAP_NGUYENLIEU
ALTER TABLE dbo.tblCHITIETHOADONNHAP
ADD CONSTRAINT FK_CTHDNHAP_NGUYENLIEU
FOREIGN KEY(FK_sNguyenlieuID)
REFERENCES dbo.tblNGUYENLIEU(PK_sNguyenlieuID)
ON DELETE CASCADE
ON UPDATE CASCADE



--=================================================================================================================================
--==========										 TẠO CÁC RÀNG BUỘC          											=======
--=================================================================================================================================

-- 1) Tạo Check Giới tính NHANVIEN
ALTER TABLE tblNHANVIEN
ADD CONSTRAINT CK_NV_GT CHECK(sGioitinh in(N'Nam',N'Nữ'));

--2) Tạo Check số lượng trong chi tiết hóa đơn
Alter table dbo.tblCHITIETHOADON
Add Constraint CK_SL_CTHD Check ( iSoluong > 0);

--3) Tạo check số ghế của bàn
ALTER TABLE dbo.tblBAN
ADD CONSTRAINT CK_SoGhe_Ban CHECK(iSoghe >0)

--	Tạo các CONSTRAINT
ALTER TABLE dbo.tblSANPHAM
ADD CONSTRAINT UNI_tblSANPHAM UNIQUE(sTensanpham);


--=================================================================================================================================
--==========										 TẠO CÁC INDEX          											    =======
--=================================================================================================================================

CREATE INDEX Idx_tenNV ON tblNHANVIEN(PK_sNhanvienID)

CREATE INDEX Idx_tenKH ON tblKHACHHANG(sHoten)

CREATE INDEX Idx_tenMH ON tblMATHANG(sTenhang)

-- Tạo default
Alter table tblNhanvien
Add Constraint DF_SDT_NV Default N'Chưa có' for sSDT



		
--=================================================================================================================================
--==========										 TẠO CÁC STORE PROCEDURE          									    =======
--=================================================================================================================================
		
			

-- Tạo các Stored Procedure kiểm tra thêm NV
CREATE PROCEDURE SP_tblNHANVIEN_themNV
@maNV varchar(10),
@hotenNV nvarchar(20),
@sdtNV varchar (13),
@mucluong float,
@gioitinh nvarchar(10),
@ngaysinh datetime,
@quequan nvarchar(20)
WITH RECOMPILE,ENCRYPTION
AS
BEGIN
IF EXISTS(SELECT * FROM tblNHANVIEN WHERE PK_sNhanvienID=@maNV)
BEGIN
		PRINT N'Nhân viên đã tồn tại'
		RETURN
END
	INSERT INTO tblNHANVIEN 
	VALUES(@maNV,@hotenNV,@sdtNV,@mucluong,@gioitinh,@ngaysinh,@quequan)
END
GO

EXEC SP_tblNHANVIEN_themNV @maNV='NV07', @hotenNV=N'Nguyễn Minh Hiền', @sdtNV='0927563486', @mucluong=1,@gioitinh=N'Nam',@ngaysinh='08/08/1996', @quequan=N'Đà Nẵng'
EXEC SP_tblNHANVIEN_themNV @maNV='NV08', @hotenNV=N'Lê Đức Anh',@sdtNV='0927563879', @mucluong=1, @gioitinh=N'Nam', @ngaysinh='03/04/1996',@quequan=N'Cần Thơ'
EXEC SP_tblNHANVIEN_themNV @maNV='NV09', @hotenNV=N'Lê Hoàn Trang', @sdtNV='0124876456', @mucluong=1,@gioitinh=N'Nữ', @ngaysinh='10/08/1996', @quequan=N'Hà Nội'
EXEC SP_tblNHANVIEN_themNV @maNV='NV10',@hotenNV=N'Nguyễn Bích Ngọc', @sdtNV='01227563486', @mucluong=1,@gioitinh=N'Nữ', @ngaysinh='08/01/1997', @quequan=N'Hải Phòng'
EXEC SP_tblNHANVIEN_themNV @maNV='NV11', @hotenNV=N'Nguyễn Cát Ngọc', @sdtNV='0927564586', @mucluong=1.5,@gioitinh=N'Nam', @ngaysinh='01/09/1996', @quequan=N'Hà Nam'

--Tạo procedure thêm khách hàng:
CREATE PROCEDURE SP_tblKHACHHANG_themKH
@maKH varchar(10),
@hotenKH nvarchar(20),
@sdtKH varchar(13),
@diachi nvarchar(20)
WITH RECOMPILE,ENCRYPTION
AS
	BEGIN
		IF EXISTS(SELECT * FROM tblKHACHHANG WHERE PK_sKhachhangID=@maKH)
		BEGIN
			PRINT N'Khách hàng đã tồn tại'
			RETURN
		END
		INSERT INTO tblKHACHHANG
		VALUES (@maKH,@hotenKH,@sdtKH,@diachi)
	END
GO

EXEC SP_tblKHACHHANG_themKH @maKH='KH06', @hotenKH=N'Hồ Trần Nhật', @sdtKH='0925892239', @diachi=N'Hà Nội'
EXEC SP_tblKHACHHANG_themKH @maKH='KH07', @hotenKH=N'Lê Đức Huy', @sdtKH='0925892239', @diachi=N'Hà Nội'
EXEC SP_tblKHACHHANG_themKH @maKH='KH08', @hotenKH=N'Phạm Hải Đăng', @sdtKH='01225892239', @diachi=N'Hà Nội'
EXEC SP_tblKHACHHANG_themKH @maKH='KH09', @hotenKH=N'Nguyễn Phan Vũ Quân', @sdtKH='0125892239', @diachi=N'New York'
EXEC SP_tblKHACHHANG_themKH @maKH='KH10', @hotenKH=N'Phạm Quang Tuấn Đức', @sdtKH='0924768839', @diachi=N'Hà Nội'
GO


--Tạo procedure thêm hóa đơn:
CREATE PROCEDURE SP_tblHOADON_themHD
@maHD varchar(10),
@ngaylap datetime,
@maNV varchar(10),
@maKH varchar(10),
@soban INT,
WITH RECOMPILE,ENCRYPTION
AS
	BEGIN
		IF EXISTS(SELECT * FROM tblHOADON WHERE PK_sHoadonID=@maHD)
		BEGIN
			PRINT N'Hóa đơn đã tồn tại'
			RETURN
		END
	INSERT INTO tblHOADON(PK_sHoadonID,dNgaylap,FK_sNhanvienID,FK_sKhachhangID,FK_iSoban)
	VALUES(@maHD,@ngaylap,@maNV,@maKH,@soban)
	END
GO

EXEC SP_tblHOADON_themHD @maHD='HD26', @ngaylap='09/05/2016', @maNV='NV06', @maKH='KH06'
EXEC SP_tblHOADON_themHD @maHD='HD27', @ngaylap='09/07/2015', @maNV='NV07', @maKH='KH07'
EXEC SP_tblHOADON_themHD @maHD='HD28', @ngaylap='02/01/2006', @maNV='NV08', @maKH='KH08'
EXEC SP_tblHOADON_themHD @maHD='HD29', @ngaylap='01/05/2016', @maNV='NV09', @maKH='KH09'
EXEC SP_tblHOADON_themHD @maHD='HD30', @ngaylap='01/09/2016', @maNV='NV10', @maKH='KH10'
GO

--Tạo procedure thêm Sản Phẩm:
CREATE PROCEDURE SP_tblSANPHAM_themSP
@maMH varchar(10),
@tenMH nvarchar(30),
@mota nvarchar(40),
@dongia float
WITH RECOMPILE,ENCRYPTION
AS
	BEGIN
		IF EXISTS(SELECT * FROM dbo.tblSANPHAM WHERE PK_sMathangID=@maMH)
		BEGIN
			PRINT N'Mặt hàng đã tồn tại'
			RETURN
		END
		INSERT INTO dbo.tblSANPHAM( PK_sSanphamID ,sTensanpham ,sMota ,iDongia)
		VALUES(@maMH,@tenMH,@mota,@dongia)
	END
GO

EXEC SP_tblSANPHAM_themSP @maMH='MH26', @tenMH=N'Trà gừng', @mota=N' Trà giúp ấm cơ thể', @dongia=33000
EXEC SP_tblSANPHAM_themSP @maMH='MH27', @tenMH=N'Trà gừng long nhân', @mota=N'Trà có thêm trân châu', @dongia=35000
EXEC SP_tblSANPHAM_themSP @maMH='MH28', @tenMH=N'Trà sữa gừng', @mota=N'Trà gừng thêm sữa đặc', @dongia=34000
EXEC SP_tblSANPHAM_themSP @maMH='MH29', @tenMH=N'Trà sữa long nhân', @mota=N'Trà thanh lọc', @dongia=37000
EXEC SP_tblSANPHAM_themSP @maMH='MH30', @tenMH=N'Trà long nhân', @mota=N'Trà truyền thống', @dongia=40000

--Tạo procedure thêm chi tiết hóa đơn:
CREATE PROCEDURE SP_tblChitietHD
@maHD varchar(20),
@maMH varchar(10),
@soluong int
AS
	BEGIN
		IF EXISTS(SELECT * FROM dbo.tblCHITIETHOADON WHERE FK_sHoadonID=@maHD AND FK_sMathangID=@maMH)
		PRINT N'Hóa đơn này đã có'
	ELSE	
		INSERT INTO tblCHITIETHOADON(FK_sHoadonID,FK_sSanphamID,iSoluong) VALUES (@maHD,@maMH,@soluong)
	END
GO

EXEC SP_tblChitietHD @maHD='HD26', @maMH='MH01', @soluong=1
EXEC SP_tblChitietHD @maHD='HD26', @maMH='MH02', @soluong=1
EXEC SP_tblChitietHD @maHD='HD27', @maMH='MH03', @soluong=2
EXEC SP_tblChitietHD @maHD='HD27', @maMH='MH04', @soluong=1
EXEC SP_tblChitietHD @maHD='HD28', @maMH='MH05', @soluong=3
EXEC SP_tblChitietHD @maHD='HD28', @maMH='MH06', @soluong=1
EXEC SP_tblChitietHD @maHD='HD29', @maMH='MH07', @soluong=1
EXEC SP_tblChitietHD @maHD='HD30', @maMH='MH08', @soluong=2
GO


-------------------------
-- Viết các stored procedure lấy thông tin
---- Lấy thông tin nhân viên:
CREATE PROCEDURE SP_PK_NHANVIENPARAMETER
@maNV VARCHAR(10)
AS
	IF (SELECT COUNT(*) FROM tblNHANVIEN WHERE PK_sNhanvienID=@maNV) > 0
	BEGIN
		SELECT * FROM tblNHANVIEN 
		WHERE PK_sNhanvienID=@maNV
	End
	ELSE
		PRINT N'Không có nhân viên này!'
GO

EXEC SP_PK_NHANVIENPARAMETER @maNV='NV01'
GO


---- Lấy thông tin sản phẩm được bán tại ngày nào đó
CREATE PROC sp_hang_time
@Ngaylap DATE
	IF EXISTS ( SELECT * FROM tblHOADON WHERE dNgaylap= @Ngaylap)
	BEGIN
		PRINT  N' Thông tin mặt hàng là: '
		Select PK_sSanphamID, sTensanpham, iDongia
		FROM dbo.tblSANPHAM Inner Join dbo.tblCHITIETHOADON
		ON  PK_sSanphamID=FK_sSanphamID
		INNER JOIN tblHOADON
		on PK_sHoadonID= FK_sHoadonID
		Where dNgaylap= @Ngaylap
	End
	Else
		Print N'Không tìm thấy mặt hàng nào được bán!'
GO

Execute sp_hang_time '01/01/2017'
GO 

----  Xây dựng thủ tục cho biết tổng số lượng tất cả mặt hàng của một hóa đơn bất kỳ. 
CREATE PROC sp_tongban
@Mahd VARCHAR(20)
AS
	IF exists (SELECT * FROM tblChitietHD WHERE FK_sHoadonID= @Mahd)
	BEGIN
		SELECT SUM(iSoluong) AS N'Tổng số'
		FROM dbo.tblCHITIETHOADON
		WHERE FK_sHoadonID= @Mahd
	END
	ELSE
		PRINT N'Không tìm thấy hóa đơn'
GO

EXEC sp_tongban N'HD03'

---- Xây dựng thủ tục cho biết thông tin mặt hàng có giá bán thấp nhất
CREATE PROC sp_minsp
AS
	IF (SELECT COUNT(*) FROM dbo.tblSANPHAM )>0
	BEGIN
		SELECT TOP 1 PK_sSanphamID, sTensanpham, iDongia
		FROM tblSANPHAM
		GROUP BY PK_sSanphamID, sTensanpham, iDongia
		ORDER BY iDongia ASC
	END
	ELSE
		PRINT N'Không có mặt hàng nào không thể thực hiện tìm kiếm !'
GO

EXEC sp_minsp

---- Viết thủ tục đếm các mặt hàng bán 1 lần có số lượng >3
Create Proc sp_sllonhon3
@dem int output
As 
	Set @Dem=0
	Select @dem = count(*) FROM dbo.tblCHITIETHOADON WHERE ( iSoluong > 3 )
GO

Declare @demh int
Exec sp_sllonhon3 @dem=@demh output
Select @demh As N'Số MH'

---- Xây dựng thủ tục hiển thị các hóa đơn được lập từ ngày nào đó tới ngày nào đó.
CREATE PROC sp_ngaytongay
@Ngaybd date,
@Ngaykt date 
AS 
	IF EXISTS ( SELECT * FROM tblHOADON Where dNgaylap between @Ngaybd and @Ngaykt  )
	BEGIN 
		SELECT * FROM tblHOADON
		WHERE dNgaylap between @Ngaybd and @Ngaykt
	END
	ELSE
		PRINT N'Không tìm thấy hóa đơn nào.'
GO

EXECUTE sp_ngaytongay '01/01/2017', '02/02/2017'
GO

---- Xây dựng thủ tục tính số lượng đã bán của 1 mặt hàng
CREATE Proc sp_slban
@sanpham VARCHAR(10)
AS
	DECLARE @Soluongdb INT
	IF EXISTS (SELECT * FROM tblMATHANG WHERE PK_sMathangID= @Mahang)
	BEGIN 
		SELECT @Soluongdb = sum(iSoluong)
		FROM dbo.tblSANPHAM inner join dbo.tblCHITIETHOADON
		ON PK_sSanphamID = FK_sSanphamID
		WHERE PK_sSanphamID= @sanpham
		PRINT N'Số lượng bán của mặt hàng '+@sanpham+' là:' + Convert(CHAR,@Soluongdb)
	END
	ELSE
		PRINT N'Không tìm thấy mặt hàng!'
GO

EXEC sp_slban N'MH03'


--=================================================================================================================================
--==========							   ĐẶT CÁC YÊU CẦU VÀ KHAI THÁC DỮ LIỆU         									=======
--=================================================================================================================================
-- Đặt ra các yêu cầu lấy dữ liệu
---- Hiện số lượng khách hàng nam và nữ
SELECT sGioitinh,COUNT(PK_sNhanvienID) [Số lượng nhân viên]
FROM tblNHANVIEN
GROUP BY sGioitinh	

---- Hiện tên mặt hàng bán chạy:
SELECT TOP 1 WITH TIES sTensanpham,SUM(iSoluong) AS Ketqua
FROM dbo.tblSANPHAM INNER JOIN dbo.tblCHITIETHOADON ON PK_sSanphamID=F
WHERE PK_sSanphamID=FK_sSanphamID
GROUP BY sTensanpham,FK_sSanphamID
ORDER BY Ketqua DESC

---- Hiện tên mặt hàng bán kém :
SELECT TOP 1 WITH TIES PK_sMathangID, sTensanpham,SUM(iSoluong)AS Ketqua
FROM dbo.tblSANPHAM INNER JOIN dbo.tblCHITIETHOADON ON PK_sSanphamID=FK_sSanphamID
GROUP BY PK_sSanphamID, sTensanpham
ORDER BY Ketqua ASC

---- Đưa ra các nhân viên có tuổi >= 20
SELECT sHoten,YEAR(getdate())-YEAR(dNgaysinh) AS Tuoi
FROM tblNHANVIEN
WHERE YEAR(getdate())-YEAR(dNgaysinh)>=20

---- Đưa ra hóa đơn lập gần nhất:
SELECT TOP 1 WITH TIES PK_sHoadonID,dNgaylap 
FROM tblHOADON 
ORDER BY dNgaylap DESC



--=================================================================================================================================
--==========							   TẠO CÁC VIEW  VÀ TRUY VẤN			         									=======
--=================================================================================================================================

-- Tạo các View
---- Tạo view hiện số lượng Nhân viên
CREATE VIEW vSLNHANVIEN
AS
SELECT sGioitinh,COUNT(PK_sNhanvienID)AS N'Số lượng nhân viên'
FROM tblNHANVIEN
GROUP BY sGioitinh
GO

SELECT * FROM vSLNHANVIEN
GO


---- Tạo view hiện tên các mặt hàng bán chạy nhất:
CREATE VIEW vSANPHAMBANCHAY
AS
SELECT TOP 1 WITH TIES sTensanpham,SUM(iSoluong) AS Ketqua
FROM dbo.tblSANPHAM INNER JOIN dbo.tblCHITIETHOADON ON PK_sSanphamID=FK_sSanphamID
WHERE PK_sSanphamID=FK_sSanphamID
GROUP BY sTensanpham,PK_sSanphamID
ORDER BY Ketqua DESC
GO

SELECT  * FROM vSANPHAMBANCHAY

---- Tạo view các nhân viên có tuổi >=20
CREATE VIEW vNVTUOI20trolen
AS
SELECT sHoten,YEAR(getdate())-YEAR(dNgaysinh) AS Tuoi
FROM tblNHANVIEN
WHERE YEAR(getdate())-YEAR(dNgaysinh)>=20
GO

SELECT  * FROM  vNVTUOI20trolen

---- Tạo view các nhân viên bán hàng trong tháng 1,2
CREATE  VIEW  vNHANVIENThang1thang2
As
SELECT   DISTINCT  PK_sNhanvienID, sHoten, dNgaysinh, sQuequan, sSDT
FROM dbo.tblNHANVIEN inner join dbo.tblHOADON
ON PK_sNhanvienID= FK_sNhanvienID
WHERE month(dNgaylap)= 1 OR  MONTH(dNgaylap)= 2

Select * From vNHANVIENThang1thang2

---- Cho biết thông tin hóa đơn bán trước ngày 1/1/2017 đồng thời hiển thị mặt hàng được bán vào ngày đó
CREATE VIEW vDONBAN
AS
SELECT PK_sHoadonID, FK_sNhanvienID, FK_sKhachhangID, PK_sSanphamID, sTensanpham
FROM (tblHOADON INNER JOIN dbo.tblCHITIETHOADON
ON PK_sHoadonID= FK_sHoadonID)
INNER JOIN dbo.tblSANPHAM
ON PK_sSanphamID= FK_sSanphamID
WHERE dNgaylap < '01/01/2017'
GROUP BY  PK_sHoadonID, FK_sNhanvienID, FK_sKhachhangID, PK_sSanphamID, sTensanpham
GO

SELECT * FROM  vDONBAN

---- Hiển thị tất cả các nhân viên không có quê quán ở Hà Nội
CREATE  VIEW  vQueKPHaNoi
AS 
SELECT PK_sNhanvienID, sHoten, sGioitinh, sSDT
FROM  tblNhanvien
WHERE  (sQuequan) not in (N'Hà Nội')

SELECT  * from vQueKPHaNoi


--=================================================================================================================================
--==========							   TẠO CÁC TRIGER		         									                =======
--=================================================================================================================================


-- Trigger
---- Khi insert vào bảng nhân viên, nếu chức vụ  =NULL thì tự động gán chức vụ = nhân viên
CREATE TRIGGER tg_insertNV
ON tblNhanvien
FOR INSERT
AS
	IF EXISTS(SELECT * FROM tblNhanvien WHERE fMucluong IS NULL)
	BEGIN
		UPDATE dbo.tblNHANVIEN
		SET FK_sChucvuID='CV01'
		WHERE PK_sNhanvienID = (SELECT PK_sNhanvienID FROM inserted)
	END
	ELSE
	BEGIN
		PRINT N'Mã nhân viên bị trùng.'
		ROLLBACK TRANSACTION
	END
GO
DROP TRIGGER tg_insertNV
INSERT INTO dbo.tblNHANVIEN ( PK_sNhanvienID , sHoten , sSDT ,FK_sChucvuID , sGioitinh , dNgaysinh , sQuequan)
VALUES ('NV11',N'Đỗ Văn Quang','0942454221',null,N'Nam','01/08/1973',N'Hà Nội')

---- Mức lương của nhân viên chỉ tăng chứ không giảm
CREATE TRIGGER tg_updateLuong
On tblNhanvien
Instead of Update
AS
Begin
	Declare @manv varchar(20)
	Select @manv=PK_sNhanvienID From inserted
	Declare @hsl1 float
	Select @hsl1=(Select fMucluong From tblNhanvien Where PK_sNhanvienID=@manv)
	Declare @hsl2 float
	Select @hsl2=fMucluong From inserted
	If(@hsl1 <= @hsl2)
	Begin
		Print N'Thỏa mãn ràng buộc lương nhân viên chỉ tăng, không giảm '+ Convert(char,@hsl1)+' '+Convert(char,@hsl2)
		Update tblNhanvien
		Set fMucluong=@hsl2
		Where PK_sNhanvienID=@manv
	End
	Else
		Begin
			Print N'Lương của nhân viên không được giảm'
			Rollback Transaction
		End
End
GO
DROP TRIGGER tg_updateLuong
UPDATE tblNhanvien
SET fMucluong=1
WHERE PK_sNhanvienID='NV02'
GO


---- Ngày lập hóa đơn phải có trước thời điểm hiện tại
CREATE TRIGGER TG_NgaylapHoadon
ON dbo.tblHOADON
FOR INSERT, UPDATE
AS
	DECLARE @ngayb DATE
	SELECT @ngayb=DNgaylap FROM Inserted
	IF(@ngayb>GETDATE())
	BEGIN
		ROLLBACK
		PRINT N'Ngày bán không thể có sau ngày hiện tại.'
	END
	ELSE
		PRINT N'Thời gian lập hóa đơn hợp lệ.'
GO
----
INSERT INTO tblHoadon
VALUES('HD31', '04/04/2017',N'NV02',N'KH01')

---- Nhân viên phải >= 18 tuổi
CREATE TRIGGER tg_tuoiNV
ON tblNHANVIEN
FOR INSERT, UPDATE
AS
BEGIN
	Declare @Ngaysinh date
	Select @Ngaysinh = dNgaysinh From Inserted
	If (Year(getdate()) - Year(@Ngaysinh) <18)
	Begin
		Print N' Nhân viên không thể ít hơn 18 tuổi'
		Rollback Tran
	End
	Else
		Print N'Dữ liệu nhập hợp lệ'
End
GO
Insert Into tblNHANVIEN
Values ('NV13',N'Nguyễn Văn Hoàng','0942124322',2,N'Nam','12/08/2010',N'TP. Hồ Chí Minh')

-- Nhân viên nhập hóa đơn nhập hàng phải có chức vụ quản lý
CREATE TRIGGER tg_nhanvien_nhap
ON dbo.tblHOADONNHAP
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @cv VARCHAR(10)
	SELECT @cv =(SELECT PK_sChucvuID FROM dbo.tblNHANVIEN INNER JOIN dbo.tblCHUCVU ON FK_sChucvuID=PK_sChucvuID WHERE PK_sNhanvienID=(SELECT FK_sNhanvienID FROM Inserted))
	IF @cv='CV01'
	BEGIN 
		PRINT N'Thêm Thành Công'
	END
    ELSE
		BEGIN
			PRINT N'Nhân viên không có quyền nhập hàng'
			ROLLBACK TRAN
		END
END


--=================================================================================================================================
--==========							TẠO CÁC USER, LOGIN và Phân Quyền	         									    =======
--=================================================================================================================================


---- Tạo login
CREATE LOGIN PHAMTHANH
WITH PASSWORD = '1234!',
DEFAULT_DATABASE = quanlytiemcoffee
GO


CREATE LOGIN LINHCHUOT
WITH PASSWORD = '1234',
DEFAULT_DATABASE = quanlytiemcoffee
GO


---- Xóa login
DROP LOGIN THANHPHAM
GO


---- Tạo user
CREATE USER thanhpham 
FOR LOGIN PHAMTHANH
GO

CREATE USER linhchuot 
FOR LOGIN LINHCHUOT
GO

---- Cấp quyền select, update, delete trên bảng tblNhanvien cho user thanhpham
GRANT SELECT,UPDATE,DELETE, CREATE TABLE, CREATE VIEW,EXECUTE
ON tblNHANVIEN
TO thanhpham
GO


---- Cấp phát cho linhchuot được quyền tạo bảng và tạo view
GRANT CREATE TABLE, CREATE VIEW
TO linhchuot
go

---- Cấp quyền xem và thêm 1 đối tượng trên bảng tblMathang
GRANT  SELECT, INSERT
ON dbo.tblHOADON
TO linhchuot
GO



---- Cấp quyền chỉ được xem 2 cột Mã nguyên liệu và tên nguyên liệu trong bảng nguyên liệu cho linhchuot
GRANT SELECT
ON dbo.tblNGUYENLIEU(PK_sNguyenlieuID,sTennguyenlieu)
TO linhchuot
GO


---- Tạo role
Create Role SQLGROUP
GO


---- Thêm linhchuot vào role
EXEC sp_addrolemember 'SQLGROUP','linhchuot'
GO


---- Cấp quyền select cho nhóm
GRANT SELECT
ON  dbo.tblNHANVIEN 
TO SQLGROUP
GO


---- Thu hồi quyền sử dụng update trên bảng tblNHANVIEN của thanhpham
REVOKE UPDATE
ON tblNHANVIEN
TO thanhpham
GO


---- Tước quyền tạo view của thanhpham
REVOKE CREATE VIEW
FROM thanhpham
GO

---- Tước quyền delete trên bảng tblKHACHHANG của thanhpham
REVOKE DELETE 
ON dbo.tblNHANVIEN
TO thanhpham
GO

---- Hủy quyền select bảng Khách hàng của thanhpham
DENY SELECT
ON tblKHACHHANG
TO thanhpham


--=================================================================================================================================
--==========									     PHÂN TÁN CSDL				         								    =======
--=================================================================================================================================
-- tạo linked server
EXEC master.dbo.sp_addlinkedserver
@server = N'S1SERVER',
@provider=N'SQLOLEDB',
@datasrc=N'10.10.10.10\S1SQL',
@srvproduct=N'PHANTANSQL'

-- Kiểm tra linked server
EXEC sp_linkedservers

-- Login vào linked server
EXEC master.dbo.sp_addlinkedsrvlogin
@rmtsrvname=N'S1SERVER',
@useself=N'False',
locallogin=NULL,
@rmtuser=N'thanhpcc',
@rmtpassword='1234'

-- test kết nối
SELECT TOP 100 * FROM S1SERVER.ok.dbo.test --SERVER.database.bảng
	
---- Tạo CSDL cho máy trạm
Create Database quanlytiemcoffe1  COLLATE Vietnamese_CI_AS

---- Tạo các bảng cho CSDL máy trạm
---- (bảng khách hàng được phân mảnh dọc chỉ chứa PK_sKhachhangID và sHoten)
---- và nhập dữ liệu để kiểm tra
CREATE TABLE  tblNhanvien(
PK_sNhanvienID varchar(10) Not null,
sHoten nvarchar(20),
sSDT varchar(13),
fMucluong float,
sGioitinh nvarchar(3),
dNgaysinh date,
sQuequan nvarchar(20)
)

insert into tblNhanvien values  ('NV01',N'Nguyễn Tuấn Anh',09121232154,1,'Nam','3/3/1995',N'Hà Nội'),
								('NV02',N'Nguyễn Thùy Linh',09121153343,2,N'Nữ','5/3/1995',N'Hà Nội')

CREATE TABLE tblKhachhang(
PK_sKhachhangID varchar(10)Not null,
sHoten nvarchar(20)
)

insert into tblKhachhang values ('KH01',N'Đỗ Văn Hòa'),
								('KH02',N'Đỗ Văn Toàn')

CREATE TABLE tblHoadon(
PK_sHoadonID varchar(20)Not null,
dNgaylap date,
FK_sNhanvienID varchar(10),
FK_sKhachhangID varchar(10)
)

insert into tblHoadon values('HD01','3/4/2017','NV01','KH02'),
							('HD02','3/4/2017','NV02','KH01')

CREATE TABLE tblMathang(
PK_sMathangID varchar(10)Not null,
sTenhang nvarchar(30),
sMota nvarchar(40),
fDongia float
)

insert into tblMathang values   ('MH01',N'Coffe đen',N'Làm từ hạt cà phê đen nguyên chất.',10000),
								('MH02',N'Coffe sữa',N'Làm từ hạt cà phê nguyên chất.',10000)

CREATE TABLE tblChitietHD(
FK_sHoadonID varchar(20)not null,
FK_sMathangID varchar(10)not null,
iSoluong int
)

insert into tblChitietHD values ('HD01','MH01',1),
								('HD02','MH02',2)

---- Tạo CSDL cho máy ảo
Create Database quanlytiemcoffe1  COLLATE Vietnamese_CI_AS
Use quanlytiemcoffe1

---- Tạo các bảng cho CSDL máy ảo (bảng khách hàng được phân mảnh dọc chỉ chứa PK_sKhachhangID,sSDT và sDiachi)
CREATE TABLE  tblNhanvien(
PK_sNhanvienID varchar(10) Not null,
sHoten nvarchar(20),
sSDT varchar(13),
fMucluong float,
sGioitinh nvarchar(3),
dNgaysinh date,
sQuequan nvarchar(20),
)

insert into tblNhanvien values  ('NV01',N'Nguyễn Tuấn Anh',09121232154,1,'Nam','3/3/1995',N'Hà Nội'),
								('NV02',N'Nguyễn Thùy Linh',09121153343,2,N'Nữ','5/3/1995',N'Hà Nội')

CREATE TABLE tblKhachhang(
PK_sKhachhangID varchar(10)Not null,
sSDT varchar(13),
sDiachi nvarchar(20),
)

insert into tblKhachhang values ('KH01',N'Đỗ Văn Hòa'),
								('KH02',N'Đỗ Văn Toàn')

CREATE TABLE tblHoadon(
PK_sHoadonID varchar(20)Not null,
dNgaylap date,
FK_sNhanvienID varchar(10),
FK_sKhachhangID varchar(10),
)

insert into tblHoadon values('HD01','3/4/2016','NV01','KH02'),
							('HD02','3/4/2016','NV02','KH01')

CREATE TABLE tblMathang(
PK_sMathangID varchar(10)Not null,
sTenhang nvarchar(30),
sMota nvarchar(40),
fDongia float,
)
insert into tblMathang values   ('MH01',N'Coffe đen',N'Làm từ hạt cà phê đen nguyên chất.',10000),
								('MH02',N'Coffe sữa',N'Làm từ hạt cà phê nguyên chất.',10000)

CREATE TABLE tblChitietHD(
FK_sHoadonID varchar(20)not null,
FK_sMathangID varchar(10)not null,
iSoluong int,
)

insert into tblChitietHD values ('HD03','MH02',1),
								('HD04','MH01',2)

---- Tạo khóa chính, khóa ngoại cho 2 database
ALTER TABLE tblNHANVIEN
ADD CONSTRAINT PK_NV PRIMARY KEY(PK_sNhanvienID)

ALTER TABLE tblKHACHHANG
ADD CONSTRAINT PK_KH PRIMARY KEY (PK_sKhachhangID)

ALTER TABLE tblHOADON
ADD CONSTRAINT PK_HD PRIMARY KEY (PK_sHoadonID)

ALTER TABLE tblMATHANG
ADD CONSTRAINT PK_MH PRIMARY KEY (PK_sMathangID)

ALTER TABLE tblChitietHD
ADD CONSTRAINT PK_ChitietHD PRIMARY KEY(FK_sHoadonID,FK_sMathangID)

ALTER TABLE tblHOADON
ADD CONSTRAINT FK_HOADON_NHANVIEN
FOREIGN KEY (FK_sNhanvienID)
REFERENCES tblNHANVIEN(PK_sNhanvienID)

ALTER TABLE tblHOADON
ADD CONSTRAINT FK_HOADON_KHACHHANG
FOREIGN KEY (FK_sKhachhangID)
REFERENCES tblKHACHHANG(PK_sKhachhangID)

ALTER TABLE tblChitietHD
ADD CONSTRAINT FK_ChitietHD_HD
FOREIGN KEY (FK_sHoadonID)
REFERENCES tblHOADON(PK_sHoadonID)

ALTER TABLE tblChitietHD
ADD CONSTRAINT FK_ChiTiet_MATHANG
FOREIGN KEY (FK_sMathangID)
REFERENCES tblMATHANG(PK_sMathangID)

---- Tạo kết nối từ máy trạm tới máy ảo
EXEC master.dbo.sp_addlinkedserver 
	@server  = N'HIEU-PC',
	@provider = N'SQLOLEDB', 
	@datasrc = N'1.1.1.2',
	@srvproduct = ''
Go

---- Tạo login đăng nhập linked sever :
EXEC master.dbo.sp_addlinkedsrvlogin 
@rmtsrvname =N'HIEU-PC',
@useself=N'False',
@locallogin= NULL ,
@rmtuser = N'sa',
@rmtpassword ='123'

---- Kiểm tra linked server thành công hay không
Select * From sys.sysservers

---- Tạo trigger để phân mảnh ngang bảng bảng hóa đơn với điều kiện máy trạm lưu những hóa đơn từ năm 2017 và máy ảo chứa hóa đơn trước năm 2017
Create Trigger tg_PmnHD
On tblHoadon
Instead of Insert
As
Begin
	Declare @ngaylap date,@PK_sHoadonID varchar(20),@FK_sNhanvienID varchar(10),@FK_sKhachhangID varchar(10)
	Select @PK_sHoadonID = PK_sHoadonID From inserted	
	If Exists(Select * From tblHoadon Where PK_sHoadonID = @PK_sHoadonID)
	Begin
		Print N'Kiểm tra lại! Hóa đơn đã có ở máy trạm.'
		Rollback Transaction
	End
	Else
	Begin
		If Exists(Select * From [HIEU-PC].quanlytiemcoffe1.dbo.tblHoadon Where PK_sHoadonID = @PK_sHoadonID)
		Begin
			Print N'Kiểm tra lại! Hóa đơn đã có ở máy ảo.'
			Rollback Transaction
		End
		Else
		Begin
			Select @ngaylap = dNgaylap From inserted
			If (Year(@ngaylap) < 2017)
			Begin
				Rollback Transaction
				Select @FK_sNhanvienID=FK_sNhanvienID,@FK_sKhachhangID=FK_sKhachhangID From inserted
				Insert Into [HIEU-PC].quanlytiemcoffe1.dbo.tblHoadon
				Values(@PK_sHoadonID,@ngaylap,@FK_sNhanvienID,@FK_sKhachhangID)
				Print N'Thêm thành công vào máy ảo'
			End
			Else
			Begin
				Insert Into tblHoadon
				Values(@PK_sHoadonID,@ngaylap,@FK_sNhanvienID,@FK_sKhachhangID)
				Print N'Thêm thành công vào máy trạm'
			End
		End
	End
End
Go

Insert into tblHoadon Values('HD08','3/7/2017','NV01','KH02')

---- Phân mảnh ngang bảng hóa đơn nên phải phân mảnh ngang bảng chi tiết
---- Trigger phân mảnh ngang bảng chi tiết
Create Trigger tg_PmnCTHD
On tblChitietHD
Instead of Insert
As
Begin
	Declare @FK_sHoadonID varchar(10)
	Select @FK_sHoadonID=FK_sHoadonID From inserted
	If Exists (Select * From tblHoadon Where PK_sHoadonID=@FK_sHoadonID)
	Begin
		Declare @FK_sMathangID varchar(10), @iSoluong int
		Select @FK_sMathangID=FK_sMathangID,@iSoluong=iSoluong From inserted
		Print N'Thêm thành công.'
		Insert into tblChitietHD
		Values (@FK_sHoadonID,@FK_sMathangID,@iSoluong)
	End
	Else
	Begin
		If Exists (Select * From [HIEU-PC].quanlytiemcoffe1.dbo.tblHoadon Where PK_sHoadonID=@FK_sHoadonID)
		Begin
			Rollback Tran
			Insert into [HIEU-PC].quanlytiemcoffe1.dbo.tblChitietHD
			Values (@FK_sHoadonID,@FK_sMathangID,@iSoluong)
			Print N'Thêm vào máy ảo thành công.'
		End
		Else
		Begin
			Rollback Tran
			Print N'Hóa đơn không tồn tại.'
		End
	End
End

Insert into tblChitietHD Values ('HD08','MH01',2)

---- Tạo Proc nhập dữ liệu cho bảng khách hàng được phân mảnh dọc
Create ProC spInsertKhachhang
@PK_sKhachhangID varchar(10),
@sHoten nvarchar(20),
@sSDT varchar(13),
@sDiachi nvarchar(20)
As
Begin
	If Exists (Select * From tblKhachhang Where PK_sKhachhangID = @PK_sKhachhangID )
		Begin
			Print N' Mã khách hàng bị trùng.'
		End
	Else
		Begin
			Insert Into tblKhachhang
			Values(@PK_sKhachhangID , @sHoten)

			Insert Into [HIEU-PC].quanlytiemcoffe1.dbo.tblKhachhang
			Values(@PK_sKhachhangID , @sSDT , @sDiachi)

			Print N'Thành công.'
		End
End
Go

Exec spInsertKhachhang 'KH03',N'Nguyễn Nam Anh',0987543234,N'Hà Nội'

---- Lấy dữ liệu từ bảng Hóa đơn được phân mảnh ngang
Select PK_sHoadonID,dNgaylap,FK_sNhanvienID,FK_sKhachhangID
From tblHoadon
Union 
Select PK_sHoadonID,dNgaylap,FK_sNhanvienID,FK_sKhachhangID
From [HIEU-PC].quanlytiemcoffe1.dbo.tblHoadon

---- Lấy dữ liệu từ bảng Khách hàng được phân mảnh dọc
Select a.PK_sKhachhangID, sHoten, sSDT,sDiachi
From tblKhachhang a Inner Join [HIEU-PC].quanlytiemcoffe1.dbo.tblKhachhang b 
ON (a.PK_sKhachhangID =b.PK_sKhachhangID)