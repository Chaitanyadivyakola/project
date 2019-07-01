package com.assignment;
public class QuestionResultModel {
    public String questionId;
    public String answerChoice;
    public Boolean isCorrect;

    QuestionResultModel(String questionId, String answerChoice, Boolean isCorrect){
        this.questionId = questionId;
        this.answerChoice = answerChoice;
        this.isCorrect = isCorrect;
    }

}
