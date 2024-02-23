
-- 결제카드 테이블
CREATE TABLE `CreditCard`  (
	`card_id`	int auto_increment PRIMARY KEY	NOT NULL,
	`user_idx`	int	NOT NULL,
	`card_number`	varchar(100) unique	NOT NULL,
	`card_holder_name`	varchar(100)	NOT NULL,
	`card_nickname`	varchar(100)	NULL,
	`expiration_date`	Date	NOT NULL,
	`cvv`	int	NOT NULL,
	`card_bank`	varchar(200)	NOT NULL,
	`card_type`	varchar(200)	NOT NULL	COMMENT '신용,체크',
	`card_category`	varchar(200)	NOT NULL	COMMENT '법인,개인',
	`regist_date`	Date	NOT NULL
);

-- 회원 참조FK키 
ALTER TABLE `CreditCard` ADD CONSTRAINT `FK_user_TO_CreditCard_1` FOREIGN KEY (
	`user_idx`
)
REFERENCES `user` (
	`user_idx`
);
