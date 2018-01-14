CREATE TABLE actors
    (systemid                       NUMBER(32,0) ,
    actor_i_id                     NUMBER(10,0),
    actor_c_type                   VARCHAR2(10),
    actor_c_name                   VARCHAR2(50),
    actor_c_address                VARCHAR2(250),
    actor_c_mobile                 VARCHAR2(20),
    actor_c_email                  VARCHAR2(50),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10),
    actor_c_sts                    VARCHAR2(10) DEFAULT 'Active',
    actor_age                      VARCHAR2(10) DEFAULT NULL,
    national_i_id                  VARCHAR2(20),
    mother_c_name                  VARCHAR2(50))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE actors
ADD CONSTRAINT pk_actors PRIMARY KEY (systemid)
USING INDEX
/

ALTER TABLE actors
ADD CONSTRAINT unq_actors UNIQUE (actor_i_id, actor_c_type)
USING INDEX
/

CREATE TABLE bar_code
    (code                           NUMBER(10,0))
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE bed_inventory
    (systemid                       NUMBER(32,0),
    room_c_id                      NUMBER(32,0),
    bed_c_id                       NUMBER(32,0),
    bed_c_status                   VARCHAR2(10),
    price                          NUMBER(32,2),
    entery_date                    DATE,
    entered_by                     VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE bed_inventory
ADD CONSTRAINT unq_bed_inventory UNIQUE (systemid, room_c_id, bed_c_id)
USING INDEX
/

CREATE TABLE bill_issue
    (systemid                       NUMBER NOT NULL,
    customer_id                    NUMBER NOT NULL,
    contractor_id                  NUMBER,
    card_id                        VARCHAR2(20),
    card_issue_date                DATE,
    card_expire_date               DATE,
    total_paid_amount              NUMBER(12,2) NOT NULL,
    bill_status                    VARCHAR2(10),
    entry_date                     DATE,
    enter_by                       VARCHAR2(10),
    window_name                    VARCHAR2(50) NOT NULL,
    class_c_id                     NUMBER,
    paid_by                        VARCHAR2(10),
    returned_by                    VARCHAR2(10),
    lastmodify_d_date              DATE)
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE bill_issue
ADD CONSTRAINT pk_issu PRIMARY KEY (systemid)
USING INDEX
/

CREATE TABLE bill_issue_detail
    (systemid                       NUMBER(38,0) NOT NULL,
    product_id                     NUMBER(38,0) NOT NULL,
    quantity                       NUMBER NOT NULL,
    product_price                  NUMBER(12,2) NOT NULL,
    contract_price                 NUMBER(12,2),
    diffrent_amount                NUMBER(12,2),
    deduct_amount                  NUMBER(12,5),
    paid_amount                    NUMBER(12,2) NOT NULL,
    window_name                    VARCHAR2(50),
    entry_date                     DATE ,
    enter_by                       VARCHAR2(50) NOT NULL,
    pass_by                        VARCHAR2(50))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE bill_issue_detail
ADD CONSTRAINT pk_issu_detail PRIMARY KEY (systemid, product_id, entry_date)
USING INDEX
/

CREATE TABLE bill_issue_detail1
    (systemid                       NUMBER NOT NULL,
    product_id                     NUMBER NOT NULL,
    quantity                       NUMBER NOT NULL,
    product_price                  NUMBER(12,2) NOT NULL,
    contract_price                 NUMBER(12,2),
    diffrent_amount                NUMBER(12,2),
    deduct_amount                  NUMBER(12,5),
    paid_amount                    NUMBER(12,2) NOT NULL,
    window_name                    VARCHAR2(50) NOT NULL,
    entry_date                     DATE,
    enter_by                       VARCHAR2(50) NOT NULL,
    pass_by                        VARCHAR2(50))
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE categories
    (systemid                       NUMBER(32,0) ,
    category_i_id                  NUMBER(16,0),
    category_c_desc                VARCHAR2(10),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10),
    category_c_sts                 VARCHAR2(10) DEFAULT 'Active',
    class_i_id                     NUMBER(32,0) DEFAULT 1 NOT NULL)
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE categories
ADD CONSTRAINT pk_categories PRIMARY KEY (systemid)
USING INDEX
/

ALTER TABLE categories
ADD CONSTRAINT unq_categories UNIQUE (category_i_id)
USING INDEX
/

CREATE TABLE classifications
    (systemid                       NUMBER(32,0) ,
    class_i_id                     NUMBER(16,0),
    class_c_desc                   VARCHAR2(15),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10),
    class_c_sts                    VARCHAR2(10) DEFAULT 'Active')
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE classifications
ADD CONSTRAINT pk_classifications PRIMARY KEY (systemid)
USING INDEX
/

ALTER TABLE classifications
ADD CONSTRAINT unq_classifications UNIQUE (class_i_id)
USING INDEX
/

CREATE TABLE cnt_mast
    (cnt_c_code                     VARCHAR2(20) NOT NULL,
    cnt_c_desc                     VARCHAR2(100) NOT NULL,
    cnt_i_no                       NUMBER(20,0) NOT NULL)
  PARALLEL (DEGREE DEFAULT)
  LOGGING
  MONITORING
/




ALTER TABLE cnt_mast
ADD CONSTRAINT pk_cnt_mast PRIMARY KEY (cnt_c_code)
USING INDEX
/

CREATE TABLE contract
    (systemid                       NUMBER NOT NULL,
    contractor_id                  NUMBER NOT NULL,
    startdate                      DATE,
    enddate                        DATE,
    contract_status                VARCHAR2(10),
    enry_date                      DATE,
    enter_by                       VARCHAR2(10),
    contract_c_class               VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE contract
ADD CONSTRAINT pk_contracts PRIMARY KEY (systemid)
USING INDEX
/

ALTER TABLE contract
ADD CONSTRAINT uk_contract UNIQUE (contractor_id, contract_c_class)
USING INDEX
/


ALTER TABLE contract
ADD CONSTRAINT fk_contractorid FOREIGN KEY (contractor_id)
REFERENCES actors (systemid)
/
CREATE TABLE contract_classes
    (systemid                       NUMBER NOT NULL,
    contractor_id                  NUMBER NOT NULL,
    contract_c_class               VARCHAR2(10) NOT NULL,
    class_c_description            VARCHAR2(99),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))
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
ADD CONSTRAINT uk_contract_detail UNIQUE (contract_id, product_id)
USING INDEX
/

ALTER TABLE contract_detail
ADD CONSTRAINT pk_con_det PRIMARY KEY (systemid, contract_id, product_id)
USING INDEX
/

CREATE TABLE dept_mast
    (dept_code                      NUMBER(3,0) ,
    dept_name                      VARCHAR2(30))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE dept_mast
ADD CONSTRAINT pk_dept_mast PRIMARY KEY (dept_code)
USING INDEX
/

CREATE TABLE dictdetl
    (detl_c_repid                   VARCHAR2(8) NOT NULL,
    detl_c_colm                    VARCHAR2(30) NOT NULL,
    detl_c_disp                    VARCHAR2(30) NOT NULL,
    detl_c_filt                    VARCHAR2(30) NOT NULL)
  NOPARALLEL
  LOGGING
  MONITORING
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
    dict_c_sortorder               VARCHAR2(2),
    dict_c_dddwname                VARCHAR2(100),
    dict_c_datacolumn              VARCHAR2(100),
    dict_c_displaycolumn           VARCHAR2(100),
    dict_c_dddwargument            VARCHAR2(30))
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE emp_attendance
    (seq_no                         NUMBER(10,0),
    emp_no                         NUMBER(10,0) ,
    work_date                      DATE ,
    time_in                        DATE ,
    time_out                       DATE,
    delay_minutes                  NUMBER(4,0),
    over_minutes                   NUMBER(4,0) DEFAULT NULL,
    out_reason                     VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE emp_attendance
ADD CONSTRAINT pk_emp_attendance PRIMARY KEY (emp_no, work_date, time_in)
USING INDEX
/

CREATE TABLE emp_mast
    (emp_no                         NUMBER(10,0) ,
    emp_name                       VARCHAR2(40),
    dept_code                      NUMBER(3,0),
    emp_type                       VARCHAR2(5),
    start_date                     DATE,
    end_date                       DATE,
    job_code                       NUMBER(3,0),
    emp_status                     VARCHAR2(3),
    emp_status_id                  NUMBER DEFAULT 1)
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE emp_mast
ADD CONSTRAINT pk_emp_mast PRIMARY KEY (emp_no)
USING INDEX
/

CREATE OR REPLACE TRIGGER tg_updatestatusid
 BEFORE
  UPDATE
 ON emp_mast
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
if :new.emp_status = '¿¿¿' then
:new.emp_status_id :=1;
else
 :new.emp_status_id :=0;
end if;
end ;
/

CREATE TABLE emp_mast2
    (emp_code                       VARCHAR2(255),
    emp_name                       VARCHAR2(255),
    dept_code                      VARCHAR2(255),
    emp_type                       VARCHAR2(255),
    start_date                     DATE,
    end_date                       VARCHAR2(255))
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE emp_mast3
    (emp_no                         VARCHAR2(255),
    emp_name                       VARCHAR2(255),
    dept_code                      VARCHAR2(255),
    emp_type                       VARCHAR2(255),
    start_date                     DATE,
    end_date                       DATE)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE emp_permissions
    (perm_id                        NUMBER NOT NULL,
    emp_no                         NUMBER NOT NULL,
    perm_date                      DATE NOT NULL,
    perm_minutes                   NUMBER NOT NULL,
    perm_reason                    VARCHAR2(200),
    perm_status                    CHAR(1))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE emp_permissions
ADD CONSTRAINT pk_emp_perm_id PRIMARY KEY (perm_id)
USING INDEX
/


COMMENT ON COLUMN emp_permissions.perm_status IS 'E=Entry , A=Authorized , R=Rejected'
/
ALTER TABLE emp_permissions
ADD CONSTRAINT fk_emp_perm_emp_no FOREIGN KEY (emp_no)
REFERENCES emp_mast (emp_no)
/
CREATE TABLE employee_works
    (employee_i_no                  NUMBER NOT NULL,
    project_c_code                 VARCHAR2(10) NOT NULL,
    start_d_time                   DATE NOT NULL,
    no_i_hours                     NUMBER NOT NULL,
    end_d_time                     DATE NOT NULL,
    work_c_details                 VARCHAR2(250))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE employee_works
ADD PRIMARY KEY (employee_i_no, project_c_code, start_d_time)
USING INDEX
/

CREATE TABLE in_out_orders
    (systemid                       NUMBER(32,0),
    in_out_order_i_id              NUMBER(16,0),
    in_out_order_c_type            VARCHAR2(50),
    prouduct_invoice_i_id          VARCHAR2(50),
    vendor_i_id                    NUMBER(16,0),
    purpose_i_id                   NUMBER(16,0),
    note                           VARCHAR2(250),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10),
    order_c_sts                    VARCHAR2(20),
    order_i_price                  NUMBER(32,2),
    store_i_id                     NUMBER)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE in_out_ordersdetails
    (systemid                       NUMBER(32,0),
    product_i_id                   NUMBER(16,0),
    quantity                       NUMBER(32,0),
    manufacturing_d_date           DATE,
    expiry_d_date                  DATE,
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10),
    in_out_order_i_id              NUMBER(32,0),
    product_c_sts                  VARCHAR2(20),
    current_c_sts                  VARCHAR2(20),
    current_i_amount               NUMBER(32,0),
    order_i_price                  NUMBER(32,2),
    store_i_id                     NUMBER,
    order_c_type                   VARCHAR2(3))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE in_out_ordersdetails
ADD CONSTRAINT chk_order_amount CHECK (
  quantity > 0
)
/

ALTER TABLE in_out_ordersdetails
ADD CONSTRAINT chk_out_quanttiy CHECK (
  current_i_amount <= quantity
)
/

CREATE TABLE job_mast
    (job_code                       NUMBER(3,0) ,
    job_name                       VARCHAR2(30))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE job_mast
ADD CONSTRAINT pk_job_mast PRIMARY KEY (job_code)
USING INDEX
/

CREATE TABLE lib_version
    (lib_c_name                     VARCHAR2(50) ,
    lib_c_version                  VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE lib_version
ADD CONSTRAINT pk_lib_version PRIMARY KEY (lib_c_name)
USING INDEX
/

CREATE OR REPLACE TRIGGER tr_notlessthan
 BEFORE
   UPDATE OF lib_c_version
 ON lib_version
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
WHEN ((TO_NUMBER(NEW.LIB_C_VERSION) < TO_NUMBER(OLD.LIB_C_VERSION))
)
begin
  if TO_NUMBER(:new.LIB_C_VERSION) < TO_NUMBER(:OLD.LIB_C_VERSION)
  then 
    raise_application_error(-20000,'NEW VERSION CAN NOT BE LESS/EQUAL THAN OLD ONE!');
    rollback;
  end if;
end;
/

CREATE TABLE login
    (user_name                      VARCHAR2(12),
    user_password                  VARCHAR2(12),
    user_type                      VARCHAR2(1),
    user_lock                      VARCHAR2(1) DEFAULT 'N' NOT NULL)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE module_menus
    (systemid                       NUMBER(32,0) ,
    module_i_id                    NUMBER(32,0),
    menu_c_name                    VARCHAR2(10),
    menu_i_order                   NUMBER(2,0),
    submenu_i_order                NUMBER(2,0),
    subsubmenu_i_order             NUMBER(2,0),
    menu_c_sts                     VARCHAR2(10) DEFAULT 'Active',
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE module_menus
ADD CONSTRAINT pk_module_menus PRIMARY KEY (systemid)
USING INDEX
/


ALTER TABLE module_menus
ADD CONSTRAINT fk_module_i_id FOREIGN KEY (module_i_id)
REFERENCES modules (systemid)
/
CREATE TABLE modules
    (systemid                       NUMBER(32,0) ,
    module_c_name                  VARCHAR2(10),
    module_c_desc                  VARCHAR2(50),
    module_c_sts                   VARCHAR2(10) DEFAULT 'Active',
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE modules
ADD CONSTRAINT pk_modules PRIMARY KEY (systemid)
USING INDEX
/

ALTER TABLE modules
ADD CONSTRAINT unq_module_c_name UNIQUE (module_c_name)
USING INDEX
/

CREATE TABLE parameters_mast
    (dept_code                      NUMBER(3,0) ,
    time_in                        DATE,
    time_out                       DATE,
    day_delay                      NUMBER(3,0),
    month_delay                    NUMBER(4,0),
    over_start                     NUMBER(3,0))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE parameters_mast
ADD PRIMARY KEY (dept_code)
USING INDEX
/

CREATE TABLE pbcatcol
    (pbc_tnam                       VARCHAR2(60) NOT NULL,
    pbc_tid                        NUMBER(*,0),
    pbc_ownr                       VARCHAR2(60) NOT NULL,
    pbc_cnam                       VARCHAR2(60) NOT NULL,
    pbc_cid                        NUMBER(*,0),
    pbc_labl                       VARCHAR2(254),
    pbc_lpos                       NUMBER(*,0),
    pbc_hdr                        VARCHAR2(254),
    pbc_hpos                       NUMBER(*,0),
    pbc_jtfy                       NUMBER(*,0),
    pbc_mask                       VARCHAR2(61),
    pbc_case                       NUMBER(*,0),
    pbc_hght                       NUMBER(*,0),
    pbc_wdth                       NUMBER(*,0),
    pbc_ptrn                       VARCHAR2(61),
    pbc_bmap                       CHAR(1),
    pbc_init                       VARCHAR2(254),
    pbc_cmnt                       VARCHAR2(254),
    pbc_edit                       VARCHAR2(61),
    pbc_tag                        VARCHAR2(254))
  NOPARALLEL
  LOGGING
  MONITORING
/

GRANT DELETE ON pbcatcol TO public
/
GRANT INSERT ON pbcatcol TO public
/
GRANT SELECT ON pbcatcol TO public
/
GRANT UPDATE ON pbcatcol TO public
/



CREATE UNIQUE INDEX pbsyscatcoldict_idx ON pbcatcol
  (
    pbc_tnam                        ASC,
    pbc_ownr                        ASC,
    pbc_cnam                        ASC
  )
NOPARALLEL
LOGGING
/


CREATE TABLE pbcatedt
    (pbe_name                       VARCHAR2(60),
    pbe_edit                       VARCHAR2(254),
    pbe_type                       NUMBER(*,0),
    pbe_cntr                       NUMBER(*,0),
    pbe_seqn                       NUMBER(*,0),
    pbe_flag                       NUMBER(*,0),
    pbe_work                       VARCHAR2(32))
  NOPARALLEL
  LOGGING
  MONITORING
/

GRANT DELETE ON pbcatedt TO public
/
GRANT INSERT ON pbcatedt TO public
/
GRANT SELECT ON pbcatedt TO public
/
GRANT UPDATE ON pbcatedt TO public
/



CREATE UNIQUE INDEX pbsyspbe_idx ON pbcatedt
  (
    pbe_name                        ASC,
    pbe_seqn                        ASC
  )
NOPARALLEL
LOGGING
/


CREATE TABLE pbcatfmt
    (pbf_name                       VARCHAR2(60),
    pbf_frmt                       VARCHAR2(254),
    pbf_type                       NUMBER(*,0) NOT NULL,
    pbf_cntr                       NUMBER(*,0))
  NOPARALLEL
  LOGGING
  MONITORING
/

GRANT DELETE ON pbcatfmt TO public
/
GRANT INSERT ON pbcatfmt TO public
/
GRANT SELECT ON pbcatfmt TO public
/
GRANT UPDATE ON pbcatfmt TO public
/



CREATE UNIQUE INDEX pbsyscatfrmts_idx ON pbcatfmt
  (
    pbf_name                        ASC
  )
NOPARALLEL
LOGGING
/


CREATE TABLE pbcattbl
    (pbt_tnam                       VARCHAR2(60) NOT NULL,
    pbt_tid                        NUMBER(*,0),
    pbt_ownr                       VARCHAR2(60) NOT NULL,
    pbd_fhgt                       NUMBER(*,0),
    pbd_fwgt                       NUMBER(*,0),
    pbd_fitl                       CHAR(1),
    pbd_funl                       CHAR(1),
    pbd_fchr                       NUMBER(*,0),
    pbd_fptc                       NUMBER(*,0),
    pbd_ffce                       VARCHAR2(36),
    pbh_fhgt                       NUMBER(*,0),
    pbh_fwgt                       NUMBER(*,0),
    pbh_fitl                       CHAR(1),
    pbh_funl                       CHAR(1),
    pbh_fchr                       NUMBER(*,0),
    pbh_fptc                       NUMBER(*,0),
    pbh_ffce                       VARCHAR2(36),
    pbl_fhgt                       NUMBER(*,0),
    pbl_fwgt                       NUMBER(*,0),
    pbl_fitl                       CHAR(1),
    pbl_funl                       CHAR(1),
    pbl_fchr                       NUMBER(*,0),
    pbl_fptc                       NUMBER(*,0),
    pbl_ffce                       VARCHAR2(36),
    pbt_cmnt                       VARCHAR2(254))
  NOPARALLEL
  LOGGING
  MONITORING
/

GRANT DELETE ON pbcattbl TO public
/
GRANT INSERT ON pbcattbl TO public
/
GRANT SELECT ON pbcattbl TO public
/
GRANT UPDATE ON pbcattbl TO public
/



CREATE UNIQUE INDEX pbsyscatpbt_idx ON pbcattbl
  (
    pbt_tnam                        ASC,
    pbt_ownr                        ASC
  )
NOPARALLEL
LOGGING
/


CREATE TABLE pbcatvld
    (pbv_name                       VARCHAR2(60),
    pbv_vald                       VARCHAR2(254),
    pbv_type                       NUMBER(*,0),
    pbv_cntr                       NUMBER(*,0),
    pbv_msg                        VARCHAR2(254))
  NOPARALLEL
  LOGGING
  MONITORING
/

GRANT DELETE ON pbcatvld TO public
/
GRANT INSERT ON pbcatvld TO public
/
GRANT SELECT ON pbcatvld TO public
/
GRANT UPDATE ON pbcatvld TO public
/



CREATE UNIQUE INDEX pbsyscatvlds_idx ON pbcatvld
  (
    pbv_name                        ASC
  )
NOPARALLEL
LOGGING
/


CREATE TABLE pharmacies
    (pharmacy_i_id                  NUMBER(2,0) ,
    pharmacy_c_desc                VARCHAR2(250),
    store_i_id                     NUMBER(2,0) ,
    store_c_main                   VARCHAR2(1)
  ,
  PRIMARY KEY (pharmacy_i_id, store_i_id))
  ORGANIZATION INDEX
   PCTTHRESHOLD 50 
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE pharmacies_users
    (pharmacy_i_id                  NUMBER(2,0) ,
    user_c_name                    VARCHAR2(250) 
  ,
  PRIMARY KEY (pharmacy_i_id, user_c_name))
  ORGANIZATION INDEX
   PCTTHRESHOLD 50 
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE products
    (systemid                       NUMBER(32,0),
    product_i_id                   NUMBER(32,0),
    product_c_desc                 VARCHAR2(250),
    unit_i_id                      NUMBER(10,0),
    class_i_id                     NUMBER(32,0),
    category_i_id                  NUMBER(16,0),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10),
    products_c_sts                 VARCHAR2(10) DEFAULT 'Active',
    product_c_code                 VARCHAR2(100) NOT NULL,
    min_i_quantity                 NUMBER(10,0) DEFAULT 0,
    max_i_quantity                 NUMBER(10,0) DEFAULT 0,
    actor_i_id                     NUMBER(10,0),
    expiry_i_limit                 NUMBER(3,0),
    manufacture_i_id               NUMBER(32,0))
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE products
ADD CONSTRAINT un_product_c_code UNIQUE (product_c_code)
USING INDEX
/

CREATE TABLE products_prices
    (systemid                       NUMBER(32,0) ,
    product_i_id                   NUMBER(16,0),
    product_i_price                NUMBER(10,2),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10)
  ,
  CONSTRAINT PK_PRODUCTS_PRICES
  PRIMARY KEY (systemid)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE products_prices
ADD CONSTRAINT unq_products_prices UNIQUE (product_i_id, product_i_price, 
  entry_d_date)
USING INDEX
/

CREATE TABLE products_pricese
    (systemid                       NUMBER(32,0) ,
    product_i_id                   NUMBER(16,0),
    product_i_price                NUMBER(10,0),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10)
  ,
  CONSTRAINT PK_PRODUCTS_PRICESE
  PRIMARY KEY (systemid)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE products_pricese
ADD CONSTRAINT unq_products_pricese UNIQUE (product_i_id, product_i_price, 
  entry_d_date)
USING INDEX
/

ALTER TABLE products_pricese
ADD CONSTRAINT uk_products_date UNIQUE (product_i_id, entry_d_date)
USING INDEX
/

CREATE TABLE productstemp
    (systemid                       NUMBER(32,0) ,
    product_i_id                   NUMBER(32,0),
    product_c_desc                 VARCHAR2(250),
    unit_i_id                      NUMBER(10,0),
    class_i_id                     NUMBER(32,0),
    category_i_id                  NUMBER(16,0),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10),
    products_c_sts                 VARCHAR2(10),
    product_c_code                 VARCHAR2(100),
    min_i_quantity                 NUMBER(10,0),
    max_i_quantity                 NUMBER(10,0),
    actor_i_id                     NUMBER(10,0),
    expiry_i_limit                 NUMBER(3,0)
  ,
  CONSTRAINT PK_PRODUCTTEMP
  PRIMARY KEY (systemid)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE profile
    (id                             VARCHAR2(1) NOT NULL,
    name                           VARCHAR2(50) NOT NULL,
    comments                       VARCHAR2(30),
    address                        VARCHAR2(99),
    phone                          VARCHAR2(99),
    english_name                   VARCHAR2(40),
    email                          VARCHAR2(99)
  ,
  PRIMARY KEY (id, name)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE project_mast
    (project_c_code                 VARCHAR2(10) NOT NULL,
    project_c_desc                 VARCHAR2(100) NOT NULL,
    start_d_date                   DATE NOT NULL,
    end_d_date                     DATE NOT NULL,
    project_c_details              VARCHAR2(250)
  ,
  PRIMARY KEY (project_c_code)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE purposes
    (systemid                       NUMBER(32,0) ,
    puprose_i_id                   NUMBER(16,0),
    purpose_c_desc                 VARCHAR2(50),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10)
  ,
  CONSTRAINT PK_PURPOSES
  PRIMARY KEY (systemid)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE purposes
ADD CONSTRAINT unq_purposes UNIQUE (puprose_i_id)
USING INDEX
/

CREATE TABLE rep_att_temp
    (emp_no                         NUMBER(10,0),
    emp_name                       VARCHAR2(40),
    work_date                      DATE,
    timein                         VARCHAR2(20),
    timeout                        VARCHAR2(20),
    in_delay                       NUMBER,
    out_delay                      NUMBER,
    in_bonus                       NUMBER,
    out_bonus                      NUMBER,
    perm_min                       NUMBER,
    within_day                     NUMBER DEFAULT 0)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE rep_att_temp_temp
    (emp_no                         NUMBER(10,0),
    emp_name                       VARCHAR2(40),
    work_date                      DATE,
    timein                         VARCHAR2(20),
    timeout                        VARCHAR2(20),
    in_delay                       NUMBER,
    out_delay                      NUMBER,
    in_bonus                       NUMBER,
    out_bonus                      NUMBER,
    perm_min                       NUMBER,
    within_day                     NUMBER)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE reports_temp
    (id                             VARCHAR2(25),
    c1                             VARCHAR2(64),
    c2                             VARCHAR2(32),
    c3                             DATE,
    c4                             NUMBER,
    c5                             NUMBER,
    c6                             NUMBER,
    c7                             NUMBER,
    c8                             VARCHAR2(32))
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE room_bills
    (systemid                       NUMBER(32,0) ,
    customer_id                    NUMBER(32,0),
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
    contractor_id                  NUMBER(32,0),
    card_id                        VARCHAR2(32),
    contract_class                 VARCHAR2(32),
    card_issue_date                DATE,
    card_end_date                  DATE,
    operation_type                 VARCHAR2(99),
    doctor1                        NUMBER(32,0),
    doctor2                        NUMBER(32,0),
    exit_date                      DATE
  ,
  CONSTRAINT PK_ROOM_BILLS
  PRIMARY KEY (systemid)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE room_bills_details
    (systemid                       NUMBER(32,0),
    room_c_id                      NUMBER(32,0),
    service                        NUMBER(32,0),
    quantity                       NUMBER(32,2),
    price                          NUMBER(32,2),
    limit                          NUMBER(32,2),
    deduct                         NUMBER(32,2),
    diffrent                       NUMBER(32,2),
    total                          NUMBER(32,2))
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
    entered_by                     VARCHAR2(10)
  ,
  CONSTRAINT PK_ROOM_RECORDS
  PRIMARY KEY (systemid)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE room_swap_log
    (room_bill                      NUMBER(32,0),
    old_rrom_id                    NUMBER(32,0),
    old_bed_id                     NUMBER(32,0),
    new_room                       NUMBER(32,0),
    new_bed                        NUMBER(32,0),
    entered_by                     VARCHAR2(32),
    entery_date                    DATE)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE room_transactions
    (systemid                       NUMBER(32,0) ,
    room_bill_id                   NUMBER(32,0),
    room_c_id                      NUMBER(32,0),
    service                        VARCHAR2(32),
    amount                         NUMBER(32,2),
    days                           NUMBER(32,0),
    entery_date                    DATE,
    entered_by                     VARCHAR2(10),
    pass_by                        VARCHAR2(10),
    from_date                      DATE,
    to_date                        DATE,
    bed_c_id                       NUMBER(32,0),
    price                          NUMBER(32,2),
    tran_sts                       VARCHAR2(3)
  ,
  CONSTRAINT PK_ROOM_TRANSACTIONS
  PRIMARY KEY (systemid)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE room_type
    (systemid                       NUMBER(32,0) ,
    room_c_type                    VARCHAR2(10),
    room_c_description             VARCHAR2(250)
  ,
  CONSTRAINT PK_ROOM_TYPE
  PRIMARY KEY (systemid)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE room_type
ADD CONSTRAINT unq_room_type UNIQUE (systemid, room_c_type)
USING INDEX
/

CREATE TABLE sqln_explain_plan
    (statement_id                   VARCHAR2(30),
    timestamp                      DATE,
    remarks                        VARCHAR2(80),
    operation                      VARCHAR2(30),
    options                        VARCHAR2(30),
    object_node                    VARCHAR2(128),
    object_owner                   VARCHAR2(30),
    object_name                    VARCHAR2(30),
    object_instance                NUMBER(*,0),
    object_type                    VARCHAR2(30),
    optimizer                      VARCHAR2(255),
    search_columns                 NUMBER(*,0),
    id                             NUMBER(*,0),
    parent_id                      NUMBER(*,0),
    position                       NUMBER(*,0),
    cost                           NUMBER(*,0),
    cardinality                    NUMBER(*,0),
    bytes                          NUMBER(*,0),
    other_tag                      VARCHAR2(255),
    partition_start                VARCHAR2(255),
    partition_stop                 VARCHAR2(255),
    partition_id                   NUMBER(*,0),
    other                          LONG,
    distribution                   VARCHAR2(30))
  NOPARALLEL
  LOGGING
  MONITORING
/

GRANT DELETE ON sqln_explain_plan TO public
/
GRANT INSERT ON sqln_explain_plan TO public
/
GRANT SELECT ON sqln_explain_plan TO public
/
GRANT UPDATE ON sqln_explain_plan TO public
/



CREATE TABLE status_mast
    (statusid                       NUMBER NOT NULL,
    statusdesc                     VARCHAR2(50) NOT NULL,
    statusdesc_ar                  VARCHAR2(50) NOT NULL)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE stocks
    (systemid                       NUMBER(32,0),
    product_i_id                   NUMBER(16,0) ,
    quantity                       NUMBER(32,0),
    store_i_id                     NUMBER(10,0) 
  ,
  CONSTRAINT PK_STOCKS
  PRIMARY KEY (product_i_id, store_i_id)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE stocks
ADD CONSTRAINT chk_stock_amt CHECK (
   quantity >= 0
)
/

CREATE TABLE stores
    (store_i_id                     NUMBER(2,0) ,
    store_c_desc                   VARCHAR2(250)
  ,
  PRIMARY KEY (store_i_id))
  ORGANIZATION INDEX
   PCTTHRESHOLD 50 
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE system_flag
    (flag_code                      VARCHAR2(50) NOT NULL,
    flag_desc                      VARCHAR2(250) NOT NULL,
    flag_value                     VARCHAR2(10) NOT NULL
  ,
  CONSTRAINT PK_SYSTEM_FLAG
  PRIMARY KEY (flag_code)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE system_menus
    (systemid                       NUMBER(32,0),
    module_c_name                  VARCHAR2(20),
    menu_name                      VARCHAR2(30),
    menu_c_text                    VARCHAR2(30) NOT NULL)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE testbaha
    (id                             NUMBER(2,0))
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE units
    (systemid                       NUMBER(32,0) ,
    unit_i_id                      NUMBER(10,0),
    unit_c_desc                    VARCHAR2(50),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10),
    unit_i_class                   NUMBER(32,0) NOT NULL
  ,
  CONSTRAINT PK_UNITS
  PRIMARY KEY (systemid)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




ALTER TABLE units
ADD CONSTRAINT unq_units UNIQUE (unit_i_id)
USING INDEX
/

COMMENT ON COLUMN units.unit_i_class IS '1=Doctors,2=Lab,3=X-ray,4=medicine'
/
CREATE TABLE user_messages
    (msg_c_id                       VARCHAR2(10) NOT NULL,
    msg_c_desc                     VARCHAR2(250),
    msg_c_severity                 CHAR(1),
    msg_c_foreign                  VARCHAR2(300)
  ,
  CONSTRAINT PK_USER_MESSAGES
  PRIMARY KEY (msg_c_id)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE users_permissions
    (login_name                     VARCHAR2(20) NOT NULL,
    application                    VARCHAR2(20) NOT NULL,
    item_type                      VARCHAR2(10) NOT NULL,
    item_name                      VARCHAR2(50) NOT NULL,
    priviledge                     CHAR(1),
    module_c_name                  VARCHAR2(20) NOT NULL)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE users_permissions_backup
    (login_name                     VARCHAR2(20) NOT NULL,
    application                    VARCHAR2(20) NOT NULL,
    item_type                      VARCHAR2(10) NOT NULL,
    item_name                      VARCHAR2(50) NOT NULL,
    priviledge                     CHAR(1),
    module_c_name                  VARCHAR2(20) NOT NULL)
  NOPARALLEL
  LOGGING
  MONITORING
/




CREATE TABLE vendors_products
    (systemid                       NUMBER(32,0) ,
    vendor_i_id                    NUMBER(16,0),
    product_i_id                   NUMBER(16,0),
    entry_d_date                   DATE,
    entered_c_by                   VARCHAR2(10)
  ,
  CONSTRAINT PK_VENDORS_PRODUCTS
  PRIMARY KEY (systemid)
  USING INDEX)
  NOPARALLEL
  LOGGING
  MONITORING
/




