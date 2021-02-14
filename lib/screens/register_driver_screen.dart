import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpsjournal/screens/login_screen.dart';
import 'package:gpsjournal/services/navigation_service.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/widgets/button_widget.dart';
import 'package:gpsjournal/widgets/common_widget.dart';
import 'package:gpsjournal/widgets/image_widget.dart';
import 'package:gpsjournal/widgets/textfield_widget.dart';

class DriverRegisterScreen extends StatefulWidget {
  @override
  _DriverRegisterScreenState createState() => _DriverRegisterScreenState();
}

class _DriverRegisterScreenState extends State<DriverRegisterScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundWidget(
          isBottomLeft: false,
          isBottomRight: false,
          body: Column(
            children: [
              SizedBox(height: offsetLg,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: offsetBase),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/logo_login.svg', width: 44, fit: BoxFit.cover,),
                    SizedBox(height: offsetSm,),
                    Text('GPSJournal', style: mediumTextStyle,),
                  ],
                ),
              ),
              SizedBox(height: 14,),
              AvatarWidget(uri: '',),
              SizedBox(height: 40,),
              NoneTextfieldWidget(
                keyBoardType: TextInputType.text,
                controller: nameController,
                hintText: 'Full Name',
              ),
              NoneTextfieldWidget(
                margin: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetBase),
                keyBoardType: TextInputType.emailAddress,
                controller: emailController,
                hintText: 'Email',
              ),
              NoneTextfieldWidget(
                keyBoardType: TextInputType.visiblePassword,
                controller: passController,
                hintText: 'Password',
              ),
              SizedBox(height: offsetBase,),
              ButtonWidget(
                title: 'Register',
                action: () {

                },
              ),
              SizedBox(height: offsetBase,),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account? ',
                      style: mediumTextStyle.copyWith(fontSize: 15, color: blackTextColor),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () => NavigateToRouter(context, LoginScreen(), replace: true),
                      text: 'Log in',
                      style: mediumTextStyle.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


