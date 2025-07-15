<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Student List</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #0f172a; /* dark blue background */
      color: #e2e8f0; /* text color */
    }

    th {
      background: linear-gradient(to right, #f0047f, #70e1f5);
      color: #000;
      font-weight: 600;
    }

    td {
      background-color: #1e293b; /* slate color */
    }

    tr:hover td {
      background-color: #334155;
      transition: background-color 0.3s ease;
    }

    .table-wrapper {
      overflow-x: auto;
    }

    .btn-home {
      background: linear-gradient(to right, #f0047f, #70e1f5);
      color: black;
      font-weight: 600;
    }

    .btn-home:hover {
      background: linear-gradient(to right, #ff007a, #57d0ff);
    }

    .resume-link {
      color: #38bdf8;
      text-decoration: underline;
    }

    .resume-link:hover {
      color: #0ea5e9;
    }
  </style>
</head>
<body class="p-6">

  <div class="max-w-full bg-slate-800 p-6 rounded-xl shadow-2xl border border-slate-700">
    <h1 class="text-3xl font-bold text-center text-pink-400 mb-6">📋 Student Registration Details</h1>

    <div class="table-wrapper">
      <table class="min-w-full text-sm text-left border border-slate-700 rounded-md">
        <thead>
          <tr>
            <th class="px-4 py-3 border border-slate-600">Photo</th>
            <th class="px-4 py-3 border border-slate-600">Title</th>
            <th class="px-4 py-3 border border-slate-600">First Name</th>
            <th class="px-4 py-3 border border-slate-600">Middle Name</th>
            <th class="px-4 py-3 border border-slate-600">Last Name</th>
            <th class="px-4 py-3 border border-slate-600">Gender</th>
            <th class="px-4 py-3 border border-slate-600">DOB</th>
            <th class="px-4 py-3 border border-slate-600">Email</th>
            <th class="px-4 py-3 border border-slate-600">Phone</th>
            <th class="px-4 py-3 border border-slate-600">City</th>
            <th class="px-4 py-3 border border-slate-600">State</th>
            <th class="px-4 py-3 border border-slate-600">Country</th>
            <th class="px-4 py-3 border border-slate-600">Pincode</th>
            <th class="px-4 py-3 border border-slate-600">Degree</th>
            <th class="px-4 py-3 border border-slate-600">CGPA</th>
            <th class="px-4 py-3 border border-slate-600">College</th>
            <th class="px-4 py-3 border border-slate-600">Resume</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td class="px-4 py-3 border border-slate-700 text-center">
              <img src="https://via.placeholder.com/80" alt="Photo" class="mx-auto rounded-full border-4 border-pink-500 w-16 h-16" />
            </td>
            <td class="px-4 py-3 border border-slate-700">Mr.</td>
            <td class="px-4 py-3 border border-slate-700">John</td>
            <td class="px-4 py-3 border border-slate-700">Michael</td>
            <td class="px-4 py-3 border border-slate-700">Doe</td>
            <td class="px-4 py-3 border border-slate-700">Male</td>
            <td class="px-4 py-3 border border-slate-700">1990-01-01</td>
            <td class="px-4 py-3 border border-slate-700">john.doe@example.com</td>
            <td class="px-4 py-3 border border-slate-700">1234567890</td>
            <td class="px-4 py-3 border border-slate-700">New York</td>
            <td class="px-4 py-3 border border-slate-700">NY</td>
            <td class="px-4 py-3 border border-slate-700">USA</td>
            <td class="px-4 py-3 border border-slate-700">10001</td>
            <td class="px-4 py-3 border border-slate-700">BCA</td>
            <td class="px-4 py-3 border border-slate-700">8.5</td>
            <td class="px-4 py-3 border border-slate-700">Sankalchand Patel University</td>
            <td class="px-4 py-3 border border-slate-700">
              <a href="#" class="resume-link" download>resume.pdf</a>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>

  <div class="mt-8 text-center">
    <a href="homepage.jsp" class="inline-block px-6 py-2 rounded btn-home shadow-md">⬅ Go to Homepage</a>
  </div>

</body>
</html>
