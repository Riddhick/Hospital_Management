<html>
    <%@ page import="java.sql.*" %>
    <head>
        <title>Delete Department</title>
    </head>
    <body>
        <% String d_id=request.getParameter("id");
        
      try
      {
           Class.forName("oracle.jdbc.driver.OracleDriver");
           Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
            out.println("connected");
            PreparedStatement stmt=con.prepareStatement("delete from department where deptno='"+d_id+"'");  
            int i=stmt.executeUpdate();   
            con.close();  
            response.sendRedirect("Admin.jsp");
        }
        catch(SQLException e)
        {
            out.println(e);
            e.printStackTrace();
        }
        %>
    </body>
</html>