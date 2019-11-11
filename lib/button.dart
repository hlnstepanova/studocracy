import 'package:flutter/material.dart';

class StyleButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  String _text;

  StyleButton(this._text, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
          child: Text(_text, style: Theme.of(context).textTheme.title),
          onPressed: onPressed,
          color: Colors.orangeAccent, //specify background color for the button here
          colorBrightness: Brightness
              .dark, //specify the color brightness here, either `Brightness.dark` for darl and `Brightness.light` for light
          disabledColor:
          Colors.blueGrey, // specify color when the button is disabled
          highlightColor: Colors.greenAccent, //color when the button is being actively pressed, quickly fills the button and fades out after
          padding: EdgeInsets.symmetric(
              horizontal: 15.0, vertical: 15.0), // gives padding to the button
        );
  }
}