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
VALUES('DL-0002','Are you sure to delete this record','Q','Â· «‰  „ «ﬂœ „‰ «‰ﬂ  —Ìœ Õ–› «·”Ã·');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('UP-0004','Record updated Successfully','I',' „  «·⁄„·Ì… »‰Ã«Õ ');
/
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('UP-0005','Updation of Records failed','S','›‘·  «·⁄„·Ì…');
/
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('UP-0001','Updation of Control Master Failed','S','›‘·  «·⁄„·Ì…');
INSERT INTO user_messages (MSG_C_ID,MSG_C_DESC,MSG_C_SEVERITY,MSG_C_FOREIGN)
VALUES('SL-0006','Selection of Control Number Failed','S','›‘· «·«Œ Ì«— ··—ﬁ„');
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