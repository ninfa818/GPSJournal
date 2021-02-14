import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/shadow.dart';
import 'package:gpsjournal/widgets/common_widget.dart';

class PDFModel {
  String name = '';
  String date = '';

  PDFModel({
    this.name = 'Day shift',
    this.date = '12:00 - 16:00',
  });

  Widget itemWidget(index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: offsetBase / 2),
      child: Row(
        children: [
          IconWidget(
            body: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child: Center(
                child: Text('$index', style: boldTextStyle.copyWith(fontSize: 20),),
              ),
            ),
            action: () {

            },
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: mediumTextStyle.copyWith(fontSize: 18.0, color: grayTextColor),),
              SizedBox(height: 8,),
              Text(date, style: mediumTextStyle.copyWith(fontSize: 12.0, color: grayTextColor),),
            ],
          ),
          Spacer(),
          Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [topLeftShadow(), bottomRightShadow()],
            ),
          ),
        ],
      ),
    );
  }
}