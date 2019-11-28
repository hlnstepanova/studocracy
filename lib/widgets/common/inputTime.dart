import 'package:flutter/material.dart';
import '../../style.dart';

class StyleInputTime extends StatelessWidget {
  final GestureTapCallback onTap;
  String _hintText;
  TextEditingController controller;

  StyleInputTime(this._hintText, this.onTap, this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:TextField(
        controller: controller,
        onTap: onTap,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: _hintText,
            hintStyle: HintTextStyle
        ),
        style: InputTextStyle
      ),
    );
  }
}
