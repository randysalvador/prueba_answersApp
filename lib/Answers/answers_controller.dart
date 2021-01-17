import 'dart:convert';

import 'package:prueba/Answers/answers_controller.dart';
import 'package:prueba/Answers/answers_model.dart';
import 'package:prueba/Answers/answers_view.dart';
import 'package:http/http.dart';

import 'package:get/get.dart';

import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class AnswersController extends GetxController {
  Future getPr() async {
    final response = await rootBundle.loadString('assets/answersStores.json');
    final res = answersModelFromJson(response);
    final List<String> lista = [];
    /*
    1. Usar modelo.
    2. Recorrer lista.
    3. Asignar al modelo.
    */
    for (var v in res.answers.entries) {
//      print(v.value.answer);
      lista.add(v.value.answer);

      //below is the solution

    }
    for (var i = 1; i < lista.length; i++) {
      print("Num = ${i}  -- ${lista[i]}\n");
    }

    //final data = json.decode(response);
    /* final List<dynamic> lista = [];
    var x = Map.from(data["answers"]).map((k, v) => MapEntry<String, dynamic>(
        k, v.entries.forEach((e) => lista.add((e.value)))));
    print(lista);
    return x;*/
  }

  AnswersModel answersModelFromJson(String str) =>
      AnswersModel.fromJson(json.decode(str));

  /* Future<AnswersModel> getAnswersgeById() async {
    
    
    for (final item in items) {
      print(item.id);
    }
    print(response);
    print(allAnswersModelFromJson(response).answers[0].answer);
    return allAnswersModelFromJson(response);*/

}

//Holas asdsa
// To parse this JSON data, do
//
//     final answersModel = answersModelFromJson(jsonString);

class AnswersModel {
  AnswersModel({
    this.answers,
  });

  final Map<String, Answer> answers;

  factory AnswersModel.fromJson(Map<String, dynamic> json) => AnswersModel(
        answers: Map.from(json["answers"])
            .map((k, v) => MapEntry<String, Answer>(k, Answer.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "answers": Map.from(answers)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Answer {
  Answer({
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

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answer: json["answer"],
        guideId: json["guideId"],
        questionId: json["questionId"],
        right: json["right"],
        studentEventId: json["studentEventId"],
        time: json["time"],
        timestamp: json["timestamp"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "guideId": guideId,
        "questionId": questionId,
        "right": right,
        "studentEventId": studentEventId,
        "time": time,
        "timestamp": timestamp,
        "userId": userId,
      };
}
