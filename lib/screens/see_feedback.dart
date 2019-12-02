import 'package:flutter/material.dart';
import 'package:studocracy/model/lecture.dart';
import 'package:studocracy/widgets/see_feedback_screen/feedbackList.dart';
import 'package:studocracy/widgets/see_feedback_screen/ratingIcon.dart';
import '../style.dart';

class ProfessorFeedback extends StatelessWidget {
  final Lecture lecture;

  ProfessorFeedback(this.lecture);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              Text("Handwriting", style: SentimentTextStyle)),
                      Center(child: Text("Content", style: SentimentTextStyle)),
                    ]),
                    TableRow(children: [
                      RatingIcon(lecture.id, 'speed'),
                      RatingIcon(lecture.id, 'handwriting'),
                      RatingIcon(lecture.id, 'content')
                    ])
                  ],
                ),
              ),
              //refresh every minute
              FeedbackList(lecture.id),
            ]));
  }
}
