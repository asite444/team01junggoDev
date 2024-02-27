use secondhanddb;
CREATE TABLE `categories` (
	`c_idx`	int auto_increment PRIMARY KEY	NOT NULL,
	`c_name`	varchar(100)	NULL,
	`c_code`	varchar(100)	NULL
);


alter table category add constraint unique_category unique(category_code)
