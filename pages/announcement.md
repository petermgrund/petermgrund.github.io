---
layout: plain
title: Wedding Announcement
permalink: /marriage
---

<html lang="en">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

  <meta charset="UTF-8" />
  <title>Wedding announcement</title>
  <style>
    /* Google Fonts */
    @import url('https://fonts.googleapis.com/css2?family=Great+Vibes&family=Roboto&display=swap');

      body {
      margin: 0;
      padding: 0;
      font-family: 'Roboto', sans-serif;
      background: #fdf8f6;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .announcement-container {
      max-width: 600px;
      padding: 2rem;
      text-align: center;
      background: #ffffff;
      border: 2px solid #e6e2e0;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    h1 {
      font-family: 'Great Vibes', cursive;
      font-size: 4rem;
      color: #b56576;
      margin-bottom: 0.5rem;
    }

    .couple {
      font-size: 2rem;
      color: #555555;
      margin-bottom: 1rem;
    }

    .date-time,
    .location,
    .info {
      margin: 0.8rem 0;
      font-size: 1.1rem;
      color: #333333;
    }

    @media (max-width: 600px) {
      .announcement-container {
        margin-bottom: 1rem;
        padding: 1.5rem;
      }

      h1 {
        font-size: 2.5rem;
      }

      .couple {
        font-size: 1.8rem;
      }

      .date-time,
      .location,
      .info {
        font-size: 1rem;
      }
    }
  </style>

</head>
<body>
  <div class="announcement-container">
    <h1>We're Getting Married!</h1>
    <h2 class="couple">Peter &amp; Beatrice</h2>
    <b><p class="date-time">Saturday, July 12, 2025 • 3:00 PM</p></b>
    <p class="location"><i class="fa-solid fa-church"></i> Our Lady of Lourdes • Minneapolis, MN</p>
    <hr>
    <p class="info">
      <i class="fa-solid fa-champagne-glasses"></i> Reception to follow.<br />
      <i class="fa-solid fa-clock"></i> Please RSVP by [date].<br />
    </p>
    <p> See details <a href="/marriage/details">here</a>.</p>
  </div>
</body>
</html>
