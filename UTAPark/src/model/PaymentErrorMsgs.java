package model;

public class PaymentErrorMsgs {
	private String errorMsg;
	private String namError;
	private String cardnumberError;
	private String cvvError;
	private String expirydateError;
	


	public PaymentErrorMsgs(){
		this.errorMsg = "";
		this.namError="";
		this.cardnumberError="";
		this.cvvError="";
		this.expirydateError="";
	}
	
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String action) {
		if(action.equals("payahead")) {
			if(!namError.equals("") || !cardnumberError.equals("") || !cvvError.equals("") || !expirydateError.equals("") )
				this.errorMsg = "Please correct the following errors";
		}
	}

	public String getNamError() {
		return namError;
	}

	public void setNamError(String nameError) {
		this.namError = nameError;
	}

	public String getCardnumberError() {
		return cardnumberError;
	}

	public void setCardnumberError(String cardnumberError) {
		this.cardnumberError = cardnumberError;
	}

	public String getCvvError() {
		return cvvError;
	}

	public void setCvvError(String cvvError) {
		this.cvvError = cvvError;
	}

	public String getExpirydateError() {
		return expirydateError;
	}

	public void setExpirydateError(String expirydateError) {
		this.expirydateError = expirydateError;
	}

}
