import 'package:flutter/cupertino.dart';
import 'package:gpsjournal/themes/color_theme.dart';

BoxShadow topLeftShadow({
  double offsetX = -9.0,
  double offsetY = -9.0,
  double blurRadius = 16.0,
  Color shadowColor = lightShadowColor,
}) {
  return BoxShadow(
    color: shadowColor,
    blurRadius: blurRadius,
    offset: Offset(offsetX, offsetY), // changes position of shadow
  );
}

BoxShadow bottomRightShadow({
  double offsetX = 9.0,
  double offsetY = 9.0,
  double blurRadius = 16.0,
  Color shadowColor = darkShadowColor,
}) {
  return BoxShadow(
    color: shadowColor,
    blurRadius: blurRadius,
    offset: Offset(offsetX, offsetY), // changes position of shadow
  );
}