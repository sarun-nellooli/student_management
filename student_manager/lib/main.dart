import 'package:flutter/material.dart';
import 'package:student_manager/presentation/classroom/classroom_list.dart';
import 'package:student_manager/presentation/home_screen.dart';
import 'package:student_manager/presentation/subject/subject_list.dart';

import 'presentation/student/student_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student manager',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
