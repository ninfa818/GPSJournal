import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/screens/login_screen.dart';
import 'package:gpsjournal/screens/register_business_screen.dart';
import 'package:gpsjournal/screens/register_driver_screen.dart';
import 'package:gpsjournal/services/navigation_service.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/widgets/button_widget.dart';
import 'package:gpsjournal/widgets/common_widget.dart';

class SignScreen extends StatefulWidget {
  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        body: Column(
          children: [
            Spacer(),
            SizedBox(width: double.infinity,),
            Column(
              children: [
                SvgPicture.asset('assets/images/logo_login.svg', width: 120, fit: BoxFit.cover,),
                SizedBox(height: offsetMd,),
                Text('GPSJournal', style: boldTextStyle.copyWith(fontSize: 28),),
              ],
            ),
            Spacer(),
            Column(
              children: [
                ButtonWidget(
                  title: 'Login',
                  action: () {
                    NavigateToRouter(context, LoginScreen());
                  },
                ),
                SizedBox(height: offsetBase,),
                ButtonWidget(
                  title: 'Register',
                  action: () {
                    showCustomModalBottomSheet(
                      context: context,
                      bodyWidget: Container(
                        padding: EdgeInsets.all(offsetXB),
                        child: Column(
                          children: [
                            SizedBox(height: offsetSm,),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                NavigateToRouter(context, BusinessRegisterScreen());
                              },
                                child: Text('By Business', style: mediumTextStyle.copyWith(fontSize: 18.0, color: blackTextColor),)
                            ),
                            DividerWidget(padding: EdgeInsets.symmetric(vertical: offsetXB, horizontal: offsetXB),),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                NavigateToRouter(context, DriverRegisterScreen());
                              },
                                child: Text('By Driver', style: mediumTextStyle.copyWith(fontSize: 18.0, color: blackTextColor),)
                            ),
                          ],
                        ),
                      ),
                      titleWidget: Container(
                        padding: EdgeInsets.symmetric(vertical: offsetBase),
                        child: Text('Register Type', style: boldTextStyle.copyWith(fontSize: 18.0),),
                      )
                    );
                  },
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
