import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../button.dart';
import '../inputText.dart';
import '../inputTime.dart';

class CreateLecture extends StatefulWidget {
  CreateLecture({Key key}) : super(key: key);

  @override
  _CreateLectureState createState() => _CreateLectureState();
}

class _CreateLectureState extends State<CreateLecture> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StyleInputText("What's the title?"),
          StyleInputTime("When does it end?"),
          Center(
            child: StyleButton("Create a lecture"),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage('assets/images/create_lecture.png'),
                        fit: BoxFit.cover,
            ),
          )),
              ))
        ],
      ),
    );
  }
}
