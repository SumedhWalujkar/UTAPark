package model;

import static org.junit.Assert.assertTrue;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import junitparams.FileParameters;
import junitparams.JUnitParamsRunner;


@RunWith(JUnitParamsRunner.class)

public class UpdateUserTest {
	UpdateUser updateUser;
	UpdateUserErrorMsgs errormsgs;

	@Before
	public void setUp() throws Exception {
		
		updateUser=new UpdateUser();
		errormsgs=new UpdateUserErrorMsgs();	
		
	}

	@FileParameters("src/model/UpdateUser.csv")
	@Test
	public void test(String action, String username, String prefix, String firstname, String lastname, String password, String cnfpassword, String phone, String dob, String age, String country, String	address, String	city, String  state, String pin, String dlexp, String dlcountry, String permittype, String	usertype, String ErrorMsg, String FirstNameError, String	LastNameError, String	PasswordError, String ConfirmPasswordError, String	PhoneError, String DobError, String AgeError, String CountryError, String AddressError, String CityError, String StateError, String PinError, String DlExpError, String DlCountryError) {
		updateUser.setUpdateUser(prefix, firstname, lastname, password, cnfpassword, phone, dob, age, country, address, city, state, pin, dlexp, dlcountry, permittype, usertype);
		updateUser.validateUpdateProfile(action, updateUser, errormsgs);
		System.out.println("##################################################");
		System.out.println(firstname);
		System.out.println(ErrorMsg+" @@ "+errormsgs.getErrorMsg());
		System.out.println(FirstNameError+" @@ "+(errormsgs.getFirstNameError()));
		System.out.println(LastNameError+"  @@ "+(errormsgs.getLastNameError()));
		System.out.println(PasswordError+" @@ "+(errormsgs.getPasswordError()));
		System.out.println(ConfirmPasswordError+" @@ "+(errormsgs.getConfirmPasswordError()));
		System.out.println(PhoneError+" @@ "+(errormsgs.getPhoneError()));
		System.out.println(DobError+" @@ "+(errormsgs.getDobError()));
		System.out.println(AgeError+" @@ "+(errormsgs.getFirstNameError()));
		System.out.println(CountryError+" @@ "+(errormsgs.getCountryError()));
		System.out.println(AddressError+" @@ "+(errormsgs.getAddressError()));
		System.out.println(CityError+" @@"+(errormsgs.getCityError()));
		System.out.println(StateError+" @@ "+(errormsgs.getStateError()));
		System.out.println(PinError+" @@ "+(errormsgs.getPinError()));
		System.out.println(DlExpError+" @@ "+(errormsgs.getDlExpError()));
		System.out.println(DlCountryError+" @@ "+(errormsgs.getDlCountryError()));
		
		assertTrue(ErrorMsg.equals(errormsgs.getErrorMsg()));
		assertTrue(FirstNameError.equals(errormsgs.getFirstNameError()));
		assertTrue(LastNameError.equals(errormsgs.getLastNameError()));
		assertTrue(PasswordError.equals(errormsgs.getPasswordError()));
		assertTrue(ConfirmPasswordError.equals(errormsgs.getConfirmPasswordError()));
		assertTrue(PhoneError.equals(errormsgs.getPhoneError()));
		assertTrue(DobError.equals(errormsgs.getDobError()));
		assertTrue(AgeError.equals(errormsgs.getFirstNameError()));
		assertTrue(CountryError.equals(errormsgs.getCountryError()));
		assertTrue(AddressError.equals(errormsgs.getAddressError()));
		assertTrue(CityError.equals(errormsgs.getCityError()));
		assertTrue(StateError.equals(errormsgs.getStateError()));
		assertTrue(PinError.equals(errormsgs.getPinError()));
		assertTrue(DlExpError.equals(errormsgs.getDlExpError()));
		assertTrue(DlCountryError.equals(errormsgs.getDlCountryError()));
		
		
	}

}
