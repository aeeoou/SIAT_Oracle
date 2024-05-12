SELECT employee_id, last_name, department_id FROM employees; WHERE department_id = 90;

-- 과제 : 176번 사원의 사번, 이름, 부서번호를 조회하라.
SELECT employee_id, last_name, department_id FROM employees WHERE employee_id = 176;

SELECT employee_id, last_name, department_id FROM employees WHERE last_name = 'Whalen';

SELECT employee_id, last_name, hire_date FROM employees WHERE hire_date = '2008/02/06';

SELECT last_name, salary FROM employees WHERE salary <= 3000;

-- 과제 : 월급 $12,000 이상 버는 사원들의 이름, 월급을 조회하라.
SELECT last_name, salary FROM employees WHERE salary >= 12000;