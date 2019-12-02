import 'package:http/http.dart' as http;
import 'dart:async';

import 'services_config.dart' as config;
import '../model/feedback.dart';

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