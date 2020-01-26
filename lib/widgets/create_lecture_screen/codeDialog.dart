import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../screens/see_feedback.dart';
import 'package:studocracy/model/lecture.dart';
import '../../style.dart';

class codeDialog extends StatelessWidget {
  final Lecture lecture;

  codeDialog(this.lecture);

  Widget build(BuildContext context) {
    return AlertDialog(
        title: new Text("Enjoy the lecture!", style: SectionTextStyle),
        content: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Text("PIN-Code: ${lecture.id}"),
                flex: 1,),
                Expanded(
                    child: QrImage(
                  data: lecture.id,
                  version: QrVersions.auto,
                  size: 500.0,
                ),
                flex: 4,)
              ]),
        ),
        actions: <Widget>[
          new FlatButton(
              child: new Text("Next"),
              onPressed: () => {
                Navigator.push(context, new ProfessorFeedbackRoute(lecture)).then((result) {
              Navigator.of(context).pop();
              })
              })
        ]);
  }
}
