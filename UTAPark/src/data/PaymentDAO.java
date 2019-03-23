package data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Payment;
import util.SQLConnection;


public class PaymentDAO {

	public static void StorePaymentInDB (Payment payment,String queryString){
		Statement stmt = null;
		Connection conn = SQLConnection.getDBConnection();  
		try {
			stmt = conn.createStatement();
			
			String insertPayment = queryString + " VALUES ('"  
					+ payment.getName()  + "','"
					+ payment.getUsername() + "','"		
					+ payment.getCardnumber() + "','"
					+ payment.getCvv() + "','"
					+ payment.getExpirydate() + "',"
					+ payment.getDeductable() + ")";
			stmt.executeUpdate(insertPayment);	
			conn.commit(); 
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				stmt.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}};
		
	}
	
	public static void insertPayment(Payment payment){  
		StorePaymentInDB(payment,"INSERT INTO Payments (name, username, cardnumber, cvv, expirydate,deductable) ");
	} 
	
}
