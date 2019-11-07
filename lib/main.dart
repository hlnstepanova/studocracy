// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'screens/create_lecture.dart';
import 'screens/professor_feedback.dart';
import 'screens/role.dart';
import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studocracy',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(title: AppBarTextStyle),
        ),
        textTheme: TextTheme(
          title: TitleTextStyle,
          body1: BodyTextStyle
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Feedback'),
        ),
        body: ProfessorFeedback()
      ),
    );
  }

}

