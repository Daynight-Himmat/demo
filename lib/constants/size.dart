import 'package:flutter/cupertino.dart';

abstract class Sized {
  static sHeight(double h) {
    return SizedBox(
      height: h,
    );
  }

  static sWidth(double w) {
    return SizedBox(
      width: w,
    );
  }
}
