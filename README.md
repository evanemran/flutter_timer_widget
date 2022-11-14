# flutter_timer_widget

This is a widget for showing countdown timer in flutter. This timer has all the basic operations needed for a timer. 

* Github: https://github.com/evanemran/flutter_timer

## Features

* Simple Timer
* Customize Colors & Fonts
* Handle Events
* Responsive Layout
* Background Mode
* Multiple Themes

## Getting started

To use this widget there is not any special requirement. IF you have flutter installed you can directly start using this.

## How to Use

**Step 1:**

Add this line to your dependencies:

```
flutter_timer: ^0.0.1
```

```
import 'package:flutter_timer/flutter_timer.dart';
```

```dart
FlutterTimer(
  duration: const Duration(minutes: 5),
  onFinished: () {
    //do something after countdown is finished
},)
```

## Conclusion

This is an initial release of the package. If you find any issue please let me know I will fix it accordingly.

