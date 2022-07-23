import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_manager/core/constants.dart';

const String apiUrl = "${url}subjects/?api_key=$key";

Future<List<dynamic>> fetchSubjects() async {
  var result = await http.get(Uri.parse(apiUrl));
  var subjects = json.decode(result.body)['subjects'];
  print(subjects);
  return subjects;
}
