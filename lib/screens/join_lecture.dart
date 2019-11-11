import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../widgets/button.dart';
import '../widgets/inputText.dart';
import '../widgets/inputTime.dart';

class JoinLecture extends StatefulWidget {
  JoinLecture({Key key}) : super(key: key);

  @override
  _JoinLectureState createState() => _JoinLectureState();
}

class _JoinLectureState extends State<JoinLecture> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  var qrText = "LECTURE #12345";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         // StyleInputText("Enter Lecture PIN"),
          Center(child: Text("or scan provided QR-Code")),
          Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,)),
          Center(
            child: new Container(
                margin: const EdgeInsets.all(3),
                child: StyleButton("Join lecture")),
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