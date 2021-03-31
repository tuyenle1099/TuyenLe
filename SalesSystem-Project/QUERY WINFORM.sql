USE PTTK_TH
GO
CREATE PROC USP_LOAITK @username VARCHAR(30)
AS
BEGIN
SELECT username FROM TAIKHOAN WHERE @username = username AND loaiTaiKhoan = 'KH'
END 
GO


--KIỂM TRA ĐĂNG NHẬP 
CREATE PROC USP_Login @username VARCHAR(30), @password char(30)
AS
BEGIN
SELECT username, matKhau FROM TAIKHOAN WHERE @username = username AND  @password = matKhau
END 
GO

--TÌM KIẾM SẢN PHẨM
CREATE PROC USP_TIMKIEM @tenSP NVARCHAR(50)
AS
BEGIN
	SELECT maSP, ten
	FROM SANPHAM
	WHERE ten LIKE '%'+@tenSP+'%'
END
GO

--THÊM SẢN PHẨM VÀO GIỎ HÀNG
CREATE PROC USP_ThemGioHang @userName varchar(30), @maSP INT , @sl INT
AS
BEGIN
	DECLARE @maKH INT,@donGia FLOAT,@tongTien FLOAT
	SET @maKH= (SELECT MAKH FROM TAIKHOAN WHERE userName = @userName )
	SET @donGia= (SELECT GIA FROM SANPHAM WHERE maSP = @maSP) 
		DECLARE @TEMP INT
		SET @TEMP = (SELECT COUNT(*) FROM GIOHANG WHERE MAKH=@maKH AND MASP=@maSP)
		IF(@TEMP = 0)
			BEGIN
				SET @tongTien = @donGia*@sl
				INSERT GIOHANG VALUES (@maKH,@maSP,@sl,@tongTien)
				--EXEC Update_thanhTienSPGH @maKH, @maSP
			END
END
GO

--TÍNH TỔNG TIỀN GIỎ HÀNG CỦA 1 KHÁCH HÀNG
CREATE PROC USP_TongTienGioHang @userName VARCHAR(30)
	AS
	BEGIN
		SELECT SUM(TONGTIEN)
		FROM GIOHANG G,TAIKHOAN T
		WHERE @userName=T.username and G.MAKH=T.MAKH
	END
GO



--LOAD GIỎ HÀNG
CREATE PROC USP_LoadGioHang @userName VARCHAR(30)
	AS
	BEGIN
		SELECT S.MASP,S.TEN, G.SOLUONG, S.GIA, G.TONGTIEN
		FROM GIOHANG G,TAIKHOAN T, SANPHAM S
		WHERE @userName=T.username AND G.MAKH=T.MAKH AND G.MASP=S.MASP
	END
GO

--XÓA SẢN PHẨM KHỎI GIỎ HÀNG
CREATE PROC USP_XoaGioHang @userName VARCHAR(30), @maSP INT
	AS
	BEGIN
		DECLARE @maKH INT
		SET @maKH= (SELECT MAKH FROM TAIKHOAN WHERE @userName = username)
		DELETE GIOHANG WHERE @maSP=MASP AND @maKH=MAKH
	END
	GO

CREATE PROC Update_thanhTien @maKH INT , @maSP INT, @soLuong INT
AS
BEGIN
	DECLARE @donGia FLOAT,
			@tongTien FLOAT
	SET @donGia = (SELECT GIA FROM dbo.SANPHAM WHERE maSP=@maSP)
	SET @tongTien = @donGia * @soLuong
	UPDATE dbo.GIOHANG SET tongTien=@tongTien WHERE @maKH=maKH AND @maSP=maSP
END
GO
--SỬA SỐ LƯỢNG CỦA SẢN PHẨM TRONG GIỎ HÀNG
CREATE PROC USP_SuaGioHang @userName VARCHAR(30), @maSP INT, @soluong INT
AS
	BEGIN
		DECLARE @maKH INT
		SET @maKH= (SELECT MAKH FROM TAIKHOAN WHERE @userName =username)
		UPDATE dbo.GIOHANG SET SOLUONG=@soluong WHERE @maSP=MASP AND @maKH=MAKH
		EXEC Update_thanhTien @maKH, @maSP,@soLuong
	END
	GO

--XUẤT SỔ ĐỊA CHỈ
CREATE PROC USP_SODIACHI @userName VARCHAR(30)
AS
BEGIN
	SELECT * FROM SODIACHI DC, TAIKHOAN TK
	WHERE DC.MAKH=TK.MAKH AND TK.username=@userName
END
GO

--THÊM ĐỊA CHỈ
CREATE PROC USP_THEMDIACHI 
	@userName VARCHAR(30),
	@hoTEN NVARCHAR(50),
	@SDT CHAR(10),
	@tinh NVARCHAR(30),
	@quan	NVARCHAR(30),
	@phuong NVARCHAR(30),
	@diaChi NVARCHAR(50)
AS
BEGIN
	DECLARE @maKH INT,
			@STT INT
	
	SET @maKH= (SELECT MAKH FROM TAIKHOAN WHERE @userName =username)
	SET @STT = (SELECT MAX(STT) FROM dbo.SODIACHI WHERE @maKH = maKH)
	IF(@STT IS NULL)
		BEGIN
			SET @STT = 1
		END
	ELSE
		BEGIN
			SET @STT = @STT + 1
		END
	INSERT SODIACHI VALUES(@maKH,@STT,@hoTEN,@SDT,@diaChi,@phuong,@quan,@tinh)
END
GO
 

--LOAD SỔ ĐỊA CHỈ
CREATE PROC USP_LoadSoDiaChi @userName VARCHAR(30)
	AS
	BEGIN
	DECLARE @maKH INT
		SET @maKH= (SELECT MAKH FROM TAIKHOAN WHERE @userName =username)
		SELECT * FROM dbo.SODIACHI WHERE @maKH = maKH
	END
GO

--LOAD ĐƠN HÀNG
CREATE PROC USP_DonHangList @userName VARCHAR(30)
AS 
BEGIN
	DECLARE @maKH INT
	SET @maKH= (SELECT MAKH FROM TAIKHOAN WHERE @userName =username)
	SELECT MAHD,TRANGTHAI, NGAYLAP, TRANGTHAITHANHTOAN, HINHTHUCTHANHTOAN FROM HOADON
	WHERE @maKH = maKH
END
GO

--LOAD CHI TIẾT ĐƠN HÀNG
CREATE PROC USP_ChiTietDH @maDH INT
AS
BEGIN
	SELECT maSP, soLuong, tongCong FROM CHITIEDONHANG WHERE MAHOADON=@maDH
END
GO

--TONG TIEN CHI TIÊT
CREATE PROC USP_TongTien @maDH INT
AS
BEGIN
	SELECT SUM(TONGCONG) FROM CHITIEDONHANG WHERE MAHOADON=@maDH
END
GO

--USP_THEMHOADONTHANHTOANTHE
CREATE PROC USP_THEMHDTTT @maHD INT, @maThe bigint
AS
BEGIN
	INSERT INTO dbo.HOADONTHANHTOANTHE
	VALUES  (@maHD,@maThe,NULL)
END
GO

--USP_THEMCHITIETDONHANG
CREATE PROC ThemCTDH @maDH INT, @maKH INT
AS
    BEGIN
        DECLARE @maSP INT,
            @soLuong INT ,
            @tong FLOAT
        DECLARE cursorGH CURSOR
        FOR
            SELECT  MASP ,
                    SOLUONG,
					tongTien
            FROM    GIOHANG
            WHERE   MAKH = @maKH
        OPEN cursorGH                

        FETCH NEXT FROM cursorGH     
		INTO @maSP, @soLuong,@tong

        WHILE @@FETCH_STATUS = 0
            BEGIN

                INSERT  dbo.CHITIEDONHANG
                VALUES  ( @maSP, -- MADH - INT
                          @maDH,
						  @soluong, -- MASP - INT
                          @tong,
						  0,
						  NULL  -- TONGTAM - float
                          )
				
                FETCH NEXT FROM cursorGH
          INTO @maSP, @soLuong,@tong
            END

        CLOSE cursorGH              
        DEALLOCATE cursorGH
    END
GO

--USP_THEMDONHANG
CREATE PROC USP_THEMDONHANG @userName VARCHAR(30) , @trangThai NVARCHAR(50) , @trangThaiThanhToan NVARCHAR(50) , @hinhThucThanhToan NVARCHAR(50) , @maThe BIGINT
AS
BEGIN
	DECLARE @MAKH INT,
			@MAHD INT,
			@TONGCONG FLOAT
	SET @maKH= (SELECT MAKH FROM TAIKHOAN WHERE @userName =username)
	SET @MAHD = (SELECT MAX(MAHD) FROM HOADON)
	IF (@MAHD IS NULL)
		BEGIN
			SET @MAHD=1
		END
	ELSE
		BEGIN
			SET @MAHD =@MAHD +1
		END
	SET @TONGCONG = (SELECT SUM(TONGTIEN)
					FROM GIOHANG G
					WHERE @MAKH = G.maKH)
	INSERT INTO HOADON VALUES (@MAHD,@MAKH,@trangThai,@TONGCONG,GETDATE(),NULL,NULL,@trangThaiThanhToan,@hinhThucThanhToan)
	EXEC dbo.ThemCTDH @maHD,@MAKH
	IF(@maThe != 0)
	BEGIN
	EXEC dbo.USP_THEMHDTTT @maHD ,@maThe
	END
END
GO
--XÓA TOÀN BỘ GIỎ HÀNG
CREATE PROC USP_XoaTatCaGioHang @userName VARCHAR(30)
	AS
	BEGIN
		DECLARE @maKH INT
		SET @maKH= (SELECT MAKH FROM dbo.TAIKHOAN WHERE @userName =username)
		DELETE GIOHANG WHERE @maKH=MAKH
	END
GO
--------------
-------------------------------------------------------------------------------
--UYÊN
create procedure dt_TatCaDoiTac
as 
begin 
select * from DOITAC
end 
go

create procedure dt_TimDoiTac (@maDT int)
as 
begin 
select * from DOITAC where maDT = @maDT
end 
go

create procedure dt_ThemDoiTac (@maDt int, @tenDT nvarchar(50), @ngayKiHopDong date, @thoiHan date, @viTriDang nvarchar(50) )
as 
begin 
insert into DOITAC values (@maDt,@tenDT,@ngayKiHopDong,@thoiHan,@viTriDang)
end 
go 

create procedure sp_TatCaSP
as
begin 
select * from SANPHAM
end 
go

create procedure sp_TimSanPham (@maSP int)
as 
begin 
select * from SANPHAM where maSP = @maSP
end 
go

create procedure ttt_XemDS 
as 
begin 
select * from DANHSACHTTT
end 
go

create procedure ttt_ThemDS (@maSP int,@maDT int, @ngayKiHopDong date ,@ngayDangTin date,@hanDangTin date )
as 
begin 
insert into DANHSACHTTT values (@maSP,@maDT,@ngayKiHopDong,@ngayDangTin,@hanDangTin)
end 
go

-----------------------------------------------------
--Vy

CREATE PROC THONGTINHOADON @maHoaDon INT
AS
    BEGIN
        SELECT  maHD AS N'Mã hóa đơn' ,
                maKH AS N'Mã khách hàng' ,
                trangThai AS N'Trạng thái đơn hàng' ,
				tongCong AS N'Tổng cộng' ,
                ngayLap AS N'Ngày lập' ,
				maNVGiaoHang AS N'Mã NV GH' ,
				trangThaiThanhToan AS N'Trạng thái thanh toán' ,
                hinhThucThanhToan AS N'Hình thức thanh toán'
        FROM    dbo.HOADON
        WHERE   maHD = @maHoaDon
    END
GO 

CREATE PROC CAPNHATTRANGTHAIDONHANG @maHoaDon INT, @trangThai NVARCHAR(50)
AS
    BEGIN
        UPDATE dbo.HOADON
		SET trangThai = @trangThai
		WHERE maHD = @maHoaDon
		UPDATE dbo.HOADON
		SET trangThaiThanhToan = N'Thanh toán thành công'
		WHERE maHD = @maHoaDon AND trangThai LIKE N'%Giao hàng thành công%' AND hinhThucThanhToan LIKE N'%Thanh toán tiền mặt%'
    END

CREATE PROC THONGTINHOADONTTTHE @maHoaDon INT
AS
    BEGIN
        SELECT  hd.maHD AS N'Mã hóa đơn' ,
                maKH AS N'Mã khách hàng' ,
				tongCong AS N'Tổng cộng' ,
                ngayLap AS N'Ngày lập' ,
				trangThaiThanhToan AS N'Trạng thái thanh toán' ,
				the.MATHE AS N'Mã thẻ',
				the.XACNHAN AS N'Trạng thái xác nhận'
        FROM    dbo.HOADON hd, dbo.HOADONTHANHTOANTHE the
        WHERE   hd.maHD = @maHoaDon AND the.MAHD = hd.maHD
    END
GO
CREATE PROC XACNHANTINHTRANGTHANHTOAN @maHoaDon INT, @trangThai NVARCHAR(50)
AS
    BEGIN
        UPDATE dbo.HOADONTHANHTOANTHE
		SET XACNHAN = @trangThai
		WHERE maHD = @maHoaDon
    END


--Tuyền Nguyễn
create procedure dt_TatCaNhanVien
as 
begin 
select * from NHANVIEN
end 
go

create procedure dt_NhapMaNV (@MaNV int)
as 
begin 
select * from NHANVIEN where MaNV = @MaNV
end 
go

create procedure sp_TatCaSP
as
begin 
select * from SANPHAM
end 
go

create procedure sp_TimSanPham (@maSP int)
as 
begin 
select * from SANPHAM where maSP = @maSP
end 
go


