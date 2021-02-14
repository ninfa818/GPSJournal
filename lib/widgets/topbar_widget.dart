import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/shadow.dart';
import 'package:gpsjournal/widgets/common_widget.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({Key key,
    this.titleWidget,
    this.leftImage,
    this.actionLeft,
    this.rightImage,
    this.actionRight
  }) : super(key: key);

  final Widget titleWidget;
  final String leftImage;
  final Function() actionLeft;
  final String rightImage;
  final Function() actionRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: offsetBase),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftImage == null
              ? Container(width: 60,)
              : IconWidget(
            body: Container(
              margin: EdgeInsets.all(iconPadding),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                boxShadow: [topLeftShadow(offsetX: -6, offsetY: -6), bottomRightShadow(offsetX: 6, offsetY: 6)],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SvgPicture.asset(leftImage),
                ),
              ),
            ),
            action: actionLeft,
          ),
          titleWidget?? Container(),
          rightImage == null
              ? Container(width: 60,)
              : IconWidget(
            body: Container(
              margin: EdgeInsets.all(iconPadding),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                boxShadow: [topLeftShadow(offsetX: -6, offsetY: -6), bottomRightShadow(offsetX: 6, offsetY: 6)],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SvgPicture.asset(rightImage),
                ),
              ),
            ),
            action: actionRight,
          ),
        ],
      ),
    );
  }

}