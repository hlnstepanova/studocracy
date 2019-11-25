// To parse this JSON data, do
//
//     final lecture = lectureFromJson(jsonString);

import 'dart:convert';
import 'rating.dart';
import 'feedback.dart';

Lecture lectureFromJson(String str) => Lecture.fromJson(json.decode(str));

String lectureToJson(Lecture data) => json.encode(data.toJson());

List<Lecture> allLecturesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Lecture>.from(jsonData.map((l) => Lecture.fromJson(l)));
}

String allLecturesToJson(List<Lecture> data) {
  final dyn = new List<dynamic>.from(data.map((l) => l.toJson()));
  return json.encode(dyn);
}

class Lecture {
  String id;
  String title;
  int endTime;
  List<Rating> ratings;
  List<Feedback> feedbackList;

  Lecture({
    this.id,
    this.title,
    this.endTime,
    this.ratings,
    this.feedbackList,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
    id: json["id"],
    title: json["title"],
    endTime: json["endTime"],
    ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
    feedbackList: List<Feedback>.from(json["feedbackList"].map((x) => Feedback.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "endTime": endTime,
    "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
    "feedbackList": List<dynamic>.from(feedbackList.map((x) => x.toJson())),
  };
}
