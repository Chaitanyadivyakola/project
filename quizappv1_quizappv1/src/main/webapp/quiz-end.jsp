<%--
  Created by IntelliJ IDEA.
  User: ijebastinabraham
  Date: 2019-06-21
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QuizApp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
</head>
<body>
<style scoped>

    .button-success,
    .button-secondary {
        color: white;
        border-radius: 4px;
        text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
    }

    .button-success {
        background: rgb(28, 184, 65); /* this is a green */
    }
    .button-secondary {
        background: rgb(66, 184, 221); /* this is a light blue */
    }

</style>

<h2> Thank you!</h2>
<p>Answers have been successfully submitted!</p>
<br>
<div>
    <form action="quiz-form">
        <input type="submit" value="Retake Quiz" class="button-secondary pure-button">
    </form>
    <form action="show-results">
        <input type="submit" value="Show Results" class="button-success pure-button">
    </form>
</div>
</body>
</html>
