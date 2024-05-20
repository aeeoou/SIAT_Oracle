-- pl sql 로 만들어진 API 콜해서 사용해보기

-- SINGLE FUNCTION (싱글펑션)
DESC dual           -- 더미 테이블(가짜 테이블) dual
                    -- dual테이블은 Oracle DB에서 자주 사용되는 특별한 더미 테이블로, 하나의 행과 하나의 열('Dummy'라는 이름의 열)을 갖고 있음.
                    -- 주로 SELECT문에서 연산이나 함수의 결과를 테스트할 때 사용
SELECT * FROM dual; 

-- 함수 LOWER (파라미터를 소문자로 바꾼다.)
SELECT LOWER('SQL Course') 
FROM dual;          -- FROM 에는 SELECT한 칼럼의 테이블명이 들어가야하나, 없으므로 더미테이블 명을 작성한다.
-- 함수 UPPER (파라미터를 대문자로 바꾼다.)
SELECT UPPER('sql Course')
FROM dual;
-- 함수 INITCAP (문자열의 각 단어의 첫 글자를 대문자로, 나머지는 소문자로 변환 [단어는 공백이나 다른 비문자 문자를 기준으로 나눔])
SELECT INITCAP('eyes on you')
FROM dual;

SELECT last_name
FROM employees
WHERE last_name = 'higgins';

SELECT last_name
FROM employees
WHERE last_name = 'Higgins';

SELECT last_name
FROM employees
WHERE LOWER(last_name) = 'higgins';     -- 싱글펑션 WHERE절에 사용, LOWER(비교값) = '리턴값'

-- 함수 CONCAT (두 개의 문자열을 결합하여 하나의 문자열로 만든다. [두 개의 인수만 받아들이며, 두 개의 문자열을 단순히 이어붙인다.])
SELECT CONCAT('Hello', 'World')
FROM dual;

-- 함수 SUBSTR (index값 글자부터 길이값까지의  글자만 반환)
SELECT SUBSTR('HelloWorld', 2, 5)   -- '소스', index 값, length(길이)
FROM dual;
-- 마지막 글자만 반환해보기
SELECT SUBSTR('HelloWorld', -1, 1)
FROM dual;