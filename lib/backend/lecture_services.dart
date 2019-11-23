import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../model/lecture.dart';
import '../model/lecturePosted.dart';

final headers = {
  HttpHeaders.contentTypeHeader: 'application/json',
  HttpHeaders.authorizationHeader : ''
};
final String yannicksBaseUrl = "http://192.168.2.138:8888/lectures";
final String baseUrl = "http://192.168.56.1:8888/lectures";

Future<Lecture> postLecture(LecturePosted lecture) async {
    final response = await http.post('$baseUrl',
      headers: headers,
      body: lecturePostedToJson(lecture)
  );

  if(response.statusCode == 200)
    print(response.body);
  else
    print(response.statusCode);

  return lectureFromJson(response.body);
}

Future<List<Lecture>> getLectures() async {
  final response = await http.get('$yannicksBaseUrl',
      headers: headers);
  if (response.statusCode != 200)
    print(response.statusCode);
  return allLecturesFromJson(response.body);
}