library flutter_timer;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_timer_widget/timer_controller.dart';
import 'package:flutter_timer_widget/timer_style.dart';

class FlutterTimer extends StatefulWidget {
  const FlutterTimer({Key? key, required this.duration, required this.onFinished, required this.timerController}) : super(key: key);

  final Duration duration;
  final Function() onFinished;
  final TimerController timerController;

  @override
  State<FlutterTimer> createState() => _FlutterTimerState();
}

class _FlutterTimerState extends State<FlutterTimer> {

  var countDownDuration = const Duration();
  List<Widget> timerElements = [];

  late Duration duration;
  Timer? timer;

  bool isCountDown = true;

  @override
  void initState() {
    super.initState();
    duration = widget.duration;
    countDownDuration = widget.duration;
    startTimer();
    reset();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) { addTime(); });
  }

  void pauseTimer() {
    timer?.cancel();
    countDownDuration = duration;
  }

  @override
  Widget build(BuildContext context) {
    countDownDuration = widget.duration;
    return buildTimer();
  }

  void addTime() {
    final addSeconds = isCountDown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if(seconds<0) {
        timer?.cancel();
        widget.onFinished.call();
      }
      else {
        duration = Duration(seconds: seconds);      }
    });
  }

  Widget buildTimer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final days = twoDigits(duration.inDays.remainder(24));
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    timerElements.clear();
    if(days!="00") {timerElements.add(Expanded(child: buildTimerCard(time: days, header: "DAY", duration: const Duration(seconds: 86400))));}
    if(hours!="00") {timerElements.add(Expanded(child: buildTimerCard(time: hours, header: "HOUR", duration: const Duration(seconds: 3600))));}
    if(minutes!="00") {timerElements.add(Expanded(child: buildTimerCard(time: minutes, header: "MIN", duration: const Duration(seconds: 60))));}
    if(seconds!="00") {timerElements.add(Expanded(child: buildTimerCard(time: seconds, header: "SEC", duration: const Duration(seconds: 1))));}

    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: buildTimerCard(time: days, header: "DAY", duration: const Duration(seconds: 86400))),
        Expanded(child: buildTimerCard(time: hours, header: "HOUR", duration: const Duration(seconds: 3600))),
        Expanded(child: buildTimerCard(time: minutes, header: "MIN", duration: const Duration(seconds: 60))),
        Expanded(child: buildTimerCard(time: seconds, header: "SEC", duration: const Duration(seconds: 1))),
      ],);
  }

  void reset() {
    if(isCountDown) {
      setState(() {
        duration = countDownDuration;
      });
    }
    else {
      setState(() {
        duration = const Duration();
      });
    }
  }
  Widget buildTimerCard({required String time, required String header, required Duration duration}) {


    return Container(
      margin: widget.timerController.margin,
      decoration: BoxDecoration(
          color: widget.timerController.background,
          shape: widget.timerController.timerStyle== TimerStyle.circular ? BoxShape.circle : BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(widget.timerController.elevation, widget.timerController.elevation), //(x,y)
              blurRadius: 4.0,
            ),
          ]
      ),
      child: Padding(padding: widget.timerController.padding,
        child: Wrap(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _animatedText(Text(
                  time,
                  style: widget.timerController.timerTextStyle,
                ), duration),
                Row(children: [Expanded(child: Text(
                  header,
                  style: widget.timerController.subTitleTextStyle, textAlign: TextAlign.center,
                ))],)
              ],)
          ],
        ),),
    );
  }

  Widget _animatedText(Text text, Duration duration) {
    return AnimatedSwitcher(
        duration: duration,
        transitionBuilder:
            (Widget child, Animation<double> animation) {
          return SlideTransition(
            position: Tween<Offset>(
                begin: const Offset(0.0, -0.5),
                end: const Offset(0.0, 0.0))
                .animate(animation),
            child: child,
          );
        },
        child: text
    );
  }
}

class TimerType {
  static const String day = "day";
  static const String hour = "hour";
  static const String min = "min";
  static const String sec = "sec";
  static const String none = "none";
}