package com.assignment;

import org.jdom2.Document;
import org.jdom2.input.SAXBuilder;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamWriter;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.StringWriter;
import java.util.Map;


@WebServlet(description = "quiz info read", urlPatterns = { "/quiz-form"})
public class QuizMainServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) {
        SAXBuilder saxBuilder = new SAXBuilder();

        Document document;
        try {
            document = saxBuilder.build(new File("./quiz-bank/questions.xml"));

            req.setAttribute("questions", document.getRootElement());
            RequestDispatcher view = req.getRequestDispatcher("quiz-form.jsp");
            view.forward(req, res);


        }
        catch (Exception e){
            e.printStackTrace();
        }


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        Map<String, String[]> params = request.getParameterMap();
        StringWriter stringWriter = new StringWriter();

        XMLOutputFactory xmlOutputFactory = XMLOutputFactory.newInstance();
        try {
             XMLStreamWriter xmlStreamWriter = xmlOutputFactory.createXMLStreamWriter(stringWriter);
             xmlStreamWriter.writeStartDocument();
             xmlStreamWriter.writeStartElement("AnswerList");
             for (Map.Entry<String, String[]> answerEntry : params.entrySet()) {
                 xmlStreamWriter.writeStartElement("answer");
                 xmlStreamWriter.writeAttribute("questionId", answerEntry.getKey().replaceAll("question-",""));
                 xmlStreamWriter.writeAttribute("answerChoiceId", answerEntry.getValue()[0]);
                 xmlStreamWriter.writeEndElement();
             }
             xmlStreamWriter.writeEndElement();
             xmlStreamWriter.writeEndDocument();
             xmlStreamWriter.flush();
             xmlStreamWriter.close();

             BufferedWriter bwr = new BufferedWriter(new FileWriter(new File("./quiz-bank/answers.xml")));
             bwr.write(stringWriter.getBuffer().toString());
             bwr.flush();
             bwr.close();
             stringWriter.close();
             RequestDispatcher view = request.getRequestDispatcher("quiz-end.jsp");
             view.forward(request, response);

         }
        catch (Exception e){
            e.printStackTrace();
        }


    }

}

