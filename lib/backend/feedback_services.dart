import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'services_config.dart' as config;
import '../model/feedback.dart';

//for params: https://stackoverflow.com/questions/52824388/how-do-you-add-query-parameters-to-a-dart-http-request
Future<List<Feedback>> getFeedbackList(String lectureId) async {
  final response = await http.get('${config.baseUrl}/feedback/$lectureId',
      headers: config.headers);
  print("REQ: ${config.baseUrl}/feedback/$lectureId");
  if (response.statusCode != 200)
    print(response.statusCode);
  else {
    print("RESP: ${response.body}");
  }
  return allFeedbackFromJson(response.body);
  //return allFeedbackFromJson('[{"clientId": "12348","message": "Very boring","sentiment": 2,"lecture": {"id": "lecture0"}}]');
}

Future<bool> postFeedback(Feedback feedback) async {
  final String lectureId = feedback.lecture.id;
  final response = await http.post('${config.baseUrl}/feedback/$lectureId',
      headers: config.headers,
      body: json.encode(feedback.toJson()));
  print("REQ: ${config.baseUrl}/feedback/$lectureId");
  print("REQ: ${feedback.toJson()}");
  if (response.statusCode != 200)
    return false;
  else {
    print("RESP: ${response.body}");
  }
  return true;
}