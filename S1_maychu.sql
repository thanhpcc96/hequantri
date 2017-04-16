---- Tạo CSDL cho máy chủ S1
CREATE DATABASE S1_QUANLYTIEMCOFFEE  COLLATE Vietnamese_CI_AS
GO
USE S1_QUANLYTIEMCOFFEE
GO
--=================================================================================================================================
--==========										 Tạo các bảng cho CSDL máy chủ S1										=======
--==========						(bảng khách hàng được phân tách dọc chỉ chứa PK_sKhachhangID và sHoten)					=======
--==========										Bảng Hóa đơn phân tách ngang											=======
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

INSERT INTO tblNHANVIEN VALUES  ('NV01',N'Nguyễn Tuấn Anh',09121232154,1,'Nam','3/3/1995',N'Hà Nội'),
								('NV02',N'Nguyễn Thùy Linh',09121153343,2,N'Nữ','5/3/1995',N'Hà Nội')
GO
---- (bảng khách hàng được phân mảnh dọc chỉ chứa PK_sKhachhangID và sHoten)
CREATE TABLE tblKHACHHANG(
PK_sKhachhangID VARCHAR(10) NOT NULL,
sHoten NVARCHAR(20)
);

insert into tblKhachhang values ('KH01',N'Đỗ Văn Hòa'),
								('KH02',N'Đỗ Văn Toàn')
GO

CREATE TABLE tblSANPHAM(
PK_sSanphamID VARCHAR(10)NOT NULL,
sTensanpham NVARCHAR(30),
sMota NVARCHAR(40),
iDongia INT,
);

INSERT INTO dbo.tblSANPHAM( PK_sSanphamID ,sTensanpham ,sMota ,iDongia )
VALUES    ('MH01',N'Coffe đen',N'Làm từ hạt cà phê đen nguyên chất.',10000),
		  ('MH02',N'Coffe sữa',N'Làm từ hạt cà phê nguyên chất.',10000)
GO


--- Phân mảnh theo chiều ngang bảng HOADON
CREATE TABLE tblHOADON(
PK_sHoadonID VARCHAR(20) NOT NULL,
dNgaylap DATE,
FK_sNhanvienID VARCHAR(10),
FK_sKhachhangID VARCHAR(10),
FK_iSoban INT
);

INSERT INTO dbo.tblHOADON( PK_sHoadonID, dNgaylap, FK_sNhanvienID , FK_sKhachhangID ,FK_iSoban)
VALUES  ('HD01','3/4/2017','NV01','KH02',1),
		('HD02','3/4/2017','NV02','KH01',2)
GO
CREATE TABLE tblCHITIETHOADON(
FK_sHoadonID VARCHAR(20) NOT NULL,
FK_sSanphamID VARCHAR(10) NOT NULL,
iSoluong INT,
);








CREATE TABLE tblChitietHD(
FK_sHoadonID varchar(20)not null,
FK_sMathangID varchar(10)not null,
iSoluong int
)

insert into tblChitietHD values ('HD01','MH01',1),
								('HD02','MH02',2)
GO
CREATE TABLE tblNGUYENLIEU(
PK_sNguyenlieuID VARCHAR(10) NOT NULL,
sTennguyenlieu NVARCHAR(50),
FK_sNhacungcapID VARCHAR(10),
iDongia INT,
sDonvidoluong NVARCHAR(10)
);
GO

CREATE TABLE tblNHACUNGCAP(
PK_sNhaCCID VARCHAR(10) NOT NULL,
sTennhaCC NVARCHAR(50)
);
GO

CREATE TABLE tblBAN(
PK_iSoban INT NOT NULL,
iSoghe INT
);
GO

CREATE TABLE tblHOADONNHAP(
PK_sHoadonnhapID VARCHAR(10) NOT NULL,
dNgaylap DATE,
FK_sNhanvienID VARCHAR(10)
);
GO

CREATE TABLE tblCHITIETHOADONNHAP(
FK_HoadonnhapID VARCHAR(10) NOT NULL,
FK_sNguyenlieuID VARCHAR(10) NOT NULL,
iSoluong INT,
sDonvi VARCHAR(10) -- gam, kg, tá,  bịch,......
);
GO

CREATE TABLE tblCHUCVU(
PK_sChucvuID VARCHAR(10) NOT NULL,
sTenchucvu NVARCHAR(50),
fHesoluong FLOAT
);
GO
CREATE TABLE tblCONGTHUCCHE(
FK_sSanphamID VARCHAR(10) NOT NULL,
FK_sNguyenlieuID VARCHAR(10) NOT NULL,
iHamluong INT,
sDonvidoluong VARCHAR(10)
);
GO
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
ADD CONSTRAINT PK_ChitietHD PRIMARY KEY(FK_sHoadonID,FK_sSanphamID);

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
ADD CONSTRAINT PK_CTHOADONNHAP PRIMARY KEY(FK_HoadonnhapID,FK_sNguyenlieuID)

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
GO

-- 13) tạo FK_ Hóa đơn và bàn
ALTER TABLE dbo.tblHOADON
ADD CONSTRAINT FK_HOADON_BAN
FOREIGN KEY(FK_iSoban)
REFERENCES dbo.tblBAN(PK_iSoban)


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

GO 
---------=======================================================================================
------ Tạo kết nối tới máy ảo S2V ( server 2 vitual)
-- tạo linked server
EXEC master.dbo.sp_addlinkedserver
@server = N'S2SERVER', -- tên mình đặt cho server
@provider=N'SQLOLEDB', -- provider giống driver kết nối
@datasrc=N'10.10.10.10\S1SQL', -- địa chỉ IP\instances_name_server
@srvproduct=N'PHANTANSQL' -- tên product tùy ý
GO 
-- Kiểm tra linked server
EXEC sp_linkedservers

-- Login vào linked server
EXEC master.dbo.sp_addlinkedsrvlogin
@rmtsrvname=N'S2SERVER',
@useself=N'False',
@locallogin=NULL,
@rmtuser=N'thanhpcc',
@rmtpassword='1234'
GO 
-- test kết nối
SELECT TOP 100 * FROM S1SERVER.ok.dbo.test --SERVER.database.bảng
GO
---- Tạo trigger để phân mảnh ngang bảng bảng hóa đơn với điều kiện máy trạm lưu những hóa đơn từ tháng 4 năm 2017 và máy ảo chứa hóa đơn trước tháng 4 năm 2017
CREATE TRIGGER tg_PmnHD
On dbo.tblHOADON
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @ngaylap DATE, @PK_sHoadonID VARCHAR(20),@FK_sNhanvienID VARCHAR(10),@FK_sKhachhangID VARCHAR(10),@FK_iSoban INT
	Select @PK_sHoadonID = PK_sHoadonID From inserted	
	IF EXISTS(SELECT * FROM dbo.tblHOADON WHERE PK_sHoadonID = @PK_sHoadonID)
	BEGIN
		PRINT N'Kiểm tra lại! Hóa đơn đã có ở máy chủ S1.'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		IF EXISTS(SELECT * FROM S2SERVER.S2v_QUANLYTIEMCOFFEE.dbo.tblHOADON WHERE PK_sHoadonID = @PK_sHoadonID)
		BEGIN
			PRINT N'Kiểm tra lại! Hóa đơn đã có ở máy ảo S2.'
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			Select @ngaylap = dNgaylap From inserted
			If (Year(@ngaylap)=2017 AND MONTH(@ngaylap)<4)
			Begin
				ROLLBACK TRANSACTION
				SELECT @FK_sNhanvienID=FK_sNhanvienID, @FK_sKhachhangID=FK_sKhachhangID, @FK_iSoban=Inserted.FK_iSoban FROM inserted
				INSERT INTO S2SERVER.S2v_QUANLYTIEMCOFFEE.dbo.tblHOADON
						(PK_sHoadonID,dNgaylap,FK_sNhanvienID,FK_sKhachhangID,FK_iSoban)
				VALUES  (@PK_sHoadonID,@ngaylap,@FK_sNhanvienID,@FK_sKhachhangID,@FK_iSoban)
				PRINT N'Thêm thành công vào máy ảo S2'
			END
			ELSE
			BEGIN
				Insert Into dbo.tblHOADON (PK_sHoadonID , dNgaylap , FK_sNhanvienID , FK_sKhachhangID ,FK_iSoban)
								VALUES    (@PK_sHoadonID, @ngaylap , @FK_sNhanvienID, @FK_sKhachhangID,@FK_iSoban)
				PRINT  N'Thêm thành công vào máy chủ S1'
			END
		END
	END
END
GO

INSERT INTO dbo.tblHOADON
        ( PK_sHoadonID ,
          dNgaylap ,
          FK_sNhanvienID ,
          FK_sKhachhangID ,
          FK_iSoban
        )
VALUES  ('HD08','3/7/2017','NV01','KH02',1)
