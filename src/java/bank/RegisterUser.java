package bank;
import java.sql.*;

public class RegisterUser {
static int status=-6;
static PreparedStatement ps=null;
static Connection con=null;
//int accountno=1;
public static int register(int acc,String username,String password,String repassword,int amount,String adderess,String phone) throws SQLException{
	//public static int register(String email,String password,String gender,String country,String name){
             
	
	try {
               Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection
		   ("jdbc:mysql://localhost:3306/akash","root","akashjain123");
		ps = con.prepareStatement("Insert into NEWACCOUNT values(?,?,?,?,?,?,?)");
		ps.setInt(1,acc);
		ps.setString(2,username);
		ps.setString(3,password);
		ps.setString(4,repassword);
		ps.setInt(5,amount);
		ps.setString(6,adderess);
		ps.setString(7,phone);
		
		status=ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is:=="+e);
	}
	return status;
	
}
}
