SELECT employee_id, last_name, department_id FROM employees; WHERE department_id = 90;

-- 과제 : 176번 사원의 사번, 이름, 부서번호를 조회하라.
SELECT employee_id, last_name, department_id FROM employees WHERE employee_id = 176;

SELECT employee_id, last_name, department_id FROM employees WHERE last_name = 'Whalen';

SELECT employee_id, last_name, hire_date FROM employees WHERE hire_date = '2008/02/06';

SELECT last_name, salary FROM employees WHERE salary <= 3000;

-- 과제 : 월급 $12,000 이상 버는 사원들의 이름, 월급을 조회하라.
SELECT last_name, salary FROM employees WHERE salary >= 12000;

-- 연산자 != (다르다)
SELECT last_name, job_id
FROM employees
WHERE job_id != 'IT_PROG'; -- 프로그래머가 아니다. 즉 직업이 프로그래머가 아닌 사람을 찾는다.

-- 연산자 between 값 AND 값 (범위를 나타낸다.)
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500; -- 시작값(포함) and 끝값(포함) 사이를 찾는다.

SELECT last_name
FROM employees
WHERE last_name BETWEEN 'King' AND 'Smith'; -- 캐릭터 값으로 찾기