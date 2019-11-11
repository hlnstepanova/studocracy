import 'package:flutter/material.dart';
import 'package:studocracy/style.dart';

import '../widgets/button.dart';

class GiveFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text("Rate Lecture Speed"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.sentiment_satisfied, color: Colors.green),
                iconSize: 100,
                onPressed: () {print("Satisfied");},),
              IconButton(
                icon: Icon(Icons.sentiment_dissatisfied, color: Colors.yellow),
                iconSize: 100,
                onPressed: () {print("Dissatisfied");},),
              IconButton(
                icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
                iconSize: 100,
                onPressed: () {print("Very Dissatisfied");},)
            ],
          ),
          Text("Rate Lecture Understanding"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.sentiment_satisfied, color: Colors.green),
                iconSize: 100,
                onPressed: () {},),
              IconButton(
                icon: Icon(Icons.sentiment_dissatisfied, color: Colors.yellow),
                iconSize: 100,
                onPressed: () {},),
              IconButton(
                icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
                iconSize: 100,
                onPressed: () {},)
            ],
          )
        ]
    );

  }
}