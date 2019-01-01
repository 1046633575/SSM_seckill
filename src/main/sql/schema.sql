--数据库初始化脚本

--创建数据库
CREATE DATABASE seckill;
--使用数据库
use seckill;
--创建秒杀库存表
create table seckill(
  seckill_id BIGINT NOT NULL Auto_increment comment '商品id',
  name varchar(120) not null comment '商品名称',
  number int not null comment '商品数量',
  start_time TIMESTAMP not null comment '秒杀开始时间',
  end_Time TIMESTAMP not null comment '秒杀结束时间',
  create_Time TIMESTAMP not null DEFAULT current_timestamp comment '秒杀行为创建时间',
  PRIMARY KEY (seckill_id),
  key idx_start_time (start_time),
  key idx_end_time (end_Time),
  key idx_create_time(create_Time)
) ENGINE Innodb AUTO_INCREMENT 1000 default CHARSET = utf8 COMMENT '商品库存表';
--初始化数据
insert into
  seckill(name,number,start_time,end_time)
values
  ('2000元秒杀iphoneX',100,'2018-9-22 00:00:00','2018-9-23 00:00:00'),
  ('500元秒杀Mi8',100,'2018-9-22 00:00:00','2018-9-23 00:00:00'),
  ('300元秒杀Mi6',100,'2018-9-22 00:00:00','2018-9-23 00:00:00'),
  ('200元秒杀拖拉机',100,'2018-9-22 00:00:00','2018-9-23 00:00:00');

--秒杀成功明细表
--用户登录认证相关的信息

create table success_killed(
  seckill_id BIGINT not NULL comment '商品id',
  user_phone BIGINT NOT NULL COMMENT '用户手机号',
  state TINYINT NOT NULL DEFAULT -1 COMMENT '秒杀状态，-1代表失败；0代表成功；1代表已付款',
  create_time TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '秒杀行为创建时间',
  PRIMARY KEY (seckill_id,user_phone),    /*联合主键，保证一个用户对同一商品只能秒杀一次*/
  KEY idx_create_time(create_time)
) ENGINE Innodb DEFAULT CHARSET = utf8 COMMENT '秒杀明细表';

--连接数据库控制台
mysql -uroot -p 123456;