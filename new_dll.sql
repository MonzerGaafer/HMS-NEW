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


