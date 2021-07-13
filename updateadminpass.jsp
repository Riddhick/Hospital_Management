<html>
    <%@ page import="java.sql.*"%>
    <head>
        <link rel="stylesheet" href="update.css">
    </head>
    <body>
        <% 
        String new_password=request.getParameter("password");
        String conf_password=request.getParameter("con_paswd");
        int flag=0;
        if(new_password.equals(conf_password)==false)
        {
            %><div class="message"><p class="text">Password Did not match.</p>
                <table>
                    <tr>
                <td><a href="updatepassword.html"><button>Retry</button></a></td>
                <td><a href="login.jsp"><button>Log in</button></a></td>
                </tr>
                </table>
                </div><%
        }
        else if(new_password=="")
        {
            %><div class="message"><p class="text">Password Can not be empty.</p>
                <table>
                    <tr>
                        <td><a href="updatepassword.html"><button>Retry</button></a></td>
                        <td><a href="login.jsp"><button>Log in</button></a></td>
                </tr>
                </table>
                </div><%
        }
        else
        {
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
            Statement st=con.createStatement();
                PreparedStatement stmt=con.prepareStatement("UPDATE admin set password=?");
                stmt.setString(1,new_password);
                int i=stmt.executeUpdate(); 
                con.close();
                response.sendRedirect("index.html");
         
        }
            catch(SQLException e)
            {
                out.println(e);
                e.printStackTrace();
            }
        }
        %>
    </body>

</html>