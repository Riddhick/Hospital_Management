<html>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.time.*" %>
    <%@ page import="java.time.temporal.TemporalAdjusters" %>
    <title>
        User
    </title>
    <link href="style.css" rel="stylesheet">
    <link href="user.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Architects+Daughter&display=swap" rel="stylesheet">
    <meta http-equiv="cache-control" content="no-cache">
</head>
<body class="user">
    <% String docname=request.getParameter("search");
    String check_loggedin=(String)session.getAttribute("pname");
    if(check_loggedin==null){
        response.sendRedirect("login.jsp");
    }
   // out.println(docname);
    int flag=0;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT doc_name,dname,d_date,d_time,doc_id,doctor.deptno FROM doctor,department where doctor.deptno=department.deptno and doc_name like '%"+docname+"%'");%>
        
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
   <div class="profile"><button id="mng_prf">Manage Profile</button></div>
   <div class="btn_list" id="btn_list"><button class="prf_btn" id="btn_list_1">Log Out</button>
    <button class="prf_btn" id="btn_list_2">Change Password</button>
    <button class="prf_btn" id="btn_list_3">Back</button>
</div>
    <div class="doclist" id="doclist">
        
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
                String did=rs.getString("doc_id");
                String dnum=rs.getString("deptno");
                %>
                <div class="details">
                 <div class="dname_div">  <h4 class="doc_details" id="dname"><%out.print(dn); %></h4></div> 
                 <div class="dpname_div"> <h4 class="doc_details" id="dpname"><%out.print(dpn) ;%></h4></div> 
                 <div class="day_div">  <h4 class="doc_details" id="day"><%out.print(ddate); %></h4></div> 
                 <div class="time_div"> <h4 class="doc_details" id="time"><%out.print(dtime); %></h4></div> <br>
                 <form action="payment.jsp" id="form1" method="POST">
                    <input type="text" value="<%=did%>" name="id" class="inv"> 
                    <input type="text" value="<%=ddate%>" name="date" class="inv">
                    <input type="text" value="<%=dtime%>" name="time" class="inv">
                    <input type="text" value="<%=dnum%>" name="depno" class="inv">
                    <input type="submit" value="Appointment" class="appointment"> 
                </form><br>
                </div>
              <%  
                } %>
          
        </div>
    </div>
    <div class="apmnt_list" id="apmnt_list">
        <div class="apmnt_list_heading"><h3 class="name" id="apmnt">Appointments</h3></div>
        <% String uname=(String)session.getAttribute("name"); 
        ResultSet rs2=st.executeQuery("select * from booking,doctor,department where booking.doc_id=doctor.doc_id and doctor.deptno=department.deptno and username='"+uname+"'");
        while(rs2.next()){
            
                String docname1=rs2.getString("doc_name");
                String dpn1=rs2.getString("dname");
                String bdate=rs2.getString("b_date");
                String btime=rs2.getString("b_time");
                String b_id=rs2.getString("booking_id");
                String docid=rs2.getString("doc_id");
        %>
        <div class="up_ampnt">
            <div class="dname_div">  <h4 class="doc_details" id="dname"><%out.print(docname1); %></h4></div> 
            <div class="dpname_div"> <h4 class="doc_details" id="dpname"><%out.print(dpn1) ;%></h4></div> 
            <div class="day_div">  <h4 class="doc_details" id="day"><%out.print(bdate); %></h4></div> 
            <div class="time_div"> <h4 class="doc_details" id="time"><%out.print(btime); %></h4></div> <br>
            <form action="cancel_booking.jsp" id="form1">
                <input type="text" value="<%=b_id%>" name="bookingid" class="inv"> 
                <input type="text" value="<%=docid%>" name="doctoridid" class="inv"> 
                <input type="submit" value="Cancel" class="appointment"> 
            </form><br>
        </div>
        <%
    }
    %>
    </div>
    <%
    ResultSet rs3=st.executeQuery("SELECT * FROM booking");
    while(rs3.next())
    {
        String bookingid=rs3.getString("booking_id");
        String bookingdate=rs3.getString("b_date");
        String doctorid=rs3.getString("doc_id");
        LocalDate cur_date=LocalDate.now();
        LocalDate check_date=LocalDate.parse(bookingdate);
        if(cur_date.isAfter(check_date))
        {
           // out.println(bookingdate);
           PreparedStatement stmt=con.prepareStatement("delete from booking where booking_id='"+bookingid+"'");  
           int i=stmt.executeUpdate();   
           PreparedStatement stmt2=con.prepareStatement("UPDATE doctor set capacity=capacity+1 WHERE doc_id='"+doctorid+"'"); 
           int j=stmt2.executeUpdate(); 
        }
    }
}
    catch(SQLException e)
    {
       // out.println("Can't Connect");
        e.printStackTrace();
    }
%>
    <script src="functions.js"></script>
</body>
</html>