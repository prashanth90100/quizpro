<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Add Question</title>
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
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 500px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
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
</head>
<body>

    <div class="container">
        <h2>Add New Question</h2>
        <form action="add_question.jsp" method="post">
            <div class="form-group">
                <label>Question:</label>
                <input type="text" name="question" required>
            </div>
            <div class="form-group">
                <label>Option 1:</label>
                <input type="text" name="option1" required>
            </div>
            <div class="form-group">
                <label>Option 2:</label>
                <input type="text" name="option2" required>
            </div>
            <div class="form-group">
                <label>Option 3:</label>
                <input type="text" name="option3" required>
            </div>
            <div class="form-group">
                <label>Option 4:</label>
                <input type="text" name="option4" required>
            </div>
            <div class="form-group">
                <label>Correct Option (1-4):</label>
                <input type="number" name="correct_option" min="1" max="4" required>
            </div>
            <button type="submit" class="submit-btn">Add Question</button>
        </form>
    </div>

</body>
</html>
