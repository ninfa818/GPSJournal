import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/screen.dart';
import 'package:gpsjournal/utils/shadow.dart';
import 'package:gpsjournal/widgets/button_widget.dart';
import 'package:gpsjournal/widgets/common_widget.dart';
import 'package:gpsjournal/widgets/menu_widget.dart';
import 'package:gpsjournal/widgets/topbar_widget.dart';

class DayStartScreen extends StatefulWidget {
  @override
  _DayStartScreenState createState() => _DayStartScreenState();
}

class _DayStartScreenState extends State<DayStartScreen> with TickerProviderStateMixin {
  var isMenu = false;
  double width = 317;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var screen = Screen(Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height));

    return GestureDetector(
      onTap: () {
        if (isMenu) {
          setState(() {
            isMenu = false;
          });
        }
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [bottomRightShadow(offsetX: 6, offsetY: 6)],
                    ),
                    child: Column(
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
                          rightImage: 'assets/icons/icon_menu.svg',
                          actionRight: () {
                            setState(() {
                              isMenu = !isMenu;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.only(bottom: offsetBase),
                  height: 175,
                  child: Column(
                    children: [
                      Spacer(),
                      TopBarWidget(
                        titleWidget: Column(
                          children: [
                            Text('01:12:00', style: boldTextStyle.copyWith(fontSize: 40),),
                            Text('12.05.2020', style: mediumTextStyle,),
                          ],
                        ),
                        leftImage: 'assets/icons/icon_save.svg',
                        actionLeft: () {

                        },
                        rightImage: 'assets/icons/icon_print.svg',
                        actionRight: () {

                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 130, top: 20, left: 30, right: 30),
                  child: Row(
                    children: [
                      Spacer(),
                      IconWidget(
                        iconSize: 90,
                        body: Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(45.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(25),
                            child: SvgPicture.asset('assets/icons/icon_play.svg'),
                          ),
                        ),
                        action: () { }),
                      SizedBox(width: 40,),
                      IconWidget(
                          iconSize: 90,
                          body: Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(45.0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(25),
                              child: SvgPicture.asset('assets/icons/icon_pause.svg'),
                            ),
                          ),
                          action: () { }),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
            MenuWidget(
              isMenu: isMenu,
              screen: screen,
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: offsetBase),
                      child: Text('Name', style: mediumTextStyle.copyWith(fontSize: 14),),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsets.only(left: offsetBase),
                      child: Text('City', style: mediumTextStyle.copyWith(fontSize: 14),),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsets.only(left: offsetBase),
                      child: Text('Custom tag', style: mediumTextStyle.copyWith(fontSize: 14),),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        TagWidget(title: 'Probe', isDisable: true,),
                        TagWidget(title: 'Tour',),
                        TagWidget(title: 'Action-TH',),
                        TagWidget(title: 'Flyer!',),
                        TagWidget(title: 'Private',),
                      ],
                    ),
                    SizedBox(height: 60,),
                    ButtonWidget(
                        title: 'Upload',
                        background: backgroundColor,
                        fontColor: primaryColor,
                        action: () {

                        }),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




