
<%
    Connection con =null;
   PreparedStatement ps=null;
        String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);
        String username=request.getParameter("username");
		String password=request.getParameter("password");
	    boolean status=verifyLogin1.checkLogin(accountno,username,password);
		//if(status==true){
		//	out.print("Welcome    " + username);
		try {
		if(status==true){
			out.print("Welcome    " + username);
		       Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akash","root","akashjain123");
			 ps=con.prepareStatement("delete from NEWACCOUNT where accountno=?");
                          ps.setInt(1,accountno);
			ps.executeUpdate();
			
			out.print("&nbsp;&nbsp;&nbsp;your account no '"+accountno+"' has closed.");

			//out.print("<html><body><A href='index.html'>Back</A></body></htm
                        response.setHeader("Refresh","10;URL=index.html");
				
			
		}
		else{
			out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
			%>
			<jsp:forward page="closeac1.jsp"></jsp:forward> 
			<% 
			}
		 }catch (SQLException e) {

			e.printStackTrace();
out.println(e);		
}
		
    	
			%>
 <%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="bank.*" %>


   
