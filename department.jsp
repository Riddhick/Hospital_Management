<html>
    <%@ page import="java.sql.*" %>
    <head>
        <title>
           Departments
        </title>
        <link href="style.css" rel="stylesheet">
        <link href="user.css" rel="stylesheet">
        <link href="doctor.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Architects+Daughter&display=swap" rel="stylesheet">
    </head>
    <body>
        <header>
            <ul >
                <li class="nav-bar"><button id="nav-btn">SERVICES</button></li>
                <li class="nav-bar"><a href="department.jsp"><button id="nav-btn">DEPARTMENTS</button></a></li>
                <li class="nav-bar" id="nav_p_btn"><button id="nav-btn" id="nav_p_btn">PATIENT</button>
                    <ul id="p-list">
                        <li class="p_list-ele"><a href="login.jsp">Login</a></li>
                        <hr>
                        <li class="p_list-ele"><a href="signup.html">Register</a></li>
                    </ul>
                </li>
                <li class="nav-bar"><a href="index.html"><button id="nav-btn">HOME</button></a></li>
                <%
                try
                {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
                    //out.println("connected");
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("SELECT * FROM department "); %>
                    <div class="doc" id="doc">
                        <% while(rs.next())
                        {
                            String department=rs.getString("dname");
                            String dpno=rs.getString("deptno");
                            %>
                            <div class="dpname_div"> <h4 class="doc_details" id="dpname"><%out.print(department) ;%></h4></div> 
                           
                            <div class="time_div"> <h4 class="doc_details" id="dpno"><%out.print(dpno); %></h4></div> <br>
                        <%}
                    }
                    catch(SQLException e)
                    {
                        out.println(e);
                        e.printStackTrace();
                    }
                    %>
                </ul>
            </header>
            <script src="functions.js"></script>
        </body>
    </html>
    