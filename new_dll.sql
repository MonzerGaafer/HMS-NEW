CREATE TABLE room_type
    (systemid                       NUMBER(32,0) ,
    room_c_type                   VARCHAR2(10),
   room_c_description                VARCHAR2(250) 
    )
  NOPARALLEL
  LOGGING
  MONITORING
/

ALTER TABLE room_type
ADD CONSTRAINT pk_room_type PRIMARY KEY (systemid)
USING INDEX
/

ALTER TABLE room_type
ADD CONSTRAINT unq_room_type UNIQUE (systemid,room_c_type)
USING INDEX
/


CREATE TABLE room_records
    (systemid                       NUMBER(32,0) ,
    room_c_type                   VARCHAR2(10),
    room_c_description                VARCHAR2(250),
    Beds                           NUMBER(32,0),
    room_c_status                  VARCHAR2(10),
    Entery_date                     date,
    Entered_by                      VARCHAR2(10)
    )
  NOPARALLEL
  LOGGING
  MONITORING
/

ALTER TABLE room_records
ADD CONSTRAINT pk_room_records PRIMARY KEY (systemid)
USING INDEX
/


CREATE TABLE bed_inventory
    (systemid                       NUMBER(32,0) ,
    room_c_id                   NUMBER(32,0),
    Bed_c_id                      NUMBER(32,0),
    bed_c_status                  VARCHAR2(10),
    price                          NUMBER(32,2),
    Entery_date                     date,
    Entered_by                      VARCHAR2(10)
    )
  NOPARALLEL
  LOGGING
  MONITORING
/
/*
the systemId should tacke the same value of room_c_id  for  relation purpose .

*/

ALTER TABLE bed_inventory
ADD CONSTRAINT unq_bed_inventory UNIQUE (systemid,room_c_id,Bed_c_id)
USING INDEX
/


CREATE TABLE room_bills
    (systemid                       NUMBER(32,0) ,
    customer_id                     NUMBER(10,0) ,
    room_c_id                   NUMBER(32,0),
    Bed_c_id                      NUMBER(32,0),
    total_amount                  NUMBER(32,2),
    paid_amount                    NUMBER(32,2),
    bill_c_status                  VARCHAR2(10),
    price                          NUMBER(32,2),
    Entery_date                     date,
    Entered_by                      VARCHAR2(10),
    pass_by                      VARCHAR2(10) 
    )
  NOPARALLEL
  LOGGING
  MONITORING
/


ALTER TABLE room_bills
ADD CONSTRAINT pk_room_bills PRIMARY KEY (systemid)
USING INDEX
/


CREATE TABLE room_bills_details
    (systemid                       NUMBER(32,0) ,
    Days                     NUMBER(10,0) ,
    room_c_id                   NUMBER(32,0),
    service                     VARCHAR2(10),
    price                   NUMBER(32,2),
    room_price              NUMBER(32,2),
    Entery_date                     date,
    Entered_by                      VARCHAR2(10),
    pass_by                      VARCHAR2(10) 
    )
  NOPARALLEL
  LOGGING
  MONITORING
/



CREATE TABLE room_transactions
    (systemid                        NUMBER(32,0) ,
    room_bill_id                     NUMBER(32,0) ,
    room_c_id                        NUMBER(32,0),
    service                          VARCHAR2(10),
    price                            NUMBER(32,2),
    days                             NUMBER(32,0),
    Entery_date                      date,
    Entered_by                       VARCHAR2(10),
    pass_by                          VARCHAR2(10) 
    )
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
    card_end_date                  DATE,
    operation_type                 VARCHAR2(99),
    doctor1                        VARCHAR2(99),
    doctor2                        VARCHAR2(99))
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
    class_c_id                     NUMBER)
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
    window_name                    VARCHAR2(50) NOT NULL,
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
