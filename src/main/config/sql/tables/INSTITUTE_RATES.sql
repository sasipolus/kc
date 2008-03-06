 CREATE TABLE INSTITUTE_RATES 
   (	"RATE_CLASS_CODE" VARCHAR2(3) constraint INSTITUTE_RATESN1 NOT NULL ENABLE, 
	"RATE_TYPE_CODE" VARCHAR2(3) constraint INSTITUTE_RATESN2 NOT NULL ENABLE, 
	"ACTIVITY_TYPE_CODE" VARCHAR2(3) constraint INSTITUTE_RATESN3 NOT NULL ENABLE, 
	"FISCAL_YEAR" CHAR(4) constraint INSTITUTE_RATESN4 NOT NULL ENABLE, 
	"START_DATE" DATE constraint INSTITUTE_RATESN5 NOT NULL ENABLE, 
	"ON_OFF_CAMPUS_FLAG" CHAR(1) constraint INSTITUTE_RATESN6 NOT NULL ENABLE, 
	"RATE" NUMBER(5,2) constraint INSTITUTE_RATESN7 NOT NULL ENABLE, 
	"UPDATE_TIMESTAMP" DATE constraint INSTITUTE_RATESN8 NOT NULL ENABLE, 
	"UPDATE_USER" VARCHAR2(8) constraint INSTITUTE_RATESN9 NOT NULL ENABLE, 
	"UNIT_NUMBER" VARCHAR2(8) constraint INSTITUTE_RATESN10 NOT NULL ENABLE, 
	 "VER_NBR" NUMBER(8,0) DEFAULT 1  constraint  INSTITUTE_RATESN11  NOT NULL ENABLE,
	"OBJ_ID" VARCHAR2(36) DEFAULT SYS_GUID()  constraint  INSTITUTE_RATESN12  NOT NULL ENABLE,
	CONSTRAINT "PK_INST_RATES_KRA" PRIMARY KEY ("RATE_CLASS_CODE", "RATE_TYPE_CODE", "ACTIVITY_TYPE_CODE", "FISCAL_YEAR", "START_DATE", "ON_OFF_CAMPUS_FLAG", "UNIT_NUMBER") ENABLE
) ;

 ALTER TABLE INSTITUTE_RATES ADD (CONSTRAINT "FK_INSTITUTE_RATES_KRA" FOREIGN KEY ("RATE_CLASS_CODE", "RATE_TYPE_CODE")
	  REFERENCES "RATE_TYPE" ("RATE_CLASS_CODE", "RATE_TYPE_CODE") ); 
 

 ALTER TABLE INSTITUTE_RATES ADD (CONSTRAINT "FK_INST_RATES_ACTIVITY_KRA" FOREIGN KEY ("ACTIVITY_TYPE_CODE")
	  REFERENCES "ACTIVITY_TYPE" ("ACTIVITY_TYPE_CODE") ); 
 

 ALTER TABLE INSTITUTE_RATES ADD (CONSTRAINT "FK_INST_RATES_UNIT_NUMBER_KRA" FOREIGN KEY ("UNIT_NUMBER")
	  REFERENCES "UNIT" ("UNIT_NUMBER") ) ;

--ALTER table INSTITUTE_RATES modify RATE_CLASS_CODE VARCHAR2(3);
--ALTER table INSTITUTE_RATES modify RATE_TYPE_CODE VARCHAR2(3);
