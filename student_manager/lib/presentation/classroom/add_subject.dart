import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_manager/core/constants.dart';
import 'package:http/http.dart' as http;

class AddSubject extends StatefulWidget {
  const AddSubject({Key? key, required this.selected}) : super(key: key);
  final int selected;
  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  int _id = 0;
  String _layout = "";
  String? _name = "";
  int _size = 0;
  String _subject = "";

  @override
  initState() {
    fetchClassroomDetail(widget.selected);
    super.initState();
  }

  Future<dynamic> fetchClassroomDetail(int selected) async {
    var div = selected;
    var result =
        await http.get(Uri.parse("${url}classrooms/$div?api_key=$key"));
    setState(() {
      _id = jsonDecode(result.body)['id'];
      _layout = jsonDecode(result.body)['layout'];
      _name = jsonDecode(result.body)['name'];
      _size = jsonDecode(result.body)['size'];
      _subject = jsonDecode(result.body)['subject'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Classroom'),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ID: ${_id.toString()}"),
                Text("Name: ${_name.toString()}"),
                Text("Layout: ${_layout.toString()}"),
                Text("Size: ${_size.toString()}"),
                
              ],
            ),
          ),
        ));
  }
}
