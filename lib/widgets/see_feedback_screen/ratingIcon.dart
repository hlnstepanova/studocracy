import 'package:flutter/material.dart';
import 'package:studocracy/backend/rating_services.dart';
import 'package:studocracy/helpers/helpers.dart' as helpers;
import 'dart:async';

class RatingIcon extends StatefulWidget{
  final String lectureId;
  final String category;

  const RatingIcon(this.lectureId, this.category);

  @override
  _RatingIconState createState() => _RatingIconState();

}

class _RatingIconState extends State<RatingIcon>{
  Timer _timer;
  double _ratingValue = 0.0;

  @override
  void initState() {
    super.initState();
    _populateRating(widget.lectureId, widget.category);
    _timer = Timer.periodic(Duration(seconds: 30), (Timer t) {
      print("Refreshing Rating for ${widget.category}");
      _populateRating(widget.lectureId, widget.category);
    }
     );
  }

  void _populateRating(String lectureId, String category){
    getRatingByCategory(lectureId, category).then((rating){
      print("Rating for $lectureId in $category: ${rating.value}");
      setState(() => {_ratingValue = rating.value});
    });
    
  }

  @override
  Widget build(BuildContext context) {
    int value = _ratingValue.round();
    return helpers.setIcon(value, true);
  }

}