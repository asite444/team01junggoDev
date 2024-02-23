use secondhanddb;
-- 회원테이블
CREATE TABLE `user` (
	`user_idx`	 int primary key auto_increment not null,
	`user_name`	varchar(100)	NOT NULL,
	`user_id`	varchar(100)	NOT NULL,
	`user_pwd`	varchar(100)	NOT NULL,
	`user_email`	varchar(100)	NOT NULL,
	`user_zipcode`	varchar(100)	NOT NULL,
	`user_addr`	varchar(200)	NOT NULL,
	`user_ip`	varchar(100)	NOT NULL,
	`user_regdate`	datetime	 NULL,
	`user_modifydate`	datetime	 NULL,
	`user_grade`	varchar(100)	NOT NULL	DEFAULT '일반'
);
