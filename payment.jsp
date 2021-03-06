<html>
<%@ page import="java.sql.*"%>
<head>
    <title>Payment</title>
    <link href="style.css" rel="stylesheet">
    <link href="user.css" rel="stylesheet">
    <link href="form.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Architects+Daughter&display=swap" rel="stylesheet">
</head>
<body>
   <%
    String ddate=request.getParameter("date");
    String dtime=request.getParameter("time");
    String did=request.getParameter("id");
    String dnum=request.getParameter("depno");
    //out.println(ddate+dtime+did+dnum);
    try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","PROJECT","1234");%>
        <form action="booking.jsp" id="form5" autocomplete="off" method="POST" onsubmit="return cardValidate()" >
            <input type="text" value="<%=did%>" name="id" class="inv"> 
            <input type="text" value="<%=ddate%>" name="date" class="inv">
            <input type="text" value="<%=dtime%>" name="time" class="inv">
            <input type="text" value="<%=dnum%>" name="depno" class="inv">
            <input type="text" placeholder="Card Number" id="cardnumber">
            <input type="text" placeholder="Name" id="name">
            <input type="text" placeholder="Expiry Date: mm/yy"  id="date">
            <input type="text" placeholder="CVV" id="cvv">
            <input type="submit" value="Proceed" class="appointment" id="proceed"> 
        </form><br>
        <input type="image" src="./img/mastercard.png" class="cardlogo">
        <h5 class="payment_info">You will be charged &#x20b9 500 as appoinment fees</h5>
        </div>
        
   <% }
    catch(SQLException e)
    {
        out.println(e);
        e.printStackTrace();
    }
    %>
    <script src="functions.js"></script>
    <script src="payment.js"></script>
</body> 
</html>