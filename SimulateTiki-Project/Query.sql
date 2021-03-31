USE TIKI
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Them Nhan Vien
CREATE PROC ThemNhanVien
    @hoTen NVARCHAR(40) ,
    @phai NVARCHAR(3) ,
    @diaChi NVARCHAR(100) ,
    @SDT CHAR(12) ,
    @email NVARCHAR(50) ,
    @chucVu NVARCHAR(50) ,
    @luong FLOAT ,
    @maNVQL INT ,
    @maKho INT
AS
    BEGIN
        IF ( @maNVQL NOT IN ( SELECT    MANV
                              FROM      dbo.NHANVIEN ) )
            BEGIN
                PRINT N'Không tìm thấy nhân viên quản lý trên'
                RETURN
            END
        ELSE
            IF ( @maKho NOT IN ( SELECT MAKHO
                                 FROM   dbo.KHOHANG ) )
                BEGIN
                    PRINT N'Không tìm thấy kho trên'
                    RETURN
                END
		INSERT dbo.NHANVIEN
		        ( HOTEN ,
		          PHAI ,
		          DIACHI ,
		          SDT ,
		          EMAIL ,
		          CHUCVU ,
		          LUONG ,
		          MANVQL ,
		          MAKHO
		        )
		OUTPUT Inserted.MANV
		VALUES  ( @hoTen, -- HOTEN - char(40)
                  @phai, -- PHAI - char(3)
                  @diaChi, -- DIACHI - char(100)
                  @SDT, -- SDT - char(12)
                  @email, -- EMAIL - char(50)
                  @chucVu, -- CHUCVU - char(20)
                  @luong, -- LUONG - float
                  @maNVQL, -- MANVQL - INT
                  @maKho  -- MAKHO - INT
		        )
    END

    EXEC ThemNhanVien N'Nguyễn Trà Hương', N'Nữ', N'56 Clarendon Freeway', '0964879846', 'qsqnad@gmail.com', N'Nhân viên bảo hành', 5090486.16145294, 92, 28

	SELECT *
	FROM dbo.NHANVIEN
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Them San Pham
CREATE PROC ThemSanPham
    @tenSP NVARCHAR(100) ,
    @loaiSP NVARCHAR(20) ,
    @maNCC INT ,
    @dongia FLOAT ,
    @thuongHieu NVARCHAR(20) ,
    @xuatXu NVARCHAR(20) ,
    @chatLieu NVARCHAR(20) ,
    @trongLuong FLOAT ,
    @kichThuoc FLOAT ,
    @chiTietSP NVARCHAR(256)
AS
    BEGIN
            IF ( @maNCC NOT IN ( SELECT MANCC
                                 FROM   dbo.NHACUNGCAP ) )
                BEGIN
                    PRINT N'Không tìm thấy nhà cung cấp trên'
                    RETURN
                END
		INSERT dbo.SANPHAM
		        ( TENSP ,
		          LOAISP ,
		          MANCC ,
		          DONGIA ,
		          THUONGHIEU ,
		          XUATXU ,
		          CHATLIEU ,
		          TRONGLUONG ,
		          KICHTHUOC ,
		          CHITIETSP
		        )
		OUTPUT Inserted.MASP
		VALUES  ( @tenSP, -- TENSP - char(100)
                  @loaiSP, -- LOAISP - char(20)
                  @maNCC, -- MANCC - INT
                  @dongia, -- DONGIA - float
                  @thuongHieu, -- THUONGHIEU - char(20)
                  @xuatXu, -- XUATXU - char(20)
                  @chatLieu, -- CHATLIEU - char(20)
                  @trongLuong, -- TRONGLUONG - float
                  @kichThuoc, -- KICHTHUOC - float
                  @chiTietSP  -- CHITIETSP - char(256)
		        )
    END
        
    EXEC ThemSanPham N'Hạt giống sen Mini Nhật Bản', N'Hàng Quốc Tế', 34, 1434458.9102587, N'Cipsapistor', N'Syria', NULL, 977.300436691055, 58.370175798596, N'Hạt giống để trồng'

	SELECT *
	FROM dbo.SANPHAM
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Thêm chi tiết đơn hàng
CREATE PROC ThemCTDH @maDH INT, @maKH INT
AS
    BEGIN
        DECLARE @maSP INT ,
            @tenSP NVARCHAR(100) ,
            @soLuong INT ,
            @gia FLOAT ,
            @giamGia FLOAT ,
            @tong FLOAT ,
            @khoiLuong FLOAT
        DECLARE cursorGH CURSOR
        FOR
            SELECT  MASP ,
                    SOLUONG
            FROM    GIOHANG
            WHERE   MAKH = @maKH
        OPEN cursorGH                

        FETCH NEXT FROM cursorGH     
		INTO @maSP, @soLuong

        WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @khoiLuong = @khoiLuong + ( SELECT  TRONGLUONG
                                                FROM    dbo.SANPHAM
                                                WHERE   MASP = @maSP
                                              )
                SET @tenSP = ( SELECT   TENSP
                               FROM     dbo.SANPHAM
                               WHERE    MASP = @maSP
                             )

                SET @gia = ( SELECT DONGIA
                             FROM   dbo.SANPHAM
                             WHERE  MASP = @maSP
                           )

                SET @giamGia = NULL

                SET @tong = @gia * @soLuong

                INSERT  dbo.CHITIETDONHANG
                VALUES  ( @maDH, -- MADH - INT
                          @maSP, -- MASP - INT
                          @tenSP, -- TENSP - char(100)
                          @soLuong, -- SOLUONG - int
                          @gia, -- GIA - float
                          @giamGia, -- GIAMGIA - float
                          @tong  -- TONGTAM - float
                          )
				
                FETCH NEXT FROM cursorGH
          INTO @maSP, @soLuong
            END

        CLOSE cursorGH              
        DEALLOCATE cursorGH
        UPDATE  dbo.THONGTINDONHANG
        SET     KHOILUONGDH = @khoiLuong
        WHERE   MADH = @maDH      
    END

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--Thêm thông tin đơn hàng
CREATE PROC ThemDonHang
    @maKH INT ,
    @hoTenNTT NVARCHAR(40) ,
    @SDTNTT CHAR(12) ,
    @diaChi NVARCHAR(100) ,
    @SDTNhan CHAR(12) ,
    @phiVanChuyen FLOAT ,
    @PTTT NVARCHAR(50),
    @giamGia FLOAT
AS
    BEGIN
        DECLARE @ma INT
		INSERT dbo.THONGTINDONHANG
		        ( NGAYDAT ,
		          MAKH ,
		          HOTENNTT ,
		          SDT_NTT ,
		          DIACHIGIAO ,
		          SDTNHAN ,
		          PHIVANCHUYEN ,
		          PHUONGTHUCTT ,
		          TRANGTHAIDH ,
		          KHOILUONGDH ,
		          NGAYGIAO ,
		          TONGCHUAGIAM ,
		          GIAMGIA ,
		          TONGCONG
		        )
		OUTPUT Inserted.MADH
		VALUES  ( GETDATE(), -- NGAYDAT - date
                  @maKH, -- MAKH - INT
                  @hoTenNTT, -- HOTENNTT - char(40)
                  @SDTNTT, -- SDT_NTT - char(12)
                  @diaChi, -- DIACHIGIAO - char(100)s
                  @SDTNhan, -- SDTNHAN - char(12)
                  @phiVanChuyen, -- PHIVANCHUYEN - float
                  @PTTT, -- PHUONGTHUCTT - char(50)
                  N'Đặt hàng thành công', -- TRANGTHAIDH - char(50)
                  0.0,  -- KHOILUONGDH - float
                  NULL, -- NGAYGIAO - date
                  0.0, -- TONGCHUAGIAM - float
                  @giamGia, -- GIAMGIA - float
                  0.0  -- TONGCONG - float
		        )
		SET @ma = IDENT_CURRENT('[dbo].[THONGTINDONHANG]')  
        EXEC ThemCTDH @ma, @maKH
		UPDATE dbo.THONGTINDONHANG
		SET TONGCHUAGIAM = (SELECT SUM(GIA*SOLUONG) FROM dbo.CHITIETDONHANG WHERE MADH = @ma)
		WHERE MADH=@ma
		UPDATE dbo.THONGTINDONHANG
		SET TONGCONG = TONGCHUAGIAM - GIAMGIA + PHIVANCHUYEN
		WHERE MADH = @ma
    END
	EXEC ThemDonHang 3, N'Trần Nhân', NULL, NULL, NULL, NULL, N'Tiền mặt', NULL
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--Cập nhật tồn kho
CREATE PROC CapNhatTonKho @maSP INT, @soLuong INT
AS
    BEGIN
        UPDATE  dbo.SANPHAM_KHO
        SET     SOLUONGTON = SOLUONGTON - @soLuong
        WHERE   MASP = @maSP
    END

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cập nhật tình trạng đơn hàng
CREATE PROC CapNhatTinhTrangDH
    @maDH INT ,
    @tinhTrang NVARCHAR(50)
AS
    BEGIN 
        IF ( ( ( SELECT TRANGTHAIDH
                 FROM   dbo.THONGTINDONHANG
                 WHERE  MADH = @maDH
               ) = N'Đặt hàng thành công' )
             AND ( @tinhTrang != N'Tiki đã tiếp nhận đơn hàng' )
           )
            OR ( ( ( SELECT TRANGTHAIDH
                     FROM   dbo.THONGTINDONHANG
                     WHERE  MADH = @maDH
                   ) = N'Tiki đã tiếp nhận đơn hàng' )
                 AND ( @tinhTrang != N'Đang đóng gói' )
               )
            OR ( ( ( SELECT TRANGTHAIDH
                     FROM   dbo.THONGTINDONHANG
                     WHERE  MADH = @maDH
                   ) = N'Đang đóng gói' )
                 AND ( @tinhTrang != N'Đang vận chuyển' )
               )
            OR ( ( ( SELECT TRANGTHAIDH
                     FROM   dbo.THONGTINDONHANG
                     WHERE  MADH = @maDH
                   ) = N'Đang vận chuyển' )
                 AND ( @tinhTrang != N'Giao hàng thành công' )
               )
            OR ( ( SELECT   TRANGTHAIDH
                   FROM     dbo.THONGTINDONHANG
                   WHERE    MADH = @maDH
                 ) = N'Giao hàng thành công' )
            BEGIN
                PRINT N'Cập nhật trạng thái không hợp lệ'
                RETURN
            END
                     
        UPDATE  dbo.THONGTINDONHANG
        SET     TRANGTHAIDH = @tinhTrang
        WHERE   MADH = @maDH
		
		UPDATE dbo.THONGTINDONHANG
		SET NGAYGIAO = GETDATE()
		WHERE   MADH = @maDH

		IF @tinhTrang = N'Giao hàng thành công'
		DECLARE @maSP INT, @soLuong INT
		DECLARE cursorCTDH CURSOR
        FOR
            SELECT  MASP ,
                    SOLUONG
            FROM    dbo.CHITIETDONHANG
			WHERE	MADH = @maDH
        OPEN cursorCTDH                

        FETCH NEXT FROM cursorCTDH
		INTO @maSP, @soLuong
        WHILE @@FETCH_STATUS = 0
            BEGIN
				EXEC CapNhatTonKho @maSP, @soLuong
                FETCH NEXT FROM cursorCTDH
          INTO @maSP, @soLuong
            END
        CLOSE cursorCTDH              
        DEALLOCATE cursorCTDH         			
    END
                       
-----------------------------------------------------------------------------------------------------------------------------------------------------------
--Thống kê doanh thu theo sản phẩm
CREATE PROC ThongKeDTSP @date DATE
AS
    BEGIN
        DECLARE @thang INT ,
            @nam INT,
            @theoNgay FLOAT ,
            @theoThang FLOAT ,
            @theoNam FLOAT
                                
        SET @theoNgay = ( SELECT    SUM(c.TONGTAM)
                          FROM      dbo.THONGTINDONHANG d, dbo.CHITIETDONHANG c
                          WHERE     d.TRANGTHAIDH = N'Giao hàng thành công'
									AND c.MADH = d.MADH
									AND NGAYGIAO = @date
                          GROUP BY  c.MASP
                        )

        SET @thang = MONTH(@date)
        SET @theoThang = ( SELECT    SUM(c.TONGTAM)
                          FROM      dbo.THONGTINDONHANG d, dbo.CHITIETDONHANG c
                          WHERE     d.TRANGTHAIDH = N'Giao hàng thành công'
									AND c.MADH = d.MADH
                                    AND MONTH(NGAYGIAO) = @thang
                                    AND YEAR(NGAYGIAO) = @nam
                           GROUP BY c.MASP
                         )

		SET @nam = YEAR(@date)
        SET @theoNam = ( SELECT    SUM(c.TONGTAM)
                          FROM      dbo.THONGTINDONHANG d, dbo.CHITIETDONHANG c
                          WHERE     d.TRANGTHAIDH = N'Giao hàng thành công'
									AND c.MADH = d.MADH
									AND YEAR(NGAYGIAO) = @nam
                         GROUP BY c.MASP
                       )

        PRINT N'Doanh thu sản phẩm theo ngày: '
        PRINT @theoNgay

        PRINT N'Doanh thu sản phẩm theo tháng: '
        PRINT @theoThang

        PRINT N'Doanh thu sản phẩm theo năm: '
        PRINT @theoNam
    END
	
	EXEC ThongKeDTSP '2018-09-09'
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Thống kê doanh thu theo doanh nghiệp
CREATE PROC ThongKeDTDN @date DATE
AS
    BEGIN
        DECLARE @thang INT ,
				@nam INT ,
				@theoNgay FLOAT ,
				@theoThang FLOAT ,
				@theoNam FLOAT
                               
        SET @theoNgay = ( SELECT    SUM(c.TONGTAM)
                          FROM      dbo.THONGTINDONHANG d, dbo.CHITIETDONHANG c, dbo.SANPHAM s
                          WHERE     d.MADH = c.MADH
                                    AND d.TRANGTHAIDH = N'Giao hàng thành công'
									AND s.MASP = c.MASP
                                    AND NGAYGIAO = @date
                          GROUP BY  s.MANCC
                        )

        SET @thang = MONTH(@date)
        SET @nam = YEAR(@date)
        SET @theoThang = ( SELECT    SUM(c.TONGTAM)
                          FROM      dbo.THONGTINDONHANG d, dbo.CHITIETDONHANG c, dbo.SANPHAM s
                          WHERE     d.MADH = c.MADH
                                    AND d.TRANGTHAIDH = N'Giao hàng thành công'
									AND s.MASP = c.MASP
                                    AND MONTH(NGAYGIAO) = @thang
                                    AND YEAR(NGAYGIAO) = @nam
                           GROUP BY s.MANCC
                         )
        SET @theoNam = ( SELECT    SUM(c.TONGTAM)
                          FROM      dbo.THONGTINDONHANG d, dbo.CHITIETDONHANG c, dbo.SANPHAM s
                          WHERE     d.MADH = c.MADH
                                    AND d.TRANGTHAIDH = N'Giao hàng thành công'
									AND s.MASP = c.MASP
                                AND YEAR(NGAYGIAO) = @nam
                         GROUP BY s.MANCC
                       )
        PRINT N'Doanh thu doanh nghiệp theo ngày: '
        PRINT @theoNgay

        PRINT N'Doanh thu doanh nghiệp theo tháng: '
        PRINT @theoThang

        PRINT N'Doanh thu doanh nghiệp theo năm: '
        PRINT @theoNam
    END

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Thêm tài khoản khách hàng
CREATE PROC TaoTaiKhoan
    @Ten NVARCHAR(40) ,
    @Dt CHAR(12) ,
    @Mail CHAR(50) ,
    @Mk CHAR(50) ,
    @Gt NVARCHAR(3) ,
    @Nsinh DATE
AS
    BEGIN
		INSERT dbo.KHACHHANG
		        ( HOTEN ,
		          SDT ,
		          EMAIL ,
		          MATKHAU ,
		          PHAI ,
		          NGAYSINH
		        )
		OUTPUT Inserted.MAKH
		VALUES  ( @Ten, @Dt, @Mail, @Mk, @Gt, @Nsinh)
    END

    EXEC TaoTaiKhoan N'Đặng Tuấn', '012345678', 'acbjdhd@gmail.com', '1236547', N'Nam', N'1993-08-17'

-----------------------------------------------------------------------------------------------------------------------------------------------------------
--Thêm sổ địa chỉ ứng với MAKH
CREATE PROC ThemDiaChi @Ma INT, @Dc NVARCHAR(100)
AS
BEGIN
    IF ( @Ma NOT IN ( SELECT    MAKH
                      FROM      KHACHHANG ) )
        BEGIN
            PRINT N'Mã KH không tồn tại.'
            RETURN
        END
    ELSE
        IF ( @Dc IN ( SELECT    DAICHI
                      FROM      SODIACHI ) )
            BEGIN
                PRINT N'Địa chỉ đã có trong sổ địa chỉ.'
                RETURN
            END
        ELSE
            BEGIN
                INSERT  INTO SODIACHI
                VALUES  ( @Ma, @Dc )
            END
	END

    EXEC ThemDiaChi 10, N'324 West Cowley Street, Columbia'

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Thêm thông tin NCC
CREATE PROC ThemNCC
    @Ten NVARCHAR(50) ,
    @Chu NVARCHAR(40) ,
    @Dt CHAR(12) ,
    @Mail CHAR(50) ,
    @Mk CHAR(50) ,
    @MaSo CHAR(20) ,
    @Tp NVARCHAR(20) ,
    @Nganh NVARCHAR(100) ,
    @NgayKy DATE ,
    @ngayHet DATE
AS
    BEGIN
		 IF ( @MaSo IN ( SELECT  MASODKKD
                        FROM    NHACUNGCAP ) )
            BEGIN
                PRINT N'Mã số đăng ký không hợp lệ!'
                RETURN
            END
		INSERT dbo.NHACUNGCAP
		        ( TENNCC ,
		          CHUCUAHANG ,
		          SDT ,
		          EMAIL ,
		          MATKHAU ,
		          MASODKKD ,
		          THANHPHO ,
		          NGANHHANG ,
		          NGAYKYHOPDONG ,
		          NGAYCHAMDUT
		        )
		OUTPUT Inserted.MANCC
		VALUES  ( @Ten, @Chu, @Dt, @Mail, @Mk, @MaSo, @Tp, @Nganh,
                  @NgayKy, @ngayHet )
    END

    EXEC ThemNCC N'LunaDemons', N'Ailen Huck', '0362145879',
        'dbdvdcsssfdf@gmail.com', 'bcxsa', 'LEA065201', 'Southampton',
        N'Nhà sách Tiki', '2018-1-04', '2020-10-30'

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Kiểm tra trạng thái đơn hàng dựa vào mã đh
CREATE PROC KiemTraTrangThai @Ma INT
AS
BEGIN
    IF ( @Ma NOT IN ( SELECT    MADH
                      FROM      THONGTINDONHANG ) )
        BEGIN
            PRINT N'Đơn hàng không tồn tại.'
            RETURN
        END
    SELECT  MADH AS N'Mã đơn hàng',
            TRANGTHAIDH AS N'Trạng thái đơn hàng'
    FROM    THONGTINDONHANG
    WHERE   @Ma = MADH
END

EXEC KiemTraTrangThai 1
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Tính tổng số tiền bán hàng, tổng tiền thu được từ việc bán(bao gồm phí)
	-- Tổng tiền được tính đối với các đơn hàng đã thành công (TRANGTHAI Giao hàng thành công)
CREATE PROC TongTien
AS
    DECLARE @TongBan FLOAT ,
        @TongThu FLOAT ,
        @PhiVC FLOAT 
    SET @TongBan = ( SELECT SUM(TONGCONG)
                     FROM   THONGTINDONHANG
                     WHERE  TRANGTHAIDH = N'Giao hàng thành công'
                   )
    SET @PhiVC = ( SELECT   SUM(PHIVANCHUYEN)
                   FROM     THONGTINDONHANG
                   WHERE    TRANGTHAIDH = N'Giao hàng thành công'
                 )
    SET @TongThu = @TongBan + @PhiVC
    PRINT N'Tổng tiền bán: '
    PRINT @TongBan
    PRINT N'Tổng thu: '
    PRINT @TongThu
    RETURN @TongThu

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Dựa vào MaSP -> xuất lượng tồn kho, thuộc kho hàng nào
CREATE PROC XuatSPKho @Ma INT
AS
    SELECT  MASP AS N'Mã sản phẩm',
			MAKHO AS N'Mã Kho',
            SOLUONGTON AS N'Số lượng tồn'
    FROM    SANPHAM_KHO
    WHERE   MASP = @Ma

    EXEC XuatSPKho 6

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Xem sp còn trong kho (để biết lượng sp còn ít hơn mức quy định -> nhập hàng)
CREATE PROC XemSPKhoCon @Ma INT, @Sl INT
AS
    SELECT  MASP ,
            SOLUONGTON
    FROM    SANPHAM_KHO
    WHERE   MAKHO = @Ma
            AND SOLUONGTON > @Sl

    EXEC XemSPKhoCon 'K13', 1000

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Nhập trạng thái đơn hàng -> xem đơn hàng và số lượng đơn hàng theo trình trạng đh
CREATE PROC XemDonHang @TrangThai NVARCHAR(50)
AS
    DECLARE @Sl INT
    SET @Sl = ( SELECT  COUNT(*)
                FROM    THONGTINDONHANG
                WHERE   TRANGTHAIDH = @TrangThai
              )
    SELECT  MADH ,
            NGAYDAT ,
            MAKH
    FROM    THONGTINDONHANG
    WHERE   TRANGTHAIDH = @TrangThai
    PRINT N'Số đơn hàng thuộc trang thái ' + @TrangThai
    PRINT @Sl
    RETURN @Sl
	
    EXEC XemDonHang N'Giao hàng thành công'

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Xuất ra tổng lượng đơn hàng chưa hoàn tất
CREATE PROC XuatDHChuaHT
AS
    DECLARE @Tong INT
    SET @Tong = ( SELECT    COUNT(MADH)
                  FROM      THONGTINDONHANG
                  WHERE     TRANGTHAIDH != N'Giao hàng thành công'
                )
    PRINT N'Tổng lượng đơn hàng chưa hoàn tất: '
    PRINT @Tong
    RETURN @Tong

    EXEC XuatDHChuaHT

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Dựa vào MaSP -> xem các đánh giá về sp
CREATE PROC XemDanhGia @Ma INT
AS
    DECLARE @LuotDG INT
    SET @LuotDG = ( SELECT  COUNT(MASP)
                    FROM    KHAOSATSANPHAM
                    WHERE   MASP = @Ma
                    GROUP BY MASP
                  )
    SELECT  MASP ,
            DANHGIASP
    FROM    KHAOSATSANPHAM
    WHERE   MASP = @Ma
    PRINT N'Tổng lượt đánh giá của sản phẩm có mã ' + @Ma
    PRINT @LuotDG
    RETURN @LuotDG

    EXEC XemDanhGia 'SP0019'

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--LOAD GIỎ HÀNG LÊN WINFORM
CREATE PROC USP_LoadGioHang @userName CHAR(12)
	AS
	BEGIN
		SELECT S.MASP,TENSP, SOLUONG, DONGIA, THANHTIEN
		FROM GIOHANG g,KHACHHANG k, SANPHAM s
		WHERE @userName=k.SDT AND g.MAKH=k.MAKH AND g.MASP=s.MASP
	END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------	
--TÍNH TỔNG TIỀN CỦA GIỎ HÀNG
CREATE PROC USP_TongTienGioHang @userName CHAR(12)
	AS
	BEGIN
		SELECT SUM(THANHTIEN)
		FROM GIOHANG G,KHACHHANG K
		WHERE @userName=SDT and G.MAKH=K.MAKH
	END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--XÓA SẢN PHẨM KHỎI GIỎ HÀNG
CREATE PROC USP_XoaGioHang @userName CHAR(12), @maSP INT
	AS
	BEGIN
		DECLARE @maKH INT
		SET @maKH= (SELECT MAKH FROM KHACHHANG WHERE @userName =SDT)
		DELETE GIOHANG WHERE @maSP=MASP AND @maKH=MAKH
	END
	GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--SỬA SỐ LƯỢNG CỦA SẢN PHẨM TRONG GIỎ HÀNG
CREATE PROC USP_SuaGioHang @userName CHAR(12), @maSP CHAR(12), @soluong INT
AS
	BEGIN
		DECLARE @maKH INT
		SET @maKH= (SELECT MAKH FROM KHACHHANG WHERE @userName =SDT)
		UPDATE dbo.GIOHANG SET SOLUONG=@soluong WHERE @maSP=MASP AND @maKH=MAKH
		EXEC Update_thanhTien @maKH, @maSP
	END
	GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--TÌM SẢN PHẨM THEO TÊN SẢN PHẨM
CREATE PROC USP_TIMSP @tenSP NVARCHAR(100)
AS
	BEGIN
		SELECT * FROM SANPHAM WHERE TENSP LIKE @tenSP
	END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--THÊM SẢN PHẨM MỚI VÀO GIỎ HÀNG (SẢN PHẨM CHƯA CÓ TRONG GIỎ)
CREATE PROC USP_ThemGioHang @userName char(12), @maSP INT, @sl int
AS
	BEGIN
		DECLARE @maKH INT
		SET @maKH= (SELECT MAKH FROM KHACHHANG WHERE @userName = SDT)
		DECLARE @TEMP INT
		SET @TEMP = (SELECT COUNT(*) FROM GIOHANG WHERE MAKH=@maKH AND MASP=@maSP)
		IF(@TEMP = 0)
			BEGIN
				INSERT GIOHANG(MAKH,MASP,SOLUONG) VALUES (@maKH,@maSP,@sl)
				EXEC Update_thanhTien @maKH, @maSP
			END

	END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--KIỂM TRA ĐĂNG NHẬP TÀI KHOẢN TRÊN WINFORM
CREATE PROC USP_Login
	@username CHAR(12), @password char(10)
	AS
	BEGIN
	SELECT * FROM dbo.KHACHHANG WHERE @username =SDT AND  @password = MATKHAU
	END 
	GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--XUẤT DANH SÁCH ĐƠN HÀNG
CREATE PROC USP_DonHangList @userName char(12)
AS 
BEGIN
	SELECT DH.MADH,NGAYDAT,TRANGTHAIDH AS TRANGTHAI FROM THONGTINDONHANG DH,KHACHHANG KH
	WHERE DH.MAKH = KH.MAKH  AND KH.SDT = @userName
END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--XUẤT CHI TIẾT ĐƠN HÀNG CỦA 1 ĐƠN HÀNG
CREATE PROC USP_ChiTietDH @maDH INT
AS
BEGIN
	SELECT * FROM CHITIETDONHANG WHERE MADH=@maDH
END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--TÍNH TỔNG TIỀN 1 ĐƠN HÀNG
CREATE PROC USP_TongTien @maDH INT
AS
BEGIN
	SELECT SUM(TONGTAM) FROM CHITIETDONHANG WHERE MADH=@maDH
END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--XÓA ĐƠN HÀNG
CREATE PROC USP_HuyDon @maDH INT
AS
BEGIN
	DECLARE @TRANGTHAIDH NVARCHAR(50)
	SET @TRANGTHAIDH= (SELECT TRANGTHAIDH FROM dbo.THONGTINDONHANG WHERE MADH=@maDH )
	IF(@TRANGTHAIDH = N'ĐẶT HÀNG THÀNH CÔNG')
		BEGIN
			DELETE CHITIETDONHANG WHERE MADH= @maDH
			DELETE THONGTINDONHANG WHERE MADH = @MaDH
		END
END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--XUẤT SỔ ĐỊA CHỈ
CREATE PROC USP_SODIACHI @userName char(12)
AS
BEGIN
	SELECT * FROM SODIACHI DC, KHACHHANG K
	WHERE DC.MAKH=K.MAKH AND K.SDT=@userName
END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--THÊM ĐỊA CHỈ
CREATE PROC USP_THEMDIACHI @userName char(12), @diaChi nvarchar(100)
AS
BEGIN
	DECLARE @maKH INT
	SET @maKH= (SELECT MAKH FROM KHACHHANG WHERE @userName =SDT)
	INSERT SODIACHI VALUES(@maKH,@diaChi)
END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
--ĐẶT HÀNG
CREATE PROC USP_DATHANG @userName char(12),@diaCHi NVARchar(100),@sdtNhan char(12), @PTTT NVARCHAR(50)
AS
BEGIN
	DECLARE @maKH INT, 
			@hoTenNTT NVARCHAR(40)	
	SET @maKH= (SELECT MAKH FROM KHACHHANG WHERE @userName =SDT)
	SET @hoTenNTT=(SELECT HOTEN FROM dbo.KHACHHANG WHERE @userName =SDT)
	EXEC ThemDonHang @maKH, @hoTenNTT,@userName,@diaCHi,@sdtNhan,0,@PTTT,0

END



----------------------------------------------------------------------------------------------------------------------------------------------------------------
--XÓA TOÀN BỘ GIỎ HÀNG
CREATE PROC USP_XoaTatCaGioHang @userName CHAR(12)
	AS
	BEGIN
		DECLARE @maKH INT
		SET @maKH= (SELECT MAKH FROM KHACHHANG WHERE @userName =SDT)
		DELETE GIOHANG WHERE @maKH=MAKH
	END
	GO