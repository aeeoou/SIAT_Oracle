-- 선택 테이블 DB의 모든 열을 가져온다.
select * from employees;

SELECT * FROM departments;

-- departments 에서 department_id 랑 location_id 만 사용
SELECT department_id, location_id FROM departments;

-- 순서 바꿔보기
SELECT location_id, department_id FROM departments;

-- desc <=> describe (sqlplus명령어) :: 테이블의 구조를 확인하는 명령어
DESC departments;

-- 과제: employees 구조를 확인하라
DESC employees;

SELECT last_name, salary FROM employees;

SELECT last_name, salary + 300 FROM employees;

-- 과제: 사원들의 월급, 연봉을 조회하라. (연봉은 DB테이블에 없기 때문에 월급 * 12 표현식을 써서 새로 생성한다.)
SELECT last_name, salary * 12 FROM employees;

-- 연산자가 2개 이상 들어가면 우선순위 대로 진행된다. 단 강제로 우선순위를 두고 싶으면 ()를 넣어준다.
SELECT last_name, salary, 12 * salary + 100 FROM employees;
SELECT last_name, salary, 12 * (salary + 100) FROM employees;

SELECT last_name, job_id, commission_pct FROM employees;

SELECT salary, salary * 12 + salary * 12 * commission_pct FROM employees;

-- as : 칼럼의 이름을 직접적으로 바꾸는 것 (as는 생략이 가능하다.)
SELECT last_name as name, commission_pct comm FROM employees;

SELECT last_name "NAME", salary * 12 "Annual Salary" FROM employees;

-- 과제: 사원들의 사번, 이름, 직업, 입사일(STARTDATE로 변경)을 조회
SELECT employee_id, last_name, job_id, hire_date as STARTDATE FROM employees;

-- 과제: 사원들의 사번(EMP #), 이름(Name), 직업(Job), 입사일(Hire Date)를 조회
SELECT employee_id "EMP #", last_name "Name", job_id "Job", hire_date "Hire Date" FROM employees;

-- || : 붙이기 연산자 두 칼럼을 붙여서 새로운 하나의 칼럼으로 생성한다.
SELECT last_name || job_id FROM employees;

SELECT last_name || ' is ' || job_id FROM employees;

SELECT last_name || ' is ' || job_id employees FROM employees;

SELECT last_name || null FROM employees;

SELECT last_name || commission_pct FROM employees;

SELECT last_name || salary FROM employees;

SELECT last_name || hire_date FROM employees;

SELECT last_name || (salary * 12) FROM employees;

-- 과제: 사원들의 '이름, 직업' (Emp and Title)을 조회
SELECT last_name || ',' || job_id "Emp and Title" FROM employees; 

