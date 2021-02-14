import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/shadow.dart';
import 'package:gpsjournal/widgets/button_widget.dart';
import 'package:gpsjournal/widgets/common_widget.dart';
import 'package:gpsjournal/widgets/image_widget.dart';
import 'package:gpsjournal/widgets/textfield_widget.dart';
import 'package:gpsjournal/widgets/topbar_widget.dart';

class ForgotPassScreen extends StatefulWidget {
  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final passwordController = TextEditingController();
  final repassController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    repassController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        isTop: false,
        isHover: true,
        body: Stack(
          children: [
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
                  rightImage: 'assets/icons/icon_menu.svg',
                  actionRight: () {

                  },
                ),
                SizedBox(height: 14,),
                AvatarWidget(
                  uri: 'assets/images/avatar.png',
                ),
                SizedBox(height: offsetBase,),
                InnerTextWidget(
                  margin: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetXB),
                  controller: passwordController,
                  keyBoardType: TextInputType.text,
                  hintText: 'New password',
                ),
                InnerTextWidget(
                  margin: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetXB),
                  controller: repassController,
                  keyBoardType: TextInputType.text,
                  hintText: 'Confirm password',
                ),
                SizedBox(height: offsetBase,),
                ButtonWidget(
                  title: 'Reset Password',
                  action: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
