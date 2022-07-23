import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_manager/core/constants.dart';

const String apiUrl = "${url}classrooms/?api_key=$key";

Future<List<dynamic>> fetchClassroom() async {
  var result = await http.get(Uri.parse(apiUrl));
  var classrooms = json.decode(result.body)['classrooms'];
  return classrooms;
}
