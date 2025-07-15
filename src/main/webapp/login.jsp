<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    String DB_URL = "jdbc:postgresql://localhost:5432/studemanagement";
    String DB_USER = "postgres";
    String DB_PASS = "root";

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String message = "";

    try {
        Class.forName("org.postgresql.Driver");
    } catch (Exception e) {
        message = "Driver loading failed: " + e.getMessage();
    }

    if (username != null && password != null) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            String sql = "SELECT id FROM users WHERE uname = ? AND password = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setString(2, password);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        session.setAttribute("user", username);
                        response.sendRedirect("homepage.jsp?user=" + java.net.URLEncoder.encode(username, "UTF-8"));
                        return;
                    } else {
                        message = "Invalid username or password.";
                    }
                }
            }
        } catch (SQLException se) {
            message = "Database error: " + se.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login - Student Management System</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: url('<%= request.getContextPath() %>/images/background.avif') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      color: white;
    }

    .login-container {
      background: rgba(0, 0, 0, 0.6);
      border: 1px solid rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      padding: 40px;
      border-radius: 16px;
      width: 100%;
      max-width: 420px;
      text-align: center;
      box-shadow: 0 8px 25px rgba(255, 255, 255, 0.05);
    }

    .login-container h2 {
      margin-bottom: 20px;
      font-size: 2rem;
      background: linear-gradient(90deg, #f0047f, #70e1f5);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .login-container input {
      width: 100%;
      padding: 12px;
      margin: 12px 0;
      border-radius: 10px;
      border: 1px solid rgba(255, 255, 255, 0.2);
      background: rgba(255, 255, 255, 0.05);
      color: white;
      font-size: 1rem;
    }

    .login-container input:focus {
      outline: none;
      border-color: #70e1f5;
      background: rgba(255, 255, 255, 0.1);
    }

    .login-container button {
      width: 100%;
      padding: 12px;
      border: none;
      border-radius: 10px;
      background: linear-gradient(90deg, #f0047f, #70e1f5);
      color: black;
      font-weight: 600;
      font-size: 1rem;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .login-container button:hover {
      transform: translateY(-2px);
      box-shadow: 0 0 10px #f0047f88;
    }

    .register-link {
      margin-top: 18px;
      font-size: 0.95rem;
      color: #ccc;
    }

    .register-link a {
      color: #70e1f5;
      text-decoration: none;
      font-weight: bold;
      border-bottom: 2px solid transparent;
      transition: all 0.3s ease;
    }

    .register-link a:hover {
      color: #f0047f;
      border-bottom: 2px solid #f0047f;
    }

    .error-message {
      color: #ff8080;
      margin-top: 10px;
      font-size: 0.9rem;
    }

    .footer {
      position: absolute;
      bottom: 15px;
      width: 100%;
      text-align: center;
      color: #aaa;
      font-size: 0.8rem;
    }
  </style>
</head>
<body>

  <div class="login-container">
    <h2>Student Login</h2>
    <% if (!message.isEmpty()) { %>
      <div class="error-message"><%= message %></div>
    <% } %>
    <form action="login.jsp" method="post">
      <input type="text" name="username" placeholder="Username" required>
      <input type="password" name="password" placeholder="Password" required>
      <button type="submit">Log In</button>
    </form>

    <div class="register-link">
      <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
  </div>

  <div class="footer">
    &copy; 2025 Student Management System
  </div>

</body>
</html>
