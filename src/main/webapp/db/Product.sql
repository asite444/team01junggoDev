use secondhanddb;
-- drop table product;
drop table product
-- 상품 테이블
CREATE TABLE `Product` (
	`p_idx`	int PRIMARY KEY  auto_increment	NOT NULL,
	`categories`	varchar(100)	NOT NULL,
	`user_idx`	int	NOT NULL,
	`p_subject`	varchar(100)	NOT NULL,
	`p_content`	varchar(500)	NOT NULL,
	`p_filename`	varchar(100)	NOT NULL,
	`p_filename1`	varchar(100)	NOT NULL,
	`p_filename2`	varchar(100)	NOT NULL,
	`p_filename3`	varchar(100)	NOT NULL,
	`p_ip`	varchar(100)	NOT NULL,
	`p_regdate`	datetime	NULL	DEFAULT now(),
	`p_modifydate`	datetime	NULL	DEFAULT now(),
	`p_hit`	int	NOT NULL	DEFAULT 0,
	`p_status`	varchar(100)	NOT NULL,
	`p_price`	int	NOT NULL	DEFAULT 0,
	`p_nego`	varchar(100)	NOT NULL,
	`p_deal`	varchar(100)	NULL,
	`p_name`	varchar(100)	NULL,
	`p_local`	varchar(100)	NULL,
	`p_som`	varchar(100)	NULL,
	`p_company` varchar(100)	NULL,
	`p_num`	varchar(100)	NULL
);

insert into board values(2,'웃기지마','똥멍충이','192.168.0.25',now(),0,2,'김관리',1,1,1,'y'); 


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


select * from product


CREATE TABLE `categories` (
	`c_idx`	int auto_increment PRIMARY KEY	NOT NULL,
	`c_name`	varchar(100)	NULL,
	`c_code`	varchar(100)	NULL
);

alter table Product add constraint fk_Product_categories foreign key(categories) references categories(c_code)

alter table product add constraint fk_product_category foreign key(category) references category(category_code)
commit;
select * from user;
select * from product;
select * from cart;
select 
c. cart_idx
, c.user_idx
, c.prod_idx
, c.prod_count 
, p.p_subject
, p.user_idx as sell_user_idx
,p.p_price
, p.p_status
, u.user_name
from cart c 
join product p
on  p.p_idx=c.prod_idx
join user u
on u.user_idx=p.user_idx
where c.user_idx=1
;


select `p`.`p_idx` AS `p_idx`
,`c`.`c_idx` AS `c_idx`
,`p`.`p_num` AS `p_num`
,`p`.`p_name`  AS `p_name`
,`p`.`p_price` AS `p_price`
,`p`.`p_saleprice` AS `p_saleprice`
,`c`.`c_cnt` AS `c_cnt`
,(`c`.`c_cnt` * `p`.`p_saleprice`) AS `amount`
,`c`.`mem_idx` AS `mem_idx`
,`p`.`p_image_s` AS `p_image_s` 
from 
(`product` `p` join `cart` `c` on((`p`.`p_idx` = `c`.`p_idx`)))

COMMIT;