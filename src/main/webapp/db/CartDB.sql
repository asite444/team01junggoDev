-- 장바구니 테이블
CREATE TABLE `Cart` (
	`cart_idx`	int auto_increment  PRIMARY KEY 	NOT NULL,
	`user_idx`	int	NOT NULL,
	`prod_idx`	int	NOT NULL,
	`prod_count`	int	NOT NULL
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_user_TO_cart_1` FOREIGN KEY (
	`user_idx`
)
REFERENCES `user` (
	`user_idx`
);
use secondhanddb;
select * from cart;
commit;
-- 샘플 데이터 (user 테이블에 회원정보가 존재해야 함)
INSERT INTO cart (`cart_idx`, `user_idx`, `p_idx`, `p_count`) VALUES ('1', '1', '1', '1');
INSERT INTO cart (`cart_idx`, `user_idx`, `p_idx`, `p_count`) VALUES ('2', '1', '2', '1');
INSERT INTO cart (`cart_idx`, `user_idx`, `p_idx`, `p_count`) VALUES ('3', '1', '3', '1');
commit;

update product set p_deal='결제완료' where p_idx=1;

select  ifnull(sum(p.p_price),0) 
from cart c join product p on  p.p_idx=c.prod_idx
where c.user_idx=1;
select * from cart;