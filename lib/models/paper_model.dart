import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/shadow.dart';
import 'package:gpsjournal/widgets/common_widget.dart';

class PaperModel {
  String name = '';

  PaperModel({
    this.name = 'Oscar Felix',
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
          Text(name, style: mediumTextStyle.copyWith(fontSize: 18.0, color: grayTextColor),),
          Spacer(),
          Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
              color: pinkColor,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [topLeftShadow(), bottomRightShadow()],
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset('assets/icons/icon_pdf.svg'),
            ),
          ),
        ],
      ),
    );
  }
}