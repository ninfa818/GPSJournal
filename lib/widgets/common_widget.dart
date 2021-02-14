import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/screen.dart';
import 'package:gpsjournal/utils/shadow.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget body;
  final bool isTop;
  final bool isBottomLeft;
  final bool isBottomRight;
  final bool isHover;

  const BackgroundWidget({
    Key key,
    @required this.body,
    this.isTop = true,
    this.isBottomLeft = true,
    this.isBottomRight = true,
    this.isHover = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screen = Screen(Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height));

    return Stack(
      children: [
        if (isTop) Container(
            alignment: Alignment.topRight,
            transform: Matrix4.translationValues(screen.wp(71 * 100 / 414), -screen.hp(155 * 100 / 896), 0),
            child: SvgPicture.asset('assets/images/back_top.svg', width: screen.wp(250 * 100 / 414), fit: BoxFit.fill,)
        ),
        if (isBottomLeft) Container(
            alignment: Alignment.bottomLeft,
            transform: Matrix4.translationValues(-screen.wp(124 * 100 / 414), screen.hp(50 * 100 / 896), 0),
            child: SvgPicture.asset('assets/images/back_bottom_left.svg', width: screen.wp(285 * 100 / 414), fit: BoxFit.cover,)
        ),
        if (isBottomRight) Container(
            alignment: Alignment.bottomRight,
            transform: Matrix4.translationValues(screen.wp(37 * 100 / 414), screen.hp(86 * 100 / 896), 0),
            child: SvgPicture.asset('assets/images/back_bottom_right.svg', width: screen.wp(250 * 100 / 414), fit: BoxFit.cover,)
        ),
        body,
      ],
    );
  }
}

class IconWidget extends StatelessWidget {
  final double iconSize;
  final Widget body;
  final Function() action;

  const IconWidget({
    Key key,
    this.iconSize = 60.0,
    @required this.body,
    @required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        width: iconSize,
        height: iconSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(iconSize / 2)),
          boxShadow: [topLeftShadow(), bottomRightShadow()],
        ),
        child: body,
      ),
    );
  }
}

class BottomSheetTopStrip extends Container {
  BottomSheetTopStrip()
      : super(
    width: 75.0,
    height: 5.0,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(20.0),
    ),
  );
}

class DividerWidget extends Padding {
  DividerWidget({
    Key key,
    Color color = Colors.grey,
    EdgeInsetsGeometry padding = const EdgeInsets.all(0),
  }) : super(
    padding: padding,
    child: Divider(
      key: key,
      color: color,
      thickness: 1,
      height: 0,
    ),
  );
}

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key key,
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    Widget child,
  }) : super(key: key, child: child);

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderInnerShadow renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  double blur;
  Color color;
  double dx;
  double dy;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx,
      size.height - dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx, dy);
    context.paintChild(child, offset);
    context.canvas..restore()..restore()..restore();
  }
}

class TagWidget extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final bool isDisable;

  const TagWidget({
    Key key,
    @required this.title,
    this.width = 78,
    this.height = 26,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: isDisable? Color(0xffE7E8EF).withOpacity(0.6) : Color(0xffE7E8EF),
        borderRadius: BorderRadius.all(Radius.circular(9.0)),
      ),
      child: Center(
        child: Text(title, style: mediumTextStyle.copyWith(color: isDisable? primaryColor.withOpacity(0.6) : primaryColor),),
      ),
    );
  }
}

