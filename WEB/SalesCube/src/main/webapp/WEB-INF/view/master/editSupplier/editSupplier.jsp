<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ja">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><bean:message key='titles.system'/>　仕入先マスタ管理（登録・編集）</title>

	<%@ include file="/WEB-INF/view/common/header.jsp" %>

	<script type="text/javascript">
	<!--
    function init() {
    }

    // ファンクションキーとのマッピング
    function onF1() { initForm(); }
    function onF2() { backToSearch(); }
    function onF3() { registerSupplier(); }
    function onF4() { deleteSupplier(); }
    function onF5() { openMasterDefaultSettingDialog('master', 'SUPPLIER_MST'); }

    function addSupplier() {
    	if(confirm("<bean:message key='confirm.newrecord'/>")){
    		window.location.doHref("${f:url("/master/editSupplier")}");
        }
    }

    function setZipCode(id, map) {
        $("#supplierZipCode").val(map["zipCode"]);
        $("#supplierAddress1").val(map["zipAddress1"]);
        $("#supplierAddress2").val(map["zipAddress2"]);
    }

    function searchZipCodeDirect() {
		// 入力チェック
		var val = $("#supplierZipCode").val();
		if (!val) {
			return;
		}

		// 検索実行
		$("#errors").empty();
		var data = {"zipCode" : val};
		asyncRequest(contextRoot + "/ajax/master/searchZipCodeAjax/search", data,
			function(data) {
				var results = eval(data);
				if (results.length!=1) {
					var message = "<bean:message key="warns.zipcode.notidentical" arg0="仕入先"/>";
					$("#errors").append(message);
				}
				else {
					$("#supplierZipCode").val(results[0].zipCode);
					$("#supplierAddress1").val(results[0].zipAddress1);
					$("#supplierAddress2").val(results[0].zipAddress2);
				}
			}
		);
	}

    function initForm() {
    	if(confirm("<bean:message key='confirm.init'/>")){
    		location.doHref(contextRoot + "/master/editSupplier/");
        }
    }

    function backToSearch() {
    	if(confirm("<bean:message key='confirm.master.supplier.back'/>")){
            location.doHref(contextRoot + "/master/searchSupplier/");
        }
    }

    function registerSupplier() {
        <c:if test="${!editMode}">
    	if(confirm("<bean:message key='confirm.insert'/>")){
        	$("#editSupplierForm").attr("action", "${f:url("/master/editSupplier/insert")}");
        </c:if>
        <c:if test="${editMode}">
    	if(confirm("<bean:message key='confirm.update'/>")){
        	$("#editSupplierForm").attr("action", "${f:url("/master/editSupplier/update")}");
        </c:if>
    	$("#editSupplierForm").trigger("submit");
        }
    }

    function deleteSupplier() {
    	if(confirm("<bean:message key='confirm.delete'/>")){
        	$("#editSupplierForm").attr("action", "${f:url("/master/editSupplier/delete")}");
        	$("#editSupplierForm").trigger("submit");
        }
    }

	-->
	</script>
	<script type="text/javascript" src="./scripts/common.js"></script>
</head>
<body onhelp="return false;" onload="init()">


<%@ include file="/WEB-INF/view/common/titlebar.jsp" %>


<jsp:include page="/WEB-INF/view/common/menubar.jsp">
	<jsp:param name="PARENT_MENU_ID" value="0013"/>
	<jsp:param name="MENU_ID" value="1303"/>
</jsp:include>

<!-- メイン機能 -->
<s:form styleId="editSupplierForm" onsubmit="return false;">
<div id="main_function">

	<span class="title">仕入先</span>

	<div class="function_buttons">
		<button tabindex="2000" onclick="initForm()"> F1<br>初期化</button>
		<button tabindex="2001" onclick="backToSearch()">F2<br>戻る</button>
<c:if test="${!isUpdate}">
		<button tabindex="2002" disabled="true">F3<br>更新</button>
</c:if>
<c:if test="${isUpdate}">
	<c:if test="${editMode}">
		<button tabindex="2002" onclick="registerSupplier()">F3<br>更新</button>
    </c:if>
	<c:if test="${!editMode}">
		<button tabindex="2002" onclick="registerSupplier()">F3<br>登録</button>
    </c:if>
</c:if>
<c:if test="${!isUpdate}">
		<button tabindex="2003" disabled="disabled">F4<br>削除</button>
</c:if>
<c:if test="${isUpdate}">
	<c:if test="${editMode}">
		<button tabindex="2003" onclick="deleteSupplier()">F4<br>削除</button>
    </c:if>
	<c:if test="${!editMode}">
		<button tabindex="2003" disabled="disabled">F4<br>削除</button>
    </c:if>
</c:if>
<c:if test="${!isUpdate}">
		<button tabindex="2004" disabled="disabled">F5<br>初期値</button>
</c:if>
<c:if test="${isUpdate}">
	<c:if test="${!editMode}">
		<button tabindex="2004" onclick="openMasterDefaultSettingDialog('master', 'SUPPLIER_MST')">F5<br>初期値</button>
    </c:if>
	<c:if test="${editMode}">
		<button tabindex="2004" disabled="disabled">F5<br>初期値</button>
    </c:if>
</c:if>
		<button disabled="disabled">F6<br>&nbsp;</button>
		<button disabled="disabled">F7<br>&nbsp;</button>
		<button disabled="disabled">F8<br>&nbsp;</button>
		<button disabled="disabled">F9<br>&nbsp;</button>
		<button disabled="disabled">F10<br>&nbsp;</button>
		<button disabled="disabled">F11<br>&nbsp;</button>
		<button disabled="disabled">F12<br>&nbsp;</button>
	</div>

	<div class="function_forms">
	<div id="errors" style="color: red" style="padding-left: 20px"><html:errors/></div>
	<div style="padding-left: 20px;color: blue;">
	<html:messages id="msg" message="true">
		<bean:write name="msg" ignore="true"/><br>
	</html:messages>
	</div>

		<span>仕入先情報</span><br>
		<table id="supplier_info" class="forms" summary="仕入先情報">
			<colgroup>
				<col span="1" style="width: 13%">
				<col span="1" style="width: 20%">
				<col span="1" style="width: 13%">
				<col span="1" style="width: 20%">
				<col span="1" style="width: 13%">
				<col span="1" style="width: 20%">
			</colgroup>
			<tr>
				<th>仕入先コード<bean:message key='labels.must'/></th>
				<td>
	<c:if test="${editMode}">
                <html:text maxlength="9" styleId="supplierCode" property="supplierCode" style="width: 120px"  tabindex="100" readonly="true" styleClass="c_disable"/>
    </c:if>
	<c:if test="${!editMode}">
                <html:text maxlength="9" styleId="supplierCode" property="supplierCode" style="width: 120px;ime-mode:disabled;"  tabindex="100"/>
    </c:if>
                </td>
				<th>仕入先名<bean:message key='labels.must'/></th>
				<td><html:text maxlength="60" property="supplierName" style="width: 200px" tabindex="101"/></td>
				<th>仕入先名カナ<bean:message key='labels.must'/></th>
				<td><html:text maxlength="60" property="supplierKana" style="width: 200px" tabindex="102"/></td>
			</tr>
			<tr>
				<th>仕入先略称</th>
				<td><html:text maxlength="14" property="supplierAbbr" style="width: 200px" tabindex="103"/></td>
				<th>F.O.B</th>
				<td colspan="3"><html:text maxlength="60" property="fobName" style="width: 200px" tabindex="104"/></td>
			</tr>
		</table>

		<table class="forms" style="width: 910px" summary="仕入先情報2">
			<colgroup>
				<col span="1" style="width: 10%">
				<col span="1" style="width: 20%">
				<col span="1" style="width: 10%">
				<col span="1" style="width: 25%">
				<col span="1" style="width: 10%">
				<col span="1" style="width: 12%">
				<col span="1" style="width: 10%">
				<col span="1" style="width: 13%">
			</colgroup>
			<tr>
				<th>郵便番号<bean:message key='labels.must'/></th>
				<td><html:text maxlength="8" styleId="supplierZipCode" property="supplierZipCode" style="width:70px;ime-mode:disabled;" tabindex="200" onfocus="this.curVal=this.value;" onblur="if(this.curVal!=this.value){searchZipCodeDirect();}"/>
                <html:image tabindex="201" src='${f:url("/images/icon_04_02.gif")}'style="vertical-align: middle; cursor: pointer;" onclick="openSearchZipDialog('supplier', setZipCode);$('#supplier_zipCode').val($('#supplierZipCode').val());" />
				<th>住所１<bean:message key='labels.must'/></th>
				<td><html:text maxlength="50" styleId="supplierAddress1" property="supplierAddress1" tabindex="202" style="width: 250px"/></td>
				<th>住所２</th>
				<td><html:text maxlength="50" styleId="supplierAddress2" property="supplierAddress2" tabindex="203" style="width: 250px"/></td>
			</tr>
			<tr>
				<th>担当者</th>
				<td><html:text maxlength="60" styleId="supplierPcName" property="supplierPcName" style="width: 150px" tabindex="204"/></td>
				<th>担当者カナ</th>
				<td><html:text maxlength="60" styleId="supplierPcKana" property="supplierPcKana" style="width: 150px" tabindex="205"/></td>
				<th>敬称<bean:message key='labels.must'/></th>
				<td>
                    <html:select styleId="supplierPcPreCategory" property="supplierPcPreCategory" tabindex="206">
                        <html:options collection="supplierPcPreTypeCategoryList" property="value" labelProperty="label"/>
					</html:select>
				</td>
			</tr>
			<tr>
                <th>部署名</th>
                <td><html:text maxlength="60" styleId="supplierDeptName" property="supplierDeptName" style="width:150px" tabindex="207"/></td>
                <th>役職</th>
                <td colspan="3"><html:text maxlength="30" styleId="supplierPcPost" property="supplierPcPost" style="width:400px" tabindex="208"/></td>
			</tr>
			<tr>
				<th>TEL</th>
				<td><html:text maxlength="15" styleId="supplierTel" property="supplierTel" style="width:150px;ime-mode:disabled;" tabindex="209"/>
				<th>FAX</th>
				<td colspan="3"><html:text maxlength="15" styleId="supplierFax" property="supplierFax" style="width:150px;ime-mode:disabled;" tabindex="210"/></td>
			</tr>
			<tr>
				<th>E-MAIL</th>
				<td colspan="5"><html:text maxlength="255" styleId="supplierEmail" property="supplierEmail" style="width:400px;ime-mode:disabled;" tabindex="211"/></td>
			</tr>
		</table>


		<table class="forms" style="width: 910px" summary="仕入先情報3">
			<colgroup>
				<col span="1" style="width: 12%">
				<col span="1" style="width: 13%">
				<col span="1" style="width: 12%">
				<col span="1" style="width: 13%">
				<col span="1" style="width: 12%">
				<col span="1" style="width: 13%">
				<col span="1" style="width: 12%">
				<col span="1" style="width: 13%">
			</colgroup>
			<tr>
				<th>取引区分<bean:message key='labels.must'/></th>
				<td>
                    <html:select styleId="supplierCmCategory" property="supplierCmCategory" tabindex="300">
                        <html:options collection="supplierCmCategoryList" property="value" labelProperty="label"/>
					</html:select>
				</td>
				<th>税転稼<bean:message key='labels.must'/></th>
				<td>
                    <html:select styleId="taxShiftCategory" property="taxShiftCategory" tabindex="301">
                        <html:options collection="taxShiftCategoryList" property="value" labelProperty="label"/>
					</html:select>
				</td>
				<th>支払方法<bean:message key='labels.must'/></th>
				<td>
                    <html:select styleId="paymentTypeCategory" property="paymentTypeCategory" tabindex="302">
                        <html:options collection="paymentTypeCategoryList" property="value" labelProperty="label"/>
					</html:select>
				</td>
				<th>支払間隔<bean:message key='labels.must'/></th>
				<td>
                    <html:select styleId="paymentCycleCategory" property="paymentCycleCategory" tabindex="303">
                        <html:options collection="paymentCycleCategoryList" property="value" labelProperty="label"/>
					</html:select>
				</td>
			</tr>
			<tr>
				<th>最終締処理日</th>
				<td><html:text styleId="lastCutoffDate" property="lastCutoffDate" style="width:100px" tabindex="304" styleClass="c_disable" readonly="true"/>
				<th>支払日</th>
				<td><html:text styleId="paymentDate" property="paymentDate" style="width:100px" tabindex="305" styleClass="c_disable" readonly="true"/>
				<th>レート</th>
				<td>
                    <html:select styleId="rateId" property="rateId" tabindex="306">
                        <html:options collection="rateList" property="value" labelProperty="label"/>
					</html:select>
				</td>
				<th>振込方法<bean:message key='labels.must'/></th>
				<td>
                    <html:select styleId="transferTypeCategory" property="transferTypeCategory" tabindex="307">
                        <html:options collection="transferTypeCategoryList" property="value" labelProperty="label"/>
					</html:select>
				</td>
			</tr>
		</table>

		<table class="forms" style="width: 910px" summary="仕入先情報3">
			<colgroup>
				<col span="1" style="width: 12%">
				<col span="1" style="width: 13%">
				<col span="1" style="width: 12%">
				<col span="1" style="width: 63%">
			</colgroup>
			<tr>
				<th>発注伝票発行</th>
				<td>
					<html:checkbox styleId="poSlipComeoutCategory" property="poSlipComeoutCategory" value="1" tabindex="402"/>発行する
				</td>
				<th>手数料負担<bean:message key='labels.must'/></th>
				<td>
                    <html:select styleId="serviceChargeCategory" property="serviceChargeCategory" tabindex="403">
                        <html:options collection="serviceChargeCategoryList" property="value" labelProperty="label"/>
					</html:select>
				</td>
			</tr>
		</table>
		<html:hidden property="taxFractCategory" />
		<html:hidden property="priceFractCategory" />

		<table class="forms" style="width: 910px" summary="仕入先情報4">
			<colgroup>
				<col span="1" style="width: 10%">
				<col span="1" style="width: 90%">
			</colgroup>
			<tr>
				<th>備考</th>
				<td><html:text maxlength="120" styleId="remarks" property="remarks" style="width:600px" tabindex="405"/></td>
			</tr>
			<tr>
				<th>コメント</th>
				<td><html:text maxlength="1000" styleId="commentData" property="commentData" style="width:600px" tabindex="406"/></td>
			</tr>
		</table>

		<div style="text-align: right; width: 910px">
			<span>登録日：${creDatetmShow}　更新日:${updDatetmShow}　</span>
			<button tabindex="800" onclick="initForm()">初期化</button>
<c:if test="${!isUpdate}">
            <button tabindex="801" disabled="true">更新</button>
</c:if>
<c:if test="${isUpdate}">
	<c:if test="${editMode}">
            <button tabindex="801" onclick="registerSupplier()">更新</button>
    </c:if>
	<c:if test="${!editMode}">
            <button tabindex="801" onclick="registerSupplier()">登録</button>
    </c:if>
</c:if>
<c:if test="${!isUpdate}">
		<button tabindex="802" disabled="true">削除</button>
</c:if>
<c:if test="${isUpdate}">
	<c:if test="${editMode}">
		<button tabindex="802" onclick="deleteSupplier()">削除</button>
    </c:if>
	<c:if test="${!editMode}">
		<button tabindex="802" disabled="true">削除</button>
    </c:if>
</c:if>
		</div>

	</div>
</div>

<html:hidden property="creDatetm"/>
<html:hidden property="creDatetmShow"/>
<html:hidden property="updDatetm"/>
<html:hidden property="updDatetmShow"/>
</s:form>
</body>

</html>
