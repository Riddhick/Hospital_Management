<html>
    <%@ page import="java.sql.*" %>
    <head>
        <meta  name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1,viewport-fit=cover">
        <title>Admin</title>
        <link href="style.css" rel="stylesheet">
        <link href="admin.css" rel="stylesheet">
        <link href="user.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Architects+Daughter&display=swap" rel="stylesheet">
    </head>
    <body>
        <%
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM department ");%>
        <header>
            <ul >
                <li class="nav-bar"><button id="nav-btn">SERVICES</button></li>
                <li class="nav-bar"><button id="nav-btn">DEPARTMENTS</button></li>
                <li class="nav-bar" id="nav_a_btn"><a href="Admin.jsp"><button id="nav-btn" id="nav_p_btn">ADMIN</button></a>
                </li>
                <li class="nav-bar"><a href="index.html"><button id="nav-btn">HOME</button></a></li>
            </ul>
        </header>
        <div class="profile"><button id="mng_prf_admin">Manage Profile</button></div>
        <div class="btn_list_admin" id="btn_list"><a href="logout.jsp"><button class="prf_btn" id="btn_list_1">Log Out</button></a>
         <button class="prf_btn" id="btn_list_2">Change Password</button>
         <button class="prf_btn" id="btn_list_3">Back</button>
     </div>
     <div class="admin_tool" id="admin_tool">
        <h2 id="doctor">Doctor</h2>
        <div class="doctor_tool">
            <button class="adm_btn" id="doc_btn_1">Add Doctor</button>
            <button class="adm_btn">Delete Doctor</button>
            <button class="adm_btn">Update Doctor</button>
        </div>
        <h2 id="dept">Departments</h2>
        <div class="dept_tool">
            <button class="adm_btn" id="dep_btn_1">Add Department</button>
            <button class="adm_btn">Delete Department</button>
            <button class="adm_btn">Update Department</button>
        </div>
     </div>
     <div class="add_doc" id="add_doc">
         <form action="admin_add.jsp" autocomplete="off" method="POST" class="form3">
            <input type="text" name="doc_name" placeholder="Doctor Name">
            <input type="text" name="day" placeholder="Day">
            <input type="text" name="time" placeholder="Time">
            <input type="text" name="cap" placeholder="Capacity">
            <input type="text" name="dept_no" placeholder="Department No.">
            <button type="submit" class="adm_btn">Add</button>
         </form>
         <button class="adm_btn" id="can_btn"><a href="Admin.jsp">Cancel</a></button>
     </div>
     <div  class="add_doc" id="add_dept">
        <form action="admin_dadd.jsp" autocomplete="off" method="POST" class="form3">
            <input type="text" name="dept_name" placeholder="Department Name">
            <button type="submit" class="adm_btn">Add</button>
        </form>
        <button class="adm_btn" id="can_btn"><a href="Admin.jsp">Cancel</a></button>
     </div>
     <div class="admin_details">
         <div class="Dept_details">
             <header id="inside_header"><h2 class="heading_dlist" id="heading_1">Department Name</h2>
                <h2 class="heading_dlist" id="heading_2">Department No</h2>
            </header>
                <% while(rs.next())
                {
                    String dname=rs.getString("dname");
                    String dnum=rs.getString("deptno"); %>
                    <div class="details">
                        <div class="adm_deptname_div">  <h4 class="dep_details" id="dname"><%out.print(dname); %></h4></div> 
                        <div class="dno_div"> <h4 class="dep_details" id="dpname"><%out.print(dnum) ;%></h4></div>
                </div>
                <%}%>
         </div>
     </div>
        <script src="functions.js"></script>
        <script src="admin_func.js"></script>
        <% } catch(SQLException e)
        {
            out.println(e);
            e.printStackTrace();
        }
    %>
    </body>
</html>