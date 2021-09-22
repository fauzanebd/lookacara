import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:look_acara/models/user.dart';
import 'package:look_acara/models/event.dart';
// import 'package:dio/dio.dart';

class ApiService {
  // static var client = http.Client();

  static Future<List<Event>?> fetchEvents() async {
    var response = await http
        .get(Uri.parse('https://api-lokacara.herokuapp.com/api/v1/event'));
    print(response.body);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(response.body);
      return eventsFromJson(jsonString);
    }
  }
}
