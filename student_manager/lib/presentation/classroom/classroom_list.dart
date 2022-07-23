import 'package:flutter/material.dart';
import 'package:student_manager/domain/classroom/classroom_list_api.dart';
import 'package:student_manager/domain/subject/subject_list_api.dart';

class ClassroomList extends StatefulWidget {
  const ClassroomList({Key? key}) : super(key: key);

  @override
  State<ClassroomList> createState() => _ClassroomListState();
}

class _ClassroomListState extends State<ClassroomList> {
  String _name(dynamic user) {
    return user['name'].toString();
  }

  String _layout(dynamic user) {
    return user['layout'];
  }

  String _size(Map<dynamic, dynamic> user) {
    return user['size'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Classroom List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchClassroom(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ExpansionTile(
                      // leading: const CircleAvatar(
                      //   backgroundImage: AssetImage('assets/avatar.png'),
                      //   radius: 30,
                      // ),
                      title: Text(_name(snapshot.data[index])),
                      children: <Widget>[
                        ListTile(
                          title:
                              Text("Layout: ${_layout(snapshot.data[index])}"),
                          subtitle:
                              Text("Size: ${_size(snapshot.data[index])}"),
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
