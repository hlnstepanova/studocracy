import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../backend/lecture_services.dart';
import '../model/lecturePosted.dart';
import '../screens/professor_feedback.dart';
import 'button.dart';
import 'dart:async';
import 'inputText.dart';
import 'inputTime.dart';
import 'alertDialog.dart';
import 'codeDialog.dart';


class LectureForm extends StatefulWidget {
  @override
  _LectureFormState createState() => _LectureFormState();
}

class _LectureFormState extends State<LectureForm> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
  DateTime endTime = DateTime.now();
  final titleController = TextEditingController();
  final timeController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    timeController.dispose();
    super.dispose();
  }

  void _showDialog(String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
       return StyleAlertDialog("Missing data", description, "OK");
      },
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final date = DateTime.now();
    final TimeOfDay time = await showTimePicker(
        context: context,
        initialTime:
        TimeOfDay.fromDateTime(date ?? DateTime.now())
    );
    DateTime selectedDate = new DateTime(date.year, date.month, date.day, time.hour, time.minute);
      setState(() {
        endTime = selectedDate;
        timeController.text  = dateFormat.format(selectedDate);
      });

  }


  bool approveFormInput(){
    Duration difference = endTime.difference(DateTime.now());
    print ("duration: ${difference.toString()}");
    if (titleController.text.isEmpty){
      _showDialog("Please fill in the title");
      return false;
    } else if (difference < new Duration(hours:1, minutes:20)) {
      _showDialog("The lecture cannot be shorter than 1h30");
      return false;
    }
    return true;
  }


  createLecture(String title, DateTime endTime){
    LecturePosted post = LecturePosted(
        title: title,
        endTime: endTime
    );
    postLecture(post).then((lecture){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return codeDialog(lecture.id);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StyleInputText("What's the title?", titleController),
              StyleInputTime("When does it end?", () => _selectDate(context), timeController),
              Center(
                child: StyleButton(
                    "Create a lecture",
                    onPressed:(){
                      print ("Lecture title: ${titleController.text}");
                      print ("endTime: ${endTime.toIso8601String()}");

                      if (approveFormInput()){
                        //TODO: post createLecture()

                        createLecture(titleController.text, endTime);

                        //TODO: show QR code

                        /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfessorFeedback()),
                        );*/
                      }

                    }),
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