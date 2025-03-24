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
SELECT
	e.EMPNO,
	E.DEPTNO
FROM
	EMP e;

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
-- 9) 집합 연산자 : Union,Minus,Intersect
 
-- sql 구문 실행순서
-- ⑤ SELECT 
-- ① FROM EMP e 
-- ② WHERE 
-- ③ GROUP by
-- ④ HAVING
-- ⑥ ORDER BY

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

-- 집합연산자
-- UNION(합집합)
-- 부서번호 10, 20 사원조회
SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO IN (10, 20)
-- 셀레트 값이 같아야 한다.
	
SELECT *
FROM emp e
WHere e.deptno = 10
UNION
SELECT *
FROM emp e
WHere e.deptno = 20
	
--
SELECT
	e.DEPTNO , e.ENAME, e.SAL, e.EMPNO
FROM
	EMP e
WHERE
	e.DEPTNO  = 10
UNION
SELECT
	e.DEPTNO , e.ENAME, e.SAL, e.EMPNO
FROM
	EMP e
WHERE
	e.DEPTNO = 20

-- 타입 일치만 확인
SELECT e.ENAME, e.EMPNO, e.DEPTNO, e.SAL 
FROM EMP e 
WHERE deptno = 10
UNION
SELECT e.ENAME, e.EMPNO, e.DEPTNO, e.SAL 
FROM EMP e 
WHERE deptno = 20

-- union all
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO 
FROM EMP e 
WHERE deptno = 10
UNION ALL
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO 
FROM EMP e 
WHERE deptno = 20

--minus
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO 
FROM EMP e 
WHERE deptno = 10
minus
SELECT e.EMPNO, e.ENAME, e.SAL, e.DEPTNO 
FROM EMP e 
WHERE deptno = 20

-- INTERSECT(교집합)
SELECT e.EMPNO, e.ENAME, e.SAL, e.deptno
FROM EMP e 
Intersect 
SELECT e.EMPNO, e.ENAME, e.SAL, e.deptno
FROM EMP e 
WHERE e.deptno = 20

-- 오라클 함수
-- 내장 함수
-- 1) 문자함수
-- 대소문자 바꿔주는 함수 : upper(), lower(), initcap()
-- 문자의 길이를 구하는 함수 : length(), lengthb()
-- 문자열 일부 추출 : substr(문자열데이터,시작위치,추출길이)
-- 문자열 데이터 안에서 특정 문자 위치 찾기 : INSTR()
-- 특정문자를 다른 문자로 변경 : REPLACE(원본문자열, 찾은문자열, 변경문자열)
-- 두 문자열 데이터를 합치기 : concat(문자열1, 문자열2), ||
-- 특정 문자 제거 : TRIM(), LTRIM(), RTRIM()
-- 데이터의 공간을 특정 문자로 채우기 : LPAD(), RPAD()
-- LPAD(데이터, 데이터 자릿수, 채울 문자) : 왼쪽에 채운다
-- RPAD(데이터, 데이터 자릿수, 채울 문자) : 오른쪽에 채운다

-- Oracle => 10 자리로 표현
SELECT 'Oracle', LPAD('Oracle', 10, '#'), RPAD('Oracle', 10, '*'),LPAD('Oracle', 10), RPAD('Oracle', 10)
FROM dual

--upper 
-- 사원이름을 대문자, 소문자, 첫문자만 대문자로 변경
SELECT
	e.ename UPPER(E.ENAME),
	LOWER(E.ENAME),
	INITCAP(E.ENAME)
FROM
	EMP e 

-- 제목 ORACLE 검색
-- LIKE '%ORACLE%' OR LIKE '%oralce' OR RIKE '%Oracle%'
-- SELECT *
-- FROM EMP e 
-- WHERE UPPER(title) = upper('oracle')

-- 사원명 길이 구하기
-- length(이름)
SELECT e.ENAME, LENGTH(e.ename)
FROM EMP e

-- 사원명이 5글자 이상인 사원 조회
SELECT *
FROM EMP e 
WHERE LENGTH(e.ename) >= 5

-- lengthb() : 문자열 바이트 수 반환
-- xe 버전 : 한글에 3byte 사용
-- dual : sys 소유 테이블(임시 연산이나 함수의 결과값 확인 용도로 사용)
SELECT LENGTH('한글'), LENGTHB('한글')
FROM dual;

-- 시작위치 지정 시 양수(왼쪽부터), 음수(오른쪽부터) : 맨 끝부터 -1
SELECT e.JOB, substr(e.job,1,2), substr(e.job,5)
FROM EMP e 

SELECT
	e.JOB,
	substr(e.job,-LENGTH(e.job)), substr(e.job,-length(e.job), 2), substr(e.job,-3)
FROM EMP e

-- instr(대상문자열, 위치를 찾으려는 문자, 시작위치에서 찾으려는 문자가 몇 번째인지)
SELECT
	INSTR('hello, oracle!', 'l') AS instr_1,
	INSTR('hello, oracle!', 'l', 5) AS instr_2,
	INSTR('hello, oracle!', 'l', 2, 2) AS instr_3
FROM
	dual
	
-- 사원 이름에 s 가 있는 사원 조회
SELECT *
FROM emp e
WHERE e.ENAME LIKE '%s%' AND e.ENAME LIKE '%S%'

SELECT *
FROM emp e
WHERE instr(e.ename, 's') > 0

-- REPLACE(원본문자열, 찾은문자열, 변경문자열)
SELECT '010-1234,5678' AS replace_before, replace('010-1234-5678', '-', ' ') AS replace1, replace('010-1234-5678', '-') AS replace2
FROM dual

-- 사번 : 사원명
SELECT concat(e.empno, concat(':',e.ename))
FROM emp e

SELECT e.empno ||  ':' || e.ename
FROM emp e

-- TRIM(삭제옵션(선택사항), 삭제한문자(선택사항) FROM 원본문자열 (필수사항))
SELECT
	'[' || TRIM(' __Oracle__ ') || ']' AS trim, -- 공백제거
	'[' || TRIM(LEADING FROM ' __Oracle__ ') || ']' AS trim_leading, -- 앞쪽만
	'[' || TRIM(TRAILING FROM ' __Oracle__ ') || ']' AS trim_trailing,
	'[' || TRIM(BOTH FROM ' __Oracle__ ') || ']' AS trim_both
FROM
	DUAL
	
-- ltrim(), rtrim()
	SELECT
	'[' || TRIM(' __Oracle__ ') || ']' AS trim, 
	'[' || lTRIM(' __Oracle__ ') || ']' AS ltrim, 
	'[' || rTRIM(' __Oracle__ ') || ']' AS rtrim,
	'[' || rTRIM('<_Oracle_>', '>_') || ']' AS rtrim2
FROM
	DUAL
	
-- 숫자함수
-- 반올림 : round()
-- 버림 : trunc()
-- 가장 큰 정수 : ceil()
-- 가장 작은 정수 : floor()
-- 나머지 : mod()
	
-- -4 -3 -2 -1. 0 1 2 3 -- 자리값
--  1  2  3  4. 5 6 7 8 -- 값

-- 반올림
SELECT
	round(1234.5678) AS ROUND, -- 기본값 0
	round(1234.5678, 0) AS ROUND1, -- 소수점 이 안나온다
	round(1234.5678, 1) AS ROUND2, -- 소수점 첫째자리 까지 나온다
	round(1234.5678, 2) AS ROUND3, -- 소수점 둘때자리
	round(1234.5678, 3) AS ROUND4, -- 소수점 셋째
	round(1234.5678, 4) AS ROUND5 -- 소수점 넷째
FROM
	dual
	
-- 올림
	SELECT
	trunc(1234.5678) AS trunc, 
	trunc(1234.5678, 0) AS trunc1, 
	trunc(1234.5678, 1) AS trunc2, 
	trunc(1234.5678, 2) AS trunc3, 
	trunc(1234.5678, 3) AS trunc4, 
	trunc(1234.5678, 4) AS trunc5
FROM
	dual
	
--
SELECT ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14)
FROM dual

SELECT mod(15,6), mod(10,2), mod(11,2) 
FROM dual

-- 날짜함수

-- 오늘날짜/시간 : SYSDATE
-- 몇개월 이후 날짜 구하기 : ADD_MONTH()
-- 두 날짜 간의 개월 수 차이 구하기 : MONTH_BETWEEN()
-- 돌아오는 요일, 달의 마지막 날짜 구하기 : NEXT_DAY() / LAST_DAY()
SELECT
	SYSDATE "NOW",
	SYSDATE-1 "YESTERDAY",
	SYSDATE + 1 "TOMORROW",
	CURRENT_DATE "CURRENT_DATE",
	CURRENT_TIMESTAMP "CURRENT_TIMESTAMP"
FROM
	DUAL
	
-- 오늘 날짜를 기준으로 3개월 이후 날짜 구하기
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3)
FROM
	DUAL
	
-- 입사한지 40년이 넘은 사원 조회
SELECT *
FROM EMP e
WHERE ADD_MONTHS(E.HIREDATE, 480) < SYSDATE

-- 오늘 날짜와 입사일자의 차이 구하기
SELECT
	E.EMPNO,
	E.ENAME,
	E.HIREDATE,
	SYSDATE,
	MONTHS_BETWEEN(E.HIREDATE, SYSDATE) "MONTH1",
	MONTHS_BETWEEN(SYSDATE, E.HIREDATE) "MONTH2",
	TRUNC(MONTHS_BETWEEN(E.HIREDATE, SYSDATE)) "MONTH3"
FROM
	EMP e 
	
SELECT SYSDATE, NEXT_DAY(SYSDATE,'월요일'), LAST_DAY(SYSDATE)
FROM DUAL

-- 자료형을 변환하는 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자열 데이터로 반환
-- TO_NUMBER() : 문자열 데이터를 숫자 데이터로 반환
-- TO_DATE() : 문자열 데이터를 날짜 데이터로 반환

-- NUMBER + '문자숫자' : 덧셈 가능(자동형변환) 
SELECT E.DEPTNO , E.ENAME, E. EMPNO + '500'
FROM EMP e 
WHERE E.ENAME  = 'SMITH'

-- SELECT E.DEPTNO , E.ENAME, E. EMPNO + 'ABCD'
-- FROM EMP e 
-- WHERE E.ENAME  = 'SMITH'

SELECT sysdate, to_char(sysdate, 'yyyy/mm/dd')
FROM dual

SELECT
	sysdate,
	to_char(sysdate, 'mm'),
	to_char(sysdate, 'mon'),
	to_char(sysdate, 'month'),
	to_char(sysdate, 'dd'),
	to_char(sysdate, 'dy'),
	to_char(sysdate, 'day'), to_char(sysdate, 'HH24 : MI : SS'), to_char(sysdate, 'HH12 : MI : SS AM'), to_char(sysdate, 'HH : MI : SS PM')
FROM
	dual

-- 9 : 숫자 한자리를 의미
-- 0 : 숫자 한자리를 의미(빈자리를 0으로 채움)
SELECT
	e.SAL,
	TO_CHAR(e.sal, '$999,999'),
	TO_CHAR(e.sal, '$000,999,999')
FROM
	emp e
	
-- 오라클에서는 기본적으로 숫자+문자, 문자+문자, 숫자+숫자는 제공하지만
SELECT 1300-'1500', 1300 + '1500'
FROM dual

SELECT '1300' - '1500'
FROM dual

-- ORA-01722: 수치가 부적합합니다
-- ',' 콤마가 들어가는 순간 오류가 나타난다
-- to_number('문자열 데이터','인식 숫자형태)
SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999') " TO_NUMBER"
FROM dual

-- to_date : 문자열 데이터를 => 날짜로 변경
SELECT
	TO_DATE('2025-03-20', 'YYYY-MM-DD')
	AS "DATE1",
	TO_DATE('2025-03-20', 'YYYY/MM/DD') AS "DATE2"
FROM
	DUAL
	
-- NULL
-- 산술연산이나 비교연산자(IS NULL OR IS NOT NULL)가 제대로 수행되지 않음
-- 1) NVL(널 여부를 검사할 데이터, 널일때 반환할 데이터)
-- 2) NVL2(널 여부를 검사할 데이터,널이 아닐때 반환할 데이터, 널일때 반환할 데이터)
	
SELECT E.EMPNO, E.ENAME, E.SAL, E.COMM, E.SAL*E.COMM, NVL(E.COMM, 0), E.SAL * NVL(E.COMM,0)
FROM EMP E

SELECT E.EMPNO, E.ENAME, E.SAL, E.COMM, E.SAL*E.COMM, NVL2(E.COMM, 'O', 'X'), E.SAL + NVL2(E.COMM,E.COMM * E.SAL,0) "연봉"
FROM EMP E

-- 자바의 IF, SWITCH 구문과 유사
-- DECODE
-- DECODE(검사대상이 될 데이터,
--			조건1, 조건1 만족시 반환할 결과
--			조건2, 조건2 만족시 반활할 결과,
--			조건1 ~ 조건N까지 일치하지 않을대 반환할 결과) 
-- CASE
-- CASE 검사대상이 될 데이터
--		WHEN	조건1 THEN 조건1 만족시 반환할 결과
--		WHEN	조건2 THEN 조건2 만족시 반활할 결과
--		ELSE	조건1 ~ 조건N까지 일치하지 않을대 반환할 결과 END

-- 직책이 MANNAGER 인 사원은 급여의 10% 인상
-- 직책이 SALESMAN 인 사원은 급여의 5% 인상
-- 직책이 ANALYST 인 사원은 급여 동결
-- 나머지는 3% 인상

SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB,
	E.SAL,
	DECODE(E.JOB, 'MANAGER', E.SAL*1.1, 'SALESMAN', E.SAL*1.05, 'ANALYST', E.SAL, E.SAL *1.03) "연봉"
FROM
	EMP E
	
	SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB,
	E.SAL,
	CASE E.JOB WHEN 'MANAGER' THEN E.SAL*1.1 WHEN 'SALESMAN' THEN E.SAL*1.05 WHEN 'ANALYST' THEN E.SAL ELSE E.SAL *1.03 END "연봉"
FROM
	EMP E
	
-- COMM NULL 인 경우 '해당사항 없음'
-- COMM 0 인 경우 '수당없음'	
-- CIMM > 0 인 경우 ' 수당 : 800'
	
SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB,
	E.SAL,
	CASE
		WHEN E.COMM IS NULL THEN '해당사항 없음'
		WHEN E.COMM = 0 THEN '수당 없음'
		WHEN E.COMM > 0 THEN '수당 : ' || E.COMM
	END "COMM_NEXT"
FROM
	EMP E

-- [실습]
-- 1. EMPNO 7369 => 73**, ENAME SMITH => S****
-- EMPNO, 마스킹처리EMPNO, ENAME, 마스킹처리ENAME
SELECT E.EMPNO, REPLACE(e.empno, SUBSTR(e.empno, 3), '**') "마스킹처리empno", E.ENAME E, REPLACE(e.ename, SUBSTR(e.ename,2), '****')"마스킹처리ename"
FROM EMP E


SELECT  e.EMPNO, RPAD(SUBSTR(e.EMPNO, 1,2), 4, '*'), e.ENAME, RPAD(SUBSTR(e.ENAME, 1,1),5, '*')
FROM emp e
	
-- 2. EMP 테이블에서 사원의 월 평균 근무일수는 21이다.
-- 하루 근무시간을 8시간으로 보았을 때 사원의 하루급여(DAY)와 시급(TIME_PAY)을
-- 계산하여 출력한다. (단, 하루급여는 소수 셋째자리에서 버리고, 시급은 둘재자리에서 반올림)
-- 출력형태) empno, ename, sal, day_pay, time_pay
SELECT
	e.EMPNO,
	e.ENAME,
	e.SAL,
	trunc(e.SAL / 21, 2) "일급",
	round(e.SAL / 21 / 8, 1) "시급"
FROM
	emp e


-- 3. 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
-- 사원이 정직원이 되는 날짜(R_JOB)을 YYYY-MM-DD 형식으로 출력한다
-- 단, 추가수당이 없는 사원의 추가수당은 N/A로 출력
-- 출력형태)EMPNO, ENAME, HIREDATE, R_JOB, COMM	
SELECT e.EMPNO, e.ENAME, e.HIREDATE, next_day(ADD_MONTHS(e.HIREDATE, 3), '월요일') "r_job", NVL(TO_CHAR(e.COMM), 'N/A')
FROM emp e


-- 4. 직속상관의 사원번호가 없을 때 : 0000
-- 직속상관의 사원번호 앞 두자리가 75 일때 : 5555
-- 직속상관의 사원번호 앞 두자리가 76 일때 : 6666
-- 직속상관의 사원번호 앞 두자리가 77 일때 : 7777
-- 직속상관의 사원번호 앞 두자리가 78 일때 : 8888
-- 그 외 직속상관 사원 번호일때 : 본래 직속상관 사원번호 그대로 출력
-- 출력형태) empno, ename, mgr, chg_mgr
SELECT
	e.EMPNO,
	e.ENAME,
	e.MGR,
	CASE
		WHEN e.mgr IS NULL THEN 0000
		WHEN e.mgr LIKE '75%' THEN 5555
		WHEN e.mgr LIKE '76%' THEN 6666
		WHEN e.mgr LIKE '77%' THEN 7777
		WHEN e.mgr LIKE '78%' THEN 8888
		ELSE e.mgr
	END "chg_mgr"
FROM
		EMP e
		
-- 하나의 열에 출력결과를 담는 다중행 함수
-- null 행은 제외하고 연산
-- 1. sum() / 2. count() / 3. max() / 4. min() / 5. avg()

-- 전체사원 급여 합
SELECT SUM(e.SAL)
FROM emp e

-- 중복된 급여는 제외한 합
SELECT SUM(e.SAL), sum(DISTINCT e.SAL), sum(ALL e.sal)
FROM emp e

-- ORA-00937: 단일 그룹의 그룹 함수가 아닙니다( 해결방안 : GROUP BY 절에 사용한 컬럼만 가능)
SELECT e.ENAME , SUM(e.SAL)
FROM emp e
	
-- 사원 수
SELECT count(e.empno), COUNT(e.COMM), COUNT(ALL e.COMM)
FROM emp e
	
-- 급여의 최대값과 최소값
SELECT MAX(e.sal), min(e.SAL)
FROM emp e

-- 10번 부서 사원 중 급여 최대값
SELECT
	max(e.sal),
	min(e.sal)
FROM
	emp e
WHERE e.DEPTNO = 20

-- 20번 부서의 입사일 중 가장 최근 입사일
SELECT MAX(e.HIREDATE)
FROM emp e
WHERE e.DEPTNO = 20

-- 20번 부서의 입사일 중 가장 오래된 입사일 출력
SELECT min(e.HIREDATE)
FROM emp e
WHERE e.DEPTNO = 20

-- 30번 부서 사원의 평균 급여
SELECT AVG(e.SAL)
FROM emp e
WHERE e.DEPTNO = 30

-- 결과값을 원하는 열로 묶어 출력 : GROUP BY

-- 부서별 평균 급여
SELECT e.DEPTNO, avg(e.sal)
FROM emp e
GROUP BY e.DEPTNO

-- 부서별, 직책별 평균 급여 조회
SELECT e.DEPTNO , e.job, AVG(e.sal)
FROM emp e
GROUP BY e.DEPTNO, e.JOB
ORDER BY e.DEPTNO

-- 결과값을 원하는 열로 묶어 출력할 때 조건 추가 : GROUP BY + HAVING

-- 부서별, 직책별, 평균 급여 조회 + 평균급여 >= 2000
SELECT e.DEPTNO, AVG(e.SAL)
FROM emp e
GROUP BY e.DEPTNO, e.JOB HAVING avg(e.sal) >= 2000

-- SQL Error [934] [42000]: ORA-00934: 그룹 함수는 허가되지 않습니다
-- where 절 그룹함수 불가
-- ① FROM EMP e 
-- ② WHERE 
-- ③ GROUP by
-- ④ HAVING
-- ⑤ SELECT 
-- ⑥ ORDER BY
SELECT e.DEPTNO, AVG(e.SAL)
FROM emp e
WHERE avg(e.sal) >= 2000

-- 같은 직무에 종사하는 사원이 3명 이상인 직책과 인원 수 출력
-- EX : SALESMAN4
SELECT E.JOB, COUNT(E.EMPNO)
FROM EMP E
GROUP BY E.JOB HAVING COUNT(E.EMPNO) >= 3

-- 사원들의 입사연도를 기준으로 부서별로 몇 명이 입사했는지 출력
-- 1987 20 2
-- 1987 30 1
SELECT TO_CHAR(E.HIREDATE, 'YYYY'), E.DEPTNO , COUNT(E.EMPNO)
FROM EMP E
GROUP BY TO_CHAR(E.HIREDATE, 'YYYY'), E.DEPTNO

-- 조인(JOIN)
-- 여러 종류의 데이터를 다양한 테이블에 나누어 저장하기 때문에 여러 테이블의 데이터를 조합하여 출력할 때가 많다.
-- 이때 사용하는 방식이 조인
-- 종류

-- 내부조인(연결이 안되는 데이터는 제외) - INNTER JOIN
-- 1. 등가조인 : 각 테이블의 특정 열과 일치하는 데이터 추출
-- 2. 비등가조인 : 등가조인 외의 방식
-- 3. 자체(SELF)조인 : 같은 테이블끼리 조인

-- 외부조인 : 연결이 안되는 데이터 보기 - OUTER JOIN
-- 1. 왼쪽 외부조인(LEFT OUTER JOIN) : 오른쪽 테이블의 데이터 존재 여부와 상관없이 왼쪽 테이블 기준으로 출력
-- 2. 오른쪽 외부조인(RIGHT OUTER JOIN) : 왼쪽 테이블의 데이터 존재 여부와 상관없이 오른족 테이블 기준으로 출력


-- 사원별 부서정보 조회
SELECT E.EMPNO, E.DEPTNO, D.DNAME, D.LOC
FROM EMP e , DEPT D
WHERE E.DEPTNO = D.DEPTNO

-- 나올 수 있는 모든 조합 출력
SELECT E.EMPNO, E.DEPTNO, D.DNAME, D.LOC
FROM EMP e , DEPT D

-- 사원별 부서정보 조회 + 사원별 급여 >= 3000
SELECT E.EMPNO, E.DEPTNO,E.SAL, D.DNAME , D.LOC
FROM EMP e , DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL >= 3000

-- 사원별 부서정보 조회 + 사원별 급여 <= 2500 + 사원번호 9999 이하
SELECT E.EMPNO, E.DEPTNO,E.SAL, D.DNAME , D.LOC
FROM EMP e , DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL <= 2500 AND E.EMPNO  <= 9999 

-- 비등가 조인
-- 사원별 정보 + SALGRADE GRADE
SELECT *
FROM EMP E, SALGRADE S 
WHERE E.SAL >= S.LOSAL AND E.SAL <= S.HISAL 

SELECT *
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL 

-- 자체조인
-- 사원정보 + 직송상관 정보
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS "MGR_ENAME"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO 

-- LEFT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS "MGR_ENAME"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+)

-- RIGHT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS "MGR_ENAME"
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO

-- 표준 문법을 사용한 조인
-- JOIN ON
-- JOIN 테이블명 ON JOIN 조건
SELECT * 
FROM EMP E
JOIN SALGRADE s
ON E.SAL BETWEEN S.LOSAL  AND S.HISAL

-- INNER 생략가능
SELECT * 
FROM EMP E
INNER JOIN SALGRADE s
ON E.SAL BETWEEN S.LOSAL  AND S.HISAL

-- LEFT OUTER JOIN 테이블명 ON 조인조건
SELECT
	E1.EMPNO,
	E1.ENAME,
	E1.MGR,
	E2.ENAME AS "MGR_ENAME"
FROM
	EMP E1
RIGHT OUTER JOIN EMP E2 ON E1.MGR  = E2.EMPNO

-- 급여가 2000을 초과한 사원의 부서정보, 사원정보 출력
-- 출력) 부서번호, 부서명, 사원번호, 사원명, 급여
SELECT
	E1.DEPTNO,
	D.DNAME ,
	E1.EMPNO,
	E1.ENAME,
	E1.SAL
FROM
	EMP E1
JOIN DEPT d ON
	E1.DEPTNO = D.DEPTNO
WHERE
	E1.SAL > 2000
ORDER BY E1.DEPTNO

-- 모든 부서정보와 사원정보를 부서번호, 사원번호 순서로 정렬하여 출력
-- 출력) 부서번호, 부서명, 사원번호, 사원명, 직무, 급여
SELECT E1.DEPTNO , D.DNAME , E1.EMPNO, E1.ENAME, E1.JOB, E1.SAL
FROM EMP E1
JOIN DEPT d  ON E1.DEPTNO = D.DEPTNO
ORDER BY E1.DEPTNO, E1.EMPNO

--모든 부서정보, 사원정보, 급여등급정보 각 사원의 직속상관 정보를
-- 부서번호, 사원번호 순서로 정렬하여 출력
-- 출력) 부서번호, 부서명, 사원번호, 사원명, 매니저번호, 급여, LOSAL, HISAL, GRADE, 매니저EMPNO, 매니저이름
-- FROM EMP E1 JOIN DEPT d  ON E1.EMPNO = D.DEPTNO JOIN SALGRADE s ON D.DEPTNO = S.GRADE
SELECT
	E1.DEPTNO,
	D.DNAME,
	E1.EMPNO,
	E1.ENAME,
	E1.MGR,
	E1.SAL,
	S.LOSAL,
	S.HISAL,
	S.GRADE,
	E2.EMPNO "MGR_EMPNO",
	E2.ENAME "MGR_NAME"
FROM
	EMP E1
LEFT OUTER
JOIN EMP E2 ON
	E1.MGR = E2.EMPNO
JOIN DEPT d ON
	E1.DEPTNO = D.DEPTNO
JOIN SALGRADE s ON
	E1.SAL BETWEEN S.LOSAL AND S.HISAL


-- 부서별 평균급여, 최대급여, 최소급여, 사원 수 출력
-- 부서번호, 부서명, AVG_SAL, MAX-SAL,MIN-SAL, CNT
SELECT E.DEPTNO,D.DNAME, AVG(E.SAL) "AVG_SAL", MAX(E.SAL),MIN(E.SAL) "MIN_SAL", COUNT(E.EMPNO) "CNT"
FROM EMP E JOIN DEPT d ON E.DEPTNO  = D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME
ORDER BY E.DEPTNO


-- 서브쿼리 : SQL 구문을 실행하는 데 필요한 데이터를 추가로 조회하고자 SQL 내부에서 사용하는 select문
-- 연산자 등의 비교 또는 조회 대상 오른쪽에 놓이며 괄호로 묶어서 사용한다
-- 특수한 몇몇 겅우를 제외한 대부분의 서브쿼리에서는 order by 절을 사용할 수 없다.
-- 서브쿼리의 select 절에 명시한 열은 메인쿼리의 비교 대상과 같은 자료형과 같은 개수로 지정
-- 서브쿼리에 있는 select문의 결과 행 수는 함께 사용하는 메인 쿼리의 연산자 종류와 어울려야 한다.
-- 1) 단일형 서브쿼리 : 실행결과가 행 하나인 서브쿼리
--			연산자 : >, >=, <, <=, <>, ^=, !=
-- 2) 다중형 서브쿼리 : 실행결과가 여러개의 행인 서브쿼리
--			연산자 : in, any(some), all, exsits
-- 3) 다중열 서브쿼리 : 서브쿼리의 SELECT 절에 비교할 데이터를 여러개 지정

-- 이름이 JONES 인 사원의 급여보다 높은 급여를 받는 사원 조회

-- JONES의 급여 조회
SELECT sal from emp e WHERE e.ename = 'JONES'

-- JONES보다 많이 받는 사원 조회
SELECT *
FROM EMP E WHERE E.SAL >2975

-- 서브쿼리로 변경
SELECT *
FROM EMP E WHERE E.SAL >(SELECT sal from emp e WHERE e.ename = 'JONES')

-- Allen보다 빨리 입사한 사원 조회
SELECT * FROM EMP E WHERE E.HIREDATE < (SELECT E.HIREDATE from emp e WHERE e.ename = 'ALLEN')

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받은 사원정보 (사번, 이름, 직무, 급여)
-- 소속부서정보 조회(부서번호,부서명,부서위치) 조회
SELECT
	e.EMPNO,
	e.ENAME,
	d.DEPTNO,
	d.DNAME,
	d.LOC
FROM
	EMP E
JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
WHERE
	e.deptno = 20
	AND E.SAL > (
	SELECT
		AVG(e.SAL)
	FROM
		emp e)


-- 전체사원의 평균급여보다 적거나 같은 급여를 받는 20번부서의 정보 조회
SELECT
	e.EMPNO,
	e.ENAME,
	d.DEPTNO,
	d.DNAME,
	d.LOC
FROM
	EMP E
JOIN DEPT d ON
	e.DEPTNO = d.DEPTNO
WHERE
	e.deptno = 20
	AND E.SAL <= (
	SELECT
		AVG(e.SAL)
	FROM
		emp e)
		
-- 다중행 서브쿼리
-- 부서별 최고 급여와 같은 급여를 받는 사원 조회
-- 1) 부서별 최고급여
SELECT
	max(e.SAL)
FROM
	emp e
GROUP BY
	e.DEPTNO
SELECT
	*
FROM
	emp e
WHERE
	e.SAL IN(3000, 2850, 5000)
	
-- 서브쿼리 사용
SELECT
	*
FROM
	emp e
WHERE
	e.SAL IN(
	SELECT
		max(e.SAL)
	FROM
		emp e
	GROUP BY
		e.DEPTNO)

-- ANY, SOME : 서브쿼리가 반환한 여러 결과값 중 메인 쿼리와 조건식을 사용한 결과가 하나라도 TRUE 라면
--			   메인쿼리 조건식을 TRUE로 반환
-- IN 과 같은 효과를 =ANY(or = some)로 가능(in 을 더 많이 쓴다)
SELECT
	*
FROM
	emp e
WHERE
	e.SAL = ANY(
	SELECT
		max(e.SAL)
	FROM
		emp e
	GROUP BY
		e.DEPTNO)
		
-- < ANY, < SOME
-- 30번 부서의 (최대)급여보다 적은 급여를 받는 사원조회(단일행)
		
SELECT
	*
FROM
	emp e
WHERE
	e.SAL < (SELECT MAX(E.SAL) FROM EMP E WHERE E.DEPTNO = 30)
	ORDER BY E.SAL, E.EMPNO
	
	-- 30번 부서의 급여보다 적은 급여를 받는 사원조회(다중형)
	
	SELECT
	*
FROM
	emp e
WHERE
	e.SAL < ANY(SELECT E.SAL FROM EMP E WHERE E.DEPTNO = 30)
	ORDER BY E.SAL, E.EMPNO
	

-- ALL : 서브쿼리의 모든 결과가 조건식에 맞아 떨어져야만 메인쿼리의 조건식이 TRUE
	
-- 30번 부서의 최소급여보다 적은 급여를 받는 사원조회(단일행)
SELECT * FROM emp e WHERE e.SAL < (SELECT min(e.sal) FROM emp e WHERE e.DEPTNO = 30)

-- 30번 부서의 최소급여보다 적은 급여를 받는 사원조회(다중행)
SELECT * FROM emp e WHERE e.SAL < ALL (SELECT e.sal FROM emp e WHERE e.DEPTNO = 30)

-- EXISTS : 서브쿼리에 결과값이 하나 이상 있으면 조건식이 모두 TRUE, 없으면 FALSE
 SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10)
 
 SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 50)
 
 -- 비교할 열이 여러개인 다중열 서브쿼리
 SELECT * FROM EMP E WHERE (E.DEPTNO, E.SAL) IN(SELECT E.DEPTNO, MAX(E.SAL) FROM EMP E GROUP BY E.DEPTNO)
 
 -- SELECT절에 사용하는 서브쿼리(결과가 반드시 하나만 반환)
 -- 사원정보, 급여등급, 부서명 조회(조인)
 SELECT E.EMPNO, E.JOB, E.SAL, (SELECT S.GRADE  FROM SALGRADE s WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL ) "SALGRADE", E.DEPTNO, (SELECT D.DNAME FROM DEPT d WHERE E.DEPTNO = D.DEPTNO )"DNAME"
 FROM EMP e  
 
 -- 10번 부서에 근무하는 사원 중 30번 부서에 없는 직책인 사원의 사원정보(사번, 이름, 직무)
 -- 부서정보(부서번호, 부서명, 위치) 조회
 SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC
 FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
 WHERE E.JOB
 NOT IN (SELECT E.JOB
 FROM EMP E
 WHERE E.DEPTNO = 30) AND E.DEPTNO = 10
 
 
 -- 직책이 SALESMAN인 사람의 최고급여보다 많이 받는 사람의 사원정보, 급여등급정보를 조회
 -- 다중행 함수를 사용하는 방법과 사용하지 않는 방법 2가지로 작성
 -- 출력 : 사번, 이름, 급여, 등급
 
 -- 다중행 함수를 사용하지 않는 방법
 SELECT e.EMPNO, e.ENAME, e.SAL, (SELECT S.GRADE  FROM SALGRADE s WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL ) "SALGRADE"
 FROM EMP E
 WHERE E.SAL >(SELECT max(E.SAL) FROM EMP E WHERE E.JOB = 'SALESMAN') order BY e.EMPNO 
 
 -- 다중행 함수를 사용하는 방법
  SELECT e.EMPNO, e.ENAME, e.SAL, (SELECT S.GRADE  FROM SALGRADE s WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL ) "SALGRADE"
 FROM EMP E
 WHERE E.SAL > all(SELECT E.SAL FROM EMP E WHERE E.JOB = 'SALESMAN') order BY e.EMPNO 
 