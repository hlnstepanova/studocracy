import 'package:http/http.dart' as http;
import 'dart:async';

import 'services_config.dart' as config;
import '../model/rating.dart';

Future<List<Rating>> getRatings(String lectureId) async {
  final response = await http.get('${config.baseUrl}/rating/$lectureId',
      headers: config.headers);
  print("REQ: ${config.baseUrl}/rating/$lectureId");
  if (response.statusCode != 200)
    print(response.statusCode);
  else {
    print("RESP: ${response.body}");
  }
  return allRatingsFromJson(response.body);
}

Future<Rating> getRatingByCategory(String lectureId, String category) async {
  final response = await http.get('${config.baseUrl}/rating/$lectureId/$category',
      headers: config.headers);
  print("REQ: ${config.baseUrl}/rating/$lectureId/$category");
  if (response.statusCode != 200)
    print(response.statusCode);
  else {
    print("RESP: ${response.body}");
  }
  return ratingFromJson(response.body);
  //return ratingFromJson('{"clientId": "12348","category": "speed","value": 2,"lecture": {"id": "lecture0"}}');
}

Future<Rating> postRatingByCategory(Rating rating, String category) async {
  final response = await http.get('${config.baseUrl}/rating/${rating.lecture.id}/$category',
      headers: config.headers);
  print("REQ: ${config.baseUrl}/rating/${rating.lecture.id}/$category");
  if (response.statusCode != 200)
    print(response.statusCode);
  else {
    print("RESP: ${response.body}");
  }
  return ratingFromJson(response.body);
}

