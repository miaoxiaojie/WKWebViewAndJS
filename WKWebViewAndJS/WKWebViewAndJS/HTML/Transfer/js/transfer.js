function fn(){
		alert(1)
	}
function selectTheReceivingBank(){
	var bankCards=["中国工商银行","中国农业银行","平安银行","建设银行","邮政银行"];
	var sendStrs = {
		"callback":"selectBankResult",
		"title":"选择银行卡",
		"cards":bankCards
	};
	var str = JSON.stringify(sendStrs)
	  window.webkit.messageHandlers.selectBank.postMessage(str);  
}
function selectBankResult(date){
	var dic = JSON.parse(date);
	var bank = document.getElementById("transfer-BankCard-button");
	bank.innerHTML = dic.bank;
}
function submit(){
	var name = document.getElementById("transfer-text-name").value;
	var account = document.getElementById("transfer-text-account").value;
	var bankCard = document.getElementById("transfer-BankCard-button");
	if(name == "" || name == null){
		alert("户名为空");
	    return;
	}if(account == "" || account == null){
		alert("账号为空");
		return;
	}if(bankCard.innerText == "请选择收款银行"){
		alert("请选择收款银行");
		return;
	}
	alert(bankCard.innerText);
	alert("提交")
}
