<table><%
    	Connection con = null ; 
        Connection con1 = null ;
        Connection con2 = null ;
        Connection con3=null;
        PreparedStatement ps = null ;
       PreparedStatement ps1 = null ;
       PreparedStatement ps2 = null ;
       PreparedStatement ps3= null;
        String num=request.getParameter("accountno");
		int accountno=Integer.parseInt(num);
		
		
        String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String num1=request.getParameter("taccountno");
		int taccountno=Integer.parseInt(num1);
		
		String amoun=request.getParameter("amount");
		int accoun=Integer.parseInt(amoun);
		//accountno=taccountno;
	    boolean status=verifyLogin1.checkLogin(accountno,username,password);
		//if(status==true){
		//	out.print("Welcome    " + username);
		try {
		if(status==true){
			out.print("Welcome    " + username);
		    out.print("       TARGET ACCOUNT NO DOES NOT EXSIT -->    " + taccountno);
		    %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href='index.html'><IMG SRC='images/home1.gif'></IMG></A>
			<% 
			//Class.forName("com.mysql.jdbc.Driver");
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/akash","root","akashjain123");
			
			 ps=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+taccountno+"'");
			
            //ps.setInt(1,accountno);
			ResultSet rs=ps.executeQuery();
			int dataamount=0;
			
			if(rs.next()){
			dataamount=accoun+rs.getInt(5); 
			
			}
			//Class.forName("com.mysql.jdbc.Driver");
			 con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/akash","root","akashjain123");
		
		   ps1=con1.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+taccountno+"'");
			ps1.setInt(1,dataamount);
			ps1.executeUpdate();
			boolean rs1=ps1.execute();
		
			if(rs1==false)
                        {
			System.out.println("data amonut"+dataamount);
			request.setAttribute("target account A ",dataamount);
				//Class.forName("com.mysql.jdbc.Driver");
			 con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/akash","root","akashjain123");
		
			 ps2=con2.prepareStatement("Select * from NEWACCOUNT where accountno=?");
			
            ps2.setInt(1,accountno);
			ResultSet rs2=ps2.executeQuery();
			
			int dataamount1=0;
			if(rs2.next()){
			dataamount1=rs2.getInt(5)-accoun; 
			System.out.println(dataamount1);
			}
			//	Class.forName("com.mysql.jdbc.Driver");
			 con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/akash","root","akashjain123");
		
			
			 ps3=con3.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+accountno+"'");
			ps3.setInt(1,dataamount1);
			ps3.executeUpdate();
			boolean rs3=ps3.execute();
			
			if(rs3==false){
		
			request.setAttribute("target account A",dataamount);
			request.setAttribute("account B",dataamount1);	
			%>
			<jsp:forward page="tbalance.jsp"></jsp:forward> 
			<% 
		
			}
			
		}
		else{
			out.print("Please check your username and Password and target accountno");
			request.setAttribute("balance","Please check your username and Password and target acountno");
			%>
			<jsp:forward page="transfer1.jsp"></jsp:forward> 
			<% 
			}
		 }
}
             catch (Exception e) {
			e.printStackTrace();
out.println("Exception:"+e);
}
		
		
			%></table><%
%>
    	
    	
		 </table>


<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="bank.*" %>


   
