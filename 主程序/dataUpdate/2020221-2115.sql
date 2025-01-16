alter table lh_sending_config add last_num DECIMAL(20,4) COMMENT '剩余库存';
alter table lh_sending_order add original_interest DECIMAL(20,4) COMMENT '原币收益';