import 'package:flutter/material.dart';
import '../style.dart';

class StyleAlertDialog extends StatelessWidget {
  String text;
  String title;
  String buttonOk;

  StyleAlertDialog(this.title, this.text, this.buttonOk);

  Widget build(BuildContext context) {
    return AlertDialog(
        title: new Text(title),
        content: new Text (text),
        actions: <Widget>[
          new FlatButton(
              child: new Text(buttonOk),
              onPressed:(){
                Navigator.of(context).pop();
              }
          )
        ]
    );
}
}