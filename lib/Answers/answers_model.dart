import 'dart:convert';
import 'package:http/http.dart';

class AnswersModel {
  List<Answers> answers;
  AnswersModel({
    this.answers,
  });

  //final Map<String, Answer> answer;

  factory AnswersModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['answers'] as List;

    List<Answers> answerList = list.map((i) => Answers.fromJson(i)).toList();
    return AnswersModel(
      answers: answerList,
    );
  }
}

class Answers {
  Answers({
    this.answer,
    this.guideId,
    this.questionId,
    this.right,
    this.studentEventId,
    this.time,
    this.timestamp,
    this.userId,
  });

  final String answer;
  final String guideId;
  final int questionId;
  final bool right;
  final String studentEventId;
  final int time;
  final int timestamp;
  final String userId;

  factory Answers.fromJson(Map<String, dynamic> json) {
    return Answers(
      answer: json["answer"],
      guideId: json["guideId"],
      questionId: json["questionId"],
      right: json["right"],
      studentEventId: json["studentEventId"],
      time: json["time"],
      timestamp: json["timestamp"],
      userId: json["userId"],
    );
  }
}

AnswersModel allAnswersModelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return AnswersModel.fromJson(data);
}
