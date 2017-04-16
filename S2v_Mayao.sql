---- Tạo CSDL cho máy ảo
Create Database S2v_QUANLYTIEMCOFFEE  COLLATE Vietnamese_CI_AS
Use S2v_QUANLYTIEMCOFFEE

--=================================================================================================================================
--==========										 Tạo các bảng cho CSDL máy chủ S1										=======
--==========			  (bảng khách hàng được phân tách dọc chỉ chứa PK_sKhachhangID và sSDT, sDiachi)					=======
--==========										Bảng Hóa đơn phân tách ngang											=======
--=================================================================================================================================
GO

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
---- (bảng khách hàng được phân mảnh dọc chỉ chứa PK_sKhachhangID và sSDT, sDiachi)
CREATE TABLE tblKHACHHANG(
PK_sKhachhangID VARCHAR(10) NOT NULL,
sSDT VARCHAR(13),
sDiachi NVARCHAR(20),
);


INSERT INTO dbo.tblKHACHHANG
        ( PK_sKhachhangID, sSDT, sDiachi )
VALUES  ('KH01','01672454407',N'Cà Mau'),
		('KH02','0963366444',N'Hà Nội')
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
GO 
-- 2) Tạo PK bảng KHACHHANG
ALTER TABLE tblKHACHHANG
ADD CONSTRAINT PK_Khachhang PRIMARY KEY (PK_sKhachhangID);
GO
-- 3) Tạo PK bảng HOADON
ALTER TABLE tblHOADON
ADD CONSTRAINT PK_Hoadon PRIMARY KEY (PK_sHoadonID);
GO
-- 4) Tạo PK bảng SANPHAM
ALTER TABLE dbo.tblSANPHAM
ADD CONSTRAINT PK_Sanpham PRIMARY KEY (PK_sSanphamID);
GO
-- 5)Tạo PK bảng CHITIETHOADON
ALTER TABLE dbo.tblCHITIETHOADON
ADD CONSTRAINT PK_ChitietHD PRIMARY KEY(FK_sHoadonID,FK_sSanphamID);
GO
-- 6) Tạo PK bảng Công thức chế
ALTER TABLE dbo.tblCONGTHUCCHE
ADD CONSTRAINT PK_CONGTHUCCHE PRIMARY KEY(FK_sSanphamID,FK_sNguyenlieuID);
GO
-- 7) Tạo PK bảng NGUYENLIEU
ALTER TABLE dbo.tblNGUYENLIEU 
ADD CONSTRAINT PK_Nguyenlieu PRIMARY KEY(PK_sNguyenlieuID);
GO
-- 8) Tạo PK bảng BÀN
ALTER TABLE dbo.tblBAN
ADD CONSTRAINT PK_Ban PRIMARY KEY(PK_iSoban);
GO
-- 9) Tạo PK bảng Nhà cung cấp
ALTER TABLE dbo.tblNHACUNGCAP
ADD CONSTRAINT PK_NhaCC PRIMARY KEY(PK_sNhaCCID);
GO
-- 10) tạo pk bảng hóa đơn nhập
ALTER TABLE dbo.tblCHITIETHOADONNHAP
ADD CONSTRAINT PK_CTHOADONNHAP PRIMARY KEY(FK_HoadonnhapID,FK_sNguyenlieuID)
GO
-- 11) tạo pk bảng HOADONNHAP
ALTER TABLE dbo.tblHOADONNHAP
ADD CONSTRAINT PK_HOADONNHAP PRIMARY KEY(PK_sHoadonnhapID);
GO
--12) tạo PK bảng CHUCVU
ALTER TABLE dbo.tblCHUCVU
ADD CONSTRAINT PK_CHUCVU PRIMARY KEY(PK_sChucvuID);
GO





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
GO
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
GO


--=================================================================================================================================
--==========										 TẠO CÁC RÀNG BUỘC          											=======
--=================================================================================================================================

-- 1) Tạo Check Giới tính NHANVIEN
ALTER TABLE tblNHANVIEN
ADD CONSTRAINT CK_NV_GT CHECK(sGioitinh in(N'Nam',N'Nữ'));
GO
--2) Tạo Check số lượng trong chi tiết hóa đơn
Alter table dbo.tblCHITIETHOADON
Add Constraint CK_SL_CTHD Check ( iSoluong > 0);
GO
--3) Tạo check số ghế của bàn
ALTER TABLE dbo.tblBAN
ADD CONSTRAINT CK_SoGhe_Ban CHECK(iSoghe >0)
GO
--	Tạo các CONSTRAINT
ALTER TABLE dbo.tblSANPHAM
ADD CONSTRAINT UNI_tblSANPHAM UNIQUE(sTensanpham);
GO
--=================================================================================================================================
--==========									     PHÂN TÁN CSDL				         								    =======
--=================================================================================================================================
-- tạo linked server chủ
EXEC master.dbo.sp_addlinkedserver
@server = N'S1SERVERCHU',
@provider=N'SQLOLEDB',
@datasrc=N'10.10.10.1\SQL2012',
@srvproduct=N'PHANTANSQL'

GO
-- Kiểm tra linked server
EXEC sp_linkedservers
GO

-- Login vào linked server
EXEC master.dbo.sp_addlinkedsrvlogin
@rmtsrvname=N'S1SERVERCHU',
@useself=N'False',
locallogin=NULL,
@rmtuser=N'thanhpcc',
@rmtpassword='1234'
GO
-- test kết nối
SELECT TOP 100 * FROM S1SERVERCHU.ok.dbo.test --SERVER.database.bảng
GO

---- Kiểm tra linked server thành công hay không
Select * From sys.sysservers
GO



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