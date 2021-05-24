<%@ page import="java.sql.*"%>
<body>
   <% try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
        //out.println("connected");
    }
    catch(SQLException e)
    {
        out.println(e);
        e.printStackTrace();
    }
    %>
</body> 