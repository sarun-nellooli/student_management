import 'package:flutter/material.dart';
import 'package:student_manager/domain/subject/subject_list_api.dart';

class SubjectList extends StatefulWidget {
  const SubjectList({Key? key}) : super(key: key);

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  String _credits(dynamic user) {
    return user['credits'].toString();
  }

  String _name(dynamic user) {
    return user['name'];
  }

  String _teacher(Map<dynamic, dynamic> user) {
    return user['teacher'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Subject List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchSubjects(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ExpansionTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/subject.png'),
                        radius: 25,
                      ),
                      title: Text(_name(snapshot.data[index])),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                              "Teacher: ${_teacher(snapshot.data[index])}"),
                          subtitle:
                              Text("ID: ${_credits(snapshot.data[index])}"),
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
