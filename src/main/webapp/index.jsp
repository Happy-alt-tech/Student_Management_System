<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Student Management System</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: #000;
      color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      min-height: 100vh;
      overflow-x: hidden;
    }

    .container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      max-width: 1100px;
      padding: 40px;
      width: 100%;
    }

    .left {
      flex: 1;
    }

    .logo {
      background: white;
      color: black;
      display: inline-block;
      padding: 6px 14px;
      font-weight: bold;
      font-size: 0.9rem;
      border-radius: 25px;
      margin-bottom: 20px;
      transition: all 0.3s ease;
    }

    .logo:hover {
      background: #eee;
      transform: scale(1.05);
    }

    h1 {
      font-size: 3rem;
      font-weight: 700;
      line-height: 1.2;
    }

    p {
      margin: 20px 0;
      color: #ccc;
    }

    .explore-btn {
      display: inline-block;
      padding: 12px 30px;
      background: linear-gradient(90deg, #f0047f, #70e1f5);
      color: black;
      font-weight: 600;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .explore-btn:hover {
      transform: translateY(-3px) scale(1.05);
      box-shadow: 0 5px 15px rgba(255, 255, 255, 0.2);
    }

    .socials {
      margin-top: 25px;
    }

    .socials a {
      margin-right: 15px;
      color: white;
      font-size: 1.2rem;
      text-decoration: none;
      transition: transform 0.3s ease;
    }

    .socials a:hover {
      transform: scale(1.3);
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
        text-align: center;
      }

      .right {
        margin-top: 40px;
      }

      h1 {
        font-size: 2.2rem;
      }
    }

    .cartoon-character {
      position: relative;
    }

    .cartoon-character img {
      max-width: 260px;
      height: auto;
      object-fit: contain;
      filter: drop-shadow(0 0 10px rgba(255, 255, 255, 0.3));
      animation: floatGirl 3s ease-in-out infinite;
    }

    /* ➤ Arrow Button */
    .scroll-arrow {
    
      position: absolute;
      top: 50%;
      right: -40px;
      transform: translateY(-50%);
      background: linear-gradient(90deg, #f0047f, #70e1f5);
      border: none;
      padding: 12px 16px;
      border-radius: 50%;
      color: #fff;
      font-size: 20px;
      cursor: pointer;
      box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
      transition: all 0.3s ease;
    }

    .scroll-arrow:hover {
      transform: translateY(-50%) scale(1.1);
      background: #f0047f;
    }

    /* Floating animation */
    @keyframes floatGirl {
      0%, 100% {
        transform: translateY(0px);
      }
      50% {
        transform: translateY(-10px);
      }
    }

    .about-section {
      width: 100%;
      padding: 60px 40px;
      background: #111;
      color: white;
      text-align: center;
      animation: fadeInUp 1.2s ease-in-out;
    }

    .about-section h2 {
      font-size: 2.5rem;
      margin-bottom: 20px;
      background: linear-gradient(90deg, #f0047f, #70e1f5);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .about-section .desc {
      font-size: 1.1rem;
      max-width: 800px;
      margin: 0 auto 40px;
      line-height: 1.7;
      color: #ccc;
    }

    .about-section .desc span {
      color: #fff;
      font-weight: bold;
      transition: color 0.3s ease;
    }

    .about-section .desc span:hover {
      color: #f0047f;
    }

    .features {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 30px;
    }

    .feature-card {
      background: #1a1a1a;
      padding: 20px 30px;
      border-radius: 12px;
      max-width: 280px;
      box-shadow: 0 5px 15px rgba(255,255,255,0.05);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .feature-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 10px 20px rgba(255,255,255,0.1);
    }

    .feature-card h3 {
      font-size: 1.5rem;
      margin-bottom: 10px;
      color: #f0047f;
    }

    .feature-card p {
      font-size: 0.95rem;
      color: #ccc;
      line-height: 1.5;
    }

    @keyframes fadeInUp {
      0% {
        opacity: 0;
        transform: translateY(30px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }
    .custom-footer {
  position: relative;
  background: #0b0b0b;
  padding: 60px 20px 40px;
  text-align: center;
  color: #eee;
  overflow: hidden;
}

.footer-gradient {
  position: absolute;
  top: -50px;
  left: 50%;
  width: 400px;
  height: 400px;
  background: radial-gradient(circle at center, #ff007f33, #70e1f522);
  transform: translateX(-50%);
  z-index: 0;
  filter: blur(60px);
  animation: floatGlow 8s ease-in-out infinite;
}

.footer-content {
  position: relative;
  z-index: 1;
  max-width: 800px;
  margin: 0 auto;
}

.footer-title {
  font-size: 2rem;
  margin-bottom: 15px;
  background: linear-gradient(to right, #f0047f, #70e1f5);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: fadeInUp 1s ease forwards;
}

.footer-tagline {
  font-size: 1rem;
  color: #bbb;
  margin-bottom: 30px;
  animation: fadeInUp 1.5s ease forwards;
}

.footer-socials a {
  font-size: 1.5rem;
  margin: 0 12px;
  color: white;
  display: inline-block;
  transition: transform 0.3s ease, color 0.3s;
}

.footer-socials a:hover {
  transform: scale(1.2) rotate(-5deg);
  color: #f0047f;
}

.footer-bottom-text {
  margin-top: 40px;
  font-size: 0.85rem;
  color: #666;
  animation: fadeInUp 2s ease forwards;
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    transform: translateY(20px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes floatGlow {
  0%, 100% {
    transform: translateX(-50%) translateY(0px);
  }
  50% {
    transform: translateX(-50%) translateY(-15px);
  }
}
    
  </style>
</head>
<body>

  <div class="container">
    <div class="left">
      <div class="logo">🌟 YOUR WEBSITE</div>
      <h1>STUDENT<br>MANAGEMENT<br>SYSTEM</h1>
      <p>Manage your data here.</p>
      <a href="login.jsp" class="explore-btn">Explore now</a>
      <div class="socials">
        <a href="#"><i class="fab fa-facebook-f">📘</i></a>
        <a href="#"><i class="fab fa-instagram">📸</i></a>
        <a href="#"><i class="fab fa-twitter">🐦</i></a>
      </div>
    </div>

    <!-- Side cartoon character + arrow -->
    <div class="cartoon-character">
      <img src="images/schoolgirl-removebg-preview.png" alt="Schoolgirl" />
      <button class="scroll-arrow" onclick="scrollToAbout()">➤</button>
    </div>
  </div>

  <!-- About Section -->
  <section class="about-section">
    <h2>✨ About This Website</h2>
    <p class="desc">
      Our Student Management System allows you to <span>add</span>, <span>update</span>, <span>delete</span>, and <span>view</span> student records easily. 
      Designed with a user-friendly interface, this platform helps institutions manage data efficiently and securely.
    </p>

    <div class="features">
      <div class="feature-card">
        <h3>Add Students</h3>
        <p>Register new students with complete academic and personal details.</p>
      </div>
      <div class="feature-card">
        <h3>Update Info</h3>
        <p>Modify existing records like contact, grades, or personal data anytime.</p>
      </div>
      <div class="feature-card">
        <h3>List & Search</h3>
        <p>View all student records with dynamic search and filters.</p>
      </div>
    </div>
  </section>
  <footer class="custom-footer">
  <div class="footer-gradient"></div>
  <div class="footer-content">
    <h2 class="footer-title">Let’s make student data smarter. 📚</h2>
    <p class="footer-tagline">Built for schools, teachers, and admins who care about managing students beautifully.</p>
    <div class="footer-socials">
      <a href="#" aria-label="Facebook">📘</a>
      <a href="#" aria-label="Instagram">📸</a>
      <a href="#" aria-label="Twitter">🐦</a>
    </div>
    <p class="footer-bottom-text">© 2025 SMS — Student Management System</p>
  </div>
</footer>
  

  <!-- JavaScript to scroll -->
  <script>
    function scrollToAbout() {
      const aboutSection = document.querySelector('.about-section');
      if (aboutSection) {
        aboutSection.scrollIntoView({ behavior: 'smooth' });
      }
    }
  </script>

</body>
</html>
