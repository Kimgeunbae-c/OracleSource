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
