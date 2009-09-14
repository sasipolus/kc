-- Table Script 
CREATE TABLE PROPOSAL ( 
    PROPOSAL_ID NUMBER(12,0) NOT NULL, 
    PROPOSAL_NUMBER VARCHAR2(8) NOT NULL,
    DOCUMENT_NUMBER VARCHAR2(10) NOT NULL,
    PROPOSAL_SEQUENCE_STATUS varchar2 (10) NOT NULL,
    FISCAL_MONTH VARCHAR2(2),
  	FISCAL_YEAR VARCHAR2(4), 
    SPONSOR_PROPOSAL_NUMBER VARCHAR2(70), 
    SEQUENCE_NUMBER NUMBER(4,0) NOT NULL, 
    PROPOSAL_TYPE_CODE VARCHAR2(3) NOT NULL, 
    CURRENT_ACCOUNT_NUMBER CHAR(7), 
    TITLE VARCHAR2(200) NOT NULL, 
    SPONSOR_CODE CHAR(6) NOT NULL, 
    ROLODEX_ID NUMBER(6,0), 
    NOTICE_OF_OPPORTUNITY_CODE VARCHAR2(3), 
    GRAD_STUD_HEADCOUNT NUMBER(3,0), 
    GRAD_STUD_PERSON_MONTHS NUMBER(5,2), 
    TYPE_OF_ACCOUNT CHAR(1), 
    ACTIVITY_TYPE_CODE VARCHAR2(3) NOT NULL, 
    REQUESTED_START_DATE_INITIAL DATE, 
    REQUESTED_START_DATE_TOTAL DATE, 
    REQUESTED_END_DATE_INITIAL DATE, 
    REQUESTED_END_DATE_TOTAL DATE, 
    TOTAL_DIRECT_COST_INITIAL NUMBER(12,2), 
    TOTAL_DIRECT_COST_TOTAL NUMBER(12,2), 
    TOTAL_INDIRECT_COST_INITIAL NUMBER(12,2), 
    TOTAL_INDIRECT_COST_TOTAL NUMBER(12,2), 
    NUMBER_OF_COPIES VARCHAR2(7), 
    DEADLINE_DATE DATE, 
    DEADLINE_TYPE CHAR(1), 
    MAIL_BY CHAR(1), 
    MAIL_TYPE CHAR(1), 
    MAIL_ACCOUNT_NUMBER CHAR(7),
    MAIL_DESCRIPTION VARCHAR2(80), 
    SUBCONTRACT_FLAG CHAR(1) NOT NULL, 
    COST_SHARING_INDICATOR CHAR(2) NOT NULL, 
    IDC_RATE_INDICATOR CHAR(2) NOT NULL, 
    SPECIAL_REVIEW_INDICATOR CHAR(2) NOT NULL, 
    STATUS_CODE NUMBER(3,0) NOT NULL, 
    SCIENCE_CODE_INDICATOR CHAR(2) NOT NULL, 
    NSF_CODE VARCHAR2(15), 
    PRIME_SPONSOR_CODE CHAR(6), 
    INITIAL_CONTRACT_ADMIN VARCHAR2(9), 
    IP_REVIEW_ACTIVITY_INDICATOR CHAR(2) NOT NULL, 
    CURRENT_AWARD_NUMBER CHAR(10), 
    CFDA_NUMBER VARCHAR2(7), 
    OPPORTUNITY VARCHAR2(50),
    CREATE_TIMESTAMP DATE, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    AWARD_TYPE_CODE NUMBER(3,0), 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);


-- Primary Key Constraint 
ALTER TABLE PROPOSAL 
ADD CONSTRAINT PK_PROPOSAL 
PRIMARY KEY (PROPOSAL_ID);

-- *************** UNIQUE CONSTRAINT DEFINED FOR COMPOSITE KEY COLUMNS ************ 
ALTER TABLE PROPOSAL 
ADD CONSTRAINT UQ_PROPOSAL 
UNIQUE (PROPOSAL_NUMBER, SEQUENCE_NUMBER);

