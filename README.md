# TechVibe Premium Store

A Java web application built with JSP and MySQL for a premium tech accessories e-commerce store. Developed as a semester project (SEM6_PROJECT) using Apache NetBeans.

---

## Features

- **Home Page** — Hero section with featured product showcase
- **Products Page** — Dynamically fetches and displays products from the database
- **User Authentication** — Sign up and login with MySQL-backed session management
- **Contact Form** — Submits messages directly to the database
- **Order Form** — Customer order submission interface

---

## Tech Stack

| Layer      | Technology                        |
|------------|-----------------------------------|
| Frontend   | HTML, CSS, JSP                    |
| Backend    | Java (JSP Scriptlets, JDBC)       |
| Database   | MySQL                             |
| Server     | Apache Tomcat                     |
| Build Tool | Apache Ant (NetBeans)             |
| Driver     | MySQL Connector/J 9.7.0           |

---

## Project Structure

```
jsp-project/
├── web/
│   ├── index.html          # Home page with hero & featured products
│   ├── products.jsp        # Dynamic product listing from DB
│   ├── login.jsp           # Login form with session handling
│   ├── signup.jsp          # User registration form
│   ├── contact.jsp         # Contact form (saves to DB)
│   ├── order.html          # Product order form
│   ├── main.css            # Global stylesheet
│   ├── images/             # Product & logo images
│   └── META-INF/
├── src/
│   └── conf/
│       └── MANIFEST.MF
├── nbproject/              # NetBeans project configuration
└── build.xml               # Ant build script
```

---

## Database Setup

Create a MySQL database named `store` and the following tables:

```sql
CREATE DATABASE store;
USE store;

-- Users table for authentication
CREATE TABLE users (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(50) NOT NULL
);

-- Products table
CREATE TABLE product_list (
    product_id   VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price        INT NOT NULL
);

-- Contact messages table
CREATE TABLE contact (
    name    VARCHAR(100),
    email   VARCHAR(100),
    message TEXT
);
```

---

## Getting Started

### Prerequisites

- JDK 8 or higher
- Apache Tomcat 9+
- MySQL Server
- Apache NetBeans (recommended) or any IDE with Ant support
- [MySQL Connector/J 9.7.0](https://dev.mysql.com/downloads/connector/j/)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/suhanidhar25/jsp-project.git
   ```

2. **Set up the database**
   Run the SQL statements from the [Database Setup](#database-setup) section above.

3. **Configure the DB connection**
   The connection credentials are hardcoded in the JSP files. Update these lines if your MySQL setup differs:
   ```java
   Connection con = DriverManager.getConnection(
       "jdbc:mysql://localhost:3306/store",
       "root",    // your username
       "12345"    // your password
   );
   ```

4. **Add the MySQL driver**
   Place `mysql-connector-j-9.7.0.jar` in `web/WEB-INF/lib/`.

5. **Open in NetBeans**
   Go to **File → Open Project** and select the cloned folder.

6. **Run the project**
   Right-click the project → **Run**. NetBeans will deploy it to the configured Tomcat instance.

7. **Access in browser**
   ```
   http://localhost:8080/SEM6_PROJECT/
   ```

---

## Pages Overview

| Page           | URL              | Description                              |
|----------------|------------------|------------------------------------------|
| Home           | `index.html`     | Landing page with featured products      |
| Products       | `products.jsp`   | Full product catalog fetched from DB     |
| Sign Up        | `signup.jsp`     | New user registration                    |
| Login          | `login.jsp`      | User login with session                  |
| Contact        | `contact.jsp`    | Contact form (name, email, message)      |
| Order Form     | `order.html`     | Customer and order details form          |

---

## Notes

- Passwords are stored as plain text — for production use, replace with hashed passwords (e.g. BCrypt).
- The order form (`order.html`) currently uses a front-end alert and is not wired to the database.
- The DB credentials in JSP files should be moved to a config file or connection pool for production deployments.v
