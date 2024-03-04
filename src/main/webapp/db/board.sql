use secondhanddb;
drop table board;
CREATE TABLE `board` (
	`b_idx`	int  primary key auto_increment 	NOT NULL,
	`b_subject`	varchar(200)	NOT NULL,
	`b_content`	text	NOT NULL,
	`b_ip`	varchar(200)	NOT NULL,
	`b_regdate`	datetime	NULL,
	`b_readhit`	int NULL	DEFAULT 0,
	`b_ref`	int	NULL,
	`b_step`	int	NULL,
	`b_depth`	int	NULL,
	`b_use`	varchar(10)	NULL,
	`user_idx`	int 	NOT NULL,
	`user_name`	varchar(200)	NOT NULL
);

ALTER TABLE `board` ADD CONSTRAINT `FK_user_TO_board_1` FOREIGN KEY (
	`user_idx`
)
REFERENCES `user` (
	`user_idx`
);

select * from board;
commit;