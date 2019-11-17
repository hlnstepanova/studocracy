import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/io_client.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../widgets/button.dart';
import '../widgets/inputText.dart';

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
  var allLectures = "";

  @override
  void initState() {
    super.initState();
    _getAllLectures().then((value) => setLectures(value));
  }

  setLectures(lectures) {
    print(lectures);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    lecturePinController.dispose();
    super.dispose();
  }

  _getAllLectures() async {
    var httpClient = new HttpClient()..badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);
    var uri = new Uri.https('192.168.2.138:8888', '/lectures');
    var response = await ioClient.get(uri);
    var responseBody = response.body;
    return responseBody;
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
                  print(allLectures);
                  print("Lecture PIN: ${lecturePinController.text}");
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