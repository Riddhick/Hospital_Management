<html>
    <%@ page import="java.sql.*" %>
    <body>
        <% String pass=request.getParameter("password");
            int flag=0;
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
            //out.println("connected");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM admin");
            while(rs.next())
            {
                if(rs.getString("password").equals(pass))
                {
                    response.sendRedirect("Admin.jsp");
                    con.close();
                }
                else{
                    %>
                    <script>
                        alert("Wrong Password");
                        location="index.html";
                    </script>
                    <%
                }
            }
            }
            catch(SQLException e)
            {
               // out.println("Can't Connect");
                e.printStackTrace();
            }    
        %>
    </body>
</html>