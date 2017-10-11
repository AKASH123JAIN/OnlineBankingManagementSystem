package bank;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class CreateServlet extends HttpServlet {
	int status;
        int acc;
        @Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		acc=Integer.parseInt(request.getParameter("account"));
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String  repassword=request.getParameter("repassword");
		
		String amoun=request.getParameter("amount");
		int  amount=Integer.parseInt(amoun);
		
		String adderess=request.getParameter("address");
		
		String phone=request.getParameter("phone");
		
		//double mname=Double.parseDouble(num);
		//String country=request.getParameter("country");
		
	    
            try {
                status = RegisterUser.register(acc,username, password, repassword, amount, adderess,phone);
            } catch (SQLException ex) {
                Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
	   
	    
		if(status>0){
			out.print("WELCOME! YOUR ACCOUNT HAS OPENED");
			//RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			//rd.include(request, response);
		}
		else{
			out.print("Sorry,Registration failed. please try later");
			//RequestDispatcher rd=request.getRequestDispatcher("MyHtml.html");
			//rd.include(request, response);
		}
		
	out.close();	
	}

}
