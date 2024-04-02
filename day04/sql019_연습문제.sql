-- 1. 새로운 도서('스포츠 세계', '대한미디어', 10,000원)가 마당서점에 입고되었다.
 -- 삽입이 안 될 때 필요한 데이터가 더 있는지 찾아보시오
 INSERT INTO Book (bookid, bookname, publisher, price)
    VALUES(14, '스포츠 세계', '대한미디어', 10000);

-- 2. '삼성당'에서 출판한 도서를 삭제하시오
DELETE FROM Book
 WHERE publisher = '삼성당';

-- 3. '이상미디어'에서 출판한 도서를 삭제하시오. 삭제가 안되면 원인을 생각해보시오
-- 참조 제약조건에 걸리기 때문에 삭제가 불가
-- 삭제할려면 Orders테이블에서 bookid 7,8을 삭제 후 삭제 가능
DELETE FROM Book
 WHERE publisher = '이상미디어' 

-- 4. 출판사 '대한미디어'를 '대한출판사'로 이름을 바꾸시오
UPDATE Book
   SET publisher = '대한출판사'
 WHERE bookid IN (SELECT bookid
                    FROM Book
                   WHERE publisher = '대한미디어')