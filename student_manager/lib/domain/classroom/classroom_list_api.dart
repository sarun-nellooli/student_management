import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_manager/core/constants.dart';

const String apiUrl = "${url}classrooms/?api_key=$key";

Future<List<dynamic>> fetchClassroom() async {
  var result = await http.get(Uri.parse(apiUrl));
  var classrooms = json.decode(result.body)['classrooms'];
  print(classrooms);
  return classrooms;
}
Future<List<dynamic>> fetchClassrooms() async {
  var result = await http.get(Uri.parse(apiUrl));
  var classrooms = json.decode(result.body)['classrooms'];
  print(classrooms[0]['name']);
  return classrooms;
}
