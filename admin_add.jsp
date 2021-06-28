<html>
    <%@ page import="java.sql.*" %>
    <body>
        <%
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
        Statement st=con.createStatement();
        String doc_name=request.getParameter("doc_name");
        String day=request.getParameter("day");
        String time=request.getParameter("time");
        String capacity=request.getParameter("cap");
        String deptno=request.getParameter("dept_no");
        PreparedStatement stmt=con.prepareStatement("insert into doctor(doc_name , deptno, d_date , d_time , capacity) values(?,?,?,?,?)");  
                stmt.setString(1,doc_name);  
                stmt.setString(2,deptno); 
                stmt.setString(3,day);
                stmt.setString(4,time);
                stmt.setString(5,capacity);
                int i=stmt.executeUpdate();    
                 con.close();  
                 %>
                 <script>
                    alert(" New Doctor is Added" );
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