package model;

import java.io.Serializable;
import data.UsersDAO;
import model.PaymentErrorMsgs;
import java.util.*;
import java.lang.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;


public class Payment implements Serializable{
	
	private String name = "";
	private String username = "";
	private String cardnumber = "";
	private String cardtype = "";
	private String cvv="";
	private String expirydate="";
	private double deductable=0;
	
	

	public void setPayment (String name,String username,String cardnumber,String cardtype,String cvv,String expirydate,double deductable){
		setName(name);
		setUsername(username);
		setCardnumber(cardnumber);
		setCardtype(cardtype);
		setCvv(cvv);
		setExpirydate(expirydate);
		setDeductable(deductable);
	}

	public double getDeductable() {
		return deductable;
	}

	public void setDeductable(double deductable) {
		this.deductable = deductable;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCardnumber() {
		return cardnumber;
	}
	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}
	public String getCardtype() {
		return cardtype;
	}
	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	public String getExpirydate() {
		return expirydate;
	}
	public void setExpirydate(String expirydate) {
		this.expirydate = expirydate;
	}
	
	public void validatePayment (String action, Payment payment, PaymentErrorMsgs errorMsgs){
		if(action.equals("payahead")) {
			errorMsgs.setNamError(validateFirst_name(action,payment.getName()));
			errorMsgs.setCardnumberError(validateCardnumber(action, payment.getCardnumber()));
			errorMsgs.setCvvError(validateCvv(action, payment.getCvv()));
			errorMsgs.setExpirydateError(validateExpirydate(action,payment.expirydate));
			errorMsgs.setErrorMsg(action);
			
		}
		
	}
		private String validateFirst_name(String action, String name) {
			String result = "";
			name = name.trim();
			if(!stringSize(name,6,45))
				result = "First Name must be between 6 and 45 characters";
			else if(!name.matches("^[a-zA-Z]+ [a-zA-z]+$"))
				result = "First Name must contain only characters";
			return result;
	}
		private String validateCardnumber(String action, String cardnumber) {
			String result = "";
			cardnumber = cardnumber.trim();
			if(!stringSize(cardnumber,16))
				result = "Card Number Name must have 16 digits";
			else if(!cardnumber.matches("^[0-9]+$"))
				result = "Card Number must contain only digits";
			return result;
		}
		private String validateCvv(String action, String cvv) {
			String result = "";
			cvv = cvv.trim();
			if(!stringSize(cvv,3,4))
				result = "Card Number Name must have 3 to 4 digits";
			else if(!cardnumber.matches("^[0-9]+$"))
				result = "Card Number must contain only digits";
			return result;
		}
		private String validateExpirydate(String action, String expirydate) {
			String result = "";
			expirydate = expirydate.trim();
			if(!expirydate.matches("^\\d{4}-\\d{2}$"))
				result = "Invalid date format";
			return result;
		}
		
		
		private boolean stringSize(String string, int min, int max) {
			return string.length()>=min && string.length()<=max;
		}
		
		private boolean stringSize(String string, int min) {
			return string.length()==min;
		}
}
