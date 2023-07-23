import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class DataRepository {
  static String apiUrl = "http://coding-assignment.bombayrunning.com/data.json";

  static Future<List<DataModel>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON data.
        List<dynamic> jsonData = json.decode(response.body);
        List<DataModel> data =
            jsonData.map((e) => DataModel.fromJson(e)).toList();
        return data;
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle any errors that occurred during the HTTP request.
      throw Exception('Failed to connect to the server');
    }
  }
}
