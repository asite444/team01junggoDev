use secondhanddb;
drop table comment;
CREATE TABLE `comment` (
	`cmt_idx`	int auto_increment PRIMARY KEY	NOT NULL,
	`cmt_ip`	varchar(200) not null,
	`b_idx`	int	NOT NULL,
	`user_idx`	int	NOT NULL,
	`user_id`	varchar(200)	NULL,
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
select * from comment;
commit;
