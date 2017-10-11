package bank;
import java.sql.*;
public class verifyLogin1 {

public static boolean checkLogin(int accountno,String username,String password) throws SQLException{
	boolean status=false;
	Connection con=null;	  
	try {
            
            Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection
		   ("jdbc:mysql://localhost:3306/akash","root","akashjain123");
		//PreparedStatement ps=con.prepareStatement("Select * from MAILCASTINGUSER where EMAILADD = ? and PASSWORD =?");
		PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=? and username = ? and password =?");
		ps.setInt(1,accountno);
		ps.setString(2,username);
		ps.setString(3,password);
		
		ResultSet rs=ps.executeQuery();
		status=rs.next();
                System.out.print("check login sataus"+status);
		
	} catch (Exception e) {
            
            System.out.println("Exception is:=="+e);
			}
	return status;
}
}
