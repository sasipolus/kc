DECLARE temp NUMBER;
BEGIN
        SELECT COUNT(*) INTO temp FROM user_tables WHERE table_name = 'FIN_OBJECT_CODE_MAPPING';
        IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP TABLE FIN_OBJECT_CODE_MAPPING CASCADE CONSTRAINTS PURGE'; END IF;
END;
/

CREATE TABLE FIN_OBJECT_CODE_MAPPING 
  ( 
    FIN_OBJECT_CODE varchar2(10) not null,
    RATE_TYPE_CODE varchar2(3) not null,
    OBJ_ID VARCHAR2(36),
    UNIT_NUMBER VARCHAR2(8) not null,
    RATE_CLASS_CODE VARCHAR2(3) not null,
    ACTIVITY_TYPE_CODE VARCHAR2(3),
    MAPPING_ID NUMBER(12, 0)
  )
/

