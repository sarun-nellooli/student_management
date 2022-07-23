import 'package:flutter/material.dart';
import 'package:student_manager/domain/student/student_list_api.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  String _id(dynamic user) {
    return user['id'].toString();
  }

  String _name(dynamic user) {
    return user['name'];
  }

  String _email(dynamic user) {
    return user['email'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return user['age'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Students List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchStudents(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ExpansionTile(
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/avatar.png'),
                        radius: 30,
                      ),
                      title: Text(_name(snapshot.data[index])),
                      children: <Widget>[
                        ListTile(
                          title: Text("Id: ${_id(snapshot.data[index])}"),
                          subtitle: Text("Age: ${_age(snapshot.data[index])}"),
                          trailing:
                              Text("Email: ${_email(snapshot.data[index])}"),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
