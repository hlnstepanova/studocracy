import 'package:flutter/material.dart';
import 'package:studocracy/model/lecture.dart';
import 'package:studocracy/widgets/see_feedback_screen/feedbackList.dart';
import 'package:studocracy/widgets/see_feedback_screen/ratingIcon.dart';
import '../style.dart';

class ProfessorFeedbackRoute extends MaterialPageRoute {
  ProfessorFeedbackRoute(lecture) : super(builder: (context) => new ProfessorFeedback(lecture));
}

class ProfessorFeedback extends StatefulWidget {
  final Lecture lecture;
  ProfessorFeedback(this.lecture);

  @override
  _ProfessorFeedbackState createState() => _ProfessorFeedbackState();
}

class _ProfessorFeedbackState extends State<ProfessorFeedback> {

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
    child: Scaffold(
        appBar: AppBar(
          title: Text('Feedback'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Table(
                  children: [
                    TableRow(children: [
                      Center(child: Text("Speed", style: SentimentTextStyle)),
                      Center(
                          child:
                              Text("Understanding", style: SentimentTextStyle)),
                      //Center(child: Text("Content", style: SentimentTextStyle)),
                    ]),
                    TableRow(children: [
                      RatingIcon(widget.lecture.id, 'Speed'),
                      RatingIcon(widget.lecture.id, 'Understanding'),
                      //RatingIcon(lecture.id, 'content')
                    ])
                  ],
                ),
              ),
              //refresh every minute
              FeedbackList(widget.lecture.id),
            ])),
      onWillPop: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  void dispose() {
    print("dispose SeeFeedback");
    super.dispose();
  }
}

