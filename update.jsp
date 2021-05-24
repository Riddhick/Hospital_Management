<html>
    <%@ page import="java.sql.*"%>
    <head>
        <link rel="stylesheet" href="update.css">
    </head>
    <body>
        <% String name=request.getParameter("username");
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
            ResultSet rs=st.executeQuery("SELECT username FROM patient where username='"+name+"'");
            if(rs.next())
           {
     
                    flag=1;
                                 
            }
            if(flag==1)
            {
                PreparedStatement stmt=con.prepareStatement("UPDATE patient set password=? WHERE username='"+name+"'");
                stmt.setString(1,new_password);
                int i=stmt.executeUpdate(); 
                con.close();
                response.sendRedirect("index.html");
            }
            else
            {
                %><div class="message"><p class="text">User name does not exist.</p>
                <table>
                    <tr>
                        <td><a href="updatepassword.html"><button>Retry</button></a></td>
                        <td><a href="login.jsp"><button>Log in</button></a></td>
                </tr>
                </table>
                </div><%
                con.close();
            }
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