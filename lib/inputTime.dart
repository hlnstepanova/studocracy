import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'style.dart';

class StyleInputTime extends StatelessWidget {
  String _hintText;

  StyleInputTime(this._hintText);

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
      onTap: () {
        DatePicker.showTimePicker(context, showTitleActions: true,
            onChanged: (date) {
              print('change $date in time zone ' +
                  date.timeZoneOffset.inHours.toString());
            }, onConfirm: (date) {
              print('confirm $date');
            }, currentTime: DateTime.now());
      },
      ),
    );
  }
}
