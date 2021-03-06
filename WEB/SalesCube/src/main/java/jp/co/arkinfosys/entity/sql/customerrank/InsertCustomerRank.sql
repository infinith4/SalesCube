INSERT INTO CUSTOMER_RANK_MST_/*$domainId*/
(
	RANK_CODE,
	RANK_NAME,
	RANK_RATE,
	RO_COUNT_FROM,
	RO_COUNT_TO,
	ENROLL_TERM_FROM,
	ENROLL_TERM_TO,
	DEFECT_TERM_FROM,
	DEFECT_TERM_TO,
	RO_MONTHLY_AVG_FROM,
	RO_MONTHLY_AVG_TO,
	POSTAGE_TYPE,
	REMARKS,
	CRE_FUNC,
	CRE_DATETM,
	CRE_USER,
	UPD_FUNC,
	UPD_DATETM,
	UPD_USER
)
VALUES
(
	/*rankCode*/,
	/*rankName*/,
	/*rankRate*/,
	/*roCountFrom*/,
	/*roCountTo*/,
	/*enrollTermFrom*/,
	/*enrollTermTo*/,
	/*defectTermFrom*/,
	/*defectTermTo*/,
	/*roMonthlyAvgFrom*/,
	/*roMonthlyAvgTo*/,
	/*postageType*/,
	/*remarks*/,
	/*creFunc*/,
	now(),
	/*creUser*/,
	/*updFunc*/,
	now(),
	/*updUser*/
)
