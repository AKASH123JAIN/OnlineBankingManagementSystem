<table>
		<tr>
			<td align="center" valign="middle" bgcolor="red"><h4>Account Info</h4></td>
		</tr>
		<tr>
			<td>
			<%if(request.getAttribute("balance")!=null)
			{
			out.print(request.getAttribute("balance"));
			out.print(request.getAttribute("totaldataamount"));
			}
			
			 %>
				</td>
		</tr>

 

    		</table><%
%>
    	
    	
		 
 
	
</html>