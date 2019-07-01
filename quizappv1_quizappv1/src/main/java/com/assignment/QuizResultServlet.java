package com.assignment;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(description = "quiz info read", urlPatterns = { "/show-results"})
public class QuizResultServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) {
        SAXBuilder saxBuilder = new SAXBuilder();

        Document answerDocument, questionDocument;
        try {
            answerDocument = saxBuilder.build(new File("./quiz-bank/answers.xml"));
            questionDocument = saxBuilder.build(new File("./quiz-bank/questions.xml"));

            Map<String, String > answerMap = new HashMap<>();

            for (Element element : questionDocument.getRootElement().getChildren("Question")) {
                answerMap.put(element.getChildText("id"), element.getChildText("correctAnswer"));
            }
            List<QuestionResultModel> questionResultList = new ArrayList<>();
            for (Element element: answerDocument.getRootElement().getChildren("answer")) {
               String questionId =  element.getAttributeValue("questionId");
                String answerChoiceId = element.getAttributeValue("answerChoiceId");
                QuestionResultModel questionResultModel = new QuestionResultModel(
                        questionId,
                        answerChoiceId,
                        answerMap.get(questionId).equals(answerChoiceId)
                );
                questionResultList.add(questionResultModel);

            }

            req.setAttribute("result", questionResultList);
            RequestDispatcher view = req.getRequestDispatcher("show-results.jsp");
            view.forward(req, res);


        }
        catch (Exception e){
            e.printStackTrace();
        }


    }

}
