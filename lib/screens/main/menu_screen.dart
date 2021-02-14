import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/widgets/common_widget.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 75,),
          Row(
            children: [
              Spacer(),
              IconWidget(
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/icon_close.svg',),
                ),
                action: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(width: 35,)
            ],
          ),
          SizedBox(height: 100,),
          InkWell(
            onTap: () {
              Navigator.of(context).pop(0);
            },
              child: Text('USER PROFILE', style: boldTextStyle.copyWith(fontSize: 32),)
          ),
          SizedBox(height: 30,),
          InkWell(
            onTap: () {
              Navigator.of(context).pop(4);
            },
              child: Text('RECORDED TOURS', style: boldTextStyle.copyWith(fontSize: 32),)),
          SizedBox(height: 30,),
          InkWell(
            onTap: () {
              Navigator.of(context).pop(2);
            },
              child: Text('PDF DOWNLOAD', style: boldTextStyle.copyWith(fontSize: 32),)),
          SizedBox(height: 30,),
          InkWell(
            onTap: () {
              Navigator.of(context).pop(3);
            },
              child: Text('DAY SHIFT', style: boldTextStyle.copyWith(fontSize: 32),)),
          SizedBox(height: 30,),
          InkWell(
            onTap: () {
              Navigator.of(context).pop(1);
            },
              child: Text('PAPER SHIFT', style: boldTextStyle.copyWith(fontSize: 32),)),
          SizedBox(height: 30,),
          Text('UPLOAD FILE', style: boldTextStyle.copyWith(fontSize: 32),),
          SizedBox(height: 30,),
          Text('LOG OUT', style: boldTextStyle.copyWith(fontSize: 32),),
          Spacer(),
        ],
      ),
    );
  }
}
