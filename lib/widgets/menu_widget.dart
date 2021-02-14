import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/utils/screen.dart';
import 'package:gpsjournal/utils/shadow.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key key,
    @required this.screen,
    @required this.body,
    this.width = 317,
    this.height = 640,
    this.isExtra = false,
    this.isMenu = false,
    this.during = 1000,
    this.onExtraEvent,
  }) : super(key: key);

  final Screen screen;
  final double width;
  final double height;
  final bool isExtra;
  final Widget body;
  final bool isMenu;
  final int during;
  final Function() onExtraEvent;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: during),
      curve: Curves.fastOutSlowIn,
      alignment: Alignment.centerLeft,
      transform: Matrix4.translationValues(isMenu? 0 : -screen.wp(width * 100 / 414), 0, 0),
      child: Container(
        width: screen.wp(width * 100 / 414) + (isExtra? 30 : 0),
        height: screen.hp(height * 100 / 896),
        decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [bottomRightShadow(offsetX: 9.0, offsetY: 0.0)],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(9.0),
              bottomRight: Radius.circular(9.0),
            )
        ),
        child: Stack(
          children: [
            body,
            if (isExtra) InkWell(
              onTap: onExtraEvent,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset(isMenu? 'assets/icons/icon_sort_left.svg' : 'assets/icons/icon_sort.svg',),
              ),
            ),
          ],
        ),
      ),
    );
  }
}