package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.PaymentDAO;
import data.UsersDAO;
import model.Payment;
import model.PaymentErrorMsgs;
import model.User;
import model.UserErrorMsgs;

/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/PaymentController")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private void getPaymentParam (HttpServletRequest request, Payment payment) {
		HttpSession session = request.getSession();
		payment.setPayment(request.getParameter("name"),(String)session.getAttribute("username"), request.getParameter("cardnumber"),request.getParameter("cardtype"), request.getParameter("cvv"), request.getParameter("expirydate"), (Double)session.getAttribute("cost"));  
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action"), url="";
		HttpSession session = request.getSession();
		Payment payment = new Payment();
		PaymentErrorMsgs PerrorMsgs = new PaymentErrorMsgs();
		////System.out.println("1");
		
		if (action.equalsIgnoreCase("payahead") ) {
			////System.out.println("2");
			getPaymentParam(request,payment);
			payment.validatePayment(action,payment,PerrorMsgs);
			session.setAttribute("payment", payment);
			////System.out.println();
			if(!PerrorMsgs.getErrorMsg().equals("")) {
				getPaymentParam(request,payment);
				session.setAttribute("error", PerrorMsgs);
				////System.out.println("4");
				response.sendRedirect("payment.jsp");
			}
		else
		{
			PaymentDAO.insertPayment(payment);
			////System.out.println("5");
			response.sendRedirect("success.jsp");
		}
	}

}}
