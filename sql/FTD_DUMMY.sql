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

COMMIT;

		   