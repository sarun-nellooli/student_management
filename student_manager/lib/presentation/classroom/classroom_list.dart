import 'package:flutter/material.dart';
import 'package:student_manager/domain/classroom/classroom_list_api.dart';
import 'package:student_manager/domain/subject/subject_list_api.dart';
import 'package:student_manager/presentation/classroom/add_subject.dart';

class ClassroomList extends StatefulWidget {
  const ClassroomList({Key? key}) : super(key: key);

  @override
  State<ClassroomList> createState() => _ClassroomListState();
}

class _ClassroomListState extends State<ClassroomList> {
  
  String _name(dynamic user) {
    return user['name'].toString();
  }

  int _id(dynamic user) {
    return user['id'];
  }

  String _layout(dynamic user) {
    return user['layout'];
  }

  String _size(Map<dynamic, dynamic> user) {
    return user['size'].toString();
  }

  var selected;
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
                      leading: const CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/class.png'),
                        radius: 20,
                      ),
                      title: Text(_name(snapshot.data[index])),
                      children: <Widget>[
                        ListTile(
                          title:
                              Text("Layout: ${_layout(snapshot.data[index])}"),
                          subtitle:
                              Text("Size: ${_size(snapshot.data[index])}"),
                          trailing: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.black12)),
                              onPressed: () {
                                // setState(() {
                                //   selected = _id(snapshot.data[index]);
                                // });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddSubject(
                                            selected: _id(snapshot.data[index]),
                                          )),
                                );
                              },
                              child: const Text("Assign Subject")),
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
