CREATE TABLE UNIT_CORRESPONDENT ( 
    UNIT_CORRESPONDENT_ID NUMBER(12,0) NOT NULL, 
    UNIT_NUMBER VARCHAR2(8) NOT NULL, 
    CORRESPONDENT_TYPE_CODE NUMBER(3,0) NOT NULL, 
    PERSON_ID VARCHAR2(40) NULL,
    PERSON_NAME VARCHAR2(90) NOT NULL, 
    NON_EMPLOYEE_FLAG VARCHAR2(1) NOT NULL, 
    DESCRIPTION VARCHAR2(2000), 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL)
/
ALTER TABLE UNIT_CORRESPONDENT 
ADD CONSTRAINT PK_UNIT_CORRESPONDENT 
PRIMARY KEY (UNIT_CORRESPONDENT_ID)
/

