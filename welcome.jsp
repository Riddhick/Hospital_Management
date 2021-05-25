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
            ResultSet rs=st.executeQuery("SELECT doc_name,dname,d_date,d_time,doc_id FROM doctor,department where doctor.deptno=department.deptno and doc_name like '%"+docname+"%'");%>
        
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
            <form action="welcome.jsp" method="POST" autocomplete="off" class="form1">
                <input type="text" placeholder="Search Doctor" name="search" id="searchbox">
                <input type="submit" value="Search" id="searchbtn">
            </form>
        </div>
        <div class="searchresult">
            <%   while(rs.next()){
                String dn=rs.getString("doc_name");
                String dpn=rs.getString("dname");
                String ddate=rs.getString("d_date");
                String dtime=rs.getString("d_time");
                String did=rs.getString("doc_id");%>
                <div class="details">
                 <div class="dname_div">  <h4 class="doc_details" id="dname"><%out.print(dn); %></h4></div> 
                 <div class="dpname_div"> <h4 class="doc_details" id="dpname"><%out.print(dpn) ;%></h4></div> 
                 <div class="day_div">  <h4 class="doc_details" id="day"><%out.print(ddate); %></h4></div> 
                 <div class="time_div"> <h4 class="doc_details" id="time"><%out.print(dtime); %></h4></div> <br>
                 <form action="booking.jsp" id="form1">
                    <input type="text" value="<%=did%>" name="id" class="inv"> 
                    <input type="submit" value="Appointment" class="appointment"> 
                </form><br>
                </div>
              <%  
                } %>
          
        </div>
    </div>
    <% }
    catch(SQLException e)
    {
       // out.println("Can't Connect");
        e.printStackTrace();
    }
%>
    <script src="functions.js"></script>
</body>
</html>