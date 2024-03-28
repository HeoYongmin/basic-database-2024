-- 모든 도서의 이름과 가격을 검색하시오
-- Ctrl+Shirft+U --> 대문자, Ctrl+Shift+L -> 소문자
SELECT bookname, price
  FROM Book;

-- 모든 도서의 가격과 이름을 검색하시오
SELECT price, bookname
  FROM Book;

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오
SELECT *
  FROM Book;

-- 실무에서는 속성, 컬럼며을 다 적는게 일반적
SELECT bookid, bookname, publisher, price
  FROM Book;
