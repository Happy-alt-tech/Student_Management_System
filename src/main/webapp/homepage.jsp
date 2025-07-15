<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>StudentMS - Home</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      padding: 0;
      background: #000;
      font-family: 'Poppins', sans-serif;
      color: white;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    h1 {
      font-size: 2.8rem;
      font-weight: 700;
      background: linear-gradient(90deg, #f0047f, #70e1f5);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      margin-bottom: 40px;
      text-align: center;
      animation: fadeIn 1.2s ease-in-out;
    }

    .btn-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
      gap: 20px;
      width: 100%;
      max-width: 500px;
      padding: 0 20px;
    }

    .btn-grid a {
      text-align: center;
      padding: 16px;
      font-size: 1rem;
      font-weight: 600;
      border-radius: 12px;
      background: linear-gradient(90deg, #f0047f, #70e1f5);
      color: black;
      text-decoration: none;
      transition: all 0.3s ease;
      box-shadow: 0 4px 12px rgba(255, 255, 255, 0.1);
    }

    .btn-grid a:hover {
      transform: translateY(-4px);
      box-shadow: 0 6px 20px rgba(255, 255, 255, 0.2);
    }

    .footer {
      position: absolute;
      bottom: 15px;
      text-align: center;
      font-size: 0.9rem;
      color: #888;
      width: 100%;
    }

    @keyframes fadeIn {
      0% { opacity: 0; transform: translateY(-30px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 400px) {
      h1 {
        font-size: 2rem;
      }
      .btn-grid a {
        font-size: 0.9rem;
        padding: 14px;
      }
    }
  </style>
</head>
<body>

  <h1>Student Management System</h1>

  <div class="btn-grid">
    <a href="registration.jsp">➕ Add Student</a>
    <a href="update.jsp">✏️ Edit Student</a>
    <a href="list.jsp">📋 View/List Students</a>
    <a href="remove.jsp">🗑️ Delete Student</a>
  </div>

  <div class="footer">
    &copy; 2025 Student Management System
  </div>

</body>
</html>
