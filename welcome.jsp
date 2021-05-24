<html>
    <%@ page import="java.sql.*" %>
    <title>
        User
    </title>
    <link href="style.css" rel="stylesheet">
    <link href="user.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Architects+Daughter&display=swap" rel="stylesheet">
</head>
<body class="user">
    <% String docname=request.getParameter("search");
   // out.println(docname);
    int flag=0;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM doctor where doc_name like '%"+docname+"%'");
            while(rs.next()){
            String k=rs.getString("doc_name");
            out.print(k);
            }
        }
        catch(SQLException e)
        {
           // out.println("Can't Connect");
            e.printStackTrace();
        }
    %>
    <header>
        <ul >
            <li class="nav-bar"><button id="nav-btn">SERVICES</button></li>
            <li class="nav-bar"><button id="nav-btn">DEPARTMENTS</button></li>
            <li class="nav-bar" id="nav_p_btn"><button id="nav-btn" id="nav_p_btn">PATIENT</button>
                <ul id="p-list">
                    <li class="p_list-ele"><a href="login.jsp">Login</a></li>
                    <hr>
                    <li class="p_list-ele"><a href="signup.html">Register</a></li>
                </ul>
            </li>
            <li class="nav-bar"><a href="index.html"><button id="nav-btn">HOME</button></a></li>

        </ul>
    </header>
    <h3 class="name"><%=session.getAttribute("pname") %></h3>
   
    <div class="doclist">
        
        <div class="search">
            <form action="welcome.jsp" method="POST" autocomplete="off">
                <input type="text" placeholder="Search Doctor" name="search">
                <input type="submit" value="search" id="searchbtn">
            </form>
        </div>
        <div class="searchresult">

        </div>
    </div>
    <script src="functions.js"></script>
</body>
</html>