<html>
    <%@ page import="java.sql.*"%>
    <body>
        <% String id=request.getParameter("id");
        String count=request.getParameter("cap");
        int finalid=Integer.parseInt(id);
        try{
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
         PreparedStatement stmt=con.prepareStatement("update doctor set d_date=? where doc_id="+finalid+"");
         stmt.setString(1,count);
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