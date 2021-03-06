	SELECT NODE_ID 
		FROM 
			(
			SELECT NODE_ID, LEFT(LINK_ID,3) AS REGION_CD
			FROM 
				(
				SELECT NODE_ID 
				FROM  NODE_OLD 
				WHERE NODE_TYPE ='105'
				) AS A,LINK_OLD AS B
			WHERE A.NODE_ID = B.F_NODE OR A.NODE_ID = B.T_NODE
			GROUP BY NODE_ID, LEFT(LINK_ID,3)
			) Z1
		GROUP BY NODE_ID
		HAVING COUNT(*) = 1



		SELECT NODE_ID, COUNT(*) AS REF_CNT
		FROM 
			(
			SELECT NODE_ID 
			FROM  NODE_OLD 
			WHERE NODE_TYPE ='105'
			) AS A,LINK_OLD AS B
		WHERE A.NODE_ID = B.F_NODE OR A.NODE_ID = B.T_NODE
		GROUP BY NODE_ID