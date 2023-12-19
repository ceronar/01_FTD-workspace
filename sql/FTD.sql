//==============================================================================
// 계정 생성 및 권한 부여
// CREATE USER FTD IDENTIFIED BY FTD;
// GRANT CONNECT, RESOURCE TO FTD;

//==============================================================================

// 테이블 초기화
DROP TABLE "NOTICE_FILE"; // 공지 파일
DROP TABLE "SELLER_FILE"; // 판매자 파일
DROP TABLE "GOODS_FILE"; // 상품 파일
DROP TABLE "REVIEW_FILE"; // 후기 파일
DROP TABLE "PROMOTION_FILE"; // 홍보 파일
DROP TABLE "INQUIRY_FILE"; // 문의 파일
DROP TABLE "INIQUIRY_FILE"; // 예전 문의 파일

DROP TABLE "SELL_REPLY"; // 상품 판매 댓글
DROP TABLE "PROMOTION_REPLY"; // 홍보 댓글
DROP TABLE "REVIEW_REPLY"; // 후기 댓글
DROP TABLE "INQUIRY_REPLY"; // 문의 댓글
DROP TABLE "INIQUIRY_REPLY"; // 예전 문의 댓글

DROP TABLE "CART"; // 장바구니
DROP TABLE "LIKE"; // 좋아요
DROP TABLE "SUBSCRIBE"; // 찜

DROP TABLE "NOTICE"; // 공지
DROP TABLE "INQUIRY"; // 문의
DROP TABLE "INIQUIRY"; // 예전 문의
DROP TABLE "PROMOTION"; // 홍보
DROP TABLE "REVIEW"; // 후기

DROP TABLE "GOODS_SELL"; // 상품 판매
DROP TABLE "GOODS_ORDER"; // 예전 주문 상품
DROP TABLE "ORDER_GOODS"; // 주문 상품
DROP TABLE "ORDER"; // 주문

DROP TABLE "GOODS"; // 상품
DROP TABLE "SELLER"; // 판매자
DROP TABLE "MEMBER"; // 회원

//==============================================================================
// 테이블 시퀀스 초기화
DROP SEQUENCE SEQ_MNO; // 회원
DROP SEQUENCE SEQ_SNO; // 판매자
DROP SEQUENCE SEQ_GNO; // 상품

DROP SEQUENCE SEQ_ONO; // 주문
DROP SEQUENCE SEQ_GSNO; // 상품 판매
DROP SEQUENCE SEQ_ODNO; // 예전 주문 상품
DROP SEQUENCE SEQ_OGNO; // 주문 상품

DROP SEQUENCE SEQ_NNO; // 공지
DROP SEQUENCE SEQ_INO; // 문의
DROP SEQUENCE SEQ_PNO; // 홍보
DROP SEQUENCE SEQ_RNO; // 후기

DROP SEQUENCE SEQ_CNO; // 장바구니


DROP SEQUENCE SEQ_SRNO; // 상품 판매 댓글
DROP SEQUENCE SEQ_PRNO; // 홍보 댓글
DROP SEQUENCE SEQ_RRNO; // 후기 댓글
DROP SEQUENCE SEQ_IRNO; // 문의 댓글

DROP SEQUENCE SEQ_NFNO; // 공지 파일
DROP SEQUENCE SEQ_SFNO; // 판매자 파일
DROP SEQUENCE SEQ_GFNO; // 상품 파일
DROP SEQUENCE SEQ_RFNO; // 후기 파일
DROP SEQUENCE SEQ_PFNO; // 홍보 파일
DROP SEQUENCE SEQ_IFNO; // 문의 파일

//==============================================================================
// 시퀀스 생성
CREATE SEQUENCE SEQ_MNO; // 회원
CREATE SEQUENCE SEQ_SNO; // 판매자
CREATE SEQUENCE SEQ_GNO; // 상품

CREATE SEQUENCE SEQ_ONO; // 주문
CREATE SEQUENCE SEQ_GSNO; // 상품 판매
// CREATE SEQUENCE SEQ_ODNO; // 주문 상품
CREATE SEQUENCE SEQ_OGNO; // 주문 상품

CREATE SEQUENCE SEQ_NNO; // 공지
CREATE SEQUENCE SEQ_INO; // 문의
CREATE SEQUENCE SEQ_PNO; // 홍보
CREATE SEQUENCE SEQ_RNO; // 후기

CREATE SEQUENCE SEQ_CNO; // 장바구니

CREATE SEQUENCE SEQ_SRNO; // 상품 판매 댓글
CREATE SEQUENCE SEQ_PRNO; // 홍보 댓글
CREATE SEQUENCE SEQ_RRNO; // 후기 댓글
CREATE SEQUENCE SEQ_IRNO; // 문의 댓글

CREATE SEQUENCE SEQ_NFNO; // 공지 파일
CREATE SEQUENCE SEQ_SFNO; // 판매자 파일
CREATE SEQUENCE SEQ_GFNO; // 상품 파일
CREATE SEQUENCE SEQ_RFNO; // 후기 파일
CREATE SEQUENCE SEQ_PFNO; // 홍보 파일
CREATE SEQUENCE SEQ_IFNO; // 문의 파일

//==============================================================================
// 회원 테이블 생성
CREATE TABLE "MEMBER" (
	"MEMBER_NO"	    NUMBER		        NOT NULL,
	"MEMBER_ID"	    VARCHAR(25)		    NOT NULL UNIQUE,
	"MEMBER_PWD"	VARCHAR2(100)		NOT NULL,
	"MEMBER_NAME"	VARCHAR2(15)		NOT NULL,
	"EMAIL"	        VARCHAR2(40)		NOT NULL,
	"PHONE"	        VARCHAR2(13)		NOT NULL,
    "ZIP_CODE"      VARCHAR2(5)         NOT NULL,              
	"ADDRESS"	    VARCHAR2(100)		NOT NULL,
    "DETAIL_ADDRESS"VARCHAR2(100 BYTE)  NOT NULL,
	"GENDER"	    CHAR(1)		        NOT NULL,
	"STATUS"	    DATE		        NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '아이디(영어, 숫자, 특수문자  6~12자 사이)';
COMMENT ON COLUMN "MEMBER"."MEMBER_PWD" IS '비밀번호';
COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '이름';
COMMENT ON COLUMN "MEMBER"."EMAIL" IS '이메일';
COMMENT ON COLUMN "MEMBER"."PHONE" IS '전화번호(-포함 13자리)';
COMMENT ON COLUMN "MEMBER"."ZIP_CODE" IS '우편 번호';
COMMENT ON COLUMN "MEMBER"."ADDRESS" IS '주소';
COMMENT ON COLUMN "MEMBER"."DETAIL_ADDRESS" IS '상세 주소';
COMMENT ON COLUMN "MEMBER"."GENDER" IS '성별(M,F)';
COMMENT ON COLUMN "MEMBER"."STATUS" IS '탈퇴일';

//==============================================================================
// 판매자 테이블 생성
CREATE TABLE "SELLER" (
	"SELLER_NO"	        NUMBER		        NOT NULL,
	"COMPANY_NAME"	    VARCHAR2(100)		NOT NULL,
	"SELLER_ID"	        VARCHAR2(25)		NOT NULL,
	"SELLER_PWD"	    VARCHAR2(100)		NOT NULL,
	"SELLER_NAME"	    VARCHAR2(20)		NOT NULL,
	"COMPANY_NO"	    VARCHAR2(20)		NOT NULL,
	"BUSINESS_NO"	    VARCHAR2(35)		NOT NULL,
	"ADDRESS"	        VARCHAR2(100)		NOT NULL,
	"EMAIL"	            VARCHAR2(40)		NOT NULL,
	"PHONE"	            VARCHAR2(13)		NOT NULL,
	"ACCOUNT_NO"	    VARCHAR2(30)		NOT NULL,
	"DELETE_DATE"	    DATE		        NULL,
	"ENROLL_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"ACCEPT_DATE"	    DATE		        NULL,
	"REFUSE_REASON"	    VARCHAR2(30)		NULL
);

COMMENT ON COLUMN "SELLER"."SELLER_NO" IS '판매자 번호';
COMMENT ON COLUMN "SELLER"."COMPANY_NAME" IS '상호명';
COMMENT ON COLUMN "SELLER"."SELLER_ID" IS '아이디';
COMMENT ON COLUMN "SELLER"."SELLER_PWD" IS '비밀번호';
COMMENT ON COLUMN "SELLER"."SELLER_NAME" IS '대표자 이름';
COMMENT ON COLUMN "SELLER"."COMPANY_NO" IS '사업자 등록 번호(000-000-0000 의 형식)';
COMMENT ON COLUMN "SELLER"."BUSINESS_NO" IS '통신 판매 번호(XXX-00000호 형식)';
COMMENT ON COLUMN "SELLER"."ADDRESS" IS '소재지';
COMMENT ON COLUMN "SELLER"."EMAIL" IS '메일 주소';
COMMENT ON COLUMN "SELLER"."PHONE" IS '전화 번호(-를 포함)';
COMMENT ON COLUMN "SELLER"."ACCOUNT_NO" IS '계좌 번호(-를 포함)';
COMMENT ON COLUMN "SELLER"."DELETE_DATE" IS '탈퇴일';
COMMENT ON COLUMN "SELLER"."ENROLL_DATE" IS '가입일';
COMMENT ON COLUMN "SELLER"."ACCEPT_DATE" IS '승인일';
COMMENT ON COLUMN "SELLER"."REFUSE_REASON" IS '회원가입 거절 사유';

//==============================================================================
// 상품 테이블 생성
CREATE TABLE "GOODS" (
	"GOOD_NO"	        NUMBER		        NOT NULL,
	"SELLER_NO"	        NUMBER		        NOT NULL,
	"GOOD_TITLE"	    VARCHAR2(100)		NOT NULL,
	"GOOD_DETAIL"	    VARCHAR2(3000)		NULL,
	"ORIGIN"	        VARCHAR2(100)		NOT NULL,
	"PRICE"	            NUMBER		        NOT NULL,
	"CREATE_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"		DATE		        NULL,
	"EXPIRATION_DATE"	DATE		        NOT NULL,
	"STOCK"	            NUMBER	            DEFAULT 0	NULL
);

COMMENT ON COLUMN "GOODS"."GOOD_NO" IS '상품 번호';
COMMENT ON COLUMN "GOODS"."SELLER_NO" IS '판매자 번호';
COMMENT ON COLUMN "GOODS"."GOOD_TITLE" IS '품목';
COMMENT ON COLUMN "GOODS"."GOOD_DETAIL" IS '상품 상세 정보';
COMMENT ON COLUMN "GOODS"."ORIGIN" IS '원산지';
COMMENT ON COLUMN "GOODS"."PRICE" IS '판매가';
COMMENT ON COLUMN "GOODS"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "GOODS"."DELETE_DATE" IS '삭제일';
COMMENT ON COLUMN "GOODS"."EXPIRATION_DATE" IS '유통기한';
COMMENT ON COLUMN "GOODS"."STOCK" IS '재고(0 일시 구매X)';

//==============================================================================
// 주문 테이블 생성
CREATE TABLE "ORDER" (
	"ORDER_NO"	        NUMBER		        NOT NULL,
	"MEMBER_NO"	        NUMBER		        NOT NULL,
	"ORDER_NAME"	    VARCHAR2(15)		NOT NULL,
	"PHONE"	            VARCHAR2(13)		NOT NULL,
	"PRICE"	            NUMBER		        NOT NULL,
	"ZIP_CODE"	        VARCHAR2(5 BYTE)    NOT NULL,
	"ADDRESS"	        VARCHAR2(100)		NOT NULL,
	"DETAIL_ADDRESS"	VARCHAR2(100)		NOT NULL,
	"REQUEST"	        VARCHAR2(200)		NULL,
	"PAY_TID"	        VARCHAR2(100)		NULL,
	"PAY_METHOD"	    VARCHAR2(100)		NULL,
	"PAY_DATE"	        DATE	            DEFAULT SYSDATE	NOT NULL,
	"PAY_CANCEL"	    DATE		        NULL,
	"STATUS"	        DATE		        NULL
);

COMMENT ON COLUMN "ORDER"."ORDER_NO" IS '주문 번호';
COMMENT ON COLUMN "ORDER"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "ORDER"."ORDER_NAME" IS '이름';
COMMENT ON COLUMN "ORDER"."PHONE" IS '전화 번호';
COMMENT ON COLUMN "ORDER"."PRICE" IS '총 가격';
COMMENT ON COLUMN "ORDER"."ZIP_CODE" IS '우편 번호';
COMMENT ON COLUMN "ORDER"."ADDRESS" IS '주소';
COMMENT ON COLUMN "ORDER"."DETAIL_ADDRESS" IS '상세 주소';
COMMENT ON COLUMN "ORDER"."REQUEST" IS '배송시 요청 사항';
COMMENT ON COLUMN "ORDER"."PAY_TID" IS '결제 고유 번호';
COMMENT ON COLUMN "ORDER"."PAY_METHOD" IS '결제 방법';
COMMENT ON COLUMN "ORDER"."PAY_DATE" IS '결제일';
COMMENT ON COLUMN "ORDER"."PAY_CANCEL" IS '환불일';
COMMENT ON COLUMN "ORDER"."STATUS" IS '결제 완료 상태';

//==============================================================================
// 상품 판매 테이블 생성
CREATE TABLE "GOODS_SELL" (
	"SELL_NO"	        NUMBER		        NOT NULL,
	"SELLER_NO"	        NUMBER		        NOT NULL,
	"GOOD_NO"	        NUMBER		        NOT NULL,
	"SELL_TITLE"	    VARCHAR2(100)		NOT NULL,
	"SELL_CONTENT"	    VARCHAR2(3000)		NOT NULL,
	"COUNT"	            NUMBER	            DEFAULT 0	NOT NULL,
	"CREATE_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	    DATE		        NULL
);

COMMENT ON COLUMN "GOODS_SELL"."SELL_NO" IS '상품 판매 번호';
COMMENT ON COLUMN "GOODS_SELL"."SELLER_NO" IS '판매자 번호';
COMMENT ON COLUMN "GOODS_SELL"."GOOD_NO" IS '상품 번호';
COMMENT ON COLUMN "GOODS_SELL"."SELL_TITLE" IS '제목';
COMMENT ON COLUMN "GOODS_SELL"."SELL_CONTENT" IS '내용';
COMMENT ON COLUMN "GOODS_SELL"."COUNT" IS '조회수';
COMMENT ON COLUMN "GOODS_SELL"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "GOODS_SELL"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 주문 상품 테이블 생성
CREATE TABLE "ORDER_GOODS" (
	"ORDER_DETAIL_NO"	    NUMBER		NOT NULL,
	"ORDER_NO"	            NUMBER		NOT NULL,
	"GOOD_NO"	            NUMBER		NOT NULL,
	"COUNT"	                NUMBER		NOT NULL,
	"PRICE"	                NUMBER		NOT NULL,
	"STATUS"	            CHAR(1)	    DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "ORDER_GOODS"."ORDER_DETAIL_NO" IS '주문 상세 번호';
COMMENT ON COLUMN "ORDER_GOODS"."ORDER_NO" IS '주문 번호';
COMMENT ON COLUMN "ORDER_GOODS"."GOOD_NO" IS '상품 번호';
COMMENT ON COLUMN "ORDER_GOODS"."COUNT" IS '수량';
COMMENT ON COLUMN "ORDER_GOODS"."PRICE" IS '상품별 가격';
COMMENT ON COLUMN "ORDER_GOODS"."STATUS" IS '주문 처리 상태';

//==============================================================================
// 공지 테이블 생성
CREATE TABLE "NOTICE" (
	"NOTICE_NO"	        NUMBER		        NOT NULL,
	"NOTICE_TITLE"	    VARCHAR2(400)		NOT NULL,
	"NOTICE_CONTENT"	VARCHAR2(3000)		NOT NULL,
	"COUNT"	            NUMBER	            DEFAULT 0	NOT NULL,
	"CREATE_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	    DATE		        NULL
);

COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '공지사항 번호';
COMMENT ON COLUMN "NOTICE"."NOTICE_TITLE" IS '제목';
COMMENT ON COLUMN "NOTICE"."NOTICE_CONTENT" IS '내용';
COMMENT ON COLUMN "NOTICE"."COUNT" IS '조회수';
COMMENT ON COLUMN "NOTICE"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "NOTICE"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 문의 테이블 생성
CREATE TABLE "INQUIRY" (
	"INQ_NO"	        NUMBER		        NOT NULL,
	"SELLER_NO"	        NUMBER		        NOT NULL,
	"MEMBER_NO"	        NUMBER		        NOT NULL,
	"INQ_TITLE"	        VARCHAR2(400)		NOT NULL,
	"INQ_CONTENT"	    VARCHAR2(3000)		NOT NULL,
	"COUNT"	            NUMBER	            DEFAULT 0	NOT NULL,
	"CREATE_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	    DATE		        NULL,
	"RESPONSE_CONTENT"	VARCHAR2(4000)		NULL,
	"RESPONSE_DATE"	    DATE		        NULL  
);

COMMENT ON COLUMN "INQUIRY"."INQ_NO" IS '문의 번호';
COMMENT ON COLUMN "INQUIRY"."SELLER_NO" IS '판매자 번호';
COMMENT ON COLUMN "INQUIRY"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "INQUIRY"."INQ_TITLE" IS '제목';
COMMENT ON COLUMN "INQUIRY"."INQ_CONTENT" IS '내용';
COMMENT ON COLUMN "INQUIRY"."COUNT" IS '조회수';
COMMENT ON COLUMN "INQUIRY"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "INQUIRY"."DELETE_DATE" IS '삭제일';
COMMENT ON COLUMN "INQUIRY"."RESPONSE_CONTENT" IS '답변';
COMMENT ON COLUMN "INQUIRY"."RESPONSE_DATE" IS '답변일';

//==============================================================================
// 홍보 테이블 생성
CREATE TABLE "PROMOTION" (
	"PROMOTION_NO"	        NUMBER		        NOT NULL,
	"SELLER_NO"	            NUMBER		        NOT NULL,
	"PROMOTION_TITLE"	    VARCHAR2(100)		,
	"PROMOTION_CONTENT"	    VARCHAR2(3000)		NOT NULL,
	"COUNT"	                NUMBER	            DEFAULT 0	NOT NULL,
	"CREATE_DATE"	        DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	        DATE		        NULL
);

COMMENT ON COLUMN "PROMOTION"."PROMOTION_NO" IS '홍보 번호';
COMMENT ON COLUMN "PROMOTION"."SELLER_NO" IS '판매자 번호';
COMMENT ON COLUMN "PROMOTION"."PROMOTION_TITLE" IS '제목';
COMMENT ON COLUMN "PROMOTION"."PROMOTION_CONTENT" IS '내용';
COMMENT ON COLUMN "PROMOTION"."COUNT" IS '조회수';
COMMENT ON COLUMN "PROMOTION"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "PROMOTION"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 후기 테이블 생성
CREATE TABLE "REVIEW" (
	"REV_NO"	        NUMBER		        NOT NULL,
	"MEMBER_NO"	        NUMBER		        NOT NULL,
	"GOOD_NO"	        NUMBER		        NOT NULL,
	"REV_TITLE"	        VARCHAR2(100),		
	"REV_CONTENT"	    VARCHAR2(3000)		NOT NULL,
	"COUNT"	            NUMBER	            DEFAULT 0	NOT NULL,
    "STAR_RATING"	    NUMBER	            DEFAULT 0	NOT NULL,
	"CREATE_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	    DATE		        NULL
);

COMMENT ON COLUMN "REVIEW"."REV_NO" IS '후기 번호';
COMMENT ON COLUMN "REVIEW"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "REVIEW"."GOOD_NO" IS '상품 번호';
COMMENT ON COLUMN "REVIEW"."REV_TITLE" IS '제목';
COMMENT ON COLUMN "REVIEW"."REV_CONTENT" IS '내용';
COMMENT ON COLUMN "REVIEW"."COUNT" IS '조회수';
COMMENT ON COLUMN "REVIEW"."STAR_RATING" IS '별점';
COMMENT ON COLUMN "REVIEW"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "REVIEW"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 장바구니 테이블 생성
CREATE TABLE "CART" (
	"CART_NO"	        NUMBER		NOT NULL,
	"MEMBER_NO"     	NUMBER		NOT NULL,
	"GOOD_NO"	        NUMBER		NOT NULL,
	"COUNT"	            NUMBER		NOT NULL,
	"STATUS"	        CHAR(1)	    DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "CART"."CART_NO" IS '장바구니 번호';
COMMENT ON COLUMN "CART"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "CART"."GOOD_NO" IS '상품 번호';
COMMENT ON COLUMN "CART"."COUNT" IS '수량';
COMMENT ON COLUMN "CART"."STATUS" IS '구매여부';

//==============================================================================
// 좋아요 테이블 생성
CREATE TABLE "LIKE" (
	"MEMBER_NO"	    NUMBER		NOT NULL,
	"GOOD_NO"	    NUMBER		NOT NULL
);

COMMENT ON COLUMN "LIKE"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "LIKE"."GOOD_NO" IS '상품 번호';

//==============================================================================
// 찜 테이블 생성
CREATE TABLE "SUBSCRIBE" (
	"MEMBER_NO"	        NUMBER		NOT NULL,
	"SELLER_NO"         NUMBER		NOT NULL
);

COMMENT ON COLUMN "SUBSCRIBE"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "SUBSCRIBE"."SELLER_NO" IS '판매자 번호';

//==============================================================================
// 상품 판매 댓글 테이블 생성
CREATE TABLE "SELL_REPLY" (
	"REPLY_NO"	    NUMBER		        NOT NULL,
	"MEMBER_NO"	    NUMBER		        NOT NULL,
	"SELL_NO"	    NUMBER		        NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(100)		NOT NULL,
	"CREATE_DATE"	DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	DATE		        NULL
);

COMMENT ON COLUMN "SELL_REPLY"."REPLY_NO" IS '댓글 번호';
COMMENT ON COLUMN "SELL_REPLY"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "SELL_REPLY"."SELL_NO" IS '상품 판매 번호';
COMMENT ON COLUMN "SELL_REPLY"."REPLY_CONTENT" IS '내용';
COMMENT ON COLUMN "SELL_REPLY"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "SELL_REPLY"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 홍보 댓글 테이블 생성
CREATE TABLE "PROMOTION_REPLY" (
	"REPLY_NO"	        NUMBER		        NOT NULL,
	"PROMOTION_NO"	    NUMBER		        NOT NULL,
	"MEMBER_NO"	        NUMBER		        NOT NULL,
	"REPLY_CONTENT"	    VARCHAR2(3000)		NOT NULL,
	"CREATE_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	    DATE		        NULL
);

COMMENT ON COLUMN "PROMOTION_REPLY"."REPLY_NO" IS '댓글 번호';
COMMENT ON COLUMN "PROMOTION_REPLY"."PROMOTION_NO" IS '홍보 번호';
COMMENT ON COLUMN "PROMOTION_REPLY"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "PROMOTION_REPLY"."REPLY_CONTENT" IS '내용';
COMMENT ON COLUMN "PROMOTION_REPLY"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "PROMOTION_REPLY"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 후기 댓글 테이블 생성
CREATE TABLE "REVIEW_REPLY" (
	"REPLY_NO"	        NUMBER		        NOT NULL,
    "REV_NO"	        NUMBER		        NOT NULL,
	"MEMBER_NO"	        NUMBER		        NOT NULL,
	"REPLY_CONTENT"	    VARCHAR2(3000)		NOT NULL,
	"CREATE_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	    DATE		        NULL 
);

COMMENT ON COLUMN "REVIEW_REPLY"."REPLY_NO" IS '댓글 번호';
COMMENT ON COLUMN "REVIEW_REPLY"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "REVIEW_REPLY"."REV_NO" IS '후기 번호';
COMMENT ON COLUMN "REVIEW_REPLY"."REPLY_CONTENT" IS '내용';
COMMENT ON COLUMN "REVIEW_REPLY"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "REVIEW_REPLY"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 문의 댓글 테이블 생성
CREATE TABLE "INQUIRY_REPLY" (
	"REPLY_NO"	        NUMBER		        NOT NULL,
	"INQ_NO"	        NUMBER		        NOT NULL,
	"MEMBER_NO"	        NUMBER		        NOT NULL,
	"REPLY_CONTENT"	    VARCHAR2(3000)		NOT NULL,
	"CREATE_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	    DATE		        NULL
);

COMMENT ON COLUMN "INQUIRY_REPLY"."REPLY_NO" IS '댓글 번호';
COMMENT ON COLUMN "INQUIRY_REPLY"."INQ_NO" IS '문의 번호';
COMMENT ON COLUMN "INQUIRY_REPLY"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "INQUIRY_REPLY"."REPLY_CONTENT" IS '내용';
COMMENT ON COLUMN "INQUIRY_REPLY"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "INQUIRY_REPLY"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 공지 파일 테이블 생성
CREATE TABLE "NOTICE_FILE" (
	"FILE_NO"	        NUMBER		        NOT NULL,
	"NOTICE_NO"	        NUMBER		        NOT NULL,
	"ORIGIN_NAME"	    VARCHAR2(400)		NOT NULL,
	"CHANGE_NAME"	    VARCHAR2(400)		NOT NULL,
	"CREATE_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	    DATE		        NULL
);

COMMENT ON COLUMN "NOTICE_FILE"."FILE_NO" IS '파일 번호';
COMMENT ON COLUMN "NOTICE_FILE"."NOTICE_NO" IS '공지사항 번호';
COMMENT ON COLUMN "NOTICE_FILE"."ORIGIN_NAME" IS '원본명';
COMMENT ON COLUMN "NOTICE_FILE"."CHANGE_NAME" IS '수정명';
COMMENT ON COLUMN "NOTICE_FILE"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "NOTICE_FILE"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 판매자 파일 테이블 생성
CREATE TABLE "SELLER_FILE" (
	"FILE_NO"	    NUMBER		        NOT NULL,
	"SELLER_NO"	    NUMBER		        NOT NULL,
	"ORIGINAL_NAME"	VARCHAR2(400)		NOT NULL,
	"CHANGE_NAME"	VARCHAR2(400)		NOT NULL,
	"CREATE_DATE"	DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	DATE		        NULL
);

COMMENT ON COLUMN "SELLER_FILE"."FILE_NO" IS '파일 번호';
COMMENT ON COLUMN "SELLER_FILE"."SELLER_NO" IS '판매자 번호';
COMMENT ON COLUMN "SELLER_FILE"."ORIGINAL_NAME" IS '원본명';
COMMENT ON COLUMN "SELLER_FILE"."CHANGE_NAME" IS '수정명';
COMMENT ON COLUMN "SELLER_FILE"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "SELLER_FILE"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 상품 파일 테이블 생성
CREATE TABLE "GOODS_FILE" (
	"FILE_NO"	        NUMBER		        NOT NULL,
	"SELL_NO"	        NUMBER		        NOT NULL,
	"ORIGINAL_NAME"	    VARCHAR2(300)		NOT NULL,
	"CHANGE_NAME"	    VARCHAR2(300)		NOT NULL,
	"CREATE_DATE"	    DATE	            NULL,
	"DELETE_DATE"	    DATE		        NULL
);

COMMENT ON COLUMN "GOODS_FILE"."FILE_NO" IS '파일 번호';
COMMENT ON COLUMN "GOODS_FILE"."SELL_NO" IS '상품 판매 번호';
COMMENT ON COLUMN "GOODS_FILE"."ORIGINAL_NAME" IS '원본명';
COMMENT ON COLUMN "GOODS_FILE"."CHANGE_NAME" IS '수정명';
COMMENT ON COLUMN "GOODS_FILE"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "GOODS_FILE"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 후기 파일 테이블 생성
CREATE TABLE "REVIEW_FILE" (
	"FILE_NO"	    NUMBER		        NOT NULL,
	"REV_NO"	    NUMBER		        NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(400)		NOT NULL,
	"CHANGE_NAME"	VARCHAR2(400)		NOT NULL,
	"CREATE_DATE"	DATE	            NULL,
	"DELETE_DATE"	DATE		        NULL
);

COMMENT ON COLUMN "REVIEW_FILE"."FILE_NO" IS '파일 번호';
COMMENT ON COLUMN "REVIEW_FILE"."REV_NO" IS '후기 번호';
COMMENT ON COLUMN "REVIEW_FILE"."ORIGIN_NAME" IS '원본명';
COMMENT ON COLUMN "REVIEW_FILE"."CHANGE_NAME" IS '수정명';
COMMENT ON COLUMN "REVIEW_FILE"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "REVIEW_FILE"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 홍보 파일 테이블 생성
CREATE TABLE "PROMOTION_FILE" (
	"FILE_NO"	        NUMBER		        NOT NULL,
	"PROMOTION_NO"	    NUMBER		        NOT NULL,
	"ORIGINAL_NAME"	    VARCHAR2(300)		NOT NULL,
	"CHANGE_NAME"	    VARCHAR2(300)		NOT NULL,
	"CREATE_DATE"	    DATE	            NULL,
	"DELETE_DATE"	    DATE		        NULL
);

COMMENT ON COLUMN "PROMOTION_FILE"."FILE_NO" IS '파일 번호';
COMMENT ON COLUMN "PROMOTION_FILE"."PROMOTION_NO" IS '홍보 번호';
COMMENT ON COLUMN "PROMOTION_FILE"."ORIGINAL_NAME" IS '원본명';
COMMENT ON COLUMN "PROMOTION_FILE"."CHANGE_NAME" IS '수정명';
COMMENT ON COLUMN "PROMOTION_FILE"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "PROMOTION_FILE"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 문의 파일 테이블 생성
CREATE TABLE "INQUIRY_FILE" (
	"FILE_NO"	        NUMBER		        NOT NULL,
	"INQ_NO"	        NUMBER		        NOT NULL,
	"ORIGIN_NAME"	    VARCHAR2(400)		NOT NULL,
	"CHANGE_NAME"	    VARCHAR2(400)		NOT NULL,
	"CREATE_DATE"	    DATE	            DEFAULT SYSDATE	NOT NULL,
	"DELETE_DATE"	    DATE		        NULL
);

COMMENT ON COLUMN "INQUIRY_FILE"."FILE_NO" IS '파일 번호';
COMMENT ON COLUMN "INQUIRY_FILE"."INQ_NO" IS '문의 번호';
COMMENT ON COLUMN "INQUIRY_FILE"."ORIGIN_NAME" IS '원본명';
COMMENT ON COLUMN "INQUIRY_FILE"."CHANGE_NAME" IS '수정명';
COMMENT ON COLUMN "INQUIRY_FILE"."CREATE_DATE" IS '등록일';
COMMENT ON COLUMN "INQUIRY_FILE"."DELETE_DATE" IS '삭제일';

//==============================================================================
// 식별자 추가
ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "PK_CART" PRIMARY KEY (
	"CART_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"REV_NO"
);

ALTER TABLE "INQUIRY_REPLY" ADD CONSTRAINT "PK_INQUIRY_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "GOODS_SELL" ADD CONSTRAINT "PK_GOODS_SELL" PRIMARY KEY (
	"SELL_NO"
);

ALTER TABLE "INQUIRY" ADD CONSTRAINT "PK_INQUIRY" PRIMARY KEY (
	"INQ_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

ALTER TABLE "ORDER" ADD CONSTRAINT "PK_ORDER" PRIMARY KEY (
	"ORDER_NO"
);

ALTER TABLE "ORDER_GOODS" ADD CONSTRAINT "PK_ORDER_GOODS" PRIMARY KEY (
	"ORDER_DETAIL_NO"
);

ALTER TABLE "GOODS" ADD CONSTRAINT "PK_GOODS" PRIMARY KEY (
	"GOOD_NO"
);

ALTER TABLE "NOTICE_FILE" ADD CONSTRAINT "PK_NOTICE_FILE" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "SELLER" ADD CONSTRAINT "PK_SELLER" PRIMARY KEY (
	"SELLER_NO"
);

ALTER TABLE "PROMOTION" ADD CONSTRAINT "PK_PROMOTION" PRIMARY KEY (
	"PROMOTION_NO"
);

ALTER TABLE "SELLER_FILE" ADD CONSTRAINT "PK_SELLER_FILE" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "PROMOTION_REPLY" ADD CONSTRAINT "PK_PROMOTION_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "SELL_REPLY" ADD CONSTRAINT "PK_SELL_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "REVIEW_FILE" ADD CONSTRAINT "PK_REVIEW_FILE" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "PROMOTION_FILE" ADD CONSTRAINT "PK_PROMOTION_FILE" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "INQUIRY_FILE" ADD CONSTRAINT "PK_INQUIRY_FILE" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "GOODS_FILE" ADD CONSTRAINT "PK_GOODS_FILE" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "REVIEW_REPLY" ADD CONSTRAINT "PK_REVIEW_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "FK_MEMBER_TO_CART_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "FK_GOODS_TO_CART_1" FOREIGN KEY (
	"GOOD_NO"
)
REFERENCES "GOODS" (
	"GOOD_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_REVIEW_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_GOODS_TO_REVIEW_1" FOREIGN KEY (
	"GOOD_NO"
)
REFERENCES "GOODS" (
	"GOOD_NO"
);

ALTER TABLE "SUBSCRIBE" ADD CONSTRAINT "FK_MEMBER_TO_SUBSCRIBE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "SUBSCRIBE" ADD CONSTRAINT "FK_SELLER_TO_SUBSCRIBE_1" FOREIGN KEY (
	"SELLER_NO"
)
REFERENCES "SELLER" (
	"SELLER_NO"
);

ALTER TABLE "INQUIRY_REPLY" ADD CONSTRAINT "FK_INQUIRY_TO_INQUIRY_REPLY_1" FOREIGN KEY (
	"INQ_NO"
)
REFERENCES "INQUIRY" (
	"INQ_NO"
);

ALTER TABLE "INQUIRY_REPLY" ADD CONSTRAINT "FK_MEMBER_TO_INQUIRY_REPLY_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "GOODS_SELL" ADD CONSTRAINT "FK_SELLER_TO_GOODS_SELL_1" FOREIGN KEY (
	"SELLER_NO"
)
REFERENCES "SELLER" (
	"SELLER_NO"
);

ALTER TABLE "GOODS_SELL" ADD CONSTRAINT "FK_GOODS_TO_GOODS_SELL_1" FOREIGN KEY (
	"GOOD_NO"
)
REFERENCES "GOODS" (
	"GOOD_NO"
);

ALTER TABLE "LIKE" ADD CONSTRAINT "FK_MEMBER_TO_LIKE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "LIKE" ADD CONSTRAINT "FK_GOODS_TO_LIKE_1" FOREIGN KEY (
	"GOOD_NO"
)
REFERENCES "GOODS" (
	"GOOD_NO"
);

ALTER TABLE "INQUIRY" ADD CONSTRAINT "FK_SELLER_TO_INQUIRY_1" FOREIGN KEY (
	"SELLER_NO"
)
REFERENCES "SELLER" (
	"SELLER_NO"
);

ALTER TABLE "INQUIRY" ADD CONSTRAINT "FK_MEMBER_TO_INQUIRY_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "ORDER" ADD CONSTRAINT "FK_MEMBER_TO_ORDER_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "ORDER_GOODS" ADD CONSTRAINT "FK_ORDER_TO_ORDER_GOODS_1" FOREIGN KEY (
	"ORDER_NO"
)
REFERENCES "ORDER" (
	"ORDER_NO"
);

ALTER TABLE "ORDER_GOODS" ADD CONSTRAINT "FK_GOODS_TO_ORDER_GOODS_1" FOREIGN KEY (
	"GOOD_NO"
)
REFERENCES "GOODS" (
	"GOOD_NO"
);

ALTER TABLE "GOODS" ADD CONSTRAINT "FK_SELLER_TO_GOODS_1" FOREIGN KEY (
	"SELLER_NO"
)
REFERENCES "SELLER" (
	"SELLER_NO"
);

ALTER TABLE "NOTICE_FILE" ADD CONSTRAINT "FK_NOTICE_TO_NOTICE_FILE_1" FOREIGN KEY (
	"NOTICE_NO"
)
REFERENCES "NOTICE" (
	"NOTICE_NO"
);

ALTER TABLE "PROMOTION" ADD CONSTRAINT "FK_SELLER_TO_PROMOTION_1" FOREIGN KEY (
	"SELLER_NO"
)
REFERENCES "SELLER" (
	"SELLER_NO"
);

ALTER TABLE "SELLER_FILE" ADD CONSTRAINT "FK_SELLER_TO_SELLER_FILE_1" FOREIGN KEY (
	"SELLER_NO"
)
REFERENCES "SELLER" (
	"SELLER_NO"
);

ALTER TABLE "PROMOTION_REPLY" ADD CONSTRAINT "FK_PRO_TO_PROMOTION_REPLY_1" FOREIGN KEY (
	"PROMOTION_NO"
)
REFERENCES "PROMOTION" (
	"PROMOTION_NO"
);

ALTER TABLE "PROMOTION_REPLY" ADD CONSTRAINT "FK_MEMBER_TO_PROMOTION_REPLY_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "SELL_REPLY" ADD CONSTRAINT "FK_MEMBER_TO_SELL_REPLY_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "SELL_REPLY" ADD CONSTRAINT "FK_GOODS_SELL_TO_SELL_REPLY_1" FOREIGN KEY (
	"SELL_NO"
)
REFERENCES "GOODS_SELL" (
	"SELL_NO"
);

ALTER TABLE "REVIEW_FILE" ADD CONSTRAINT "FK_REVIEW_TO_REVIEW_FILE_1" FOREIGN KEY (
	"REV_NO"
)
REFERENCES "REVIEW" (
	"REV_NO"
);

ALTER TABLE "PROMOTION_FILE" ADD CONSTRAINT "FK_PRO_TO_PROMOTION_FILE_1" FOREIGN KEY (
	"PROMOTION_NO"
)
REFERENCES "PROMOTION" (
	"PROMOTION_NO"
);

ALTER TABLE "INQUIRY_FILE" ADD CONSTRAINT "FK_INQUIRY_TO_INQUIRY_FILE_1" FOREIGN KEY (
	"INQ_NO"
)
REFERENCES "INQUIRY" (
	"INQ_NO"
);

ALTER TABLE "GOODS_FILE" ADD CONSTRAINT "FK_GOODS_SELL_TO_GOODS_FILE_1" FOREIGN KEY (
	"SELL_NO"
)
REFERENCES "GOODS_SELL" (
	"SELL_NO"
);

ALTER TABLE "REVIEW_REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REVIEW_REPLY_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REVIEW_REPLY" ADD CONSTRAINT "FK_REVIEW_TO_REVIEW_REPLY_1" FOREIGN KEY (
	"REV_NO"
)
REFERENCES "REVIEW" (
	"REV_NO"
);


COMMIT;
