<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        <img src="images/logo.png" alt="TechVibe Logo">
       
    </div>

    <div class="nav-links">
        <a href="index.html">Home</a>
        <a href="products.jsp">Products</a>
        <a href="order.html">Order Form</a>
    </div>

</div>

<!-- CONTENT -->

<div class="content">

    <h1>Our Products</h1>

    <h2>Premium Tech Collection</h2>

    <table>

        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Price</th>
        </tr>

<%

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/store",
        "root",
        "12345"
    );

    Statement stmt = con.createStatement();

    ResultSet rs = stmt.executeQuery(
        "SELECT * FROM product_list"
    );

    while(rs.next())
    {

%>

        <tr>

            <td>
                <%= rs.getString(1) %>
            </td>

            <td>
                <%= rs.getString(2) %>
            </td>

            <td>
                 <%= rs.getInt(3) %>
            </td>

        </tr>

<%

    }

    con.close();
}

catch(Exception e)
{
    out.println(e);
}

%>

    </table>

</div>

</body>
</html>