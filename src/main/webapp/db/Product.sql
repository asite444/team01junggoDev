-- 상품 테이블
CREATE TABLE `Product` (
	`p_idx`	int auto_increment PRIMARY KEY 	NOT NULL,
	`c_idx`	int	NOT NULL,
	`user_idx`	int	NOT NULL,
	`p_subject`	int	NOT NULL,
	`p_content`	varchar(500)	NOT NULL,
	`p_filename`	varchar(100)	NOT NULL,
	`p_ip`	varchar(100)	NOT NULL,
	`p_regdate`	datetime	NULL	DEFAULT now(),
	`p_modifydate`	datetime	NULL	DEFAULT now(),
	`mem_idx`	int	NULL,
	`mem_name`	varchar(100)	NOT NULL,
	`p_hit`	int	NOT NULL	DEFAULT 0,
	`p_status`	varchar(100)	NOT NULL,
	`p_price`	int	NOT NULL	DEFAULT 0,
	`p_nego`	varchar(100)	NOT NULL
);


-- FK 설정(카테고리 테이블)
ALTER TABLE `Product` ADD CONSTRAINT `FK_categories_TO_Product_1` FOREIGN KEY (
	`c_idx`
)
REFERENCES `categories` (
	`c_idx`
);

-- FK설정 (회원 테이블)
ALTER TABLE `Product` ADD CONSTRAINT `FK_user_TO_Product_1` FOREIGN KEY (
	`user_idx`
)
REFERENCES `user` (
	`user_idx`
);

select * from user;
