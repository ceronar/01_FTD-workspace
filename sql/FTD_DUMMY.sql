INSERT INTO MEMBER(MEMBER_NO
                 , MEMBER_ID
                 , MEMBER_PWD
                 , MEMBER_NAME
                 , EMAIL
                 , PHONE
                 , ADDRESS
                 , GENDER)
            VALUES(SEQ_MNO.NEXTVAL
                 , 'user01'
                 , 'pass01'
                 , 'ȫ�浿'
                 , 'user01@gmail.com'
                 , '010-1234-5678'
                 , '����� ��������'
                 , 'M');
                 
INSERT INTO SELLER(SELLER_NO
                 , COMPANY_NAME
                 , SELLER_ID
                 , SELLER_PWD
                 , SELLER_NAME
                 , COMPANY_NO
                 , BUSINESS_NO
                 , ADDRESS
                 , EMAIL
                 , PHONE
                 , ACCOUNT_NO
                 , DELETE_DATE
                 , ENROLL_DATE
                 , ACCEPT_DATE
                 , REFUSE_REASON)
            VALUES(SEQ_SNO.NEXTVAL
                 , '��¦���'
                 , 'user01'
                 , 'pass01'
                 , 'ȫ�浿'
                 , '111-222-3333'
                 , '�����-1111ȣ'
                 , '����� ��������'
                 , 'user01@gmail.com'
                 , '010-1234-5678'
                 , '111-111111-11-111'
                 , DEFAULT
                 , DEFAULT
                 , DEFAULT
                 , '�������');
                 
INSERT INTO INQUIRY(INQ_NO
                  , SELLER_NO
                  , MEMBER_NO
                  , INQ_TITLE
                  , INQ_CONTENT
                  , COUNT
                  , CREATE_DATE
                  , DELETE_DATE
                  , RESPONSE_CONTENT
                  , RESPONSE_DATE)
            VALUES(SEQ_INO.NEXTVAL
                 , 1
                 , 1
                 , '��������'
                 , '���ǳ���'
                 , 1
                 , DEFAULT
                 , DEFAULT
                 , DEFAULT
                 , DEFAULT);
                 

INSERT INTO NOTICE(NOTICE_NO
                 , NOTICE_TITLE
                 , NOTICE_CONTENT
                 , COUNT
                 , CREATE_DATE
                 , DELETE_DATE)
           VALUES(SEQ_NNO.NEXTVAL
                , '[��������] ����'
                , '���������� ����'
                , DEFAULT
                , DEFAULT
                , DEFAULT);

INSERT INTO SELLER(SELLER_NO,COMPANY_NAME,SELLER_ID,SELLER_PWD,SELLER_NAME,COMPANY_NO,BUSINESS_NO,ADDRESS,EMAIL,PHONE,ACCOUNT_NO,ACCEPT_DATE)
            VALUES(SEQ_SNO.NEXTVAL,'�����ڳ�','admin','$2a$10$TzwJY6QWPUor0dgui.eDo.jrTxrTeF/SokITU2rzIE8NPjFL2F3V2','������','123-12-12344','1999-����Ư����-1234','����Ư���� �������� �ű浿','admin@iei.kr','010-1234-1234','111-2222-3333-45',SYSDATE);


COMMIT;

		   