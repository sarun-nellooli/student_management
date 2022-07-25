import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_manager/domain/classroom/classroom_list_api.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    fetchClassrooms();
    super.initState();
    setState(() {});
  }

  String? dropdownvalue = 'classroom1';
  var items = [
    'classroom1',
    'classroom2',
    'classromm3',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Assign",
                  ),
                  Tab(
                    text: "Remove",
                  ),
                ],
              ),
              title: Text('Tabs Demo'),
            ),
            body: DropdownButton(
              value: dropdownvalue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue;
                });
              },
            )));
  }
}
