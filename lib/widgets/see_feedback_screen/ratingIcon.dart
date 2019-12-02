import 'package:flutter/material.dart';
import 'package:studocracy/backend/rating_services.dart';
import'package:studocracy/model/rating.dart';

class RatingIcon extends StatefulWidget{
  final String lectureId;
  final String category;

  const RatingIcon(this.lectureId, this.category);

  @override
  _RatingIconState createState() => _RatingIconState();

}

class _RatingIconState extends State<RatingIcon>{
  double _ratingValue = 0.0;

  @override
  void initState() {
    super.initState();
    _populateRating(widget.lectureId, widget.category);
  }

  void _populateRating(String lectureId, String category){
    getRatingByCategory(lectureId, category).then((rating){
      print("Rating for $lectureId in $category: ${rating.value}");
      setState(() => {_ratingValue = rating.value});
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return _setIcon(_ratingValue);
  }

  Icon _setIcon(double value) {
    /*
        0-4 very dissatisfied
        4-6 dissatisfied
        6-8 satisfied
        8-10 very satisfied
    */
    if (value >= 0 && value < 4) {
      return Icon(Icons.sentiment_very_dissatisfied,
          color: Colors.red, size: 60.0);
    }
    if (value >= 4 && value < 6) {
      return Icon(Icons.sentiment_dissatisfied,
          color: Colors.orange, size: 60.0);
    }
    if (value >= 6 && value < 8) {
      return Icon(Icons.sentiment_satisfied, color: Colors.yellow, size: 60.0);
    }

    return Icon(Icons.sentiment_very_satisfied,
        color: Colors.green, size: 60.0);
  }

}