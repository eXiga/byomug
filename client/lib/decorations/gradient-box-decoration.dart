import 'package:flutter/painting.dart';

class GradientBoxDecoration {
  static BoxDecoration build(Color left, Color right) {
    return BoxDecoration(
      gradient: LinearGradient(colors: [left, right]),
      borderRadius: BorderRadius.circular(6.0),
      boxShadow: [
        BoxShadow(
            color: right.withOpacity(.3),
            offset: Offset(0.0, 8.0),
            blurRadius: 8.0)
      ]);
  }
}