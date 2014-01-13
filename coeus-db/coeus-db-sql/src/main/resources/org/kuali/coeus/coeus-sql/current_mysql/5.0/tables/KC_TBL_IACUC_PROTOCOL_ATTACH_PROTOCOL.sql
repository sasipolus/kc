DELIMITER /
CREATE TABLE IACUC_PROTOCOL_ATTACH_PROTOCOL (
    PA_PROTOCOL_ID          DECIMAL(12,0) NOT NULL,
    PROTOCOL_ID_FK          DECIMAL(12,0) NOT NULL,
    PROTOCOL_NUMBER         VARCHAR(20) NOT NULL,
    SEQUENCE_NUMBER         DECIMAL(4,0) DEFAULT 1 NOT NULL,
    TYPE_CD                 VARCHAR(3) NOT NULL,
    DOCUMENT_ID             DECIMAL(4,0) NOT NULL,
    FILE_ID                 DECIMAL(22,0) NOT NULL,
    DESCRIPTION             VARCHAR(200) NOT NULL,
    STATUS_CD               VARCHAR(3) NULL,
    CONTACT_NAME            VARCHAR(30) NULL,
    EMAIL_ADDRESS           VARCHAR(60) NULL,
    PHONE_NUMBER            VARCHAR(20) NULL,
    COMMENTS                VARCHAR(300) NULL,
    UPDATE_TIMESTAMP        DATE NOT NULL, 
    UPDATE_USER             VARCHAR(60) NOT NULL, 
    VER_NBR                 DECIMAL(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID                  VARCHAR(36) NOT NULL,
    DOCUMENT_STATUS_CODE    VARCHAR(3) NULL,
    CREATE_TIMESTAMP        DATE NOT NULL,
    ATTACHMENT_VERSION      DECIMAL(4,0) NULL
) ENGINE InnoDB CHARACTER SET utf8 COLLATE utf8_bin
/

ALTER TABLE IACUC_PROTOCOL_ATTACH_PROTOCOL 
ADD CONSTRAINT PK_IACUC_PROTO_ATTACH_PROTO
PRIMARY KEY (PA_PROTOCOL_ID) 
/
DELIMITER ;