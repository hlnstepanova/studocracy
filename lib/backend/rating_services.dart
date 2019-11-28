import 'package:http/http.dart' as http;
import 'dart:async';

import 'services_config.dart' as config;
import '../model/rating.dart';

Future<List<Rating>> getRatings(String lectureId) async {
  final response = await http.get('${config.baseUrl}/rating/$lectureId',
      headers: config.headers);
  if (response.statusCode != 200)
    print(response.statusCode);
  return allRatingsFromJson(response.body);
}

