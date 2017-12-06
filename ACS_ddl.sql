-- Start of DDL Script for Table ACS.ACTORS
-- Generated 26-Aug-2017 15:39:39 from ACS@AbdoPc

CREATE TABLE actors
    (systemid                       NUMBER(32,0) ,
    actor_i_id                     NUMBER(10,0),
    actor_c_type                   VARCHAR2(10),
    actor_c_name                   VARCHAR2(50),
    actor_c_address                VARCHAR2(250),
    actor_c_mobile                 VARCHAR2(20),
    actor_c_email                  VARCHAR2(50),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))

/





-- Constraints for ACTORS

ALTER TABLE actors
ADD CONSTRAINT pk_actors PRIMARY KEY (systemid)
USING INDEX

/

ALTER TABLE actors
ADD CONSTRAINT unq_actors UNIQUE (actor_i_id, actor_c_type)
USING INDEX

/

alter table actors add actor_c_sts varchar2(10) default 'Active';

/

-- End of DDL Script for Table ACS.ACTORS

-- Start of DDL Script for Table ACS.CATEGORIES
-- Generated 26-Aug-2017 15:39:41 from ACS@AbdoPc

CREATE TABLE categories
    (systemid                       NUMBER(32,0) ,
    category_i_id                  NUMBER(16,0),
    category_c_desc                VARCHAR2(10),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))

/





-- Constraints for CATEGORIES

ALTER TABLE categories
ADD CONSTRAINT pk_categories PRIMARY KEY (systemid)
USING INDEX

/

ALTER TABLE categories
ADD CONSTRAINT unq_categories UNIQUE (category_i_id)
USING INDEX

/

alter table categories add category_c_sts varchar2(10) default 'Active';

/


-- End of DDL Script for Table ACS.CATEGORIES

-- Start of DDL Script for Table ACS.CLASSIFICATIONS
-- Generated 26-Aug-2017 15:39:43 from ACS@AbdoPc

CREATE TABLE classifications
    (systemid                       NUMBER(32,0) ,
    class_i_id                     NUMBER(16,0),
    class_c_desc                   VARCHAR2(10),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))

/





-- Constraints for CLASSIFICATIONS

ALTER TABLE classifications
ADD CONSTRAINT pk_classifications PRIMARY KEY (systemid)
USING INDEX

/

ALTER TABLE classifications
ADD CONSTRAINT unq_classifications UNIQUE (class_i_id)
USING INDEX

/

Alter table classifications add class_c_sts varchar2(10) default 'Active';
/

-- End of DDL Script for Table ACS.CLASSIFICATIONS

-- Start of DDL Script for Table ACS.CONTRACT_PRICES
-- Generated 26-Aug-2017 15:39:44 from ACS@AbdoPc

CREATE TABLE contract_prices
    (systemid                       NUMBER NOT NULL,
    contractor_id                  NUMBER NOT NULL,
    product_id                     NUMBER NOT NULL,
    product_price_limit            NUMBER(12,2) NOT NULL,
    product_type                   VARCHAR2(10),
    deduct_type                    VARCHAR2(10),
    deduct_value                   NUMBER(12,2) NOT NULL,
    contract_status                VARCHAR2(10),
    entry_date                     DATE,
    enter_by                       VARCHAR2(10))

/





-- End of DDL Script for Table ACS.CONTRACT_PRICES

-- Start of DDL Script for Table ACS.IN_OUT_ORDERS
-- Generated 26-Aug-2017 15:39:45 from ACS@AbdoPc

CREATE TABLE in_out_orders
    (systemid                       NUMBER(32,0) ,
    in_out_order_i_id              NUMBER(16,0),
    in_out_order_c_type            VARCHAR2(50),
    prouduct_invoice_i_id          VARCHAR2(50),
    vendor_i_id                    NUMBER(16,0),
    purpose_i_id                   NUMBER(16,0),
    note                           VARCHAR2(250),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))

/





-- Constraints for IN_OUT_ORDERS

ALTER TABLE in_out_orders
ADD CONSTRAINT pk_in_out_orders PRIMARY KEY (systemid)
USING INDEX

/

ALTER TABLE in_out_orders
ADD CONSTRAINT unq_in_out_orders UNIQUE (in_out_order_i_id)
USING INDEX

/


-- End of DDL Script for Table ACS.IN_OUT_ORDERS

-- Start of DDL Script for Table ACS.IN_OUT_ORDERSDETAILS
-- Generated 26-Aug-2017 15:39:46 from ACS@AbdoPc

CREATE TABLE in_out_ordersdetails
    (systemid                       NUMBER(32,0) ,
    product_i_id                   NUMBER(16,0),
    quantity                       NUMBER(32,0),
    manufacturing_d_date           DATE,
    expiry_d_date                  DATE,
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))

/





-- Constraints for IN_OUT_ORDERSDETAILS

ALTER TABLE in_out_ordersdetails
ADD CONSTRAINT pk_in_out_ordersdetails PRIMARY KEY (systemid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/


-- End of DDL Script for Table ACS.IN_OUT_ORDERSDETAILS

-- Start of DDL Script for Table ACS.PRODUCTS
-- Generated 26-Aug-2017 15:39:47 from ACS@AbdoPc

CREATE TABLE products
    (systemid                       NUMBER(32,0) ,
    product_i_id                   NUMBER(16,0),
    product_c_desc                 VARCHAR2(30),
    unit_i_id                      NUMBER(10,0),
    class_i_id                     NUMBER(16,0),
    category_i_id                  NUMBER(16,0),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  NOPARALLEL
  LOGGING
  MONITORING
/





-- Constraints for PRODUCTS

ALTER TABLE products
ADD CONSTRAINT pk_products PRIMARY KEY (systemid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

ALTER TABLE products
ADD CONSTRAINT unq_products UNIQUE (product_i_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

alter table PRODUCTS add PRODUCTS_c_sts varchar2(10)  default 'Active'

/


-- End of DDL Script for Table ACS.PRODUCTS

-- Start of DDL Script for Table ACS.PRODUCTS_PRICESE
-- Generated 26-Aug-2017 15:39:48 from ACS@AbdoPc

CREATE TABLE products_pricese
    (systemid                       NUMBER(32,0) ,
    product_i_id                   NUMBER(16,0),
    product_i_price                NUMBER(10,0),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  NOPARALLEL
  LOGGING
  MONITORING
/





-- Constraints for PRODUCTS_PRICESE

ALTER TABLE products_pricese
ADD CONSTRAINT pk_products_pricese PRIMARY KEY (systemid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

ALTER TABLE products_pricese
ADD CONSTRAINT unq_products_pricese UNIQUE (product_i_id, product_i_price, 
  entry_d_date)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/


-- End of DDL Script for Table ACS.PRODUCTS_PRICESE

-- Start of DDL Script for Table ACS.STOCKS
-- Generated 26-Aug-2017 15:39:49 from ACS@AbdoPc

CREATE TABLE stocks
    (systemid                       NUMBER(32,0) ,
    product_i_id                   NUMBER(16,0),
    quantity                       NUMBER(32,0),
    unit_i_id                      NUMBER(10,0))
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  NOPARALLEL
  LOGGING
  MONITORING
/





-- Constraints for STOCKS

ALTER TABLE stocks
ADD CONSTRAINT pk_stocks PRIMARY KEY (systemid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

ALTER TABLE stocks
ADD CONSTRAINT unq_stocks UNIQUE (product_i_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/


-- End of DDL Script for Table ACS.STOCKS

-- Start of DDL Script for Table ACS.UNITS
-- Generated 26-Aug-2017 15:39:50 from ACS@AbdoPc

CREATE TABLE units
    (systemid                       NUMBER(32,0) ,
    unit_i_id                      NUMBER(10,0),
    unit_c_desc                    VARCHAR2(10),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  NOPARALLEL
  LOGGING
  MONITORING
/





-- Constraints for UNITS

ALTER TABLE units
ADD CONSTRAINT pk_units PRIMARY KEY (systemid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/

ALTER TABLE units
ADD CONSTRAINT unq_units UNIQUE (unit_i_id)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/


-- End of DDL Script for Table ACS.UNITS

-- Start of DDL Script for Table ACS.VENDORS_PRODUCTS
-- Generated 26-Aug-2017 15:39:51 from ACS@AbdoPc

CREATE TABLE vendors_products
    (systemid                       NUMBER(32,0) ,
    vendor_i_id                    NUMBER(16,0),
    product_i_id                   NUMBER(16,0),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))
  PCTFREE     10
  INITRANS    1
  MAXTRANS    255
  NOPARALLEL
  LOGGING
  MONITORING
/





-- Constraints for VENDORS_PRODUCTS

ALTER TABLE vendors_products
ADD CONSTRAINT pk_vendors_products PRIMARY KEY (systemid)
USING INDEX
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
/


-- End of DDL Script for Table ACS.VENDORS_PRODUCTS



CREATE SEQUENCE SEQ_SYSTEMID
 START WITH  1
 INCREMENT BY  1
 MINVALUE  0
 MAXVALUE  99999999999
 CACHE 5
/


CREATE SEQUENCE SEQ_orders_id
 START WITH  1
 INCREMENT BY  1
 MINVALUE  0
 MAXVALUE  99999999999
 CACHE 5
/


CREATE TABLE cnt_mast
    (cnt_c_code                     VARCHAR2(20) NOT NULL,
    cnt_c_desc                     VARCHAR2(100) NOT NULL,
    cnt_i_no                       NUMBER(20,0) NOT NULL)
  PARALLEL (DEGREE DEFAULT)
  LOGGING
  MONITORING
/


-- Constraints for CNT_MAST

ALTER TABLE cnt_mast
ADD CONSTRAINT pk_cnt_mast PRIMARY KEY (cnt_c_code)
USING INDEX
/


alter table products add product_c_code  varchar2(20); 
/
alter table products add CONSTRAINT UN_product_c_code UNIQUE  (product_c_code);
/

INSERT INTO cnt_mast (CNT_C_CODE,CNT_C_DESC,CNT_I_NO)
VALUES('productID','Product ID',0);
/


create table login ( user_name    varchar2(10) PRIMARY key, user_type varchar2(10) ,user_password varchar2(10));
/

alter table products add product_c_code  varchar2(20); 
/
alter table products add CONSTRAINT UN_product_c_code UNIQUE  (product_c_code)
/

INSERT INTO cnt_mast (CNT_C_CODE,CNT_C_DESC,CNT_I_NO)
VALUES('CLASSID','CLASS ID',0);
/

INSERT INTO cnt_mast (CNT_C_CODE,CNT_C_DESC,CNT_I_NO)
VALUES('CATEGORYID','CATEGORY ID',0);
/

INSERT INTO cnt_mast (CNT_C_CODE,CNT_C_DESC,CNT_I_NO)
VALUES('PRODUCTID','PRODUCT ID',0);
/



CREATE TABLE user_messages
    (msg_c_id                       VARCHAR2(10) NOT NULL,
    msg_c_desc                     VARCHAR2(250),
    msg_c_severity                 CHAR(1),
    msg_c_foreign                  VARCHAR2(300))
  PARALLEL (DEGREE DEFAULT)
  LOGGING
  MONITORING
/


-- Constraints for USER_MESSAGES

ALTER TABLE user_messages
ADD CONSTRAINT pk_user_messages PRIMARY KEY (msg_c_id)
USING INDEX
/

INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('DL-0002','Are you sure to delete this record','Q','هل انت متاكد من انك تريد حذف السجل');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('UP-0004','Record updated Successfully','I','تمت العملية بنجاح ');
/
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('UP-0005','Updation of Records failed','S','فشلت العملية');
/
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('UP-0001','Updation of Control Master Failed','S','فشلت العملية');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('SL-0006','Selection of Control Number Failed','S','فشل الاختيار للرقم');
/


CREATE TABLE bill_issue
    (systemid                       NUMBER NOT NULL,
    customer_id                    NUMBER NOT NULL,
    contractor_id                  NUMBER NOT NULL,
    card_id                        VARCHAR2(20),
    card_issue_date                DATE,
    card_expire_date               DATE,
    total_paid_amount              NUMBER(12,2) NOT NULL,
    bill_status                    VARCHAR2(10),
    entry_date                     DATE,
    enter_by                       VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/

CREATE TABLE bill_issue_detail
    (systemid                       NUMBER NOT NULL,
    product_id                     NUMBER NOT NULL,
    quantity                       NUMBER NOT NULL,
    product_price                  NUMBER(12,2) NOT NULL,
    contract_price                 NUMBER(12,2) NOT NULL,
    diffrent_amount                NUMBER(12,2) NOT NULL,
    deduct_amount                  NUMBER(12,2) NOT NULL,
    paid_amount                    NUMBER(12,2) NOT NULL)
  NOPARALLEL
  LOGGING
  MONITORING
/

Drop TABLE contract_prices cascade;
/


CREATE TABLE contract
    (systemid                       NUMBER NOT NULL,
    contractor_id                  NUMBER NOT NULL,
    startdate                      DATE,
    enddate                        DATE,
    contract_status                VARCHAR2(10),
    enry_date                      DATE,
    enter_by                       VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/

ALTER TABLE contract
ADD CONSTRAINT pk_contracts PRIMARY KEY (contractor_id)
USING INDEX
/

CREATE TABLE contract_detail
    (systemid                       NUMBER NOT NULL,
    contract_id                    NUMBER NOT NULL,
    product_id                     NUMBER NOT NULL,
    product_price_limit            NUMBER(12,2) NOT NULL,
    deduct_type                    VARCHAR2(10),
    deduct_value                   NUMBER(12,2) NOT NULL,
    entry_date                     DATE,
    enter_by                       VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/

ALTER TABLE contract_detail
ADD CONSTRAINT pk_con_det PRIMARY KEY (systemid, contract_id, product_id)
USING INDEX
/

ALTER TABLE contract_detail
ADD CONSTRAINT uk_contract_detail UNIQUE (contract_id, product_id)
USING INDEX
/

CREATE TABLE system_flag
    (flag_code                      VARCHAR2(10) NOT NULL,
    flag_desc                      VARCHAR2(50) NOT NULL,
    flag_value                     VARCHAR2(10) NOT NULL)
  NOPARALLEL
  LOGGING
  MONITORING
/

ALTER TABLE system_flag
ADD CONSTRAINT pk_system_flag PRIMARY KEY (flag_code)
USING INDEX
/

INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('IF-0017','فشل إستعادة السعر الأصلي للخدمة','S','failed to retrive service price');
/
drop table contract_prices;
/


CREATE TABLE dictmast
    (dict_c_repid                   VARCHAR2(9) NOT NULL,
    dict_c_type                    VARCHAR2(1) NOT NULL,
    dict_c_title                   VARCHAR2(100) NOT NULL,
    dict_c_table                   VARCHAR2(100),
    dict_c_colm                    VARCHAR2(30),
    dict_c_ftype                   VARCHAR2(1),
    dict_i_flen                    FLOAT(126),
    dict_i_fdec                    FLOAT(126),
    dict_c_case                    VARCHAR2(1),
    dict_c_orientation             VARCHAR2(1),
    dict_c_sortorder               VARCHAR2(2))
  PARALLEL (DEGREE DEFAULT)
  LOGGING
  MONITORING
/


-- Constraints for DICTMAST

ALTER TABLE dictmast
ADD CONSTRAINT pk_dictmast PRIMARY KEY (dict_c_repid, dict_c_type, dict_c_title)
USING INDEX
/

CREATE TABLE dictdetl
    (detl_c_repid                   VARCHAR2(8) NOT NULL,
    detl_c_colm                    VARCHAR2(30) NOT NULL,
    detl_c_disp                    VARCHAR2(30) NOT NULL,
    detl_c_filt                    VARCHAR2(30) NOT NULL)
  PARALLEL (DEGREE DEFAULT)
  LOGGING
  MONITORING
/


-- Constraints for DICTDETL

ALTER TABLE dictdetl
ADD CONSTRAINT pk_dictdetl PRIMARY KEY (detl_c_repid, detl_c_colm, detl_c_disp)
USING INDEX
/


INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP04','R','Product Master','dw_producttabularreport',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP04','F','Product Code','products','Product_c_code','C',20,NULL,'U',NULL,NULL);




INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP05','R','Service/Product Classifications','dw_classification_report',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP05','F','Classfication ID','classifications','class_i_id','N',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP05','F','Class Description','classifications','class_c_desc','C',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP05','F','Classfication Status','classifications','class_c_sts','C',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP05','F','Entered By','classifications','entered_c_by','C',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP05','F','Entered Date','classifications','entry_d_date','D',10,NULL,'U',NULL,NULL);

INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP06','R','Service/Product Units','dw_unit_report',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP06','F','Classfication ID','units','unit_i_id','N',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP06','F','Class Description','units','unit_c_desc','C',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP06','F','Entered By','units','entered_c_by','C',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP06','F','Entered Date','units','entry_d_date','D',10,NULL,'U',NULL,NULL);


INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP07','R','Service/Product Prices','dw_product_price_report',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP07','F','Product ID','products_prices','product_i_id','N',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP07','F','Product Price','products_prices','product_i_price','N',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP07','F','Entered By','products_prices','entered_c_by','C',10,NULL,'C',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP07','F','Entered Date','products_prices','entry_d_date','D',10,NULL,'U',NULL,NULL);




-- Start of DDL Script for Table HMS.PRODUCTS_PRICESE
-- Generated 05/09/2017 12:18:09 Õ from HMS@
drop table products_pricese
/

CREATE TABLE products_prices
    (systemid                       NUMBER(32,0) ,
    product_i_id                   NUMBER(16,0),
    product_i_price                NUMBER(10,0),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/


-- Constraints for PRODUCTS_PRICESE

ALTER TABLE products_prices
ADD CONSTRAINT pk_products_prices PRIMARY KEY (systemid)
USING INDEX
/

alter table products_prices
add CONSTRAINT fk_productID FOREIGN key (product_i_id) REFERENCES products(systemid)
/

ALTER TABLE products_prices
ADD CONSTRAINT unq_products_prices UNIQUE (product_i_id, product_i_price, 
  entry_d_date)
USING INDEX
/

ALTER TABLE products_prices
ADD CONSTRAINT uk_products_date UNIQUE (product_i_id, entry_d_date)
USING INDEX
/

alter table products_prices modify product_i_price NUMBER(10,2);
/

ALTER TABLE contract
drop CONSTRAINT pk_contracts 
/

ALTER TABLE contract
ADD CONSTRAINT pk_contracts PRIMARY KEY (systemid)
USING INDEX
/

alter table contract
add CONSTRAINT fk_contractorID FOREIGN key (contractor_id) REFERENCES actors(systemid)
/


INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP08','R','Service/Product Prices','dw_contract_details_report',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP08','F','Contract ID','contract','systemid','N',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP08','F','Contract Start Date','contract','startdate','D',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP08','F','Contract End Date','contract','enddate','D',10,NULL,'U',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP08','F','Entered By','contract','enter_by','C',10,NULL,'C',NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('GM REP08','F','Entered Date','contract','enry_date','D',10,NULL,'U',NULL,NULL);
/

-- End of DDL Script for Table HMS.PRODUCTS_PRICESE

-- permissions tables
CREATE TABLE Modules
    (systemid                       NUMBER(32,0) ,
    Module_c_Name                  VARCHAR2(10),
    Module_c_desc                VARCHAR2(50),
    Module_c_sts		 VARCHAR2(10) default 'Active',
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))

/





-- Constraints for Modules

ALTER TABLE Modules
ADD CONSTRAINT pk_Modules PRIMARY KEY (systemid)
USING INDEX

/

ALTER TABLE Modules
ADD CONSTRAINT unq_Module_c_Name UNIQUE (Module_c_Name)
USING INDEX

/


CREATE TABLE Module_Menus
    (systemid                       NUMBER(32,0) ,
    Module_i_id                  NUMBER(32,0) ,
    Menu_c_name                VARCHAR2(10),
    Menu_i_order		Number(2),
    SubMenu_i_order		Number(2),
    SubSubMenu_i_order		Number(2),
    Menu_c_sts		 VARCHAR2(10) default 'Active',
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))

/





-- Constraints for Module_Menus

ALTER TABLE Module_Menus
ADD CONSTRAINT pk_Module_Menus PRIMARY KEY (systemid)
USING INDEX

/


alter table Module_Menus
add CONSTRAINT fk_Module_i_id FOREIGN key (Module_i_id) REFERENCES Modules(systemid)
/
ALTER TABLE Module_Menus
ADD CONSTRAINT unq_ModulesMenus_order UNIQUE (Module_i_order,SubMenu_i_order,SubSubMenu_i_order)
USING INDEX

/

CREATE TABLE Users_Menus_Permissions
    (systemid                       NUMBER(32,0) ,
    user_i_id                  NUMBER(32,0) ,
    Menu_i_id			NUMBER(32,0),
    Permissions_c_sts		 VARCHAR2(10) default 'Active',
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))

/





-- Constraints for Users_Menus_Permissions

ALTER TABLE Users_Menus_Permissions
ADD CONSTRAINT pk_Users_Menus_Permissions PRIMARY KEY (systemid)
USING INDEX

/


alter table Users_Menus_Permissions
add CONSTRAINT fk_Users_Menus_userid FOREIGN key (user_i_id) REFERENCES users(systemid)
/

alter table Users_Menus_Permissions
add CONSTRAINT fk_Users_Menus_Menuid FOREIGN key (Menu_i_id) REFERENCES Module_Menus(systemid)
/

ALTER TABLE Users_Menus_Permissions
ADD CONSTRAINT unq_ModulesMenus_UserMenu UNIQUE (User_i_id,Menu_i_id)
USING INDEX

/

-- End of DDL Script for Table Users_Menus_Permissions

CREATE TABLE profile
    (id                             VARCHAR2(1) NOT NULL,
    name                           VARCHAR2(50) NOT NULL,
    comments                       VARCHAR2(30),
    address                        VARCHAR2(30),
    phone                          VARCHAR2(30),
    english_name                   VARCHAR2(40))
  NOPARALLEL
  LOGGING
  MONITORING
/


-- Constraints for PROFILE

ALTER TABLE profile
ADD PRIMARY KEY (id, name)
USING INDEX
/





create table users_permissions(
Login_name   Varchar2(20) ,
Application  Varchar2(20) ,
Item_type   Varchar2(10) ,
Item_name   Varchar2(20) ,
Priviledge  char(1) -- NULL = no permission,R=read only,I=Invisible,W=read/write
)
/

alter table users_permissions add PRIMARY key ( Login_name,Application,Item_type,Item_name)
/

alter table products add Min_i_Quantity  Number(10) default 0; 
/

alter table products modify  Min_i_Quantity default 0; 
/


alter table products add Max_i_Quantity  Number(10) default 0; 
/

--

drop table room_bills
/
drop table room_bills_details
/
drop table room_records
/
drop table room_transactions
/
CREATE TABLE room_bills
    (systemid                       NUMBER(32,0) ,
    customer_id                    NUMBER(10,0),
    room_c_id                      NUMBER(32,0),
    bed_c_id                       NUMBER(32,0),
    total_amount                   NUMBER(32,2),
    paid_amount                    NUMBER(32,2),
    bill_c_status                  VARCHAR2(10),
    price                          NUMBER(32,2),
    entery_date                    DATE,
    entered_by                     VARCHAR2(10),
    pass_by                        VARCHAR2(10),
    companion                      VARCHAR2(50),
    phone1                         NUMBER(10,0),
    phone2                         NUMBER(10,0),
    days                           NUMBER(10,0),
    from_date                      DATE,
    to_date                        DATE,
    contractor_id                  VARCHAR2(32),
    card_id                        VARCHAR2(32),
    contract_class                 VARCHAR2(32),
    card_issue_date                DATE,
    card_end_date                  DATE)
  NOPARALLEL
  LOGGING
  MONITORING
/

ALTER TABLE room_bills
ADD CONSTRAINT pk_room_bills PRIMARY KEY (systemid)
USING INDEX
/

CREATE TABLE room_bills_details
    (systemid                       NUMBER(32,0),
    room_c_id                      NUMBER(32,0),
    service                        VARCHAR2(10),
    price                          NUMBER(32,2),
    room_price                     NUMBER(32,2),
    entery_date                    DATE,
    entered_by                     VARCHAR2(10),
    pass_by                        VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/

CREATE TABLE room_records
    (systemid                       NUMBER(32,0) ,
    room_c_type                    VARCHAR2(10),
    room_c_description             VARCHAR2(250),
    beds                           NUMBER(32,0),
    room_c_status                  VARCHAR2(10),
    entery_date                    DATE,
    entered_by                     VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/

ALTER TABLE room_records
ADD CONSTRAINT pk_room_records PRIMARY KEY (systemid)
USING INDEX
/
CREATE TABLE room_transactions
    (systemid                       NUMBER(32,0) ,
    room_bill_id                   NUMBER(32,0),
    room_c_id                      NUMBER(32,0),
    service                        VARCHAR2(10),
    amount                         NUMBER(32,2),
    days                           NUMBER(32,0),
    entery_date                    DATE,
    entered_by                     VARCHAR2(10),
    pass_by                        VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/

ALTER TABLE room_transactions
ADD CONSTRAINT pk_room_transactions PRIMARY KEY (systemid)
USING INDEX
/


CREATE TABLE contract_classes
    (systemid                       NUMBER NOT NULL,
    contractor_id                  NUMBER NOT NULL,
    contract_c_class               VARCHAR2(10) NOT NULL,
    class_c_description            VARCHAR2(99),
    enry_date                      DATE,
    enter_by                       VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/

ALTER TABLE contract_classes
ADD CONSTRAINT pk_contract_class PRIMARY KEY (systemid)
USING INDEX
/

ALTER TABLE contract_classes
ADD CONSTRAINT uk_contract_class UNIQUE (contractor_id, contract_c_class)
USING INDEX
/


/*

--//--//--//--//---/-/-/-/-/
/*


ALTER TABLE IN_OUT_ORDERSDETAILS 
 ADD (
  current_c_sts VARCHAR2 (20),
  current_i_amount NUMBER (32)
 )
/
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('OR-0001','حدث خطأ أثناء تحديث الطلبية','S','Error During Updating The Order');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('OR-0002','خطأ في إستجلاب الطلبية الجديدة','S','Error During Fetching The New Order');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('OR-0003','خطأ في إستجلاب كمية الطلبية الجديدة','S','Error During Fetching The New Order Quantity');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0002','المخزون أقل من القيمة الخارجة','S','The Stock Is Less Than The Wanted Quantity');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0003','حدث خطأ أثناء تحديث المخزون','S','Error During Updating The Stock');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0005','خطأ في المحزون','S','Error In The Stock');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0101','لا يوجد مخزون متاح','S','The Stock IS Empty');
/

CREATE TABLE SYSTEM_MENUS 
( SYSTEMID NUMBER(32) PRIMARY KEY,
 MODULE_C_NAME VARCHAR2(20),
MENU_NAME VARCHAR2(30),
 MENU_C_TEXT VARCHAR2(30) NOT NULL);
/

INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(1,'MASTER','SETUP','التصنيف');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(12,'MASTER','SETUP','اسعار الخدمات/المنتجات');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(13,'MASTER','SETUP','انواع المنتجات');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(14,'MASTER','SETUP','وحدات القياس');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(15,'MASTER','SETUP','تعريف الاطباء');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(16,'MASTER','SETUP','تعريف الأدوية');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(17,'MASTER','SETUP','تعريف خدمات المعمل');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(18,'MASTER','MASTER REPORT','تقرير العقودات');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(19,'MASTER','MASTER REPORT','تقرير الاسعار');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(2,'MASTER','MASTER REPORT','تقرير وحدات القياس');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(3,'MASTER','MASTER REPORT','تقرير التصنيف للمنتجات');
INSERT INTO SYSTEM_MENUS (SYSTEMID,MODULE_C_NAME,MENU_NAME,MENU_C_TEXT)
VALUES(4,'MASTER','MASTER REPORT','تقرير الخدمات/المنتجات');
/
ALTER TABLE users_permissions MODIFY ITEM_NAME VARCHAR2(50) NOT NULL
/
-- INSERT INTO users_permissions  SELECT 'SA','hms','menu',MENU_C_TEXT,'I' FROM SYSTEM_MENUS
/
ALTER TABLE users_permissions 
ADD CONSTRAINT uk_ITEM_NAME UNIQUE (ITEM_NAME)
USING INDEX
/
ALTER TABLE SYSTEM_MENUS 
ADD CONSTRAINT uk_MENU_C_TEXT UNIQUE (MENU_C_TEXT)
USING INDEX
/
<<<<<<< HEAD

INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','التصنيف','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','اسعار الخدمات/المنتجات','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','انواع المنتجات','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','وحدات القياس','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','تعريف الاطباء','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','تعريف الأدوية','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','تعريف خدمات المعمل','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','تقرير العقودات','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','تقرير الاسعار','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','تقرير وحدات القياس','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','تقرير التصنيف للمنتجات','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','تقرير الخدمات/المنتجات','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','الاعدادات','I','MASTER');
INSERT INTO users_permissions (LOGIN_NAME,APPLICATION,ITEM_TYPE,ITEM_NAME,PRIVILEDGE,MODULE_C_NAME)
VALUES('SA','hms','menu','التقارير','I','MASTER');
/

ALTER TABLE users_permissions ADD MODULE_C_NAME VARCHAR2(20) NOT NULL
/
=======
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0001','خطأ في إسترجاع المخزون','I','Error While Retrieving The Stock');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0009','خطأ أثناء إسترجاع أقل  قيمة للمخزون','I','Error While Retrieving The Minimum Stock Amount');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0090','تحذير ، المخزون تعدى الحد الأدنى','S','Warrning , The Stock Exceeded It''s  Minimum Amount');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0091','تحذير ، المخزون سيتعدى الحد الأدنى بعد إكمال هذه العملية','S','Warrning , The Stock Will Exceed It''s  Minimum Amount After This Transaction');
>>>>>>> e770225625bdd710f14e599f78670929497fd0df
<<<<<<< HEAD
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0001','خطأ في إسترجاع المخزون','I','Error While Retrieving The Stock');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0009','خطأ أثناء إسترجاع أقل  قيمة للمخزون','I','Error While Retrieving The Minimum Stock Amount');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0090','تحذير ، المخزون تعدى الحد الأدنى','S','Warrning , The Stock Exceeded It''s  Minimum Amount');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0091','تحذير ، المخزون سيتعدى الحد الأدنى بعد إكمال هذه العملية','S','Warrning , The Stock Will Exceed It''s  Minimum Amount After This Transaction');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0092','تحذير ، سيتم إستهلاك المخزون كاملا ','I','Warrning, The Stock Will Be Fully Consumed ');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('OR-0004','خطأ في إستجلاب تاريخ إنتاج/إنتهاء الطلبية ','I','Error During Fetching The Order Manufacturing/Expiring Date ');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('OR-0006','المخزون غير كافي لإكمال العملية','S','The Stock Is Not Enough To Complete The Order ');

CREATE SEQUENCE seq_orders_id
  INCREMENT BY 1
  START WITH 171
  MINVALUE 0
  MAXVALUE 99999999999
  NOCYCLE
  NOORDER
  CACHE 5
/

INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP01','R','تقرير المحزون','dw_rep_stock',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP01','F','الكمية','stocks','quantity','N',10,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP01','F','رقم المنتج','stocks','product_i_id','N',10,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP02','F','تاريخ الطلبية','IN_OUT_ORDERSDETAILS','ENTRY_D_DATE','D',10,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP02','F','رقم المنتج','IN_OUT_ORDERSDETAILS','IN_OUT_ORDER_I_ID','N',10,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP02','R','تقرير الطلبيات','dw_rep_inoutorders',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP02','F','تاريخ الإنتاج','IN_OUT_ORDERSDETAILS','MANUFACTURING_D_DATE','D',10,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP02','F','تاريخ الإنتهاء','IN_OUT_ORDERSDETAILS','EXPIRY_D_DATE','D',10,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP02','F','الكمية','IN_OUT_ORDERSDETAILS','QUANTITY','N',10,NULL,NULL,NULL,NULL);
INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP02','F','نوع الطلبية','IN_OUT_ORDERS','IN_OUT_ORDER_C_TYPE','L',10,NULL,NULL,NULL,NULL);


INSERT INTO dictdetl (DETL_C_REPID,DETL_C_COLM,DETL_C_DISP,DETL_C_FILT)
VALUES('PH REP02','IN_OUT_ORDER_C_TYPE','إذن دخول','In');
INSERT INTO dictdetl (DETL_C_REPID,DETL_C_COLM,DETL_C_DISP,DETL_C_FILT)
VALUES('PH REP02','IN_OUT_ORDER_C_TYPE','إذن خروج','Out');
=======


-- Start of DDL Script for Table USER_MASTER


CREATE TABLE user_master
    (user_c_id                      VARCHAR2(10) NOT NULL,
    emp_c_id                       VARCHAR2(10),
    user_c_name                    VARCHAR2(100) NOT NULL,
    user_c_pass                    VARCHAR2(30) NOT NULL,
    user_c_level                   VARCHAR2(10) NOT NULL,
    user_c_daytime_restrict        CHAR(1) NOT NULL,
    user_c_act_lock                CHAR(1) NOT NULL,
    user_c_acc_locked              CHAR(1) NOT NULL,
    user_d_lock_date               DATE,
    user_c_acc_rele                CHAR(1),
    user_i_acc_releprd             NUMBER(2,0),
    user_c_firstpass_change        CHAR(1) NOT NULL,
    user_c_pass_expiration         CHAR(1) NOT NULL,
    user_i_pass_expiry_period      NUMBER(2,0),
    user_d_pass_expiry_date        DATE,
    user_i_concurrent              NUMBER(2,0) NOT NULL,
    user_c_pwdhist                 CHAR(1) NOT NULL,
    user_d_expiry                  DATE,
    user_i_pwdhist_count           NUMBER(2,0),
    user_c_sts                     CHAR(1) NOT NULL,
    direct_c_auth                  CHAR(1) NOT NULL,
    auth_c_limit                   CHAR(1) NOT NULL,
    user_c_lang                    VARCHAR2(10),
    entered_c_by                   VARCHAR2(10),
    user_i_graces                  NUMBER(2,0),
    user_c_type                    CHAR(1) DEFAULT 'U' NOT NULL,
    user_c_st                      CHAR(1),
    user_i_grace                   NUMBER(2,0),
    user_chgpass_count             NUMBER)
  PARALLEL (DEGREE DEFAULT)
  LOGGING
  MONITORING
/


-- Constraints for USER_MASTER

ALTER TABLE user_master
ADD CONSTRAINT ck_user_master1 CHECK (user_c_type in ('C','U'))
ENABLE NOVALIDATE
/


---------------------------------------

>>>>>>> 59c23844bd764e9128f2d28e300d39b01f161015
 

-- PHARMACY MODIFICTIONS 
CREATE TABLE STORES
  (
  store_i_id NUMBER (2),
  store_c_desc VARCHAR2 (250),
 PRIMARY KEY (store_i_id)
 )
  ORGANIZATION INDEX 
/



CREATE TABLE pharmacies
  (
  pharmacy_i_id     NUMBER (2),
  pharmacy_C_desc   VARCHAR2(250),
  store_i_id        NUMBER (2),
  store_c_main      VARCHAR2 (1),
  
 PRIMARY KEY (pharmacy_i_id,store_i_id)
 )
  ORGANIZATION INDEX 
/

CREATE TABLE pharmacies_users
  (
  pharmacy_i_id NUMBER (2),
  USER_c_NAME VARCHAR2(250),
  
 PRIMARY KEY (pharmacy_i_id,USER_c_NAME)
 )
  ORGANIZATION INDEX 
/

ALTER TABLE STOCKS 
RENAME COLUMN UNIT_I_ID TO store_I_ID
/

ALTER TABLE STOCKS ADD CONSTRAINT PK_STOCKS
  PRIMARY KEY (
  PRODUCT_I_ID
  ,STORE_I_ID
)
/
ALTER TABLE IN_OUT_ORDERS 
 ADD (
  ORDER_I_PRICE NUMBER (32, 2),
  STORE_I_ID NUMBER
 )
/
ALTER TABLE in_out_ordersdetails 
 ADD (
  ORDER_I_PRICE NUMBER (32, 2),
  STORE_I_ID NUMBER
 )
/

ALTER TABLE in_out_ordersdetails 
 ADD (
  ORDER_c_type VARCHAR2(3)
 )
/

ALTER TABLE IN_OUT_ORDERSDETAILS 
 ADD (
  current_c_sts VARCHAR2 (20),
  current_i_amount NUMBER (32)
 )
/




ALTER TABLE in_out_ordersdetails ADD CONSTRAINT chk_ORDER_AMOUNT
  CHECK (
  quantity > 0
)
/



ALTER TABLE in_out_ordersdetails ADD CONSTRAINT chk_out_quanttiy
  CHECK (
  current_i_amount <= quantity
)
/


ALTER TABLE stocks ADD CONSTRAINT chk_stock_amt
  CHECK (
   quantity >= 0
)
/
ALTER TABLE IN_OUT_ORDERSDETAILS 
 ADD (
  IN_OUT_ORDER_I_ID NUMBER (32)

 )
/

INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('OR-0001','حدث خطأ أثناء تحديث الطلبية','S','Error During Updating The Order');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('OR-0002','خطأ في إستجلاب الطلبية الجديدة','S','Error During Fetching The New Order');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('OR-0003','خطأ في إستجلاب كمية الطلبية الجديدة','S','Error During Fetching The New Order Quantity');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0002','المخزون أقل من القيمة الخارجة','S','The Stock Is Less Than The Wanted Quantity');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0003','حدث خطأ أثناء تحديث المخزون','S','Error During Updating The Stock');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0005','خطأ في المحزون','S','Error In The Stock');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('ST-0101','لا يوجد مخزون متاح','S','The Stock IS Empty');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('PH-050','خطأ في تحديد الصيديلة التى ينتمي لها المستخدم','S','Error When Selecting The User Pharmacy');
commit;


INSERT INTO dictmast (DICT_C_REPID,DICT_C_TYPE,DICT_C_TITLE,DICT_C_TABLE,DICT_C_COLM,DICT_C_FTYPE,DICT_I_FLEN,DICT_I_FDEC,DICT_C_CASE,DICT_C_ORIENTATION,DICT_C_SORTORDER)
VALUES('PH REP02','F','رقم المخزن','IN_OUT_ORDERS','store_i_id','N',10,NULL,NULL,NULL,NULL);

INSERT INTO actors (SYSTEMID,ACTOR_I_ID,ACTOR_C_TYPE,ACTOR_C_NAME,ACTOR_C_ADDRESS,ACTOR_C_MOBILE,ACTOR_C_EMAIL,ENTRY_D_DATE,ENTERED_C_BY,ACTOR_C_STS,NATIONAL_I_ID,MOTHER_C_NAME)
VALUES(0,0,'Patient',' ','....',' ',NULL,TO_DATE('2017-09-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'SA','Active',NULL,NULL);

 ALTER TABLE actors 
 ADD (
 National_i_id              varchar2(20),
 Mother_c_Name              varchar2(50)
 )
 /
