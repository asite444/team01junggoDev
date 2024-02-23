-- 장바구니 테이블
CREATE TABLE `Cart` (
	`cart_idx`	int auto_increment  PRIMARY KEY 	NOT NULL,
	`user_idx`	int	NOT NULL,
	`prod_idx`	int	NOT NULL,
	`prod_count`	int	NOT NULL
);

ALTER TABLE `Cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`cart_idx`
);

select * from cart;
-- 샘플 데이터
INSERT INTO cart (`cart_idx`, `user_idx`, `prod_idx`, `prod_count`) VALUES ('1', '1', '1', '1');
commit;
