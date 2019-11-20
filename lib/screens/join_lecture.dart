import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/io_client.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:studocracy/backend/lecture_services.dart';
import 'package:studocracy/model/lecture.dart';
import '../widgets/button.dart';
import '../widgets/inputText.dart';
import 'give_feedback.dart';

class JoinLecture extends StatefulWidget {
  JoinLecture({Key key}) : super(key: key);

  @override
  _JoinLectureState createState() => _JoinLectureState();
}

class _JoinLectureState extends State<JoinLecture> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  final lecturePinController = TextEditingController();
  var qrText = "LECTURE #12345";
  List<Lecture> allLectures;

  @override
  void initState() {
    super.initState();
    getLectures().then((value) => this.allLectures = value);
  }



  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    lecturePinController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join a lecture'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StyleInputText("Enter Lecture PIN", lecturePinController),
          Center(child: Text("or scan provided QR-Code")),
          Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,)),
          Center(
            child: new Container(
                margin: const EdgeInsets.all(3),
                child: StyleButton("Join lecture",
                    onPressed:(){
                      for(Lecture lecture in allLectures){
                        if(lecture.id == lecturePinController.text){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GiveFeedback(lecture: lecture)),
                          );
                          return;
                        }
                      }
                    })),
          ),
        ],
      ),
    );
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }
}