# 데이터베이스에
# user 테이블.de
desc mysql.user;
describe mysql.user;

show full columns from mysql;


select Host, User
	from mysql.user;
    
    
# create user '아이디 @ 접근가능한주소' identified by '비밀번호';    
create user 'test'@'localhost' identified by '1234';

create user 'anywhere'@'%' IDENTIFIED BY '1234';
SELECT User, Host FROM mysql.user;

# 특정 IP 대역 (192.168.0.X)에서만 접속 가능한 사용자 만들기
CREATE USER'test2'@'192.168.0.%' IDENTIFIED BY '1234';
SELECT User, Host FROM mysql.user;

# 이미 존재하는 사용자 이름을 대체할 때 or replace
CREATE OR REPLACE USER 'test'@'localhost'IDENTIFIED BY '1234';
SELECT User, Host From mysql.user;

# 사용자가 없을 때만 사용자 추가 IF NOT EXISTS
CREATE USER IF NOT EXISTS 'test3'@'%'IDENTIFIED BY '1234';
SELECT User, Host FROM mysql.user;

# 사용자 이름 변경
RENAME USER 'test2'@'192.168.0.%'TO'test3'@'%';
SELECT User, Host FROM mysql.user;

# 비밀번호 변경
SET PASSWORD FOR 'test3'@'%' = PASSWORD('12345');

# 사용자 삭제
DROP USER 'test3'@'%';
SELECT User, Host FROM mysql.user;

# 사용자 조건에 따라 삭제 (존재할 때만)
DROP USER IF EXISTS 'anywhere'@'%';

# 권한 부여
# 기존 권한 확인
SHOW GRANTS FOR 'test'@'localhost';
GRANT ALL PRIVILEGES ON test. *TO 'test'@'localhost';
flush privileges;
SELECT User, Host FROM mysql.user;

#데이터베이스 목록조회
SHOW DATABASES;
#데이터베이스 TEST라는 이름으로 생성
create database test;

# 권한 확인하기
REVOKE ALL on test.*FROM'test'@'localhost';
flush privileges;
SHOW GRANTS FOR 'test'@'localhost';

SHOW DATABASES;

# 특수한 이름 명명하기
CREATE DATABASE `test.test`;
SHOW DATABASES;

DROP DATABASE `test.test`;
show databases;

# 이름 직접 변경 여기서 불가..
	#편번: 기존 데이터베이스를 덤프로 저장, 변경할 이름으로 새로 데이터베이스 생성


# 테이블 만들 준비   
CREATE DATABASE python;
USE python;
#테이블 만들기
CREATE TABLE table1 (column1 VARCHAR(100));
# 테이블 목록 조회
#현재 사용중인 데이터베이스를 확인하는 명령어
SELECT DATABASE();
#테이블 목록조회
SHOW TABLES;
# 테이블 이름 변경하기
RENAME TABLE table1 TO table2;
#테이블 목록조회
SHOW TABLES;
# 테이블 삭제
DROP TABLE table2;
# 테이블 생성
CREATE TABLE test_table(
	test_column1 INT,
    test_column2 INT,
    test_column3 INT
);
DESC test_table;
# 테이블에 column 추가하기 - 제일 뒤에 추가됨
ALTER TABLE test_table
ADD test_column4 INT;
DESC test_table;
# 테이블에 column 여러개 추가
ALTER TABLE test_table
ADD(
	test_column5 INT,
    test_column6 INT,
    test_column7 INT
	);

ALTER TABLE test_table
DROP test_column1;
DESC test_table;

ALTER TABLE test_table
modify test_column7 INT
FIRST;
DESC test_table;

#테이블 순서변경
ALTER TABLE test_table
MODIFY test_column7 INT
AFTER test_column6;
DESC test_table;

# column 이름 변경
alter table test_table
CHANGE test_column2 test_column0 INT;
DESC test_table;

# COLUMN 데이터 타입 변경
alter table test_table
change test_column0 test_column0 VARCHAR(10);
DESC test_table;

#이름과 데이터 타입 동시변경
ALTER TABLE test_table
change test_column0 test_column2 INT;
DESC test_table;
    