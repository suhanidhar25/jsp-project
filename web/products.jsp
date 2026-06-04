
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>

    <head>

        <title>Products</title>

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

                <a href="index.html">Home</a>

                <a href="products.jsp" class="active">
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

                <a href="login.jsp">
                    Log In
                </a>

            </div>

        </div>

        <!-- PRODUCTS SECTION -->

        <section class="products">

            <h2>Premium Tech Collection</h2>

            <div class="product-grid">

                <%

                    try {
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

                        while (rs.next()) {

                %>

                <!-- PRODUCT CARD -->

                <div class="product-card">



                    <h3>
                        <%= rs.getString(2)%>
                    </h3>

                    <p>

                        Product ID:
                        <%= rs.getString(1)%>

                    </p>

                    <p>

                        <%= rs.getInt(3)%>

                    </p>

                </div>

                <%

                        }

                        con.close();
                    } catch (Exception e) {
                        out.println(e);
                    }

                %>

            </div>

        </section>

    </body>

</html>
