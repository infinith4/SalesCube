<%@page import="jp.co.arkinfosys.common.Constants"%>
<div id="${dialogId}_DEPOSIT_copy" style="display: none;">
	<form style="margin: 0px;">
		<span>入金伝票検索</span>
		<table class="forms" style="width: 550px;" summary="入金伝票検索条件">
			<colgroup>
				<col span="1" style="width: 15%">
				<col span="1" style="width: 30%">
				<col span="1" style="width: 15%">
				<col span="1" style="width: 40%">
			</colgroup>
			<tr>
				<th>入金番号</th>
				<td colspan="3">
					<input type="text"
						id="${dialogId}_depositCondition.depositSlipId" name="${dialogId}_depositCondition.depositSlipId"
						value="" tabindex="14001" size="15" style="ime-mode: disabled;">
				</td>
			</tr>
			<tr>
				<th>入金日</th>
				<td colspan="3">
					<input type="text"
						id="${dialogId}_depositCondition.depositDateFrom" name="${dialogId}_depositCondition.depositDateFrom"
						class="date_input" value="${dateFrom}" tabindex="14002" size="15"> ～
					<input type="text"
						id="${dialogId}_depositCondition.depositDateTo" name="${dialogId}_depositCondition.depositDateTo"
						class="date_input" value="" tabindex="14003" size="15">
				</td>
			</tr>
			<tr>
				<th>顧客コード</th>
				<td><input type="text"
					id="${dialogId}_depositCondition.customerCode" name="${dialogId}_depositCondition.customerCode"
					value="" tabindex="14004" size="15" style="ime-mode: disabled;" maxlength="<%=Constants.CODE_SIZE.CUSTOMER%>"></td>
				<th>顧客名</th>
				<td><input type="text"
					id="${dialogId}_depositCondition.customerName" name="${dialogId}_depositCondition.customerName"
					value="" tabindex="14005" size="15"></td>
			</tr>

		</table>

		<div style="width: 550px; text-align: right">
			<button type="reset" style="width: 70px" tabindex="14050" onclick="$('#${dialogId}_errors').empty();">初期化</button>
			<button type="button" style="width: 70px" tabindex="14051"
				onclick="$('#${dialogId}_copyButton').attr('disabled', true);
					_searchCopySlip( '${dialogId}', 'DEPOSIT' );">検索</button>
		</div>
	</form>

	<div id="${dialogId}_DEPOSIT_ListContainer">
		検索結果件数： 0件
		<div style="padding: 0px; border: none; width: 550px; height: 250px; overflow: hidden;">
			<table id="${dialogId}_DEPOSIT_List" summary="伝票検索結果" style="width: 540px;">
				<colgroup>
					<col span="1" style="width: 5%">
					<col span="1" style="width: 15%">
					<col span="1" style="width: 15%">
					<col span="1" style="width: 15%">
					<col span="1" style="width: 50%">
				</colgroup>
				<tr>
					<th>&nbsp;</th>
					<th>入金番号</th>
					<th>入金日</th>
					<th>顧客コード</th>
					<th>顧客名</th>
				</tr>
			</table>
		</div>
	</div>

</div>