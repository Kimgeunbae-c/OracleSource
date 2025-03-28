-- 오라클 관리자
-- system, sys(최고권한)


-- 사용자 이름 :  sys as sysdba
-- 비밀번호 : 엔터


-- 오라클 12c 버전부터 사용자계정 생성시 접두어(c##)를 요구함
-- c##hr
-- c## 사용하지 않는다
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- 비밀번호 변경
-- 비밀번호만 대소문자 구별한다
ALTER USER hr IDENTIFIED BY hr;

-- 계정 잠금해제
-- ALTER USER hr(해제하고자하는 유저명) account unlick;

-- 데이터사전 DBA_USERS 를 사용하여 사용자 정보 조회
SELECT * FROM DAB_USERS WHERE USERNAME = 'SCOTT';

-- SCOTT VIEW 생성 권한 부여
GRANT CREATE VIEW TO scott;

-- 사용자 관리
-- 오라클은 테이블, 인덱스, 뷰등 사용자별로 여러 객체를 생성하므로 업무별 사용자를 생성한 후에 각 사용자
-- 업무에 맞는 데이터 구조를 만들어 관리하는 방식 사용

-- 데이터베이스 스키마
-- 스키마 : 데이터베이스에서 데이터 간 관계, 데이터 구조, 제약 조건 등 데이터를 저장하고 관리하고자 정의한
--			데이터베이스 구조 범위

-- 오라클 데이터베이스에서는 스키마 == 사용자

-- 사용자 생성 구문
-- CREATE USER 사용자이름 IDENTIFIED BY 비밀번호
-- DEFAULT TABLESPACE 테이블스페이스명
-- TEMPORARY TABLESPACE 테이블스페이스 그룹명
-- QUOTA 테이블스페이스 크기 ON 테이블스페이스명

-- 1. 사용자 생성
CREATE USER C##test1 IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA 10M ON USERS

-- ORA-01045: 사용자 C##TEST1는 CREATE SESSION 권한을 가지고있지 않음; 로그온이 거절되었습니다
-- 2. 권한 부여(GRANT)

-- GRANT 줄 권한 ON 테이블스페이스명
-- GRANT SELECT, INSERT, DELETE ON  BOARD TO C##test1 // 하나씩 주기에는 너무 오래걸린다
-- 롤 : 여러 개의 권한이 묶여서 정의되어 있음

GRANT CONNECT, RESOURCE TO C##TEST1;


--SQL Error [65096] [99999]: ORA-65096: 공통 사용자 또는 롤 이름이 부적합합니다. // C##이 붙지 않았다
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE; -- c##을 사용하고 싶지 않을때
CREATE USER test2 IDENTIFIED BY 12345


-- 사용자 정보 조회
SELECT * FROM ALL_USERS WHERE USERNAME = 'C##TEST1'

-- 비밀번호 변경
ALTER USER C##TEST1 IDENTIFIED BY 54321;


-- 사용자 제거
-- SQL Error [1940] [42000]: ORA-01940: 현재 접속되어 있는 사용자는 삭제할 수 없습니다
DROP USER C##TEST1;