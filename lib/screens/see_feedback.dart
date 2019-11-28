import 'package:flutter/material.dart';
import '../style.dart';

class ProfessorFeedback extends StatelessWidget {
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
                      Center(
                          child: Text("Interest", style: SentimentTextStyle)),
                    ]),
                    TableRow(children: [
                      /*TODO: set refresh every minute according to received values from GET getRatingByCategory
                      0-4 very dissatisfied
                      4-6 dissatisfied
                      6-8 satisfied
                      8-10 very satisfied*/
                      Icon(Icons.sentiment_satisfied,
                          color: Colors.green, size: 60.0),
                      Icon(Icons.sentiment_very_dissatisfied,
                          color: Colors.red, size: 60.0),
                      Icon(Icons.sentiment_dissatisfied,
                          color: Colors.yellow, size: 60.0)
                    ])
                  ],
                ),
              ),
              //TODO: make a ListView and refresh every minute: GET getFeedback
              ListTile(
                title: Text('Please write bigger', style: BodyTextStyle),
                trailing:
                    Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
              ),
              ListTile(
                title:
                    Text('Explain pumping lemma again', style: BodyTextStyle),
                trailing:
                    Icon(Icons.sentiment_dissatisfied, color: Colors.yellow),
              ),
              ListTile(
                title: Text('Interesting topic!', style: BodyTextStyle),
                trailing: Icon(Icons.sentiment_satisfied, color: Colors.green),
              ),
              ListTile(
                title: Text('Speak slower', style: BodyTextStyle),
                trailing:
                    Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
              ),
              ListTile(
                title: Text('Handwriting too small', style: BodyTextStyle),
                trailing:
                    Icon(Icons.sentiment_dissatisfied, color: Colors.yellow),
              ),
              ListTile(
                title: Text('Nice shirt', style: BodyTextStyle),
                trailing: Icon(Icons.sentiment_satisfied, color: Colors.green),
              ),
              ListTile(
                title: Text('Cannot read at all', style: BodyTextStyle),
                trailing:
                    Icon(Icons.sentiment_very_dissatisfied, color: Colors.red),
              ),
            ]));
  }
}
