import 'package:http/http.dart' as http;
import 'dart:async';

import 'services_config.dart' as config;
import '../model/feedback.dart';

Future<List<Feedback>> getFeedbackList(String lectureId) async {
  final response = await http.get('${config.baseUrl}/feedback/$lectureId',
      headers: config.headers);
  if (response.statusCode != 200)
    print(response.statusCode);
  return allFeedbackFromJson(response.body);
}