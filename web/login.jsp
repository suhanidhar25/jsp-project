
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>

<head>

    <title>Login</title>

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

        <a href="signup.jsp">
            Sign Up
        </a>

        <a href="login.jsp" class="active">
            Log In
        </a>

    </div>

</div>

<!-- LOGIN FORM -->

<div class="container">

    <h2>Login</h2>

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
            "SELECT * FROM users WHERE username=? AND password=?"
        );

        ps.setString(1,username);
        ps.setString(2,password);

        ResultSet rs = ps.executeQuery();

        if(rs.next())
        {
            session.setAttribute("user", username);

%>

            <h3
            style="
            text-align:center;
            color:#00ff88;
            margin-bottom:25px;">

                Hello <%= username %> !

            </h3>

<%

        }

        else
        {

%>

            <h3
            style="
            text-align:center;
            color:red;
            margin-bottom:25px;">

                Invalid Username or Password

            </h3>

<%

        }

        con.close();
    }

    catch(Exception e)
    {
        out.println(e);
    }
}

%>

    <form method="post">

        <label>Username</label>

        <input
        type="text"
        name="username"
        placeholder="Enter Username"
        required>

        <label>Password</label>

        <input
        type="password"
        name="password"
        placeholder="Enter Password"
        required>

        <button type="submit">

            Login

        </button>

    </form>

</div>

</body>

</html>

