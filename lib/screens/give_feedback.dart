import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studocracy/backend/feedback_services.dart';
import 'package:studocracy/backend/rating_services.dart';
import 'package:studocracy/model/feedback.dart' as ModelFeedback;
import 'package:studocracy/model/lecture.dart' as ModelLecture;
import 'package:studocracy/model/rating.dart';
import 'package:studocracy/style.dart';
import 'package:studocracy/widgets/common/inputText.dart';

import '../widgets/common/button.dart';

class GiveFeedback extends StatelessWidget {
  final ModelLecture.Lecture lecture;
  final feedbackController = TextEditingController();
  GiveFeedback({Key key, @required this.lecture}) : super(key: key);


  void sendRating(String category, double value){
    _getId().then((clientId) => {
    postRatingByCategory(new Rating(clientId: clientId, category: category, value: value, lecture: new Lecture(id: this.lecture.id)), category).then((received) => {
      this.showToast(received, "Rating accepted", "Rating rejected")
    })
    });
  }

  void sendFeedback(){
    _getId().then((clientId) => {
      postFeedback(new ModelFeedback.Feedback(clientId: clientId, message: feedbackController.text, created: DateTime.now(), sentiment: 0, lecture: new ModelFeedback.Lecture(id: this.lecture.id))).then((received) => {
        this.showToast(received, "Feedback accepted", "Feedback rejected")
      })
    });
  }

  void showToast(bool positive, String positiveMessage, String negativeMessage) {
    Color color = Colors.red;
    String message = negativeMessage;
    if(positive) {
      color = Colors.green;
      message = positiveMessage;
    }
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Future<String> _getId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate ${lecture.title}'),
      ),
      body: Center(
      child: ListView(
          children:[
            Center(child: Text("Rate Lecture Speed")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.sentiment_very_satisfied,color: Colors.green),
                  iconSize: 90,
                  onPressed: () {
                      sendRating("Speed", 9);
                  }
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_satisfied, color: Colors.yellow),
                  iconSize: 90,
                  onPressed: () {
                    sendRating("Speed", 7);
                  },),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.sentiment_dissatisfied, color: Colors.orange),
                  iconSize: 90,
                  onPressed: () {
                    sendRating("Speed", 5);
                  },),
                IconButton(
                  icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
                  iconSize: 90,
                  onPressed: () {
                    sendRating("Speed", 2);
                  },)
              ],
            ),
            Center(child: Text("Rate Lecture Understanding")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.sentiment_very_satisfied,color: Colors.green),
                    iconSize: 90,
                    onPressed: () {
                      sendRating("Understanding", 9);
                    }
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_satisfied, color: Colors.yellow),
                  iconSize: 90,
                  onPressed: () {
                    sendRating("Understanding", 7);
                  },),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.sentiment_dissatisfied, color: Colors.orange),
                  iconSize: 90,
                  onPressed: () {
                    sendRating("Understanding", 5);
                  },),
                IconButton(
                  icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
                  iconSize: 90,
                  onPressed: () {
                    sendRating("Understanding", 2);
                  },)
              ],
            ),
            Center(child: Text("Give immidiate feedback:")),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      width: 250,
                      child: StyleInputText("Enter comment", feedbackController)),
                  StyleButton("Send",
                          onPressed:(){
                              sendFeedback();
                          })
                ])
          ]
      ))
    );
  }
}