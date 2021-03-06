UPDATE USER_MST_/*$domainId*/ SET
		/*IF nameKnj != null */
		NAME_KNJ=/*nameKnj*/'',
		/*END*/

		/*IF nameKana != null */
		NAME_KANA=/*nameKana*/NULL,
		/*END*/

		/*IF deptId != null */
		DEPT_ID=/*deptId*/NULL,
		/*END*/

		/*IF email != null */
		EMAIL=/*email*/NULL,
		/*END*/

		/*IF password != null */
		PASSWORD=/*password*/NULL,
		/*END*/

		/*IF passwordValidDays != null */
		EXPIRE_DATE=DATE_ADD(now(), INTERVAL /*passwordValidDays*/ DAY),
		/*END*/

        UPD_FUNC=/*updFunc*/NULL,
        UPD_DATETM=now(),
        UPD_USER=/*updUser*/NULL
	WHERE
		USER_ID=/*userId*/''
