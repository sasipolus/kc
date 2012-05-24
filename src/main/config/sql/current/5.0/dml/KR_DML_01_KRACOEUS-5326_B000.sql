INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
	VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, SYS_GUID(), 1,
        (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Modifier' and NMSPC_CD = 'KC-AWARD'),
        (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Open Proposal Log' and NMSPC_CD = 'KC-IP'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
	VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, SYS_GUID(), 1,
        (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Modifier' and NMSPC_CD = 'KC-AWARD'),
        (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Submit Proposal Log' and NMSPC_CD = 'KC-IP'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
	VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, SYS_GUID(), 1,
        (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Modifier' and NMSPC_CD = 'KC-AWARD'),
        (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Create Proposal Log' and NMSPC_CD = 'KC-IP'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
	VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, SYS_GUID(), 1,
        (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Modifier' and NMSPC_CD = 'KC-AWARD'),
        (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Edit Institutional Proposal' and NMSPC_CD = 'KC-IP'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
	VALUES (KRIM_ROLE_PERM_ID_BS_S.NEXTVAL, SYS_GUID(), 1,
        (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Modifier' and NMSPC_CD = 'KC-AWARD'),
        (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Save Institutional Proposal' and NMSPC_CD = 'KC-IP'), 'Y')
/