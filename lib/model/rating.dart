// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';
import 'lecture.dart';

Rating ratingFromJson(String str) => Rating.fromJson(json.decode(str));

String ratingToJson(Rating data) => json.encode(data.toJson());

List<Rating> allRatingsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Rating>.from(jsonData.map((r) => Rating.fromJson(r)));
}

String allRatingsToJson(List<Rating> data) {
  final dyn = new List<dynamic>.from(data.map((r) => r.toJson()));
  return json.encode(dyn);
}

class Rating {
  String clientId;
  String category;
  double value;
  Lecture lecture;

  Rating({
    this.clientId,
    this.category,
    this.value,
    this.lecture,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    clientId: json["clientId"],
    category: json["category"],
    value: json["value"],
    lecture: Lecture.fromJson(json["lecture"]),
  );

  Map<String, dynamic> toJson() => {
    "clientId": clientId,
    "category": category,
    "value": value,
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
