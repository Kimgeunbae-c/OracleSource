-- RDBMS 
-- 기본단위 : 테이블

-- 대문자 소문자 구분하지 않는다
-- EMP(사원정보 테이블)
-- EMPNO(사원번호). ename(사원명), job(직책), mgr(직속상관 사원번호), hiredate(입사일),sal(급여), comm(추가수당), deptno(부서번호)
-- NUMBER(4,0) : 전체 자릿수 4자리(소수점 자릿수0)
-- varchar2(10) : 문자열 10byte (var : 가변 - 7byte 문자열 저장했다면 7byte 공간만 사용, 10byte 이상은 불가)
--				: 영어 10문자, 한글 2byte, utf-8 3byte 할당
-- DATE : 날짜

-- DEPT(부서테이블)
-- DEPTNO(부서번호), DNAME(부서명), LOC(부서위치)

-- SALGRADE(급여테이블)
-- GRADE(급여등급), LOSAL(최저급여), HISAL(최대급여)

-- 개발자 : CR(Read)UD
-- SQL : (Structured Query Language : 구조질의 언어) : RDBMS 데이터를 다루는 언어

-- 1. 조회(SELECT) - Read
-- 사원정보 조회(전체조회)
SELECT * FROM EMP e;