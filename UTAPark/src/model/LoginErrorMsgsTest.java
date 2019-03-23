package model;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import junitparams.FileParameters;
import junitparams.JUnitParamsRunner;
import model.Login;

@RunWith(JUnitParamsRunner.class)
public class LoginErrorMsgsTest {
	LoginErrorMsgs lerrorm;
	@Before
	public void setUp() throws Exception {
		lerrorm=new LoginErrorMsgs();
	}

	@Test
	public void getErrorMsgtest() {
		
	}

}
