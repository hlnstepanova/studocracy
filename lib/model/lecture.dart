// To parse this JSON data, do
//
//     final lecture = lectureFromJson(jsonString);

import 'dart:convert';

Lecture lectureFromJson(String str) => Lecture.fromJson(json.decode(str));

String lectureToJson(Lecture data) => json.encode(data.toJson());

class Lecture {
  String id;
  String title;
  DateTime endTime;
  Ratings ratings;
  List<dynamic> feedbackList;

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
    endTime: DateTime.parse(json["endTime"]),
    ratings: Ratings.fromJson(json["ratings"]),
    feedbackList: List<dynamic>.from(json["feedbackList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "endTime": endTime.toIso8601String(),
    "ratings": ratings.toJson(),
    "feedbackList": List<dynamic>.from(feedbackList.map((x) => x)),
  };
}

class Ratings {
  List<dynamic> speedRatings;
  List<dynamic> sizeRatings;
  List<dynamic> interestRatings;

  Ratings({
    this.speedRatings,
    this.sizeRatings,
    this.interestRatings,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
    speedRatings: List<dynamic>.from(json["speedRatings"].map((x) => x)),
    sizeRatings: List<dynamic>.from(json["sizeRatings"].map((x) => x)),
    interestRatings: List<dynamic>.from(json["interestRatings"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "speedRatings": List<dynamic>.from(speedRatings.map((x) => x)),
    "sizeRatings": List<dynamic>.from(sizeRatings.map((x) => x)),
    "interestRatings": List<dynamic>.from(interestRatings.map((x) => x)),
  };
}

