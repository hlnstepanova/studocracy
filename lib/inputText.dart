import 'package:flutter/material.dart';
import 'style.dart';

class StyleInputText extends StatelessWidget {
  String _hintText;

  StyleInputText(this._hintText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: _hintText,
              hintStyle: HintTextStyle
          ),
          style: InputTextStyle,
          keyboardType: TextInputType.text),
    );
  }
}
