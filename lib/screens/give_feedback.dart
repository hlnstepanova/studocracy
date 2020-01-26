import 'dart:async';

import 'package:battery/battery.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studocracy/backend/feedback_services.dart';
import 'package:studocracy/backend/rating_services.dart';
import 'package:studocracy/model/feedback.dart' as ModelFeedback;
import 'package:studocracy/model/lecture.dart' as ModelLecture;
import 'package:studocracy/model/rating.dart';
import 'package:studocracy/widgets/common/inputText.dart';

import '../widgets/common/button.dart';

class GiveFeedback extends StatefulWidget {
  final ModelLecture.Lecture lecture;
  GiveFeedback({Key key, @required this.lecture}) : super(key: key);

  @override
  _GiveFeedbackState createState() => _GiveFeedbackState(this.lecture);
}

class _GiveFeedbackState extends State<GiveFeedback> {
  ModelLecture.Lecture lecture;
  bool batteryLow = false;
  final feedbackController = TextEditingController();
  Timer batteryCheckTimer;

  _GiveFeedbackState(lecture) {
    this.lecture = lecture;
  }


  @override
  void initState() {
    super.initState();
    this.batteryCheckTimer = Timer.periodic(Duration(seconds: 60), (Timer t) => checkBatteryStatus());
    checkBatteryStatus();
  }

  @override
  void dispose() {
    this.batteryCheckTimer?.cancel();
    super.dispose();
  }

  void checkBatteryStatus() async {
    int batteryLevel = await Battery().batteryLevel;
    setState(() {
      if(batteryLevel <= 99){
      this.batteryLow = true;
      } else {
      this.batteryLow = false;
      }
    });
  }

  void sendRating(String category, double value){
    _getId().then((clientId) => {
    postRatingByCategory(new Rating(clientId: clientId, category: category, value: value, lecture: new Lecture(id: this.lecture.id)), category).then((received) => {
      this.showToast(received, "Rating accepted", "Please wait 5 minutes before giving another rating.")
    })
    });
  }

  void sendFeedback(){
    _getId().then((clientId) => {
      postFeedback(new ModelFeedback.Feedback(clientId: clientId, message: feedbackController.text, sentiment: 0, lecture: new ModelFeedback.Lecture(id: this.lecture.id))).then((received) => {
        this.showToast(received, "Feedback accepted", "Please wait 5 minutes, before giving another feedback.")
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
        fontSize: 25.0
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
      body: new GestureDetector(
      onTap: () {

      FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Center(
      child: ListView(
          children:[
                new Container (
                    width: double.infinity,
                    child: Visibility(
                    child: Center(child: Text("Please rate the lecture, before your device turns off.",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.red
                    ),)),
                  visible: this.batteryLow),
                  color: Colors.red,
                ),
          new Container (
              width: double.infinity,
              child: Center(
                  child: Text("Rate Lecture Speed", style: TextStyle(color: Colors.white))),
              color: Colors.blue,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.sentiment_very_satisfied,color: Colors.green),
                  iconSize: 90,
                  onPressed: () {
                      sendRating("Speed", 9);
                      FocusScope.of(context).requestFocus(new FocusNode());
                  }
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_satisfied, color: Colors.yellow),
                  iconSize: 90,
                  onPressed: () {
                    sendRating("Speed", 7);
                    FocusScope.of(context).requestFocus(new FocusNode());
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
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },),
                IconButton(
                  icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
                  iconSize: 90,
                  onPressed: () {
                    sendRating("Speed", 2);
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },)
              ],
            ),
          new Container (
              width: double.infinity,
              child: Center(child: Text("Rate Lecture Understanding", style: TextStyle(color: Colors.white))),
          color: Colors.blue,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.sentiment_very_satisfied,color: Colors.green),
                    iconSize: 90,
                    onPressed: () {
                      sendRating("Understanding", 9);
                      FocusScope.of(context).requestFocus(new FocusNode());
                    }
                ),
                IconButton(
                  icon: Icon(Icons.sentiment_satisfied, color: Colors.yellow),
                  iconSize: 90,
                  onPressed: () {
                    sendRating("Understanding", 7);
                    FocusScope.of(context).requestFocus(new FocusNode());
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
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },),
                IconButton(
                  icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
                  iconSize: 90,
                  onPressed: () {
                    sendRating("Understanding", 2);
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },)
              ],
            ),
          new Container (
              width: double.infinity,
              child:Center(child: Text("Give immidiate feedback:", style: TextStyle(color: Colors.white))),
              color: Colors.blue),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      width: 250,
                      child: StyleInputText("Enter comment", feedbackController)),
                  StyleButton("Send",
                          onPressed:(){
                              sendFeedback();
                              this.feedbackController.text = '';
                              FocusScope.of(context).requestFocus(new FocusNode());
                          })
                ])
          ]
      ))
    ));
  }
}