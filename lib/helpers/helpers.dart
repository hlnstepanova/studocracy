import 'package:flutter/material.dart';

Icon setIcon(int value, bool bigSize) {
  /*
        0-4 very dissatisfied
        4-6 dissatisfied
        6-8 satisfied
        8-10 very satisfied
    */

  double _size;
  bigSize ? _size = 60.0 : _size = 30.0;

  if (value >= 0 && value < 4) {
    return Icon(Icons.sentiment_very_dissatisfied,
        color: Colors.red, size: _size);
  }
  if (value >= 4 && value < 6) {
    return Icon(Icons.sentiment_dissatisfied,
        color: Colors.orange, size: _size);
  }
  if (value >= 6 && value < 8) {
    return Icon(Icons.sentiment_satisfied, color: Colors.yellow, size: _size);
  }

  return Icon(Icons.sentiment_very_satisfied,
      color: Colors.green, size: _size);
}