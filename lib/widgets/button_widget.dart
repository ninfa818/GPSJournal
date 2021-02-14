import 'package:flutter/material.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/shadow.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Widget titleWidget;
  final EdgeInsets margin;
  final double fontSize;
  final Color background;
  final Color fontColor;
  final double cornerRadius;
  final Function() action;

  const ButtonWidget({
    Key key,
    this.title,
    this.titleWidget,
    @required this.action,
    this.margin = const EdgeInsets.symmetric(horizontal: offsetXLg, vertical: offsetSm),
    this.background = primaryColor,
    this.fontColor = Colors.white,
    this.fontSize = 18.0,
    this.cornerRadius = buttonCorner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        margin: margin,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
          boxShadow: [topLeftShadow(), bottomRightShadow()],
        ),
        child: title == null
            ? titleWidget
            : Center(
          child: Text(title, style: mediumTextStyle.copyWith(fontSize: fontSize, color: fontColor),),
        ),
      ),
    );
  }
}