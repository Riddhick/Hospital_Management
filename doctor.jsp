<html>
    <%@ page import="java.sql.*" %>
    <head>
        <title>
            Doctors
        </title>
        <link href="style.css" rel="stylesheet">
        <link href="doctor.css" rel="stylesheet">
        <link href="user.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Architects+Daughter&display=swap" rel="stylesheet">
    </head>
    <body>
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
                <%String depname=request.getParameter("search"); 
                //out.println(depname);
                try
                {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
                    //out.println("connected");
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("SELECT * FROM doctor,department where doctor.deptno=department.deptno"); %>
                    <div class="doc" id="doc">
                        <% while(rs.next())
                        {
                            String doc_name=rs.getString("doc_name");
                            String doc_id=rs.getString("doc_id");
                            String department=rs.getString("dname");
                            String doc_time=rs.getString("d_time");
                            String day=rs.getString("d_date");%>
                            <div class="dname_div">  <h4 class="doc_details" id="dname"><%out.print(doc_name); %></h4></div> 
                            <div class="dpname_div"> <h4 class="doc_details" id="dpname"><%out.print(department) ;%></h4></div> 
                            <div class="day_div">  <h4 class="doc_details" id="day"><%out.print(day); %></h4></div> 
                            <div class="time_div"> <h4 class="doc_details" id="time"><%out.print(doc_time); %></h4></div> <br>
                        <%}
                        ResultSet rs2=st.executeQuery("SELECT doc_name,dname,d_date,d_time,doc_id,doctor.deptno FROM doctor,department where doctor.deptno=department.deptno and dname like '%"+depname+"%'");%>
                    </div>
                    <div class="doclist" id="doclist">
        
                        <div class="search">
                            <form action="doctor.jsp" method="POST" autocomplete="off" class="form1">
                                <input type="text" placeholder="Search Department" name="search" id="searchbox">
                                <input type="submit" value="Search" id="searchbtn">
                            </form>
                        </div>
                        <div class="searchresult">
                            <%   while(rs2.next()){
                                String dn=rs2.getString("doc_name");
                                String dpn=rs2.getString("dname");
                                String ddate=rs2.getString("d_date");
                                String dtime=rs2.getString("d_time");
                                String did=rs2.getString("doc_id");
                                String dnum=rs2.getString("deptno");
                                %>
                                <div class="details">
                                 <div class="dname_div">  <h4 class="doc_details" id="dname"><%out.print(dn); %></h4></div> 
                                 <div class="dpname_div"> <h4 class="doc_details" id="dpname"><%out.print(dpn) ;%></h4></div> 
                                 <div class="day_div">  <h4 class="doc_details" id="day"><%out.print(ddate); %></h4></div> 
                                 <div class="time_div"> <h4 class="doc_details" id="time"><%out.print(dtime); %></h4></div> <br>
                                </div>
                              <%  
                                } %>
                          
                        </div>
                    </div>
                <%}
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
