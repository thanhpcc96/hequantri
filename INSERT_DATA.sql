﻿--=================================================================================================================================
--==========										 INSERT DATABASE           											    =======
--=================================================================================================================================


---- 1) Nhập bản ghi tblNHANVIEN:
INSERT INTO tblNHANVIIEN
VALUES	('NV01',N'Thái Hoàng Linh','0925890228',1,N'Nam','12/03/1996',N'Hà Nội'),
		('NV02',N'Thái Gia Huy','01636956081',2,N'Nam','01/02/2000',N'Hà Nội'),
		('NV03',N'Nguyễn Thu Vân','0925890229',1.5,N'Nữ','12/03/1997',N'Hà Nội'),
		('NV04',N'Phương Xuân Hoàng','0123456789',3,N'Nam','12/12/1984',N'Cà Mau'),
		('NV05',N'Nguyễn Tuấn Huy','0942457682',2,N'Nam','12/08/1978',N'Quảng Ninh'),
		('NV06',N'Phạm Văn Thành', '0999969656',2, N'Nam','05/04/1996',N'Hải Dương')

---- 2) Nhập bản ghi tblKHACHHANG
INSERT INTO tblKHACHHANG
VALUES	('KH01',N'Nguyễn Quang Hợp','0123456806',N'Hai Bà Trưng'),
		('KH02',N'Nguyễn Hải Long','0982462654',N'Hai Bà Trưng'),
		('KH03',N'Nguyễn Viết Toán','0986623732',N'Gia Lâm'),
		('KH04',N'Phương Khoa Linh','01242890567',N'Lò Đúc'),
		('KH05',N'Vũ Hoàng Phúc','0972580053',N'Cầu Giấy')
		
---- 3) Nhập bản ghi vào tblBAN
INSERT INTO dbo.tblBAN( PK_iSoban, iSoghe )
VALUES  ( 1, 4),
		( 2, 2),
		( 3, 3),
		( 4, 6),
		( 5, 8),
		( 6, 2),
		( 7, 5),
		( 8, 2),
		( 9, 6),
		( 10, 4),
		( 11, 2),
		( 12, 6)


---- 4) Nhập bản ghi tblHOADON
INSERT INTO tblHOADON(PK_sHoadonID,dNgaylap,FK_sNhanvienID,FK_sKhachhangID,FK_iSoban)
VALUES	('HD01','12/01/2016','NV01','KH01',1),
		('HD02','12/01/2016','NV01','KH02',2),
		('HD03','12/12/2016','NV01','KH03',3),
		('HD04','12/12/2016','NV01','KH04',4),
		('HD05','01/05/2017','NV01','KH05',5),
		('HD06','01/23/2017','NV02','KH05',6),
		('HD07','01/23/2017','NV02','KH04',7),
		('HD08','01/23/2017','NV02','KH03',8),
		('HD09','01/31/2017','NV02','KH02',8),
		('HD10','01/31/2017','NV02','KH01',9),
		('HD11','02/02/2017','NV03','KH01',8),
		('HD12','02/04/2017','NV03','KH02',10),
		('HD13','02/06/2017','NV03','KH03',12),
		('HD14','02/20/2017','NV03','KH04',1),
		('HD15','02/21/2017','NV03','KH05',2),
		('HD16','02/22/2017','NV04','KH05',5),
		('HD17','03/01/2017','NV04','KH04',7),
		('HD18','03/03/2017','NV04','KH03',6),
		('HD19','03/05/2017','NV04','KH02',4),
		('HD20','03/12/2017','NV04','KH01',6),
		('HD21','03/14/2017','NV05','KH01',4),
		('HD22','03/15/2017','NV05','KH02',2),
		('HD23','03/20/2017','NV05','KH03',1),
		('HD24','03/23/2017','NV05','KH04',6),
		('HD25','03/23/2017','NV05','KH05',9)
	 
---- 5) Nhập bản ghi tblSanpham
INSERT INTO dbo.tblSANPHAM ( PK_sSanphamID ,sTensanpham ,sMota ,iDongia)
VALUES	('SP01',N'Sữa chua đánh đá',N'Sữa chua vinamilk',25000),
		('SP02',N'Sữa chua nếp cẩm',N'Sữa chua có rượu nếp',30000),
		('SP03',N'Chanh leo',N'Chanh leo tươi nhập khẩu',35000),
		('SP04',N'Coffee sữa',N'Cà phê sữa thơm ngon',27000),
		('SP05',N'Coffee đen',N'Cà phê hơi có vị đắng',30000),
		('SP06',N'Chocolate cookie',N'Trà sữa có bánh oreo',45000),
		('SP07',N'Nước ép bưởi',N'Nước bưởi thơm ngon dễ uống',37000),
		('SP08',N'Nước ép táo',N'Nước ép táo có táo miếng',37000),
		('SP09',N'Nước ép cóc',N'Nước ép cóc vị lạ',37000),
		('SP10',N'Nước ép dưa hấu',N'Nước ép dưa hấu giải khát',37000),
		('SP11',N'Nước ép cam',N'Nước ép cam có tép',37000),
		('SP12',N'Nước ép dâu',N'Nước ép dâu thơm ngon',37000),
		('SP13',N'Sinh tố bơ',N'Bơ ép thêm sữa đặc',40000),
		('SP14',N'Sinh tố mãng cầu',N'Mãng cầu giúp đẹp da',41000),
		('SP15',N'Sinh tố chuối',N'Thức uống dễ uống',36000),
		('SP16',N'Sinh tố me',N'Nước uống được ưa chuộng',42000),
		('SP17',N'Matcha trà xanh',N'Vị trà xanh thơm ngon',45000),
		('SP18',N'Matcha bạc hà ',N'Thơm mát tận họng',38000),
		('SP19',N'Trà chanh',N'Chanh tươi giải khát',12000),
		('SP20',N'Trà đào',N'Trà đào có đào miếng',15000),
		('SP21',N'Trà xanh bạc hà',N'Trà có vị bạc hà',28000),
		('SP22',N'Trà vị quất',N'Thơm ngon',32000),
		('SP23',N'Trà mật ong',N'Mật ong giúp chống ho',39000),
		('SP24',N'Trà sữa khoai môn',N'Thức uống được ưa chuộng',39000),
		('SP25',N'Trà sữa mật ong ',N'Thơm vị mật ong',42000)

--6 )Nhập bản ghi tblChitietHD

INSERT INTO dbo.tblCHITIETHOADON
        ( FK_sHoadonID ,FK_sSanphamID ,iSoluong)
VALUES	('HD01','MH01',2),
		('HD01','MH02',1),
		('HD01','MH03',3),
		('HD01','MH04',1),
		('HD01','MH05',1),
		('HD02','MH06',1),
		('HD02','MH07',2),
		('HD02','MH08',1),
		('HD02','MH09',5),
		('HD02','MH10',1),
		('HD03','MH11',1),
		('HD03','MH12',2),
		('HD03','MH13',1),
		('HD03','MH14',2),
		('HD03','MH15',3),
		('HD04','MH16',1),
		('HD04','MH17',3),
		('HD04','MH18',1),
		('HD04','MH19',4),
		('HD04','MH20',1),
		('HD05','MH21',1),
		('HD05','MH22',2),
		('HD05','MH23',1),
		('HD05','MH24',3),
		('HD05','MH25',1),
		('HD06','MH01',1),
		('HD06','MH02',1),
		('HD06','MH03',4),
		('HD06','MH04',1),
		('HD06','MH05',2),
		('HD07','MH06',1),
		('HD07','MH07',3),
		('HD07','MH08',2),
		('HD07','MH09',3),
		('HD07','MH10',1),
		('HD08','MH11',1),
		('HD08','MH12',1),
		('HD08','MH13',2),
		('HD08','MH14',3),
		('HD08','MH15',1),
		('HD09','MH16',2),
		('HD09','MH17',2),
		('HD09','MH18',1),
		('HD09','MH19',2),
		('HD09','MH20',4),
		('HD10','MH21',1),
		('HD10','MH22',2),
		('HD10','MH23',1),
		('HD10','MH24',5),
		('HD10','MH25',1),
		('HD11','MH01',3),
		('HD11','MH02',1),
		('HD11','MH03',1),
		('HD11','MH04',2),
		('HD11','MH05',1),
		('HD12','MH06',2),
		('HD12','MH07',1),
		('HD12','MH08',2),
		('HD12','MH09',2),
		('HD12','MH10',4),
		('HD13','MH11',1),
		('HD13','MH12',3),
		('HD13','MH13',1),
		('HD13','MH14',3),
		('HD13','MH15',1),
		('HD14','MH16',1),
		('HD14','MH17',2),
		('HD14','MH18',2),
		('HD14','MH19',1),
		('HD14','MH20',1),
		('HD15','MH21',2),
		('HD15','MH22',4),
		('HD15','MH23',1),
		('HD15','MH24',2),
		('HD15','MH25',2),
		('HD16','MH01',1),
		('HD16','MH02',2),
		('HD16','MH03',1),
		('HD16','MH04',3),
		('HD16','MH05',1),
		('HD17','MH06',2),
		('HD17','MH07',1),
		('HD17','MH08',2),
		('HD17','MH09',2),
		('HD17','MH10',1),
		('HD18','MH11',2),
		('HD18','MH12',2),
		('HD18','MH13',1),
		('HD18','MH14',2),
		('HD18','MH15',3),
		('HD19','MH16',1),
		('HD19','MH17',2),
		('HD19','MH18',1),
		('HD19','MH19',2),
		('HD19','MH20',1),
		('HD20','MH21',1),
		('HD20','MH22',3),
		('HD20','MH23',2),
		('HD20','MH24',1),
		('HD20','MH25',1),
		('HD21','MH01',1),
		('HD21','MH02',2),
		('HD21','MH03',1),
		('HD21','MH04',1),
		('HD21','MH05',1),
		('HD22','MH06',1),
		('HD22','MH07',1),
		('HD22','MH08',1),
		('HD22','MH09',1),
		('HD22','MH10',1),
		('HD23','MH11',3),
		('HD23','MH12',1),
		('HD23','MH13',2),
		('HD23','MH14',1),
		('HD23','MH15',1),
		('HD24','MH16',2),
		('HD24','MH17',1),
		('HD24','MH18',2),
		('HD24','MH19',1),
		('HD24','MH20',2),	
		('HD25','MH21',1),
		('HD25','MH22',2),
		('HD25','MH23',2),
		('HD25','MH24',2),
		('HD25','MH25',1)
-- 7) Nhập bản ghi bảng Nhà Cung cấp
INSERT INTO dbo.tblNHACUNGCAP
			( PK_sNhaCCID, sTennhaCC )
VALUES		( 'NCC01', N'Vinamilk' ),
			( 'NCC02', N'Natendo' ),
			( 'NCC03', N'Suzuki' ),
			( 'NCC04', N'Trung Nguyên'),
			( 'NCC05', N'Vina Coffee')

-- 8) Nhập bản ghi bảng Nguyenlieu
INSERT INTO dbo.tblNGUYENLIEU( PK_sNguyenlieuID ,sTennguyenlieu ,FK_sNhacungcapID ,iDongia ,sDonvidoluong)
VALUES  ( 'NL01' , N'Sữa tươi' ,'NCC01',25000,N'Bịch' ),
		( 'NL02' , N'Sữa chua không đường','NCC01',35000, N'Vỉ' ),
		( 'NL03' , N'Sữa chua có đường' ,'NCC01' ,30000,  N'Vỉ' ),
		( 'NL04' , N'Váng sữa','NCC01' ,25000,  N'Vỉ' ),
		( 'NL05' , N'Sữa Bột','NCC01' ,500000,  N'Hộp' ),
		( 'NL06' , N'Đường viên','NCC02',17000,  N'Kg' ),
		( 'NL07' , N'Đường viên','NCC02',17000,  N'Kg' ),
		( 'NL08' , N'Đường viên','NCC02',17000,  N'Kg' ),
		( 'NL09' , N'Đường viên','NCC02',17000,  N'Kg' ),
		( 'NL10' , N'Đường viên','NCC02',17000,  N'Kg' ),
		( 'NL11' , N'Đường viên','NCC03',17000,  N'Kg' ),
		( 'NL12' , N'Đường viên','NCC03',17000,  N'Kg' ),
		( 'NL13' , N'Đường viên','NCC03',17000,  N'Kg' ),
		( 'NL14' , N'Đường viên','NCC03',17000,  N'Kg' ),
		( 'NL15' , N'Đường viên','NCC03',17000,  N'Kg' ),
		( 'NL16' , N'Đường viên','NCC04',17000,  N'Kg' ),
		( 'NL17' , N'Đường viên','NCC04',17000,  N'Kg' ),
		( 'NL18' , N'Đường viên','NCC04',17000,  N'Kg' ),
		( 'NL19' , N'Đường viên','NCC04',17000,  N'Kg' ),
		( 'NL20' , N'Đường viên','NCC04',17000,  N'Kg' ),
		( 'NL21' , N'Đường viên','NCC05',17000,  N'Kg' ),
		( 'NL22' , N'Đường viên','NCC06',17000,  N'Kg' ),
		( 'NL23' , N'Đường viên','NCC07',17000,  N'Kg' ),
		( 'NL24' , N'Đường viên','NCC07',17000,  N'Kg' ),
		( 'NL25' , N'Đường viên','NCC07',17000,  N'Kg' )

--9) Nhập bản ghi bảng Cong thuc pha chế
 INSERT INTO dbo.tblCONGTHUCCHE( FK_sSanphamID , FK_sNguyenlieuID , iHamluong ,sDonvidoluong )
 VALUES  ( 'SP01' , 'NL01' ,200 , 'gam' ),
		 ( 'SP01' , 'NL03' ,200 , 'gam' ),
		 ( 'SP01' , 'NL06' ,200 , 'gam' ),
		 ( 'SP02' , 'NL01' ,200 , 'gam' ),
		 ( 'SP02' , 'NL01' ,200 , 'gam' ),
		 ( 'SP02' , 'NL01' ,200 , 'gam' ),
		 ( 'SP03' , 'NL01' ,200 , 'gam' ),
		 ( 'SP03' , 'NL01' ,200 , 'gam' ),
		 ( 'SP03' , 'NL01' ,200 , 'gam' ),
		 ( 'SP03' , 'NL01' ,200 , 'gam' ),
		 ( 'SP04' , 'NL01' ,200 , 'gam' ),
		 ( 'SP04' , 'NL01' ,200 , 'gam' ),
		 ( 'SP04' , 'NL01' ,200 , 'gam' ),
		 ( 'SP05' , 'NL01' ,200 , 'gam' ),
		 ( 'SP05' , 'NL01' ,200 , 'gam' ),
		 ( 'SP05' , 'NL01' ,200 , 'gam' ),
		 ( 'SP06' , 'NL01' ,200 , 'gam' ),
		 ( 'SP06' , 'NL01' ,200 , 'gam' ),
		 ( 'SP07' , 'NL01' ,200 , 'gam' ),
		 ( 'SP07' , 'NL01' ,200 , 'gam' ),
		 ( 'SP07' , 'NL01' ,200 , 'gam' ),
		 ( 'SP08' , 'NL01' ,200 , 'gam' ),
		 ( 'SP08' , 'NL01' ,200 , 'gam' ),
		 ( 'SP08' , 'NL01' ,200 , 'gam' ),
		 ( 'SP09' , 'NL01' ,200 , 'gam' ),
		 ( 'SP09' , 'NL01' ,200 , 'gam' ),
		 ( 'SP10' , 'NL01' ,200 , 'gam' ),
		 ( 'SP10' , 'NL01' ,200 , 'gam' ),
		 ( 'SP11' , 'NL01' ,200 , 'gam' ),
		 ( 'SP11' , 'NL01' ,200 , 'gam' ),
		 ( 'SP11' , 'NL01' ,200 , 'gam' ),
		 ( 'SP12' , 'NL01' ,200 , 'gam' ),
		 ( 'SP12' , 'NL01' ,200 , 'gam' ),
		 ( 'SP12' , 'NL01' ,200 , 'gam' ),
		 ( 'SP13' , 'NL01' ,200 , 'gam' ),
		 ( 'SP13' , 'NL01' ,200 , 'gam' ),
		 ( 'SP14' , 'NL01' ,200 , 'gam' ),
		 ( 'SP14' , 'NL01' ,200 , 'gam' ),
		 ( 'SP15' , 'NL01' ,200 , 'gam' ),
		 ( 'SP15' , 'NL01' ,200 , 'gam' ),
		 ( 'SP16' , 'NL01' ,200 , 'gam' ),
		 ( 'SP17' , 'NL01' ,200 , 'gam' ),
		 ( 'SP18' , 'NL01' ,200 , 'gam' ),
		 ( 'SP18' , 'NL01' ,200 , 'gam' ),
		 ( 'SP19' , 'NL01' ,200 , 'gam' ),
		 ( 'SP19' , 'NL01' ,200 , 'gam' ),
		 ( 'SP19' , 'NL01' ,200 , 'gam' ),
		 ( 'SP20' , 'NL01' ,200 , 'gam' ),
		 ( 'SP20' , 'NL01' ,200 , 'gam' )