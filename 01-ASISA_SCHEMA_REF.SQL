DROP TABLE REF_CLAIM_CATEGORY ;
DROP TABLE REF_POLICY_TYPE ;
DROP TABLE REF_CLAIM_TYPE ;
DROP TABLE REF_CLAIM_STATUS ;
DROP TABLE REF_CLAIM_CAUSE ;
DROP TABLE REF_IMPAIRMENT_CODE ;
DROP TABLE REF_LIFE_SYMBOL ;
DROP TABLE REF_LIFE_SPEC ;
DROP TABLE REF_PAYMENT_METHOD ;
DROP TABLE REF_IDTYPE ;
DROP TABLE REF_TITLE ;
DROP TABLE REF_GENDER ;
DROP TABLE REF_NOTIFICATION_TYPE ;
DROP TABLE REF_NOTIFICATION_STATUS ;
DROP TABLE REF_OFFICE;
DROP TABLE REF_IMPAIRMENT_READINGS;

CREATE TABLE REF_CLAIM_TYPE (
	ID VARCHAR2(10) NOT NULL, 
	DESCRIPTION VARCHAR2(30) NOT NULL,	
	CONSTRAINT REF_CLAIM_TYPE_PK PRIMARY KEY (ID)	
);

CREATE TABLE REF_POLICY_TYPE (
	ID VARCHAR2(10) NOT NULL, 
	DESCRIPTION VARCHAR2(30) NOT NULL,
	CLAIM_TYPE VARCHAR2(10) NOT NULL,
	CONSTRAINT REF_POLICY_TYPE_PK PRIMARY KEY (ID),
	CONSTRAINT REF_POLICY_TYPE_FK1 FOREIGN KEY (CLAIM_TYPE) REFERENCES REF_CLAIM_TYPE (ID)
);

CREATE TABLE REF_CLAIM_CATEGORY (
	ID VARCHAR2(10) NOT NULL, 
	DESCRIPTION VARCHAR2(116) NOT NULL, 
	CLAIM_TYPE VARCHAR2(10) NOT NULL,
	CONSTRAINT REF_CLAIM_CATEGORY_PK PRIMARY KEY (ID),
	CONSTRAINT REF_CLAIM_CATEGORY_FK1 FOREIGN KEY (CLAIM_TYPE) REFERENCES REF_CLAIM_TYPE (ID)
);

CREATE TABLE REF_CLAIM_STATUS (
	ID VARCHAR2(10), 
	DESCRIPTION VARCHAR2(25),
	CONSTRAINT REF_CLAIM_STATUS_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_CLAIM_CAUSE (
	ID VARCHAR2(10) NOT NULL,
	DESCRIPTION VARCHAR2(50) NOT NULL,	
	CONSTRAINT REF_CLAIM_CAUSE_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_IMPAIRMENT_CODE (
	ID VARCHAR2(10) NOT NULL, 
	DESCRIPTION VARCHAR2(120) NOT NULL, 
	GROUP_ID VARCHAR2(10),
	CONSTRAINT REF_IMPAIRMENT_CODE_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_LIFE_SYMBOL (
	ID VARCHAR2(10) NOT NULL,
	DESCRIPTION VARCHAR2(25) NOT NULL,
	CONSTRAINT REF_LIFE_SYMBOL_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_LIFE_SPEC (
	ID VARCHAR2(10) NOT NULL, 
	DESCRIPTION VARCHAR2(50) NOT NULL,
	CONSTRAINT REF_LIFE_SPEC_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_PAYMENT_METHOD (
	ID VARCHAR2(10) NOT NULL, 
	DESCRIPTION VARCHAR2(10) NOT NULL,	
	CONSTRAINT REF_PAYMENT_METHOD_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_IDTYPE (
	ID VARCHAR2(10) NOT NULL, 
	DESCRIPTION VARCHAR2(30) NOT NULL,
	CONSTRAINT REF_IDTYPE_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_TITLE (
	ID VARCHAR2(10) NOT NULL,
	DESCRIPTION VARCHAR2(15) NOT NULL,
	CONSTRAINT REF_TITLE_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_GENDER (
	ID VARCHAR2(10) NOT NULL,
	DESCRIPTION VARCHAR2(10) NOT NULL,
	CONSTRAINT REF_GENDER_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_NOTIFICATION_TYPE (
	ID VARCHAR2(10) NOT NULL,
	DESCRIPTION VARCHAR2(40) NOT NULL,
	CONSTRAINT REF_NOTIFICATION_TYPE_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_NOTIFICATION_STATUS (
	ID VARCHAR2(20) NOT NULL,
	DESCRIPTION VARCHAR2(40) NOT NULL,
	CONSTRAINT REF_NOTIFICATION_STATUS_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_OFFICE (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
	LOCATION_ID VARCHAR2(10) NOT NULL,
	OFFICE_ID VARCHAR2(10) NOT NULL,
	DESCRIPTION VARCHAR2(100) NOT NULL,
	NAME VARCHAR2(25) NOT NULL,
	CONSTRAINT REF_OFFICE_PK PRIMARY KEY (ID)
);

CREATE TABLE REF_IMPAIRMENT_READINGS (
	ID INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL, 
	IMPAIRMENT_CODE VARCHAR2(30) NOT NULL,
	FORMAT VARCHAR2(30) NULL,	
	CONSTRAINT REF_IMPAIRMENT_READINGS_PK PRIMARY KEY (ID)	
);