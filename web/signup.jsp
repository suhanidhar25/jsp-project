
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>

<head>

    <title>Register</title>

    <link rel="stylesheet" href="main.css?v=2">

    <link
    href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&display=swap"
    rel="stylesheet">

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">

        <img
        src="images/logo.png"
        alt="TechVibe Logo">

        <span>TECHVIBE</span>

    </div>

    <div class="nav-links">

        <a href="index.html">
            Home
        </a>

        <a href="products.jsp">
            Products
        </a>

        <a href="order.html">
            Order Form
        </a>

        <a href="contact.jsp">
            Contact
        </a>

        <a href="signup.jsp" class="active">
            Sign Up
        </a>

        <a href="login.jsp">
            Log In
        </a>

    </div>

</div>

<!-- SIGNUP FORM -->

<div class="container">

    <h2>Create Account</h2>

<%

String username = request.getParameter("username");
String password = request.getParameter("password");

if(username != null && password != null)
{
    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/store",
            "root",
            "12345"
        );

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO users VALUES(?,?)"
        );

        ps.setString(1,username);
        ps.setString(2,password);

        ps.executeUpdate();

%>

        <h3
        style="
        text-align:center;
        color:#00ff88;
        margin-bottom:25px;">

            Registration Successful!

        </h3>

        <div
        style="
        text-align:center;">

            <a href="login.jsp">

                <button type="button">

                    Go To Login

                </button>

            </a>

        </div>

<%

        con.close();
    }

    catch(Exception e)
    {
        out.println(e);
    }
}

else
{

%>

    <form method="post">

        <label>Username</label>

        <input
        type="text"
        name="username"
        placeholder="Create Username"
        required>

        <label>Password</label>

        <input
        type="password"
        name="password"
        placeholder="Create Password"
        required>

        <button type="submit">

            Register

        </button>

    </form>

<%

}

%>

</div>

</body>

</html>
