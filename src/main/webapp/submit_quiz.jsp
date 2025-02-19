<%@ page import="java.sql.*" %>
<%
    Connection con = (Connection) session.getAttribute("dbConnection");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM questions");

    int score = 0;
    int totalQuestions = 0;

    while (rs.next()) {
        totalQuestions++;
        int questionId = rs.getInt("id");
        int correctAnswer = rs.getInt("correct_option");

        String selectedOption = request.getParameter("q" + questionId);
        if (selectedOption != null && Integer.parseInt(selectedOption) == correctAnswer) {
            score++;
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Result</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .result-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }
        h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }
        .score {
            font-size: 30px;
            font-weight: bold;
            color: #1e3c72;
            margin: 10px 0;
            animation: fadeIn 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.8); }
            to { opacity: 1; transform: scale(1); }
        }
        .total-questions {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }
        .play-again {
            background: #1e3c72;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            transition: 0.3s;
        }
        .play-again:hover {
            background: #2a5298;
        }
        .Admin{
        background: #1e3c72;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            transition: 0.3s;
        }
    </style>
</head>
<body>

    <div class="result-container">
        <h2>Quiz Completed!</h2>
        <div class="score">Your Score: <%= score %> / <%= totalQuestions %></div>
        <p class="total-questions">Total Questions: <%= totalQuestions %></p>
        <a href="quiz.jsp" class="play-again">Play Again</a>
        <a href="admin.jsp" class="Admin">Admin panel</a>
    </div>

</body>
</html>
