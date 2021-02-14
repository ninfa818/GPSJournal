import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/utils/shadow.dart';

class AvatarWidget extends StatelessWidget {
  final String uri;

  const AvatarWidget({
    Key key,
    this.uri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
            boxShadow: [
              topLeftShadow(offsetX: -28, offsetY: -28, blurRadius: 50.0),
              bottomRightShadow(offsetX: 28, offsetY: 28, blurRadius: 50.0)
            ],
          ),
          child: uri.isEmpty
              ? Center(
                child: Icon(Icons.add, size: 70, color: primaryColor,),
          )
              : Image.asset('assets/images/avatar.png', width: 180, height: 180,)
        ),
        Container(
            margin: EdgeInsets.only(top: 20),
            child: SvgPicture.asset('assets/images/back_avatar.svg', height: 170,)
        )
      ],
    );
  }
}