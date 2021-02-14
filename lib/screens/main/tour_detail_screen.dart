import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpsjournal/models/tour_model.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/widgets/button_widget.dart';
import 'package:gpsjournal/widgets/topbar_widget.dart';

class TourDetailScreen extends StatefulWidget {
  final TourModel model;

  const TourDetailScreen({
    Key key,
    this.model
  }) : super(key: key);

  @override
  _TourDetailScreenState createState() => _TourDetailScreenState();
}

class _TourDetailScreenState extends State<TourDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Image.asset('assets/images/image_map.png', width: double.infinity, height: double.infinity, fit: BoxFit.cover,),
          Column(
            children: [
              SizedBox(height: offsetLg,),
              TopBarWidget(
                titleWidget: Column(
                  children: [
                    SvgPicture.asset('assets/images/logo_login.svg', width: 44, fit: BoxFit.cover,),
                    SizedBox(height: offsetSm,),
                    Text('GPSJournal', style: mediumTextStyle,),
                  ],
                ),
                leftImage: 'assets/icons/icon_back.svg',
                actionLeft: () {
                  Navigator.of(context).pop();
                },
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: 15.0),
                  child: widget.model.itemDetailWidget()),
              ButtonWidget(
                margin: EdgeInsets.symmetric(horizontal: 120),
                  background: Color(0xffF3F4F7),
                  titleWidget: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/icons/icon_upload.svg'),
                  ),
                  action: () {

                  }),
              SizedBox(height: 30,),
            ],
          ),
        ],
      ),
    );
  }
}
