import 'package:flutter/material.dart';
import 'package:student_manager/core/widgets/button.dart';
import 'package:student_manager/presentation/classroom/classroom_list.dart';
import 'package:student_manager/presentation/student/student_list.dart';
import 'package:student_manager/presentation/subject/subject_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              btnText: "Student Details",
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentList()),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
                btnText: "Subject Details",
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SubjectList()),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            Button(
                btnText: "Classroom Details",
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ClassroomList()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
