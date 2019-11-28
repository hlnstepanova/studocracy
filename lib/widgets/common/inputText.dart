import 'dart:async';

import 'package:flutter/material.dart';
import '../../style.dart';

class StyleInputText extends StatelessWidget {
  String _hintText;
  TextEditingController controller;

  StyleInputText(this._hintText, this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
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
