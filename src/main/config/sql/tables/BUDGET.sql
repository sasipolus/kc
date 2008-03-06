CREATE TABLE BUDGET 
   (	"PROPOSAL_NUMBER" NUMBER(12,0) constraint BUDGETN1 NOT NULL ENABLE, 
	"VERSION_NUMBER" NUMBER(3,0) constraint BUDGETN2 NOT NULL ENABLE, 
    "DOCUMENT_NUMBER"	NUMBER(10,0) constraint BUDGETN3 not null,
	"START_DATE" DATE constraint BUDGETN4 NOT NULL ENABLE, 
	"END_DATE" DATE constraint BUDGETN5 NOT NULL ENABLE, 
	"TOTAL_COST" NUMBER(12,2), 
	"TOTAL_DIRECT_COST" NUMBER(12,2), 
	"TOTAL_INDIRECT_COST" NUMBER(12,2), 
	"COST_SHARING_AMOUNT" NUMBER(12,2), 
	"UNDERRECOVERY_AMOUNT" NUMBER(12,2), 
	"RESIDUAL_FUNDS" NUMBER(12,2), 
	"TOTAL_COST_LIMIT" NUMBER(12,2), 
	"OH_RATE_CLASS_CODE" NUMBER(3,0) constraint BUDGETN6 NOT NULL ENABLE, 
	"OH_RATE_TYPE_CODE" NUMBER(3,0), 
	"COMMENTS" LONG, 
	"FINAL_VERSION_FLAG" CHAR(1), 
	"UPDATE_TIMESTAMP" DATE constraint BUDGETN7 NOT NULL ENABLE, 
	"UPDATE_USER" VARCHAR2(8) constraint BUDGET87 NOT NULL ENABLE, 
	"UR_RATE_CLASS_CODE" NUMBER(3,0) DEFAULT 1 constraint BUDGETN9 NOT NULL ENABLE, 
	"MODULAR_BUDGET_FLAG" VARCHAR2(1) DEFAULT 'N' constraint BUDGETN10 NOT NULL ENABLE, 
	 "VER_NBR" NUMBER(8,0) DEFAULT 1  constraint  BUDGETN11  NOT NULL ENABLE,
	"OBJ_ID" VARCHAR2(36) DEFAULT SYS_GUID()  constraint  BUDGETN12  NOT NULL ENABLE,
	CONSTRAINT "PK_BUDGET_KRA" PRIMARY KEY ("PROPOSAL_NUMBER", "VERSION_NUMBER") ENABLE
)
/

ALTER TABLE BUDGET ADD (CONSTRAINT "FK_BUDGET_KRA" FOREIGN KEY ("PROPOSAL_NUMBER")
	  REFERENCES "EPS_PROPOSAL" ("PROPOSAL_NUMBER") ) 
/ 
ALTER table BUDGET modify RATE_CLASS_CODE VARCHAR2(3)
/
ALTER table BUDGET modify RATE_TYPE_CODE VARCHAR2(3)
/
 ALTER TABLE BUDGET ADD (CONSTRAINT "FK_BUDGET_RATE_TYPE_KRA" FOREIGN KEY ("OH_RATE_CLASS_CODE", "OH_RATE_TYPE_CODE")
	  REFERENCES "RATE_TYPE" ("RATE_CLASS_CODE", "RATE_TYPE_CODE") )
/
