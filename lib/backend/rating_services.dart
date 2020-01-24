import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:device_info/device_info.dart';


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

Future<bool> postRatingByCategory(Rating rating, String category) async {
  final String lectureId = rating.lecture.id;
  final response = await http.post('${config.baseUrl}/rating/$lectureId',
      headers: config.headers,
      body: json.encode(rating.toJson()));
  print("REQ: ${config.baseUrl}/rating/$lectureId/$category");
  print("REQ: ${rating.toJson()}");
  if (response.statusCode != 200)
    return false;
  else {
    print("RESP: ${response.body}");
  }
  return true;
}

