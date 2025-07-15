<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Update Student</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    function previewPhoto(event) {
      const file = event.target.files[0];
      const preview = document.getElementById('photoPreview');
      const uploadBtn = document.getElementById('uploadBtn');
      if (file) {
        preview.src = URL.createObjectURL(file);
        preview.classList.remove('hidden');
        uploadBtn.style.display = 'none';
      }
    }
  </script>
</head>
<body class="bg-black text-white min-h-screen py-10 px-4">

  <div class="max-w-5xl mx-auto bg-gradient-to-br from-[#1e1e2f] to-[#2e2e4f] p-8 rounded-xl shadow-lg">
    <h1 class="text-center text-3xl font-bold mb-6 bg-gradient-to-r from-pink-500 to-blue-400 text-transparent bg-clip-text">Update Student</h1>

    <form action="#" method="post" enctype="multipart/form-data" class="space-y-8">

      <!-- Upload Photo -->
      <div class="flex flex-col items-center mb-6">
        <label class="mb-2 font-medium text-gray-200">Upload Photo</label>
        <input type="file" name="photo" accept="image/*" onchange="previewPhoto(event)" id="photoInput" class="hidden" required />
        <button type="button" id="uploadBtn" onclick="document.getElementById('photoInput').click()" class="w-16 h-16 bg-gradient-to-r from-pink-500 to-blue-400 text-white rounded-full flex items-center justify-center hover:opacity-90">
          📷
        </button>
        <img id="photoPreview" src="" alt="Preview" class="hidden w-32 h-32 object-cover rounded-full border-4 border-blue-400 shadow-lg mt-4" />
      </div>

      <!-- Name Fields -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div>
          <label class="text-gray-300 font-medium">Title</label>
          <select name="title" required class="w-full px-3 py-2 rounded bg-black text-white border border-gray-500">
            <option selected>Mr.</option>
            <option>Mrs.</option>
            <option>Ms.</option>
            <option>Dr.</option>
          </select>
        </div>
        <div>
          <label class="text-gray-300 font-medium">First Name</label>
          <input type="text" name="firstName" value="Hiten" required class="w-full px-3 py-2 rounded bg-black text-white border border-gray-500" />
        </div>
        <div>
          <label class="text-gray-300 font-medium">Middle Name</label>
          <input type="text" name="middleName" value="Kumar" required class="w-full px-3 py-2 rounded bg-black text-white border border-gray-500" />
        </div>
        <div>
          <label class="text-gray-300 font-medium">Last Name</label>
          <input type="text" name="lastName" value="Prajapati" required class="w-full px-3 py-2 rounded bg-black text-white border border-gray-500" />
        </div>
      </div>

      <!-- Gender -->
      <div>
        <label class="text-gray-300 font-medium block mb-2">Gender</label>
        <div class="flex gap-6">
          <label class="flex items-center gap-2"><input type="radio" name="gender" value="Male" required class="accent-pink-500" /> Male</label>
          <label class="flex items-center gap-2"><input type="radio" name="gender" value="Female" class="accent-pink-500" /> Female</label>
          <label class="flex items-center gap-2"><input type="radio" name="gender" value="Other" class="accent-pink-500" /> Other</label>
        </div>
      </div>

      <!-- DOB, Email, Phone -->
      <div class="grid md:grid-cols-3 gap-4">
        <div>
          <label class="text-gray-300 font-medium">📅 Date of Birth</label>
          <input type="date" name="dob" required class="w-full px-3 py-2 rounded bg-black text-white border border-gray-500" />
        </div>
        <div>
          <label class="text-gray-300 font-medium">📧 Email</label>
          <input type="email" name="email" required class="w-full px-3 py-2 rounded bg-black text-white border border-gray-500" />
        </div>
        <div>
          <label class="text-gray-300 font-medium">📞 Phone</label>
          <input type="tel" name="phone" pattern="[0-9]{10}" required class="w-full px-3 py-2 rounded bg-black text-white border border-gray-500" />
        </div>
      </div>

      <!-- Address -->
      <h2 class="text-xl font-semibold text-pink-400 mt-4">🏠 Address</h2>
      <div class="grid md:grid-cols-4 gap-4">
        <input type="text" name="city" placeholder="City" required class="border px-3 py-2 rounded bg-black text-white border-gray-500" />
        <input type="text" name="state" placeholder="State" required class="border px-3 py-2 rounded bg-black text-white border-gray-500" />
        <input type="text" name="country" placeholder="Country" required class="border px-3 py-2 rounded bg-black text-white border-gray-500" />
        <input type="text" name="pincode" pattern="[0-9]{6}" placeholder="Pincode" required class="border px-3 py-2 rounded bg-black text-white border-gray-500" />
      </div>

      <!-- Education -->
      <h2 class="text-xl font-semibold text-pink-400 mt-4">🎓 Education</h2>
      <div class="grid md:grid-cols-3 gap-4">
        <input type="text" name="degree" placeholder="Degree" required class="border px-3 py-2 rounded bg-black text-white border-gray-500" />
        <input type="number" step="0.01" min="0" max="10" name="cgpa" placeholder="CGPA" required class="border px-3 py-2 rounded bg-black text-white border-gray-500" />
        <input type="text" name="college" placeholder="College Name" required class="border px-3 py-2 rounded bg-black text-white border-gray-500" />
      </div>

      <!-- Resume -->
      <div class="mt-6">
        <label class="text-gray-300 font-medium">📄 Upload Resume</label>
        <input type="file" name="resume" accept=".pdf,.doc,.docx" required class="text-white" />
      </div>

      <!-- Buttons -->
      <div class="flex justify-between mt-10">
        <button type="submit" class="bg-gradient-to-r from-green-500 to-blue-400 text-black px-6 py-2 rounded font-semibold hover:scale-105 transition">Submit</button>
        <a href="homepage.jsp" class="bg-gradient-to-r from-gray-600 to-gray-800 text-white px-6 py-2 rounded font-semibold hover:scale-105 transition">Go to Homepage</a>
      </div>

    </form>
  </div>

</body>
</html>
