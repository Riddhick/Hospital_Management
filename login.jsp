<html>
    <%@ page import="java.sql.*" %>
    <head>
        <title>
            Login
        </title>
        <link href="form.css" rel="stylesheet">
    </head>
    <body class="update">
        <% String isLoggedin=(String)session.getAttribute("pname") ;
        if(isLoggedin==null)
        { %>
            <form action="check.jsp" method="POST" autocomplete="off" class="form1">
                <h2 id="signin_text">Sign in</h2>
                    <input type="text" name="username" placeholder="Username" >
                <input type="password" name="password" placeholder="Password">
                   <input type="submit" value="Sign in" class="button" id="signin">
               
                   <a href="signup.html"><input type="button" value="Sign Up" class="button" id="signup"></a>
                   <div class="text"><p class="forget"><a href="updatepassword.html">Forget password?</a></p></div>
            </form>
       <% }
       else
       response.sendRedirect("welcome.jsp");%>
    
    </body>
</html>
