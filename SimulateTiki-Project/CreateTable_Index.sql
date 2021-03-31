CREATE DATABASE [TIKI_INDEX]
GO
USE [TIKI_INDEX]
GO
CREATE TABLE [dbo].[CHITIETDONHANG]
    (
      [MADH] [INT] NOT NULL ,
      [MASP] [INT] NOT NULL ,
      [TENSP] [NVARCHAR](100) NULL ,
      [SOLUONG] [INT] NULL ,
      [GIA] [FLOAT] NULL ,
      [GIAMGIA] [FLOAT] NULL ,
      [TONGTAM] [FLOAT] NULL ,
      PRIMARY KEY CLUSTERED ( [MADH] ASC, [MASP] ASC )
    )
ON  [PRIMARY]

GO
CREATE NONCLUSTERED  INDEX Index_MASP
ON dbo.CHITIETDONHANG (MASP)

GO
CREATE TABLE [dbo].[DANHGIACUAHANG]
    (
      [MAPHIEU] [INT] IDENTITY(1, 1)
                      NOT NULL ,
      [MANCC] [INT] NULL ,
      [NGAYDANHGIA] [DATE] NULL ,
      [DANHGIA] [NVARCHAR](256) NULL ,
      PRIMARY KEY CLUSTERED ( [MAPHIEU] ASC )
    )
ON  [PRIMARY]

GO
CREATE TABLE [dbo].[DANHGIANHANVIEN]
    (
      [MANV] [INT] NOT NULL ,
      [NGAYDANHGIA] [DATE] NOT NULL ,
      [SONGAYNGHICP] [INT] NULL ,
      [SONGAYNGHIKP] [INT] NULL ,
      [DANHGIA] [NVARCHAR](256) NULL ,
      [THUONGPHAT] [FLOAT] NULL ,
      PRIMARY KEY CLUSTERED ( [MANV] ASC, [NGAYDANHGIA] ASC )
    )
ON  [PRIMARY]

GO
CREATE TABLE [dbo].[GIOHANG]
    (
      [MAKH] [INT] NOT NULL ,
      [MASP] [INT] NOT NULL ,
      [SOLUONG] [INT] NOT NULL ,
      [THANHTIEN] [FLOAT] NULL ,
      PRIMARY KEY CLUSTERED ( [MAKH] ASC, [MASP] ASC )
    )
ON  [PRIMARY]

GO
CREATE TABLE [dbo].[KHACHHANG]
    (
      [MAKH] [INT] IDENTITY(1, 1)
                   NOT NULL ,
      [HOTEN] [NVARCHAR](40) NULL ,
      [SDT] [CHAR](12) NULL ,
      [EMAIL] [CHAR](50) NULL ,
      [MATKHAU] [CHAR](50) NULL ,
      [PHAI] [NVARCHAR](3) NULL ,
      [NGAYSINH] [DATE] NULL ,
      PRIMARY KEY CLUSTERED ( [MAKH] ASC )
    )
ON  [PRIMARY]

GO
CREATE TABLE [dbo].[KHAOSATSANPHAM]
    (
      [MASP] [INT] NOT NULL ,
      [NGAYKHAOSAT] [DATE] NOT NULL ,
      [DANHGIASP] [NVARCHAR](256) NULL ,
      [SOLUONGTON] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [MASP] ASC, [NGAYKHAOSAT] ASC )
    )
ON  [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOHANG]    Script Date: 12/3/2019 1:45:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOHANG]
    (
      [MAKHO] [INT] IDENTITY(1, 1)
                    NOT NULL ,
      [TENKHOHANG] [NVARCHAR](50) NULL ,
      [DIACHIKHO] [NVARCHAR](100) NULL ,
      [MANVQLK] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [MAKHO] ASC )
    )
ON  [PRIMARY]
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 12/3/2019 1:45:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP]
    (
      [MANCC] [INT] IDENTITY(1, 1)
                    NOT NULL ,
      [TENNCC] [NVARCHAR](50) NULL ,
      [CHUCUAHANG] [NVARCHAR](40) NULL ,
      [SDT] [CHAR](12) NULL ,
      [EMAIL] [CHAR](50) NULL ,
      [MATKHAU] [CHAR](50) NULL ,
      [MASODKKD] [CHAR](20) NULL ,
      [THANHPHO] [NVARCHAR](20) NULL ,
      [NGANHHANG] [CHAR](100) NULL ,
      [NGAYKYHOPDONG] [DATE] NULL ,
      [NGAYCHAMDUT] [DATE] NULL ,
      PRIMARY KEY CLUSTERED ( [MANCC] ASC )
    )
ON  [PRIMARY]

GO
CREATE TABLE [dbo].[NHANVIEN]
    (
      [MANV] [INT] IDENTITY(1, 1)
                   NOT NULL ,
      [HOTEN] [NVARCHAR](40) NULL ,
      [PHAI] [NVARCHAR](3) NULL ,
      [DIACHI] [NVARCHAR](100) NULL ,
      [SDT] [CHAR](12) NULL ,
      [EMAIL] [CHAR](50) NULL ,
      [CHUCVU] [NVARCHAR](20) NULL ,
      [LUONG] [FLOAT] NULL ,
      [MANVQL] [INT] NULL ,
      [MAKHO] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [MANV] ASC )
    )
ON  [PRIMARY]

GO
CREATE TABLE [dbo].[PHIEUDATHANG]
    (
      [MAPHIEUDAT] [INT] IDENTITY(1, 1)
                         NOT NULL ,
      [NGAYDAT] [DATE] NULL ,
      [TENSP] [NVARCHAR](100) NULL ,
      [MANCC] [INT] NULL ,
      [SOLUONG] [INT] NULL ,
      [MAKHO] [INT] NULL ,
      [MANV] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [MAPHIEUDAT] ASC )
    )
ON  [PRIMARY]

GO
CREATE TABLE [dbo].[PHIEUGIAOHANG]
    (
      [MAPHIEUGIAO] [INT] IDENTITY(1, 1)
                          NOT NULL ,
      [MAPHIEUDAT] [INT] NULL ,
      [NGAYGIAO] [DATE] NULL ,
      [TENSP] [NVARCHAR](100) NULL ,
      [MANCC] [INT] NULL ,
      [SOLUONG] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [MAPHIEUGIAO] ASC )
    )
ON  [PRIMARY]

GO
CREATE TABLE [dbo].[SANPHAM]
    (
      [MASP] [INT] IDENTITY(1, 1)
                   NOT NULL ,
      [TENSP] [NVARCHAR](100) NULL ,
      [LOAISP] [NVARCHAR](20) NULL ,
      [MANCC] [INT] NULL ,
      [DONGIA] [FLOAT] NULL ,
      [THUONGHIEU] [NVARCHAR](20) NULL ,
      [XUATXU] [NVARCHAR](20) NULL ,
      [CHATLIEU] [NVARCHAR](20) NULL ,
      [TRONGLUONG] [FLOAT] NULL ,
      [KICHTHUOC] [FLOAT] NULL ,
      [CHITIETSP] [NVARCHAR](256) NULL ,
      PRIMARY KEY CLUSTERED ( [MASP] ASC )
    )
ON  [PRIMARY]

GO
CREATE NONCLUSTERED  INDEX Index_MANCC
ON dbo.SANPHAM (MANCC)

GO
CREATE NONCLUSTERED  INDEX Index_DONGIA
ON dbo.SANPHAM (DONGIA)

GO
CREATE TABLE [dbo].[SANPHAM_KHO]
    (
      [MASP] [INT] NOT NULL ,
      [MAKHO] [INT] NOT NULL ,
      [SOLUONGTON] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [MASP] ASC )
    )
ON  [PRIMARY]

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SODIACHI]
    (
      [MAKH] [INT] NOT NULL ,
      [DAICHI] [NVARCHAR](100) NOT NULL ,
      PRIMARY KEY CLUSTERED ( [MAKH] ASC, [DAICHI] ASC )
    )
ON  [PRIMARY]

GO
CREATE NONCLUSTERED  INDEX Index_MAKH_SDC
ON dbo.SODIACHI (MAKH)

GO
CREATE TABLE [dbo].[THONGTINBAOHANH]
    (
      [MASP] [INT] NOT NULL ,
      [LOAISP] [NVARCHAR](20) NOT NULL ,
      [LOAIDICHVUBH] [NVARCHAR](100) NULL ,
      [THOIHANBH] [INT] NULL ,
      [DIEUKIENBH] [NVARCHAR](256) NULL ,
      PRIMARY KEY CLUSTERED ( [MASP] ASC, [LOAISP] ASC )
    )
ON  [PRIMARY]

GO
CREATE TABLE [dbo].[THONGTINDONHANG]
    (
      [MADH] [INT] IDENTITY(1, 1)
                   NOT NULL ,
      [NGAYDAT] [DATE] NOT NULL ,
      [MAKH] [INT] NULL ,
      [HOTENNTT] [NVARCHAR](40) NULL ,
      [SDT_NTT] [CHAR](12) NULL ,
      [DIACHIGIAO] [NVARCHAR](100) NULL ,
      [SDTNHAN] [CHAR](12) NULL ,
      [PHIVANCHUYEN] [FLOAT] NULL ,
      [PHUONGTHUCTT] [NVARCHAR](50) NULL ,
      [TRANGTHAIDH] [NVARCHAR](50) NULL ,
      [KHOILUONGDH] [FLOAT] NULL ,
      [NGAYGIAO] [DATE] NULL ,
      [TONGCHUAGIAM] [FLOAT] NULL ,
      [GIAMGIA] [FLOAT] NULL ,
      [TONGCONG] [FLOAT] NULL ,
      PRIMARY KEY CLUSTERED ( [MADH] ASC )
    )
ON  [PRIMARY]

GO
CREATE NONCLUSTERED  INDEX Index_MAKH_TTDH
ON dbo.THONGTINDONHANG (MAKH)

GO
CREATE TABLE [dbo].[TK_MATHANGLOI]
    (
      [MADH] [INT] NOT NULL ,
      [MASP] [INT] NOT NULL ,
      [SOLUONG] [INT] NULL ,
      [NGUYENNHAN] [NVARCHAR](256) NULL ,
      [LUONGXUATTRA] [INT] NULL ,
      PRIMARY KEY CLUSTERED ( [MADH] ASC, [MASP] ASC )
    )
ON  [PRIMARY]

GO
CREATE PROC [dbo].[Update_thanhTien] @makh INT, @masp INT
AS
    BEGIN
        DECLARE @dongia FLOAT
        SET @dongia = ( SELECT  s.DONGIA
                        FROM    dbo.SANPHAM s
                        WHERE   s.MASP = @masp
                      )
        UPDATE  dbo.GIOHANG
        SET     THANHTIEN = @dongia * SOLUONG
        WHERE   MAKH = @makh
                AND MASP = @masp
    END

GO
USE [master]
GO
ALTER DATABASE [TIKI] SET  READ_WRITE 
GO

ALTER TABLE [dbo].[CHITIETDONHANG]  WITH CHECK ADD FOREIGN KEY([MADH])
REFERENCES [dbo].[THONGTINDONHANG] ([MADH])
GO