import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/screens/forgot_pass_screen.dart';
import 'package:gpsjournal/screens/main/main_screen.dart';
import 'package:gpsjournal/services/navigation_service.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/shadow.dart';
import 'package:gpsjournal/widgets/button_widget.dart';
import 'package:gpsjournal/widgets/common_widget.dart';
import 'package:gpsjournal/widgets/textfield_widget.dart';
import 'package:gpsjournal/widgets/topbar_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: BackgroundWidget(
          isBottomLeft: false,
          isBottomRight: false,
          body: Column(
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
              Column(
                children: [
                  NoneTextfieldWidget(
                    keyBoardType: TextInputType.emailAddress,
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  NoneTextfieldWidget(
                    margin: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetBase),
                    keyBoardType: TextInputType.emailAddress,
                    controller: passController,
                    hintText: 'Password',
                  ),
                  ButtonWidget(
                    title: 'Login',
                    action: () {
                      NavigateToRouter(context, MainScreen(), replace: true);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      NavigateToRouter(context, ForgotPassScreen());
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: offsetMd),
                      child: Text('Forgot password?', style: mediumTextStyle.copyWith(fontSize: 18, color: blackTextColor),),
                    ),
                  )
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}





