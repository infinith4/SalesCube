
		<div style="width: 910px; height: 25px;">
			<div style="position:absolute; left: 0px;">検索結果件数： ${searchResultCount}件</div>
			<input type="hidden" id="searchResultCount" value="${searchResultCount}">

			<div style="position:absolute; width: 910px; text-align: center;">
				${sw:pageLink(searchResultCount,rowCount,pageNo)}
			</div>

			<jsp:include page="/WEB-INF/view/common/rowcount.jsp"/>
		</div>

		<table id="order_myself_output_list" summary="order_myself_output_list" class="forms" style="width: 910px;">
			<colgroup>
				<col span="1" style="width: 10%;">
				<col span="1" style="width: 10%;">
				<col span="1" style="width: 15%;">
				<col span="1" style="width: 15%;">
				<col span="1" style="width: 50%;">
			</colgroup>
		<thead>
			<tr>
				<th><bean:message key='words.action.select'/></th><!-- 選択 -->
				<th style="cursor: pointer"  onclick="sort('printCount');">
					<bean:message key='labels.alreadyOutput'/>
					<c:if test="${sortColumn == 'printCount'}">
						<c:if test="${sortOrderAsc}">▲</c:if>
						<c:if test="${!sortOrderAsc}">▼</c:if>
					</c:if>
				</th><!-- 発行済 -->
				<th style="cursor: pointer"  onclick="sort('poSlipId');">
					<bean:message key='labels.poSlipId'/>
					<c:if test="${sortColumn == 'poSlipId'}">
						<c:if test="${sortOrderAsc}">▲</c:if>
						<c:if test="${!sortOrderAsc}">▼</c:if>
					</c:if>
				</th><!-- 発注番号 -->
				<th style="cursor: pointer"  onclick="sort('poDate');">
					<bean:message key='labels.poDate'/>
					<c:if test="${sortColumn == 'poDate'}">
						<c:if test="${sortOrderAsc}">▲</c:if>
						<c:if test="${!sortOrderAsc}">▼</c:if>
					</c:if>
				</th><!-- 発注日 -->
				<th style="cursor: pointer"  onclick="sort('supplierName');">
					<bean:message key='labels.supplierName'/>
					<c:if test="${sortColumn == 'supplierName'}">
						<c:if test="${sortOrderAsc}">▲</c:if>
						<c:if test="${!sortOrderAsc}">▼</c:if>
					</c:if>
				</th><!-- 仕入先名 -->
			</tr>
		</thead>
		<tbody>
		<c:forEach var="rowData" items="${searchResultList}" varStatus="s">
			<tr>
				<td style="text-align: center">
					<input type="checkbox" id="row_${f:h(s.index)}" tabindex="${(f:h(s.index)+1)*2+1000}"
					<c:if test="${rowData.printCount == 0}" >
						chacked="ture"
					</c:if>
					onclick="checkCount();"
					value="${f:h(rowData.poSlipId)}">
				</td>
				<td style="text-align: center">
					<c:if test="${rowData.printCount > 0}" >
						<span style="color:blue;">
						<bean:message key='words.adverb.already'/>
						</span>
					</c:if>
					<c:if test="${rowData.printCount == 0}" >
						<span style="color:red; font-weight: bold;">
						<bean:message key='words.adverb.yet'/>
						</span>
					</c:if>
				</td>

				<td style="">
					<input type="hidden" id="poSlipId_row_${f:h(s.index)}" value="${f:h(rowData.poSlipId)}">
					<c:if test='${isInputValid}'>
						<bean:define id="concatUrl" value="${'/porder/inputPOrder/load/?poSlipId='}${f:h(rowData.poSlipId)}" />
						<a href="javascript:window.location.doHref('${f:url(concatUrl)}');" >
							${f:h(rowData.poSlipId)}
						</a>
					</c:if>
					<c:if test='${!isInputValid}'>
						${f:h(rowData.poSlipId)}
					</c:if>
				</td>
				<td style="text-align: center">
					${f:h(rowData.poDate)}
				</td>
				<td style="">
					${f:h(rowData.supplierName)}
				</td>
			</tr>
		</c:forEach>
		</tbody>

		</table>

		<div style="position:absolute; width: 910px; text-align: center;">
			${sw:pageLink(searchResultCount,rowCount,pageNo)}
		</div>

		<div id="AllPoSlipIdList">
			<c:forEach var="searchResultList" items="${allSearchResultList}" varStatus="s"><input type="hidden" name="slipId" value="${f:h(searchResultList.poSlipId)}"></c:forEach>
		</div>