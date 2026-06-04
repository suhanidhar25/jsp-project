
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>

<head>

    <title>Contact Us</title>

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

        <a href="contact.jsp" class="active">
            Contact
        </a>

        <a href="signup.jsp">
            Sign Up
        </a>

        <a href="login.jsp">
            Log In
        </a>

    </div>

</div>

<!-- CONTACT FORM -->

<div class="container">

    <h2>Contact Us</h2>

<%

String name = request.getParameter("name");
String email = request.getParameter("email");
String message = request.getParameter("message");

if(name != null && email != null && message != null)
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
            "INSERT INTO contact VALUES(?,?,?)"
        );

        ps.setString(1,name);
        ps.setString(2,email);
        ps.setString(3,message);

        ps.executeUpdate();

%>

        <h3
        style="
        text-align:center;
        color:#00ff88;
        margin-bottom:25px;">

            Message Sent Successfully!

        </h3>

<%

        con.close();
    }

    catch(Exception e)
    {
        out.println(e);
    }
}

%>

    <form method="post">

        <label>Name</label>

        <input
        type="text"
        name="name"
        placeholder="Enter Your Name"
        required>

        <label>Email</label>

        <input
        type="email"
        name="email"
        placeholder="Enter Your Email"
        required>

        <label>Message</label>

        <textarea
        name="message"
        placeholder="Write Your Message"
        required></textarea>

        <button type="submit">

            Send Message

        </button>

    </form>

</div>

</body>

</html>
