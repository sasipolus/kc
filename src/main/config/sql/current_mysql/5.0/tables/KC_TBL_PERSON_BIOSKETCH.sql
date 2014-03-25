DELIMITER /
CREATE TABLE PERSON_BIOSKETCH (
    PERSON_BIOSKETCH_ID   DECIMAL(8) NOT NULL,
    PERSON_ID             DECIMAL(22) NOT NULL,
    DESCRIPTION           VARCHAR(4000),
    FILE_NAME             VARCHAR(300),
    CONTENT_TYPE          VARCHAR(255),
    ATTACHMENT_FILE       BLOB,
    UPDATE_USER           VARCHAR(60) NOT NULL,
    UPDATE_TIMESTAMP      DATE NOT NULL,
    OBJ_ID                VARCHAR(36) NOT NULL,
    VER_NBR               DECIMAL(8) DEFAULT 1 NOT NULL
) ENGINE InnoDB CHARACTER SET utf8 COLLATE utf8_bin
/
ALTER TABLE PERSON_BIOSKETCH ADD CONSTRAINT PK_PERSON_BIOSKETCH
    PRIMARY KEY (PERSON_BIOSKETCH_ID)
/
DROP PROCEDURE IF EXISTS p
/
CREATE PROCEDURE p ()
BEGIN
    DECLARE personId VARCHAR(40);
    DECLARE attachmentDescription VARCHAR(4000);
    DECLARE attachmentFileName VARCHAR(300);
    DECLARE attachmentContentType VARCHAR(255);
    DECLARE attachmentFile LONGTEXT;
    DECLARE updateUser VARCHAR(60);
    DECLARE updateTimestamp DATE;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT PERSON_ID, BIOSKETCH_DESCRIPTION, BIOSKETCH_FILENAME, BIOSKETCH_FILE, BIOSKETCH_FILE_CONTENT_TYPE, UPDATE_USER, UPDATE_TIMESTAMP FROM PERSON_EXT_T;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    insert_loop: LOOP
        FETCH cur INTO personId, attachmentDescription, attachmentFileName, attachmentFile, attachmentContentType, updateUser, updateTimestamp;
        IF done THEN
            LEAVE insert_loop;
        END IF;
        
        IF attachmentDescription IS NOT NULL OR attachmentFileName IS NOT NULL THEN
            INSERT INTO SEQ_PERSON_BIOSKETCH_ID VALUES (null);
            INSERT INTO PERSON_BIOSKETCH (PERSON_BIOSKETCH_ID,PERSON_ID,DESCRIPTION,FILE_NAME,CONTENT_TYPE,ATTACHMENT_FILE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) VALUES ((SELECT (MAX(ID)) FROM SEQ_PERSON_BIOSKETCH_ID),personId,attachmentDescription,attachmentFileName,attachmentContentType,attachmentFile,updateUser,updateTimestamp,UUID(),1);
        END IF;
    END LOOP;
    
    CLOSE cur;
END;
/
CALL p ()
/
DROP PROCEDURE IF EXISTS p
/

ALTER TABLE PERSON_EXT_T DROP BIOSKETCH_DESCRIPTION, DROP BIOSKETCH_FILENAME, DROP BIOSKETCH_FILE_CONTENT_TYPE, DROP BIOSKETCH_FILE
/
DELIMITER ;