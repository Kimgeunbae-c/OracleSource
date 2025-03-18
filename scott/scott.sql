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
-- *(모든 열)
-- SELECT * FROM EMP e; -- 행전체
-- SELECT e.EMPNO, E.ENAME, E.JOB FROM EMP E; -- EMPNO,ENAME,EJOB 세가지만 보기

-- 사원번호, 부서번호만 조회
SELECT e.EMPNO, E.DEPTNO FROM EMP e;

-- 중복 데이터는 제외하고 조회 -- DISTINCT --
SELECT DISTINCT DEPTNO  FROM emp;

SELECT DISTINCT JOB, DEPTNO FROM EMP e ;

-- 별칭
SELECT ename, sal, sal*12 +comm ansal, comm
FROM emp;

SELECT ename, sal, sal*12 +comm AS "ansal", comm
FROM emp;

SELECT ename, sal, sal*12 +comm "ansal", comm
FROM emp;

SELECT ename, sal, sal*12 +comm AS 연봉, comm
FROM emp;
-- 이름에 공백이 있으면 ""로 반드시 묶어야한다
SELECT ename "사원명", sal "급여", sal*12 +comm "연봉", comm "수당"
FROM emp;

-- 원하는 순서대로 출력 데이터를 정렬(오름,내림)
-- emp 테이블의 모든 열을 급여 기준으로 오름차순 조회
-- 오름차순
SELECT
	*
FROM
	emp e
ORDER BY
	e.sal; -- 기본값이 오름차순이라 정렬안해도 된다.
SELECT * FROM emp e ORDER BY e.sal asc; -- asc는 오름차순
-- 내림차순
SELECT * FROM emp e ORDER BY e.sal desc; -- desc는 내림차순
-- 사번, 이름, 직무만 급여 기준으로 내림차순 조회
--SELECT e.EMPNO, e.ENAME, e.JOB  * FROM  emp e ORDER BY e.SAL DESC;


--부서번호의 오름차순, 급여의 내림차순
SELECT * FROM emp e ORDER BY e.ENAME, ASC, e.SAL DESC;

SELECT
	e.EMPNO "EMPLOYEE_NO",
	E.ENAME "EMPLOYEE_NAME",
	E.MGR "MANAGER",
	E.SAL "SALARY",
	E.COMM "COMMISSION",
	E.DEPTNO "DEPARTMENT_NO"
FROM
	EMP E;

SELECT
	*
FROM
	EMP e
ORDER BY
	E.DEPTNO DESC,
	E.ENAME ASC;

-- where : 조회 시 조건 부여
-- 부서번호가 30번인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO = 30;

-- 사번이 7782인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO = 7782;

-- 부서번호가 30이고 직책이 SALESMAN 사람 조회
-- 오라클에서 문자는 ''만 허용, 대소문자 구분
SELECT
	*
FROM
	EMP e
WHERE
	E.DEPTNO = 30
	AND E.JOB = 'SALESMAN';  

-- 사원번호 7499 그리고 부서번호가 30인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO = 7499
	AND e.DEPTNO = 30;

-- 사원번호 7499 이거나 부서번호가 30인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO = 7499
	or e.DEPTNO = 30;

-- 연산자
-- 1) 산술연산자 : +,-,*,/
-- 2) 비교연산자 : <,>,<=,>=,=
-- 3) 등가비교연산자 : =, 같지않다(!=, <>, ^= )
-- 4) 논리부정연산자 : NOT
-- 5) 			 : IN
-- 6) 범위 연산자 : BETWEEN A AND B
-- 7) 검색 : like 연산자와 와일드카드(_, %)
-- 8) IS NULL : 널과 같다
 
-- 연봉이(sal*12) 36000 인 사원 조회
SELECT *
	
FROM
	EMP e
WHERE
	e.SAL * 12 = 36000;

-- 급여가 3000이상인 사원 조회
SELECT*
FROM EMP e 
WHERE e.SAL >= 3000

-- 급여가 2500이상이고 직업이 analyst 사원 조회
SELECT*
FROM EMP e 
WHERE e.SAL >= 2500 AND e.JOB = 'ANALYST';

-- 문자 대소비교
-- 사원명의 첫 문자가 F와 같거나 F보다 뒤에있는 사원
SELECT
	*
FROM
	EMP e
WHERE
	E.ENAME >= 'F';

-- 급여가 3000이상인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	NOT e.SAL = 3000
	-- WHERE e.SAL != 3000
	
-- JOB 이 MANAGER 이거나, SALESMAN 이거나, CLERK 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	E.JOB = 'MANAGER'
	OR E.JOB = 'SALESMAN'
	OR E.JOB = 'CLERK'
	
--IN 연산자로 변경
		SELECT
	*
FROM
	EMP e
WHERE
	E.JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK')
	
-- BETWEEN A AND B
-- 급여 2000 이상 3000이하
SELECT
	*
FROM
	EMP e
WHERE
	E.SAL >= 2000
	AND E.SAL <= 3000

SELECT
	*
FROM
	EMP e
WHERE
	E.SAL BETWEEN 2000 AND 3000
	
-- 급여 2000이상 3000이하가 아닌 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	E.SAL NOT BETWEEN 2000 AND 3000
	
-- like : r검색
-- _ : 어떤 값이든 상관 없이 한 개의 문자열 데이터를 의미
-- % : 길이와 상관없이(문자 없는 경우도 포함) 모든 문자열 데이터를 의미

-- 사원명이 S 로 시작하는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE 'S%';

-- 사원 이름의 두번째 글자가 L인 사원 조회
SELECT *
FROM EMP e 
WHERE E.ENAME LIKE '_L%'

-- 사원명에 AM 이 포함된 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	E.ENAME LIKE '%AM%'

-- 사원명에 AM 이 포함된 않은 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	E.ENAME NOT LIKE '%AM%'
	
-- IS NULL
-- CO,,이 NULL인 사원 조회
SELECT *
FROM EMP e
WHERE E.COMM IS NULL

-- MGR이 NULL 인 사원 조회
SELECT *
FROM  EMP e 
WHERE E.MGR IS NULL

-- 직속 상관(MGR)이 있는 사원 조회
SELECT *
FROM  EMP e 
WHERE E.MGR IS NOT NULL
