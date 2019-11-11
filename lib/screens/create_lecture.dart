import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/lectureForm.dart';

class CreateLecture extends StatefulWidget {
  CreateLecture({Key key}) : super(key: key);

  @override
  _CreateLectureState createState() => _CreateLectureState();
}

class _CreateLectureState extends State<CreateLecture> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create a lecture'),
        ),
        body: LectureForm()
    );
  }
}
