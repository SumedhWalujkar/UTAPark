package model;

import static org.junit.Assert.assertTrue;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import junitparams.FileParameters;
import junitparams.JUnitParamsRunner;


@RunWith(JUnitParamsRunner.class)
public class PaymentTest {
	Payment payment;
	PaymentErrorMsgs errorMsgs;

	@Before
	public void setUp() throws Exception {
		payment = new Payment();
		errorMsgs = new PaymentErrorMsgs();
	}

	@Test
	@FileParameters("src/model/Payment.csv")
	public void test(String action,String name,String username,String cardnumber, String cardtype, String cvv,String expirydate,double deductable, String errormsgs, String nameerrormsgs, String cardnumbererrormsgs, String cvverrormsgs, String expirydateerrormsgs) {
		payment.setPayment(name, username, cardnumber, cardtype, cvv, expirydate, deductable);
		payment.validatePayment(action, payment, errorMsgs);
		
		System.out.println(errormsgs);
		System.out.println(errorMsgs.getErrorMsg());
		System.out.println(nameerrormsgs);
		System.out.println(errorMsgs.getNamError());
		System.out.println(cardnumbererrormsgs);
		System.out.println(errorMsgs.getCardnumberError());
		System.out.println(cvverrormsgs);
		System.out.println(errorMsgs.getCvvError());
		System.out.println(expirydateerrormsgs);
		System.out.println(errorMsgs.getExpirydateError());
		System.out.println("###########");
		assertTrue(errormsgs.equals(errorMsgs.getErrorMsg()));
		assertTrue(nameerrormsgs.equals(errorMsgs.getNamError()));
		assertTrue(cardnumbererrormsgs.equals(errorMsgs.getCardnumberError()));
		assertTrue(cvverrormsgs.equals(errorMsgs.getCvvError()));
		assertTrue(expirydateerrormsgs.equals(errorMsgs.getExpirydateError()));
		
		
	}

}
