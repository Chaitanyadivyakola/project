<%@ page import="java.util.List" %>
<%@ page import="com.assignment.QuestionResultModel" %><%--
  Created by IntelliJ IDEA.
  User: ijebastinabraham
  Date: 2019-06-21
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QuizApp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
    <table class="pure-table" align="center">
        <thead>
        <tr>
            <th>Question No</th>
            <th>Answer</th>
            <th>Result</th>
        </tr>
        </thead>
        <tbody>
            <% List<QuestionResultModel> resultList = (List<QuestionResultModel>) request.getAttribute("result"); %>
            <% for (QuestionResultModel result :resultList ) { %>
                <tr>
                    <td><%= result.questionId%></td>
                    <td><%=result.answerChoice%></td>
                    <td>
                        <% if(result.isCorrect) { %>
                            <i class="fas fa-check-circle"></i>
                        <%} else { %>
                            <i class="fas fa-times-circle"></i>
                        <% } %>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
