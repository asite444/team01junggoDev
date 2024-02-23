-- 결제정보 테이블
CREATE TABLE `Payment` (
	`pay_idx`	int  PRIMARY KEY auto_increment	NOT NULL,
	`user_idx`	int 	NOT NULL,
	`cart_idx`	int	NOT NULL,
	`user_name`	varchar(200)	NOT NULL,
	`pay_zipcode`	varchar(200)	NULL,
	`prod_idx`	int	NOT NULL,
	`prod_name`	varchar(200)	NOT NULL,
	`prod_count`	int	NOT NULL,
	`prod_pay`	int	NOT NULL,
	`total_pay`	int	NOT NULL,
	`pro_image`	varchar(200)	NOT NULL,
	`paycard_numb`	varchar(200)	NULL,
	`pay_type`	varchar(200)	NULL	COMMENT '무통장입금,카드결제등'
);


ALTER TABLE `Payment` ADD CONSTRAINT `FK_user_TO_Payment_1` FOREIGN KEY (
	`user_idx`
)
REFERENCES `user` (
	`user_idx`
);

COMMIT;