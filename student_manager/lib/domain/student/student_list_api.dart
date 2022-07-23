import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_manager/core/constants.dart';

const String apiUrl = "${url}students/?api_key=$key";

Future<List<dynamic>> fetchStudents() async {
  var result = await http.get(Uri.parse(apiUrl));
  var students = json.decode(result.body)['students'];
  return students;
}
