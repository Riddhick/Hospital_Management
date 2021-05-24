<html>
<%@ page import="java.sql.*" %>
<body>
    <% String name=request.getParameter("username");
        session.setAttribute("name", name);
       String password=request.getParameter("password");
       String isLoggedin="hello";
       int flag=0;
      // if(name==""||password=="")
       // response.sendRedirect("loginfailed.html");
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
            //out.println("connected");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM patient");
            while(rs.next())
            {
                if(rs.getString("username").equals("admin")&&rs.getString("password").equals(password))
                {
                    flag=1;
                    //out.println("Welcome:  " + name);
                  isLoggedin="true";
                    response.sendRedirect("Admin.html");
                    con.close(); 
                }
                else if(rs.getString("username").equals(name)&&rs.getString("password").equals(password))
                {
                    flag=1;
                    //out.println("Welcome:  " + name);
                    isLoggedin="true";
                    out.print(isLoggedin);
                    session.setAttribute("isLoggedin", isLoggedin);
                    response.sendRedirect("welcome.jsp");
                    con.close();
                }
            }
            session.setAttribute("isLoggedin", isLoggedin);
            if(flag==0)
            con.close();
            %>
            <script>
                alert("Login failed");
                location="login.jsp";
            </script>
            <%
           
        }
        catch(SQLException e)
        {
           // out.println("Can't Connect");
            e.printStackTrace();
        }
        
        %>
       
</body>
</htm>