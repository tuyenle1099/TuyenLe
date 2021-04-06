--PHAN HE 1: DANH CHO NGUOI QUAN TRI CO SO DU LIEU
-- NOI DUNG: thuc hien cac cau lenh
	-- 1. xem danh sach nguoi dung trong he thong
	-- 2. thong tin ve quyen cua moi user/role tren cac doi tuong du lieu
	-- 3. cho phep tao, xoa, sua user/role
    -- 4. cap quyen cho user, cap quyen cho role
    -- 5. thu hoi quyen
    -- 6. kiem tra quyen cua chu the vua duoc cap
    -- 7. cho phep chinh sua quyen cua user/role
    
    -- kich ban Audit

----------PHAN CONG THUC HIEN--------------------
-- 1712896 - Pham Thi Cam Van: Cau 1, 2,3, 7, Audit, VPD trong kich ban Audit
-- 1712890 - Nguyen Thi Thanh Tuyen: Cau 4, 5, 6

----------BAI LAM--------------------------------
-- xoa cau truc du lieu
BEGIN
    EXECUTE IMMEDIATE 'ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE';
    EXECUTE IMMEDIATE 'DROP ROLE ROLE_THANHVIEN CASCADE';
    EXECUTE IMMEDIATE 'DROP USER QLNHANVIEN CASCADE';
    EXECUTE IMMEDIATE 'DROP ROLE ROLE_TEST CASCADE';
    EXECUTE IMMEDIATE 'DROP USER USER_TV1 CASCADE';
    EXECUTE IMMEDIATE 'DROP USER USER_TV2 CASCADE';
    EXECUTE IMMEDIATE 'DROP USER USER_TV4 CASCADE';
    EXECUTE IMMEDIATE 'DROP USER USER_TV103 CASCADE';
    EXECUTE IMMEDIATE 'DROP ROLE ROLE_THANHVIEN4 CASCADE';
    EXECUTE IMMEDIATE 'DROP USER USER_TEST CASCADE';
    EXECUTE IMMEDIATE 'DROP USER NV001 CASCADE';
    EXECUTE IMMEDIATE 'DROP USER NV101 CASCADE';
    EXECUTE IMMEDIATE 'ALTER TABLE QL_PHONGBAN DROP CONSTRAINT FK_PHONGBAN_NHANVIEN';
    EXECUTE IMMEDIATE 'ALTER TABLE QL_PNHANVIEN DROP CONSTRAINT FK_NHANVIEN_PHONGBAN';
    EXECUTE IMMEDIATE 'DROP TABLE QL_PHONGBAN';
    EXECUTE IMMEDIATE 'DROP TABLE QL_NHANVIEN';
    EXECUTE IMMEDIATE 'DROP FUNCTION VPD_NHANVIEN';
    EXECUTE IMMEDIATE 'DROP FUNCTION VPD_PHONGBAN';
EXCEPTION WHEN OTHERS THEN NULL;
END;

------------------------------------------------------------------------------
----------THUC HIEN: PHAM THI CAM VAN-------------
--dang nhap SYS:
--tao user QLNHANVIEN, cap cho user QLNHANVIEN quyen CONNECT, DBA, cac quyen can cho viec quan ly he thong
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER QLNHANVIEN IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE TO QLNHANVIEN;
GRANT CREATE SESSION TO QLNHANVIEN;
GRANT DBA TO QLNHANVIEN WITH ADMIN OPTION;
GRANT SELECT ON DBA_TABLES TO QLNHANVIEN WITH GRANT OPTION;
GRANT SELECT ON DBA_VIEWS TO QLNHANVIEN WITH GRANT OPTION;
GRANT SELECT ON DBA_USERS TO QLNHANVIEN WITH GRANT OPTION;
GRANT SELECT ON DBA_ROLES TO QLNHANVIEN WITH GRANT OPTION;
GRANT SELECT ON DBA_ROLE_PRIVS TO QLNHANVIEN WITH GRANT OPTION;
GRANT SELECT ON DBA_TAB_PRIVS TO QLNHANVIEN WITH GRANT OPTION;
GRANT SELECT ON DBA_COL_PRIVS TO QLNHANVIEN WITH GRANT OPTION;
GRANT CREATE USER, DROP USER, ALTER USER TO QLNHANVIEN;
GRANT CREATE ROLE, DROP ANY ROLE, ALTER ANY ROLE TO QLNHANVIEN;
GRANT CREATE TABLE, CREATE VIEW TO QLNHANVIEN;

--dang nhap user dba: QLNHANVIEN (pass: 123) tao user test, cap quyen connect cho user
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER USER_TV1 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE TO USER_TV1;
GRANT CREATE SESSION TO USER_TV1;

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER USER_TV2 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE TO USER_TV2;
GRANT CREATE SESSION TO USER_TV2;

--Cau 1,2: tao role ROLE_THANHVIEN cho phep cac user thanh vien duoc phep xem danh sach nguoi dung trong he thong
    --va cho phep xem thong tin ve quyen (privleges) cua moi user/role tren cac doi tuong du lieu
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE ROLE ROLE_THANHVIEN;
GRANT CONNECT TO ROLE_THANHVIEN;

GRANT SELECT ON DBA_USERS TO ROLE_THANHVIEN;
GRANT SELECT ON DBA_ROLE_PRIVS TO ROLE_THANHVIEN;
GRANT SELECT ON DBA_TAB_PRIVS TO ROLE_THANHVIEN;
GRANT SELECT ON DBA_COL_PRIVS TO ROLE_THANHVIEN;
    --gan quyen cho phep xem roles, tables, views
GRANT SELECT ON DBA_ROLES TO ROLE_THANHVIEN;
GRANT SELECT ON DBA_TABLES TO ROLE_THANHVIEN;
GRANT SELECT ON DBA_VIEWS TO ROLE_THANHVIEN;
--grant role da tao cho cac user
GRANT ROLE_THANHVIEN TO USER_TV1, USER_TV2;
    -- Test: dang nhap vao user USER_TV1 (pass: 123) de kiem tra ket qua
    SELECT * FROM DBA_USERS;
    SELECT * FROM DBA_ROLE_PRIVS;
    SELECT * FROM DBA_TAB_PRIVS;
    SELECT * FROM DBA_COL_PRIVS;
-------------
--Cau 3,7: cho phep tao moi, xoa, sua (hieu chinh user/role), chinh sua quyen cua user/role
--dang nhap user dba: QLNHANVIEN (pass: 123)
    -- cap quyen tao, xoa, sua cho role ROLE_THANHVIEN
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
GRANT CREATE USER, DROP USER, ALTER USER TO ROLE_THANHVIEN;
GRANT CREATE ROLE, DROP ANY ROLE, ALTER ANY ROLE TO ROLE_THANHVIEN;
GRANT CREATE TABLE, CREATE VIEW TO ROLE_THANHVIEN; --cho phep tao view, table
    -- Test: dang nhap vao user USER_TV1 (pass:123) de kiem tra ket qua
    --create user
    ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
    CREATE USER USER_TV103 IDENTIFIED BY 123;
    SELECT * FROM DBA_USERS WHERE USERNAME = 'USER_TV103';
    --alter user
    ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
    ALTER USER USER_TV103 IDENTIFIED BY 12345;
    --drop user
    ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
    DROP USER USER_TV103;
        --kiem tra sau khi xoa
    SELECT * FROM DBA_USERS WHERE USERNAME = 'USER_TV103';

------------------------------------------------------------------------------
-------THUC HIEN: NGUYEN THI THANH TUYEN----------
--cau 4,5 cap quyen, thu hoi quyen cua user
--dang nhap QLNHANVIEN (pass 123), tao role va user de test: role ROLE_THANHVIEN4, tao user USER_TV4, cap quyen connect
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE ROLE ROLE_THANHVIEN4;

CREATE USER USER_TV4 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE TO USER_TV4;
GRANT CREATE SESSION TO USER_TV4;
    -- thuc hien cap quyen select with grant option cho user/role
    GRANT SELECT ON DBA_TABLES TO USER_TV4 WITH GRANT OPTION;
    GRANT SELECT ON DBA_TABLES TO ROLE_THANHVIEN4;
    -- dang nhap USER_TV4 (pass: 123) de kiem tra ket qua
    SELECT * FROM DBA_TABLES;
    
--dang nhap QLNHANVIEN (pass: 123) de kiem tra quyen vua duoc cap va tien hanh thu hoi quyen da cap
    SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'USER_TV4';
    SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'USER_TV4';
    SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'ROLE_THANHVIEN4';
    -- thuc hien thu hoi quyen select, update with grant option tu user, role
    ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
    REVOKE SELECT ON DBA_TABLES FROM USER_TV4;
    REVOKE SELECT ON DBA_TABLES FROM ROLE_THANHVIEN4;
    
--cau 6 kiem tra quyen cua chu the vua duoc cap
    --dang nhap QLNHANVIEN (pass: 123) de cap cho user quyen duoc phep xem ds quyen da duoc cap
    GRANT SELECT ON DBA_ROLE_PRIVS TO USER_TV4;
    GRANT SELECT ON DBA_TAB_PRIVS TO USER_TV4;
    --dang nhap va user USER_TV4 de kiem tra ket qua cap quyen
    SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'USER_TV4';
    SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'USER_TV4';
    
    
------------------------------------------------------------------------------
----------THUC HIEN: PHAM THI CAM VAN-------------
--AUDIT: tao kich ban theo doi he thong phan tich du lieu nhat ky
--dang nhap user QLNHANVIEN (pass; 123)

--tao cac user nhan vien (NV001) va truong phong (NV101)
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER NV001 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE TO NV001;
GRANT CREATE SESSION TO NV001;

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER NV101 IDENTIFIED BY 123;
GRANT CONNECT, RESOURCE TO NV101;
GRANT CREATE SESSION TO NV101;

--tao bang, insert du lieu
CREATE TABLE QL_PHONGBAN
(
    MAPB CHAR(5),
    TENPB NVARCHAR2(30),
    TRPHG CHAR(5),
    PRIMARY KEY (MAPB)
);

CREATE TABLE QL_NHANVIEN
(
    MANV CHAR(5),
    TENNV NVARCHAR2(40),
    MAPB CHAR(5),
    LUONG FLOAT,
    PRIMARY KEY (MANV)
);
ALTER TABLE QL_PHONGBAN ADD CONSTRAINT FK_PHONGBAN_NHANVIEN FOREIGN KEY(TRPHG) REFERENCES QL_NHANVIEN(MANV);
ALTER TABLE QL_NHANVIEN ADD CONSTRAINT FK_NHANVIEN_PHONGBAN  FOREIGN KEY(MAPB) REFERENCES QL_PHONGBAN(MAPB);
    ---TABLE PHONGBAN
INSERT INTO QL_PHONGBAN VALUES ('PB001','Quan li tai nguyen va nhan su',null);
INSERT INTO QL_PHONGBAN VALUES ('PB002','Quan li tai vu',null);
INSERT INTO QL_PHONGBAN VALUES ('PB003','Quan li chuyen mon',null);
    ---TABLE NHANVIEN
INSERT INTO QL_NHANVIEN VALUES ('NV001','Le Van Hanh','PB001',20000000);
INSERT INTO QL_NHANVIEN VALUES ('NV003','Tran Thi An','PB003',22000000);
INSERT INTO QL_NHANVIEN VALUES ('NV101','Ly Kim Ngan','PB001',25000000);
INSERT INTO QL_NHANVIEN VALUES ('NV102','Tran Van Thu','PB002',23000000);
INSERT INTO QL_NHANVIEN VALUES ('NV103','Nguyen Thi Hong','PB003',22000000);
    ---UPDATE TRUONGPHONGBAN
UPDATE QL_PHONGBAN SET TRPHG = 'NV101' WHERE MAPB = 'PB001';
UPDATE QL_PHONGBAN SET TRPHG = 'NV102' WHERE MAPB = 'PB002';
UPDATE QL_PHONGBAN SET TRPHG = 'NV103' WHERE MAPB = 'PB003';
--cai dat chinh sach bao mat cho he thong (VPD)
-- cai dat co che nhan vien chi duoc xem thong tin cua chinh minh, truong phong duoc xem toan bo ds nhan vien
    --tao function nhan vien chi duoc xem du lieu cua chinh minh, rieng truong phong duoc xem toan bo nhan vien
create function VPD_NHANVIEN (schema varchar2, object varchar2)
return varchar2
as
user varchar2(100);
begin
if ((SYS_CONTEXT('userenv', 'SESSION_USER'))='QLNHANVIEN' OR (SYS_CONTEXT('userenv', 'SESSION_USER'))='NV101') then return '';
else
user:=SYS_CONTEXT('userenv', 'SESSION_USER');
return 'MANV='||'user';
end if;
end;
    --them policy_name vao bang QL_NHANVIEN
begin
dbms_rls.add_policy
(object_schema =>'QLNHANVIEN',
object_name =>'QL_NHANVIEN',
policy_name =>'nv_policy',
policy_function =>'VPD_NHANVIEN');
end;

    --tao function truong phong duoc xem thong tin phong ban nhung khong duoc xem ai la truong phong cua phong ban nao
    --chi hien thi ma truong phong cua chinh minh, cac phong ban khac ma truong phong hien thi NULL
create function VPD_PHONGBAN (schema varchar2, object varchar2)
return varchar2
as
user varchar2(100);
begin
if ((SYS_CONTEXT('userenv', 'SESSION_USER'))='QLNHANVIEN') then return '';
else
user:=SYS_CONTEXT('userenv', 'SESSION_USER');
return 'TRPHG='||'user';
end if;
end;

    --gan ham chinh sach vao bang QL_PHONGBAN
begin
dbms_rls.add_policy
(object_schema =>'QLNHANVIEN',
object_name =>'QL_PHONGBAN',
policy_name =>'phbn_policy',
policy_function =>'VPD_PHONGBAN',
sec_relevant_cols =>'TRPHG',
statement_types => 'SELECT',
sec_relevant_cols_opt => dbms_rls.ALL_ROWS);
end;

--gan quyen xem tren bang cho user nhan vien va truong phong
GRANT SELECT ON QLNHANVIEN.QL_NHANVIEN TO NV001;
GRANT SELECT ON QLNHANVIEN.QL_NHANVIEN TO NV101;
GRANT SELECT ON QLNHANVIEN.QL_PHONGBAN TO NV101;
--truong phong duoc insert, update, delete tren bang QL_NHANVIEN
GRANT INSERT, UPDATE, DELETE ON QLNHANVIEN.QL_NHANVIEN TO NV101;

-- dang nhap user nhan vien va truong phong de kiem tra ket qua cua chính sach VPD
--dang nhap user nhan vien NV001 (pass: 123) de kiem tra
SELECT * FROM QLNHANVIEN.QL_NHANVIEN;
--dang nhap user truong phong NV101 (pass: 123) de kiem tra
SELECT * FROM QLNHANVIEN.QL_NHANVIEN;
SELECT * FROM QLNHANVIEN.QL_PHONGBAN;

INSERT INTO QLNHANVIEN.QL_NHANVIEN VALUES ('NV005','Nguyen Hong An','PB001',22000000);
UPDATE QLNHANVIEN.QL_NHANVIEN SET LUONG = 23000000 WHERE MANV = 'NV005';
DELETE FROM QLNHANVIEN.QL_NHANVIEN WHERE MANV = 'NV005';


--cai dat chinh sach ghi nhat ky: audit
--dang nhap bang SYS de kich hoat tinh nang giam sat Audit
    --xem tham so khoi tao ban dau anh huong toi audit
SHOW PARAMETER AUDIT;
    --kich hoat chuc nang giam sat
ALTER SYSTEM SET audit_trail = DB SCOPE = SPFILE;
    --giam sat cau lenh select, insert, delete tren bang QLNHANVIEN.QL_NHANVIEN
AUDIT SELECT, INSERT, UPDATE, DELETE ON QLNHANVIEN.QL_NHANVIEN;
    --giam sat cau lenh select tren bang QLNHANVIEN.QL_PHONGBAN 
AUDIT SELECT ON QLNHANVIEN.QL_PHONGBAN;
 --execute 2 goi DBMS_FGA,va DBA_FGA_AUDIT_TRAIL cho tai khoan QLNHANVIEN de QLNHANVIEN co them giam sat Audit
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
GRANT EXECUTE ON DBMS_FGA TO QLNHANVIEN;
GRANT SELECT ON DBA_FGA_AUDIT_TRAIL TO QLNHANVIEN;

-- kiem tra du lieu ghi nhan
    --dang nhap NV101 (pass: 123) thuc hien truy van
    INSERT INTO QLNHANVIEN.QL_NHANVIEN VALUES ('NV006','Nguyen Hong An','PB001',21000000);
    UPDATE QLNHANVIEN.QL_NHANVIEN SET LUONG = 23000000 WHERE MANV = 'NV006';
    DELETE FROM QLNHANVIEN.QL_NHANVIEN WHERE MANV = 'NV006';
    --dang nhap QLNHANVIEN (pass: 123) thuc hien truy van
    SELECT * FROM QLNHANVIEN.QL_NHANVIEN;
    SELECT * FROM QLNHANVIEN.QL_PHONGBAN;
    --dang nhap QLNHANVIEN (pass: 123) thuc hien xem audit
    SELECT USERNAME, TIMESTAMP, OWNER, OBJ_NAME, ACTION_NAME, EXTENDED_TIMESTAMP FROM DBA_AUDIT_TRAIL;
