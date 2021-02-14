import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/shadow.dart';
import 'package:gpsjournal/widgets/button_widget.dart';
import 'package:gpsjournal/widgets/common_widget.dart';
import 'package:gpsjournal/widgets/textfield_widget.dart';
import 'package:gpsjournal/widgets/topbar_widget.dart';

class BusinessRegisterScreen extends StatefulWidget {
  @override
  _BusinessRegisterScreenState createState() => _BusinessRegisterScreenState();
}

class _BusinessRegisterScreenState extends State<BusinessRegisterScreen> {
  var companyController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  void dispose() {
    companyController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BackgroundWidget(
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
              SizedBox(height: offsetLg * 1.5,),
              InnerTextWidget(
                isExtra: true,
                margin: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetXB),
                controller: companyController,
                keyBoardType: TextInputType.text,
                hintText: 'Company Name',
              ),
              InnerTextWidget(
                margin: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetXB),
                controller: emailController,
                keyBoardType: TextInputType.emailAddress,
                hintText: 'Email',
              ),
              InnerTextWidget(
                margin: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetXB),
                controller: addressController,
                keyBoardType: TextInputType.streetAddress,
                hintText: 'Address',
              ),
              InnerTextWidget(
                margin: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetXB),
                controller: phoneController,
                keyBoardType: TextInputType.phone,
                hintText: 'Phone',
              ),
              SizedBox(height: offsetBase,),
              ButtonWidget(
                title: 'Confirm',
                action: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


