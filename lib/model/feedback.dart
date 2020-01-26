// To parse this JSON data, do
//
//     final feedback = feedbackFromJson(jsonString);

import 'dart:convert';
import 'lecture.dart';

Feedback feedbackFromJson(String str) => Feedback.fromJson(json.decode(str));

String feedbackToJson(Feedback data) => json.encode(data.toJson());

List<Feedback> allFeedbackFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Feedback>.from(jsonData.map((f) => Feedback.fromJson(f)));
}

String allFeedbackToJson(List<Feedback> data) {
  final dyn = new List<dynamic>.from(data.map((f) => f.toJson()));
  return json.encode(dyn);
}

class Feedback {
  String clientId;
  String message;
  int sentiment;
  Lecture lecture;

  Feedback({
    this.clientId,
    this.message,
    this.sentiment,
    this.lecture,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
    clientId: json["clientId"],
    message: json["message"],
    sentiment: json["sentiment"],
    lecture: Lecture.fromJson(json["lecture"]),
  );

  Map<String, dynamic> toJson() => {
    "clientId": clientId,
    "message": message,
    "sentiment": sentiment,
    "lecture": lecture.toJson(),
  };
}

class Lecture {
  String id;

  Lecture({
    this.id,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}