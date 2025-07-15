<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String DB_URL = "jdbc:postgresql://localhost:5432/studemanagement";
    String DB_USER = "postgres";
    String DB_PASS = "root";

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");

    String message = "";

    try {
        Class.forName("org.postgresql.Driver");
    } catch (Exception e) {
        out.println("Driver load failed: " + e);
        return;
    }

    if (username != null && password != null && confirmPassword != null) {
        if (!password.equals(confirmPassword)) {
            message = "Passwords do not match.";
        } else {
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                String checkSQL = "SELECT 1 FROM users WHERE uname = ?";
                try (PreparedStatement ps = conn.prepareStatement(checkSQL)) {
                    ps.setString(1, username);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            message = "Username already exists.";
                        } else {
                            String insertSQL = "INSERT INTO users(uname,password,email,contact,created_at) VALUES(?,?,?,?,NOW())";
                            try (PreparedStatement ins = conn.prepareStatement(insertSQL)) {
                                ins.setString(1, username);
                                ins.setString(2, password);
                                ins.setString(3, email);
                                ins.setString(4, contact);
                                int rows = ins.executeUpdate();
                                if (rows > 0) {
                                    message = "Registration successful! .";
                                } else {
                                    message = "Insert failed.";
                                }
                            }
                        }
                    }
                }
            } catch (SQLException e) {
                message = "Database error: " + e;
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register - Student Management System</title>
  <style>
    * {margin: 0;padding: 0;box-sizing: border-box;font-family: 'Poppins', sans-serif;}
    body {
      background: url('<%= request.getContextPath() %>/images/background.avif') no-repeat center center fixed;
      background-size: cover;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .register-container {
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
    .register-container h2 {
      margin-bottom: 20px;
      font-size: 2rem;
      background: linear-gradient(90deg, #f0047f, #70e1f5);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    .register-container input {
      width: 100%;
      padding: 10px 15px;
      margin: 10px 0;
      border: 1px solid rgba(255, 255, 255, 0.4);
      border-radius: 10px;
      background: rgba(255, 255, 255, 0.12);
      color: white;
      font-size: 1rem;
    }
    .register-container input:focus {
      outline: none;
      border-color: #70e1f5;
      background: rgba(255, 255, 255, 0.2);
    }
    .register-container button {
      width: 100%;
      padding: 12px;
      margin-top: 10px;
      border: none;
      border-radius: 10px;
      background: linear-gradient(90deg, #f0047f, #70e1f5);
      color: black;
      font-size: 1.1rem;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .register-container button:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(255,255,255,0.15);
    }
    .login-link {
      margin-top: 15px;
      color: white;
      font-size: 0.95rem;
    }
    .login-link a {
      color: #70e1f5;
      text-decoration: none;
      border-bottom: 1px solid transparent;
      transition: 0.3s;
    }
    .login-link a:hover {
      color: #f0047f;
      border-bottom: 2px solid #f0047f;
    }
    .footer {
      position: absolute;
      bottom: 20px;
      color: #ccc;
      font-size: 0.8rem;
    }
    .message-box {
      margin-top: 15px;
      padding: 10px;
      border-radius: 10px;
      color: #fff;
      font-size: 0.95rem;
    }
    .message-box a {color: #70e1f5;text-decoration: underline;}
    .success {background-color: rgba(76, 175, 80, 0.2);}
    .error {background-color: rgba(255, 0, 0, 0.2);}
  </style>
</head>
<body>

<div class="register-container">
  <h2>Student Registration</h2>

  <% if (!message.isEmpty()) { %>
    <div class="message-box <%= message.contains("successful") ? "success" : "error" %>">
      <%= message %>
    </div>
  <% } %>

  <form method="post" onsubmit="return validateForm()">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" id="password" placeholder="Password" required>
    <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
    <input type="email" name="email" id="email" placeholder="Email" required>
    <input type="text" name="contact" id="contact" placeholder="Contact Number" required
           maxlength="10" pattern="\d{10}" inputmode="numeric"
           oninput="this.value = this.value.replace(/\D/g, '').slice(0,10);">
    <button type="submit">Register</button>
  </form>

  <div class="login-link">
    Already have an account? <a href="login.jsp">Login here</a>
  </div>
</div>

<div class="footer">
  &copy; 2025 Student Management System
</div>

<script>
  function validateForm() {
    const email = document.getElementById("email").value;
    const contact = document.getElementById("contact").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const contactRegex = /^\d{10}$/;

    if (!emailRegex.test(email)) {
      alert("Please enter a valid email address.");
      return false;
    }

    if (!contactRegex.test(contact)) {
      alert("Contact number must be exactly 10 digits.");
      return false;
    }

    if (password !== confirmPassword) {
      alert("Passwords do not match.");
      return false;
    }

    return true;
  }
</script>

</body>
</html>
