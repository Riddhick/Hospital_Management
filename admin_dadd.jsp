<html>
    <%@ page import="java.sql.*" %>
    <body>
        <%
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
        Statement st=con.createStatement();
        String dept_name=request.getParameter("dept_name");
        PreparedStatement stmt=con.prepareStatement("insert into department (deptno,dname) values ((select max(deptno)+1 from department),?)");  
                stmt.setString(1,dept_name);  
                int i=stmt.executeUpdate();    
                 con.close();  
                 %>
                 <script>
                    alert(" New Department is Added" );
                    window.location = 'Admin.jsp;';
               </script> 
               <%
                //response.sendRedirect("index.html");
        } catch(SQLException e)
        {
            out.println(e);
            e.printStackTrace();
        }
    %>
    </body>
</html>