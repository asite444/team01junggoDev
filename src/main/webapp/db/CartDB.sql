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

select * from cart;
-- 샘플 데이터 (user 테이블에 회원정보가 존재해야 함)
INSERT INTO cart (`cart_idx`, `user_idx`, `prod_idx`, `prod_count`) VALUES ('1', '1', '1', '1');
commit;



select  ifnull(sum(p.p_price),0) 
from cart c join product p on  p.p_idx=c.prod_idx
where c.user_idx=1;