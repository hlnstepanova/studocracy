import 'package:flutter/material.dart';
import 'join_lecture.dart';
import 'create_lecture.dart';

class RoleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose your role'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateLecture()),
                      );
                    },
                    child: Container(
                      color: Colors.greenAccent,
                      padding: const EdgeInsets.all(15.0),
                      child: Column(children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                                child: Image.asset(
                                    'assets/images/professor.png'))),
                        Expanded(
                            flex: 1,
                            child: Container(
                                padding: const EdgeInsets.all(15.0),
                                child: Text("Start a lecture",
                                    style: Theme.of(context).textTheme.title)))
                      ]),
                    ))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JoinLecture()),
                      );
                    },
                    child: Container(
                        color: Colors.orange[300],
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                  child: Image.asset(
                                      'assets/images/student.png'))),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text("Join a lecture",
                                      style:
                                          Theme.of(context).textTheme.title))),
                        ]))))
          ],
        ));
  }
}
