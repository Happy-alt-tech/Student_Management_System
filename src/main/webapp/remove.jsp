<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Delete Student</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #0f172a;
      color: #e2e8f0;
    }

    .btn-gradient {
      background: linear-gradient(to right, #f0047f, #70e1f5);
      color: black;
      font-weight: 600;
    }

    .btn-gradient:hover {
      background: linear-gradient(to right, #ff007a, #57d0ff);
    }

    input:focus {
      outline: none;
      box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.5);
    }
  </style>
</head>
<body class="flex items-center justify-center min-h-screen p-4">

  <div class="bg-slate-800 w-full max-w-md p-8 rounded-lg shadow-2xl border border-slate-700">
    <h1 class="text-3xl font-bold text-center text-pink-400 mb-6">🗑️ Delete Student</h1>

    <form action="DeleteServlet" method="post" onsubmit="return confirmDelete()">
      <!-- Student Identifier (ID or Email) -->
      <label class="block mb-2 font-medium">Enter Student ID or Email:</label>
      <input type="text" name="studentIdentifier" required
             placeholder="e.g. 12345 or john@example.com"
             class="w-full px-4 py-2 rounded bg-slate-700 text-white border border-slate-600 mb-4" />

      <!-- Confirmation note -->
      <p class="text-sm text-red-400 mb-4">⚠️ This action is irreversible. Please confirm before deleting.</p>

      <!-- Buttons -->
      <div class="flex justify-between items-center">
        <button type="submit" class="btn-gradient px-6 py-2 rounded">Delete</button>
        <a href="homepage.jsp" class="bg-gradient-to-r from-gray-600 to-gray-800 text-white px-6 py-2 rounded font-semibold hover:scale-105 transition">Go to Homepage</a>
      </div>
    </form>
  </div>

  <script>
    function confirmDelete() {
      return confirm("Are you sure you want to delete this student?");
    }
  </script>

</body>
</html>
