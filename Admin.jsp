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
                <li class="nav-bar"><a href="services.html"><button id="nav-btn">SERVICES</button></a></li>
                <li class="nav-bar"><button id="nav-btn"><a href="department.jsp">DEPARTMENTS</a></button></li>
                <li class="nav-bar" id="nav_a_btn"><a href="Admin.jsp"><button id="nav-btn" id="nav_p_btn">ADMIN</button></a>
                </li>
                <li class="nav-bar"><a href="index.html"><button id="nav-btn">HOME</button></a></li>
            </ul>
        </header>
        <div class="profile"><button id="mng_prf_admin">Manage Profile</button></div>
        <div class="btn_list_admin" id="btn_list"><a href="logout.jsp"><button class="prf_btn" id="btn_list_1">Log Out</button></a>
         <a href="updateadminpass.html"><button class="prf_btn" id="btn_list_2">Change Password</button></a>
      
     </div>
     <div class="admin_tool" id="admin_tool">
        <h2 id="doctor">Doctor</h2>
        <div class="doctor_tool" id="doctor_tool">
            <button class="adm_btn" id="doc_btn_1">Add Doctor</button>
            <button class="adm_btn" id="doc_btn_2">Delete Doctor</button>
            <button class="adm_btn" id="doc_btn_3">Update Doctor</button>
        </div>
        <h2 id="dept">Departments</h2>
        <div class="dept_tool" id="dept_tool">
            <button class="adm_btn" id="dep_btn_1">Add Department</button>
            <button class="adm_btn" id="dep_btn_2">Delete Department</button>
           
        </div>
        <div class="update_doctor_sub" id="update_doctor_sub">
            <button class="adm_btn" id="updatetime">Change Doctor Time</button>
            <button class="adm_btn" id="updatedate">Change Doctor Day</button>
            <button class="adm_btn" id="updatecap">Change  Capacity</button>
            <button class="adm_btn" id="back_btn">Back</button>
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
         <div class="Dept_details" id="Dept_details">
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
         <div class="Doct_details" id="admin_docdetails">
            <% ResultSet rs4=st.executeQuery("select * from doctor");
            while(rs4.next())
            {
                String doctorname=rs4.getString("doc_name");
            String doctorid=rs4.getString("doc_id");
            %>
           <div class="details">
                        <div class="adm_deptname_div">  <h4 class="dep_details" id="dname"><%out.print(doctorid); %></h4></div> 
                        <div class="dno_div"> <h4 class="dep_details" id="dpname"><%out.print(doctorname) ;%></h4></div>
                </div>
           <% }%>
         </div>
     </div>
     <div class="spbtn">
        <button class="special_btn" id="spb1">1</button>
        <button class="special_btn" id="spb2">2</button>
    </div>
     <div class="Doctor_details" id="Doctor_details_del">
         <button class="adm_btn" id="back">Back</button>
        <%
        ResultSet rs2=st.executeQuery("SELECT * FROM doctor,department where doctor.deptno=department.deptno");
        while(rs2.next())
        {
            String doctorname=rs2.getString("doc_name");
            String doctorid=rs2.getString("doc_id");
            String dpn=rs2.getString("dname");
        
        %>
        <div class="details" id="admin_doc_del">
            <div class="del_doc">  <h4 class="doc_details" id="docid"><%out.print(doctorid); %></h4></div> 
            <div class="del_doc"> <h4 class="doc_details" id="docname"><%out.print(doctorname) ;%></h4></div> 
            <div class="del_doc">  <h4 class="doc_details" id="deptno"><%out.print(dpn); %></h4></div> 
            <form action="deletedoc.jsp" >
               <input type="text" value="<%=doctorid%>" name="id" class="inv"> 
               <input type="submit" value="Delete" class="delete_admin_doc"> 
           </form><br>
           </div>
           <%} %>
     </div>
     <div class="Doctor_details" id="Department_details_del">
        <button class="adm_btn" id="back2">Back</button>
       <%
       ResultSet rs3=st.executeQuery("SELECT * FROM department");
       while(rs3.next())
       {
           String departmentname=rs3.getString("dname");
           String departmentid=rs3.getString("deptno");
       
       %>
       <div class="details" id="admin_doc_del">
           <div class="del_dept">  <h4 class="doc_details" id="docid"><%out.print(departmentid); %></h4></div> 
           <div class="del_dept"> <h4 class="doc_details" id="docname"><%out.print(departmentname) ;%></h4></div> 
           <form action="deletedept.jsp" >
              <input type="text" value="<%=departmentid%>" name="id" class="inv"> 
              <input type="submit" value="Delete" class="delete_admin_dept"> 
          </form><br>
          </div>
          <%} %>
    </div>
    <div class="details" id="update_capacity">
        <form action="updatecap.jsp" autocomplete="off">
            <input type="text" placeholder="Doctor ID" name="id" id="field1">
            <input type="text" placeholder="New Capacity" name="cap" id="field1">
            <input type="submit" value="Update" class="delete_admin_dept" id="updatebtn1"> 
        </form>
        <button class="prf_btn" id="updateback1">Back</button>
    </div>
    <div class="details" id="update_time">
        <form action="updatetime.jsp" autocomplete="off">
            <input type="text" placeholder="Doctor ID" name="id" id="field1">
            <input type="text" placeholder="New Time" name="cap" id="field1">
            <input type="submit" value="Update" class="delete_admin_dept" id="updatebtn1"> 
        </form>
        <button class="prf_btn" id="updateback2">Back</button>
    </div>
    <div class="details" id="update_date">
        <form action="updatedate.jsp" autocomplete="off">
            <input type="text" placeholder="Doctor ID" name="id" id="field1">
            <input type="text" placeholder="New Day" name="cap" id="field1">
            <input type="submit" value="Update" class="delete_admin_dept" id="updatebtn1"> 
        </form>
        <button class="prf_btn" id="updateback3">Back</button>
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