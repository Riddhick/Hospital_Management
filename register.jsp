<html>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <body>
        <% String uname=request.getParameter("username");
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String new_password=request.getParameter("password");
        String conf_password=request.getParameter("con_paswd");
        int flag=0;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT username FROM patient where username='"+uname+"'");
            if(rs.next())
           {
     
                    flag=1;
                    con.close();
                    response.sendRedirect("signup.html");
               
            }
            if(flag==0)
            {
                PreparedStatement stmt=con.prepareStatement("insert into patient values(?,?,?,?)");  
                stmt.setString(1,uname);  
                stmt.setString(2,name); 
                stmt.setString(3,new_password);
                stmt.setString(4,email);
                int i=stmt.executeUpdate();    
                 con.close();  
                 %>
                 <script>
                    alert(" Account is Created" );
                    window.location = 'index.html;';
               </script> 
               <%
                //response.sendRedirect("index.html");
            }
        }
        catch(SQLException e)
        {
            out.println(e);
            e.printStackTrace();
        }
        %>
    </body>
</html>