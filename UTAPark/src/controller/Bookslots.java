package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.UsersDAO;
import model.*;

/**
 * Servlet implementation class Bookslots
 */
@WebServlet("/Bookslots")
public class Bookslots extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bookslots() {
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
		double cost=0;
		int starthour=0;
		int startminutes=0;
		int endhour=0;
		int endminutes=0;
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		try{
		//System.out.println(action);
		if(action.equalsIgnoreCase("findspots")) {
			ArrayList<User> profileInDB = new ArrayList<User>();
			String username = (String) session.getAttribute("username");
			String permittype = (String) session.getAttribute("permittype");
			System.out.println(permittype);
			profileInDB = UsersDAO.getProfile(username);
			session.setAttribute("profile", profileInDB);
			Calendar calendar = Calendar.getInstance();
			int day = calendar.get(Calendar.DAY_OF_WEEK);
			int hour = Integer.parseInt(request.getParameter("hour"));
			int minutes= Integer.parseInt(request.getParameter("minutes"));
			int duration= Integer.parseInt(request.getParameter("time"));
			String cart = (request.getParameter("cart"));
			String camera= (request.getParameter("camera"));
			String history= (request.getParameter("history"));
			int phours=duration/60;
			if(cart.equals("YES")){
				cost=cost+18.95;
			}
			if(camera.equals("YES")){
				cost=cost+2.95;
			}
			if(history.equals("YES")){
				cost=cost+1.95;
			}
			cost=cost*1.0825;
			
			
			System.out.println(cost);
			int pminutes=duration%60;
			System.out.println(pminutes);
			int hour1=hour+phours;
			int minutes2=minutes+pminutes;
			int hourmin=minutes2/60;
			int mimmim =minutes2%60;
			starthour=hour;
			startminutes=minutes;
			endhour=hour1+hourmin;
			endminutes=mimmim;
			session.setAttribute("starthour", starthour);
			session.setAttribute("startminutes", startminutes);
			session.setAttribute("endhour", endhour);
			session.setAttribute("endminutes",endminutes);
			session.setAttribute("cost", cost);
			//System.out.println(starthour+" "+startminutes+" "+endhour+" "+endminutes);
			System.out.println("starthour="+(Integer) session.getAttribute("starthour"));
			if((day==7 && hour>=8 && hour<=16)||(day==1 && hour>=12 && hour<=16)||(day>=2 && day<=6)){
				if(permittype.equals("basic")){
				getServletContext().getRequestDispatcher("/Reservation2.jsp").forward(request, response);
				}
				else if(permittype.equals("midrange")){
				getServletContext().getRequestDispatcher("/Reservation3.jsp").forward(request, response);
				}
				else if(permittype.equals("premium")){
				getServletContext().getRequestDispatcher("/Reservation4.jsp").forward(request, response);
				}
				else if(permittype.equals("access")){
				getServletContext().getRequestDispatcher("/Reservation5.jsp").forward(request, response);
				}
				
				
			}
			else
			{
				request.setAttribute("errormessage","Please Select the correct timings");
				request.getRequestDispatcher("Reservation1.jsp").forward(request, response);
			}
		
		}if(action.equalsIgnoreCase("bookspots"))
		{	System.out.println("rfhgyhujnikm1");
		System.out.println("starthour="+(Integer) session.getAttribute("starthour"));
			ArrayList<User> profileInDB = new ArrayList<User>();
			String username = (String) session.getAttribute("username");
			String membership = (String) session.getAttribute("permittype");
			int Starthour=(Integer) session.getAttribute("starthour");
			System.out.println(Starthour);
			int Startminute=(Integer) session.getAttribute("startminutes");
			int Endhour=(Integer) session.getAttribute("endhour");
			int Endminute=(Integer) session.getAttribute("endminutes");
			profileInDB = UsersDAO.getProfile(username);
			session.setAttribute("profile", profileInDB);
			String spot=request.getParameter("parkings");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("rfhgyhujnikm2");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/utapark?autoReconnect=true&useSSL=false", "root", "Sumedh95");
			PreparedStatement ps = conn.prepareStatement("SELECT Count(parking_Area) from parkingspots where (parking_Area,parking_Number) NOT IN (SELECT parking_Area,parking_Number FROM reservations) AND membership_type=? and parking_Area=? Group by parking_Area;");
			ps.setString(1, membership);
			ps.setString(2, spot);
			ResultSet rs = ps.executeQuery();
			int val=0;
			while (rs.next()){
			val=Integer.parseInt(rs.getString(1));
			}
			PreparedStatement ps2 = conn.prepareStatement("Insert into reservations values (?,?,?,?,?,?,?,?);");
			ps2.setString(1, username);
			ps2.setString(2, spot);
			ps2.setInt(3, val);
			ps2.setInt(4, Starthour);
			ps2.setInt(5, Startminute);
			ps2.setInt(6, Endhour);
			ps2.setInt(7, Endminute);
			ps2.setDouble(8, (Double)session.getAttribute("cost"));
			
			ps2.executeUpdate();
			System.out.println("UPDATE parkingspots SET occupiedusername="+username+",starttime_hour="+starthour+",starttime_minutes="+startminutes+",endtime_hour="+endhour+",endtime_minutes="+endminutes+" WHERE parking_Area="+spot+" AND parking_Number="+val+";");
			System.out.println("rfhgyhujnikm");
		}
		
		}
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
