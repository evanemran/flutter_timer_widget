import 'package:flutter/material.dart';
import 'package:flutter_timer_widget/timer_style.dart';

class TimerController {
  double elevation = 0; //elevation
  EdgeInsets margin = const EdgeInsets.all(0.0);
  EdgeInsets padding = const EdgeInsets.all(0.0); //padding
  Color background = Colors.white; //background
  TimerStyle timerStyle = TimerStyle.rectangular;
  TextStyle timerTextStyle = const TextStyle(
      color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold);
  TextStyle subTitleTextStyle = const TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal);

  TimerController(
      {required this.elevation,
      required this.margin,
      required this.padding,
      required this.background,
      required this.timerStyle,
      required this.timerTextStyle,
      required this.subTitleTextStyle});
}
