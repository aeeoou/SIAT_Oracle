-- WHERE 절
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
-- 숫자
SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500; -- 시작값(포함) and 끝값(포함) 사이를 찾는다.
-- 캐릭터 값
SELECT last_name
FROM employees
WHERE last_name BETWEEN 'King' AND 'Smith'; -- 캐릭터 값으로 찾기
-- 날짜
SELECT last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2002/01/01' AND '2002/12/31';

-- 과제] 'King' 사원의 first name, last name, 직업, 월급을 조회하라.
SELECT first_name, last_name, job_id, salary
FROM employees
WHERE last_name = 'King';

-- IN 연산자
-- 칼럼 안에 지정한 값을 반환한다.
SELECT employee_id, last_name, manager_id, hire_date
FROM employees
--WHERE manager_id IN (100, 101, 201);    --비교값 (숫자), 매니저 아이디 값이 100,101,201 인 사람을 뽑아낸다.
--WHERE last_name IN ('Hartstein', 'Vargas'); -- 비교값 (캐릭터)
WHERE hire_date IN ('2003/06/17', '2005/09/21'); -- 비교값 (날짜)

SELECT employee_id, last_name, manager_id
FROM employees
WHERE manager_id = 100 OR
      manager_id = 101 OR
      manager_id = 201;  -- 40~42번 코드를 풀어쓴 알고리즘
      
-- LIKE 연산자
-- LIKE 연산자의 비교값은 캐릭터값 뿐이다.
SELECT last_name
FROM employees
WHERE last_name LIKE 'S%';  -- 앞(일치한 값), 뒤%(와일드 카드%), 이름이 s로 시작하는 DB를 찾는다.

-- 과제] 2005년에 입사한 사원들의 이름, 입사일을 조회
SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '2005%';

SELECT last_name
FROM employees
WHERE last_name LIKE '%r'; -- %(와일드카드)r(이름이 r로 끝나는 사람)

--과제] 이름에 s가 포함된 사원들의 이름을 조회
SELECT last_name
FROM employees
--WHERE last_name LIKE '%s%';   -- % 는 0개 이상
WHERE last_name LIKE 'K___';    -- _ (언더바)는 한글자를 의미

-- 과제] 이름의 두번째 글자가 o인 사원의 이름을 조회
SELECT last_name
FROM employees
WHERE last_name LIKE '_o%';

SELECT job_id
FROM employees;

SELECT last_name, job_id
FROM employees
WHERE job_id LIKE 'I_\_%' escape '\';     -- 와일드카드 앞에 \ 를 넣으면 문자 언더바가 된다.

SELECT last_name, job_id
FROM employees
WHERE job_id LIKE 'I_[_%' escape '[';

-- 과제] 직업에 _R이 포함된 사원들의 이름, 직업을 조회
SELECT last_name, job_id
FROM employees
WHERE job_id LIKE '%\_R%' escape '\';
--WHERE job_id LIKE '%_R%';

SELECT employee_id, last_name, manager_id
FROM employees;

SELECT employee_id, last_name, manager_id
FROM employees
WHERE manager_id IS NULL;  -- NULL 은 데이터다.

-- AND (논리연산자)
SELECT last_name, job_id, salary
FROM employees
WHERE salary >= 5000 AND job_id LIKE '%IT%';  -- 조건값이 전부 참일 때, 참 반환

-- OR (논리연산자)
SELECT last_name, job_id, salary
FROM employees
WHERE salary >= 5000 OR job_id LIKE '%IT%';  -- 조건값 중 하나라도 참일 때, 참 반환

-- 과제] 월급이 $5000 이상 $12000 이하이다. 그리고, 20번이나 50번 부서에서 일한다.
--      위 사원들의 이름, 월급, 부서번호를 조회
SELECT last_name, salary, department_id
FROM employees
WHERE (salary BETWEEN 5000 AND 12000)
AND department_id IN (20, 50)
ORDER BY last_name;

-- 과제] 이름에 a 와 e가 포함된 사원들의 이름을 조회
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' AND
      last_name LIKE '%e%';
      
-- NOT 연산자
SELECT last_name, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'SA_REP');  -- 직업이 IT_PROG 와 SA_REP 가 아닌 것을 반환한다.

SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000;   -- 월급 10000 이상, 15000 이하를 제외하고 반환한다.

SELECT last_name, job_id
FROM employees
WHERE job_id NOT LIKE '%IT%';

SELECT last_name, job_id
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT last_name, salary
FROM employees
WHERE NOT (manager_id IS NULL AND salary >= 20000);

-- 과제] 직업이 영업이다. 그리고 월급이 $2000, $3500 이 아니다. 
--      위 사원들의 이름, 직업, 월급 조회
SELECT last_name, job_id, salary
FROM employees
WHERE job_id LIKE 'SA%' AND
      salary NOT IN (2000, 3500);
    
-- ORDER BY절 (오름차순 정렬)
SELECT last_name, department_id
FROM employees
ORDER BY department_id;
-- ORDER BY + DESC (내림차순 정렬)
SELECT last_name, department_id
FROM employees
ORDER BY department_id DESC;
-- ORDER BY절 에서 index값을 사용하는 경우 -> 정렬하고자 하는 열의 위치(index)를 지정 [SELECT 목록에서 열의 순서를 기준)
-- SQL에서 index 값은 1부터 시작한다.
SELECT last_name, department_id
FROM employees
ORDER BY 2;     -- 즉 여기서는 department_id 열을 기준으로 오름차순 정렬한다.

SELECT last_name, department_id dept_id
FROM employees
ORDER BY dept_id; -- 별명으로도 ORDER BY절 사용 가능

SELECT last_name, hire_date
FROM employees
WHERE department_id = 100
ORDER BY hire_date;

SELECT last_name, department_id, salary
FROM employees
WHERE department_id > 80
ORDER BY department_id ASC, salary DESC;    -- 칼럼 2개 이상 작성 가능하며, 오름차순이 기본 값이라 ASC는 생략 가능하다.