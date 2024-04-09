-- 1. 회원 테이블에서 이메일, 모바일, 이름, 주소 순으로 나오도록 검색하시오.
SELECT Email
     , Mobile
	 , Names
	 , Addr
  FROM membertbl
 ORDER BY Addr DESC, Email;

-- 2. 함수를 사용하여 아래와 같은 결과가 나오도록 쿼리를 작성하시오.(전채 행의 개수는 59개입니다)
SELECT Names AS '도서명'
     , Author AS '저자'
	 , ISBN
	 , Price AS '정가'
  FROM bookstbl
 ORDER BY Price DESC;

-- 3.  다음과 같은 결과가 나오도록 SQL 문을 작성하시오.(책을 한번도 빌린적이 없는 회원을 뜻합니다)
SELECT DISTINCT m.[Names] AS '회원명',
                m.Levels AS '회원등급',
                m.Addr AS '회원주소',
                r.RentalDate AS '대여일'
  FROM membertbl AS m LEFT JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
 WHERE (r.memberIdx IS NULL OR r.RentalDate IS NULL)
   AND m.Levels = 'A'
 ORDER BY m.Names ASC;

-- 4. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.
SELECT d.Names AS '책 장르',
       FORMAT(SUM(b.Price), '#,#') +'원' AS '총합계금액'
  FROM divtbl AS d LEFT JOIN bookstbl AS b 
    ON d.Division = b.Division
 WHERE b.Price IS NOT NULL
GROUP BY d.Names;

-- 5. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.
SELECT ISNULL(d.Names, '--합계--') AS '책 장르',
       COUNT(b.Division) AS '권수',
       FORMAT(SUM(b.Price), '#,#') +'원' AS '총합계금액'
  FROM divtbl AS d LEFT JOIN bookstbl AS b 
  ON d.Division = b.Division
 WHERE b.Price IS NOT NULL
 GROUP BY d.Names WITH ROLLUP;


