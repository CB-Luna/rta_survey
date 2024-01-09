import 'package:flutter/material.dart';

// D e s k t o p
const double minWidth = 800.0;
const double maxWidth = 1400.0;
const double maxRangeValue = maxWidth - minWidth;

screenSize(context) {
  var screenSize = MediaQuery.of(context).size;
  return screenSize;
}

mobile(context) {
  bool mobile = screenSize(context).width < minWidth ? true : false;

  return mobile;
}
