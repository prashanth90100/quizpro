<%@ page import="java.sql.*, java.util.*" %>
<%
    Connection con = (Connection) session.getAttribute("dbConnection");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM questions");

    List<String> questions = new ArrayList<>();
    int questionCount = 0;

    while (rs.next()) {
        questionCount++;
        questions.add("<div class='question-box'>"
            + "<p class='question-text'>" + rs.getString("question") + "</p>"
            + "<label class='option'><input type='radio' name='q" + rs.getInt("id") + "' value='1'> " + rs.getString("option1") + "</label><br>"
            + "<label class='option'><input type='radio' name='q" + rs.getInt("id") + "' value='2'> " + rs.getString("option2") + "</label><br>"
            + "<label class='option'><input type='radio' name='q" + rs.getInt("id") + "' value='3'> " + rs.getString("option3") + "</label><br>"
            + "<label class='option'><input type='radio' name='q" + rs.getInt("id") + "' value='4'> " + rs.getString("option4") + "</label><br>"
            + "</div>"
        );
    }

    int totalTime = questionCount * 60; // Total time in seconds (each question = 60s)
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz</title>
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
            min-height: 100vh;
            padding: 20px;
        }
        .quiz-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 600px;
            text-align: center;
            position: relative;
        }
        h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .timer-box {
            background: pink;
            color: black;
            padding: 8px 15px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            position: absolute;
            top: 15px;
            right: 15px;
        }
        .question-box {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
            text-align: left;
        }
        .question-text {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .option {
            display: block;
            background: #fff;
            padding: 8px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .option:hover {
            background: #e0e0e0;
        }
        input[type="radio"] {
            margin-right: 8px;
        }
        .submit-btn {
            background: #1e3c72;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: 0.3s ease;
        }
        .submit-btn:hover {
            background: #2a5298;
        }
    </style>
    <script>
        let totalTime = <%= totalTime %>; // Total quiz time in seconds

        function updateTimer() {
            let minutes = Math.floor(totalTime / 60);
            let seconds = totalTime % 60;
            document.getElementById("timer").innerText = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;
            
            if (totalTime === 0) {
                alert("Time's up! Submitting your quiz.");
                document.getElementById("quizForm").submit();
            } else {
                totalTime--;
                setTimeout(updateTimer, 1000);
            }
        }

        window.onload = function () {
            updateTimer(); // Start countdown when page loads
        };
    </script>
</head>
<body>

    <div class="quiz-container">
        <div class="timer-box">
            Time Left: <span id="timer"></span>
        </div>
        <h2>Online Quiz</h2>
        <form id="quizForm" action="submit_quiz.jsp" method="post">
            <%= String.join("", questions) %>
            <br>
            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>

</body>
</html>
