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

-- 아이디 unique 제약 : 도메인내 중복허용하지 않는다
   alter table users
      add constraint  unique_users_user_id  unique(user_id);
      
-- sample data
   insert into user(user_name,user_id,user_pwd,user_email,user_zipcode,user_addr,user_ip)
               values('김일반','one','1234','one@ict.com','12345','서울시 강남구','168.192.0.49'); 
   
   insert into user(user_name,user_id,user_pwd,user_email,user_zipcode,user_addr,user_ip,user_grade)
               values('박여사','vip','1234','two@ict.com','12345','서울시 용산구','168.192.0.49','vip');             
               
   insert into user(user_name,user_id,user_pwd,user_email,user_zipcode,user_addr,user_ip,user_grade)
               values('김관리','admin','1234','admin@ict.com','12345','서울시 강남구','168.192.0.49','관리자');

select * from user  where user_idx=3  
                                     
select * from user  where user_id='vip'       
   
commit;  

 -- 삭제
delete  from user where user_idx=5
