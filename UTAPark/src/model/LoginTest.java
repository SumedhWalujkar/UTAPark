package model;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import junitparams.FileParameters;
import junitparams.JUnitParamsRunner;
import model.Login;

@RunWith(JUnitParamsRunner.class)
public class LoginTest {

	Login login;
	@Before
	public void setUp() throws Exception {
		login=new Login();
	}

	@Test
	@FileParameters("src/model/ValidateUser.csv")
	public void ValidateUsernameTest(String action,String username, String result ) {
		
		assertEquals(result,login.validateUser_name(action, username));
		
	}
	
	@Test
	@FileParameters("src/model/ValidatePassword.csv")
	public void ValidatepasswordTest(String action,String password, String result ) {
		
		assertEquals(result,login.validatePassword(action, password));
		
	}

}
