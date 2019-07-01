<%@ page import="org.jdom2.Element" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>QuizApp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w" crossorigin="anonymous">
</head>
<body>
    <% Element questions = (Element) request.getAttribute("questions"); %>
    <h2>Java Quiz</h2>
    <form method="post">
     <% for(Element question : questions.getChildren()) { %>
        <% String questionHeader = "Question " + question.getChildText("id") ; %>
        <% String questionId = "question-" + question.getChildText("id"); %>
        <fieldset>
            <legend><%=questionHeader%></legend>
            <div> <%= question.getChildText("questionText")%> </div>
            <div>
                <% for( Element choice : question.getChild("choices").getChildren("choice")) { %>
                    <% String choiceNum = choice.getAttributeValue("id");
                        String choiceId = "choice-" + choiceNum;
                        String choiceVal = choiceNum + ") " + choice.getAttributeValue("value");
                        %>
                        <input type="radio"
                               id="<%= choiceId %>"
                               name="<%= questionId %>"
                               value="<%= choiceNum%>"
                               required
                        >
                        <label for="<%= choiceId%>"> <%=choiceVal%></label>
                        <br>
                <%}%>
            </div>
        </fieldset>
        <br><br>
    <% } %>

    <input type="submit" value="Submit" class="pure-button">
    </form>
</body>
</html>
