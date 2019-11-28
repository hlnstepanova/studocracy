import 'package:http/http.dart' as http;
import 'dart:async';

import 'services_config.dart' as config;
import '../model/lecture.dart';
import '../model/lecturePosted.dart';


Future<Lecture> postLecture(LecturePosted lecture) async {
    final response = await http.post('${config.baseUrl}/lectures',
      headers: config.headers,
      body: lecturePostedToJson(lecture)
  );

  if(response.statusCode == 200)
    print("RESP: ${response.body}");
  else
    print("Error code: ${response.statusCode}");

  return lectureFromJson(response.body);
}

Future<List<Lecture>> getLectures() async {
  final response = await http.get('${config.baseUrl}/lectures',
      headers: config.headers);
  if (response.statusCode != 200)
    print(response.statusCode);
  else {
    print("RESP: ${response.body}");
  }
  return allLecturesFromJson(response.body);
}