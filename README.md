# flutter_timer_widget

This is a widget for showing countdown timer in flutter. This timer has all the basic operations needed for a timer. 

* Github: https://github.com/evanemran/flutter_timer_widget

## Features

* Simple Timer
* Customize Colors & Fonts
* Handle Events
* Responsive Layout
* Background Mode
* Multiple Themes

<img src="https://github.com/evanemran/flutter_timer_widget/blob/master/assets/flutter_timer_demo.png" width="48">

[comment]: <> (![Flutter Timer Widget Demo]&#40;https://github.com/evanemran/flutter_timer_widget/blob/master/assets/flutter_timer_demo.png?raw=true&#41;)

## Getting started

To use this widget there is not any special requirement. IF you have flutter installed you can directly start using this.

## How to Use

**Step 1:**

Add this line to your dependencies:

```
flutter_timer: ^0.0.2
```

```
import 'package:flutter_timer/flutter_timer_widget.dart';
```

```dart
FlutterTimer(
  duration: const Duration(days: 2),
  onFinished: () {},
  timerController: TimerController(
    elevation: 4,
    margin: const EdgeInsets.all(4.0),
    padding: const EdgeInsets.all(8.0),
    background: Colors.orange,
    timerStyle: TimerStyle.Rectanular,
    timerTextStyle: const TextStyle(color: Colors.white, fontSize: 30),
    subTitleTextStyle: const TextStyle(color: Colors.white, fontSize: 12),
),
)
```

## Conclusion

This is an initial release of the package. If you find any issue please let me know I will fix it accordingly.

