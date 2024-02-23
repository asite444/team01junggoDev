use secondhanddb;
CREATE TABLE `comment` (
	`cmt_ip`	int auto_increment PRIMARY KEY	NOT NULL,
	`b_idx`	int	NOT NULL,
	`user_idx`	int	NOT NULL,
	`user_name`	varchar(200)	NULL,
	`cmt_content`	text	NOT NULL,
	`cmt_regdate`	datetime	NULL
);

-- FK설정 (회원 테이블)
ALTER TABLE `comment` ADD CONSTRAINT `FK_user_TO_Commentt_1` FOREIGN KEY (
	`user_idx`
)
REFERENCES `user` (
	`user_idx`
);

commit;
