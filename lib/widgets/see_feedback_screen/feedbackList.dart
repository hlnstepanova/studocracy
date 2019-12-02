import 'dart:async';
import 'package:flutter/material.dart' hide Feedback;
import 'package:studocracy/model/feedback.dart';
import 'package:studocracy/helpers/helpers.dart' as helpers;
import 'package:studocracy/backend/feedback_services.dart';
import 'package:studocracy/style.dart';

class FeedbackList extends StatefulWidget {

  final String lectureId;
  const FeedbackList(this.lectureId);

  @override
  _FeedbackListState createState() => _FeedbackListState();
}

class _FeedbackListState extends State<FeedbackList> {
  Timer _timer;
  List<Feedback> _feedbackList = List<Feedback>();

  @override
  void initState() {
    super.initState();
    _populateFeedbackList(widget.lectureId);
    _timer = Timer.periodic(Duration(seconds: 30), (Timer t){
      print("Refreshing feedbackList");
      _populateFeedbackList(widget.lectureId);
    });
  }

  void _populateFeedbackList(String lectureId) {
    getFeedbackList(lectureId).then((feedbackList) {
      print("Message: ${feedbackList[0].message}");
      setState(() => {_feedbackList = feedbackList});
    });
  }

  @override
  Widget build (BuildContext context){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _feedbackList.length,
        itemBuilder: _buildItemsForListView);
  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: Text(_feedbackList[index].message, style: BodyTextStyle),
      trailing: helpers.setIcon(_feedbackList[index].sentiment, false)
    );
  }
}
