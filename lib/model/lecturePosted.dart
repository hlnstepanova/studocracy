import 'dart:convert';

LecturePosted lecturePostedFromJson (String str) {
  final jsonData = json.decode(str);
  return LecturePosted.fromJson(jsonData);
}

String lecturePostedToJson (LecturePosted data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class LecturePosted {
  String title;
  DateTime endTime;

  LecturePosted({
    this.title,
    this.endTime,
  });

  factory LecturePosted.fromJson(Map<String, dynamic> json) => LecturePosted(
    title: json["title"],
    endTime: DateTime.parse(json["endTime"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "endTime": endTime.toIso8601String(),
  };
}
