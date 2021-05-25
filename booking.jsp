<html>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.time.*" %>
    <%@ page import="java.time.temporal.TemporalAdjusters" %>
    <head>
        <title>Booking</title>
    </head>
    <body>
        <%String id=request.getParameter("id");
        String day=request.getParameter("date").toUpperCase();
        String time=request.getParameter("time");
        String dno=request.getParameter("depno");
        String name=(String)session.getAttribute("name");
        DayOfWeek dow = DayOfWeek.valueOf( day); 
        LocalDate dt=LocalDate.now();
        String date=dt.with(TemporalAdjusters.next(dow)).toString();
        out.println(date);
        try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");
        //out.println("connected");
        PreparedStatement stmt=con.prepareStatement("insert into booking (username , deptno, doc_id , b_date , b_time) values(?,?,?,?,?)");  
                stmt.setString(1,name);  
                stmt.setString(2,dno); 
                stmt.setString(3,id);
                stmt.setString(4,date);
                stmt.setString(5,time);
                int i=stmt.executeUpdate();    
                 con.close();  
                 response.sendRedirect("welcome.jsp");
    }
    catch(SQLException e)
    {
        out.println(e);
        e.printStackTrace();
    }
        %>
    </body>
</html>