<html>
    <%@ page import="java.sql.*" %>
    <head>
        <title>Cancel Booking</title>
    </head>
    <body>
        <% String b_id=request.getParameter("bookingid");
        String d_id=request.getParameter("doctoridid");
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
            //out.println("connected");
            PreparedStatement stmt=con.prepareStatement("delete from booking where booking_id='"+b_id+"'");  
            int i=stmt.executeUpdate();   
            PreparedStatement stmt2=con.prepareStatement("UPDATE doctor set capacity=capacity+1 WHERE doc_id='"+d_id+"'"); 
            int j=stmt2.executeUpdate(); 
            con.close();  
            response.sendRedirect("welcome.jsp");
        }
        catch(SQLException e)
        {
            out.println(e);
            e.printStackTrace();
        }
        %>
    </body>
</html>