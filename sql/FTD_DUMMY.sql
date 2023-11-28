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
                 , '테스트'
                 , 'user01@gmail.com'
                 , '010-1234-5678'
                 , '서울시'
                 , 'M');
                 
COMMIT;

		   