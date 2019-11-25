// To parse this JSON data, do
//
//     final lecture = lectureFromJson(jsonString);

import 'dart:convert';

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
  DateTime endTime;

  Lecture({
    this.id,
    this.title,
    this.endTime,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
    id: json["id"],
    title: json["title"],
    endTime: DateTime.parse(json["endTime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "endTime": endTime.toIso8601String(),
  };
}
