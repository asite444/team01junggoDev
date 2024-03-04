USE secondhanddb;
DROP TABLE IF EXISTS `Payment`;

CREATE TABLE `Payment` (
	`pay_idx`	int auto_increment primary key	NOT NULL,
	`user_idx`	int 	NOT NULL,
	`order_number`	int	NULL,
	`cart_idx`	int	NULL,
	`pay_zipcode`	int	NOT NULL,
	`pay_addr`	VARCHAR(200)	NULL,
	`user_name`	VARCHAR(200)	NULL,
	`prod_idx`	int	NULL,
	`p_name`	VARCHAR(200)	NULL,
	`pro_image`	VARCHAR(200)	NULL,
	`sell_user_name`	VARCHAR(200)	NULL,
	`p_total_amount`	int	NULL,
	`amount_appr`	int	NULL,
	`card_type`	VARCHAR(200)	NULL,
	`card_number`	VARCHAR(200)	NULL,
	`payment_date`	date	NULL
);
select * from payment ;
select * from payment where user_idx=1 order by payment_date,order_number desc;
select ifnull(max(order_number),0) +1 as order_number from payment;
commit;
ALTER TABLE `Payment` ADD CONSTRAINT `FK_user_TO_Payment_1` FOREIGN KEY (
	`user_idx`
)
REFERENCES `user` (
	`user_idx`
);

commit;