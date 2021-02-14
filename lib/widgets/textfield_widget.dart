import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/widgets/common_widget.dart';

class NoneTextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final EdgeInsets margin;
  final TextInputType keyBoardType;
  final String hintText;
  final Color textColor;

  const NoneTextfieldWidget({
    Key key,
    this.margin = const EdgeInsets.symmetric(horizontal: offsetMd),
    @required this.keyBoardType,
    @required this.controller,
    this.hintText,
    this.textColor = blackTextColor,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: EdgeInsets.symmetric(horizontal: offsetBase),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(textFieldCorner)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyBoardType,
        style: lightTextStyle.copyWith(color: blackTextColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: lightTextStyle.copyWith(color: textColor),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class InnerTextWidget extends StatelessWidget {
  final Color shadowColor;
  final double corner;
  final TextEditingController controller;
  final EdgeInsets margin;
  final TextInputType keyBoardType;
  final String hintText;
  final Color textColor;
  final bool isExtra;

  const InnerTextWidget({
    Key key,
    this.isExtra = false,
    this.margin = const EdgeInsets.symmetric(horizontal: offsetMd),
    @required this.keyBoardType,
    @required this.controller,
    this.hintText,
    this.textColor = blackTextColor,
    this.shadowColor = darkShadowColor,
    this.corner = buttonCorner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          if (isExtra) SvgPicture.asset('assets/images/back_textfield.svg'),
          Stack(
            children: [
              InnerShadow(
                blur: 5,
                color: shadowColor,
                offset: const Offset(5, 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(corner)),
                    color: Colors.white,
                  ),
                  height: 48,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: offsetBase),
                child: TextField(
                  controller: controller,
                  keyboardType: keyBoardType,
                  style: lightTextStyle.copyWith(color: blackTextColor),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: lightTextStyle.copyWith(color: textColor),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}