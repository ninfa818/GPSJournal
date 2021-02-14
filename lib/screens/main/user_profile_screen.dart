import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/screens/main/menu_screen.dart';
import 'package:gpsjournal/services/navigation_service.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/shadow.dart';
import 'package:gpsjournal/widgets/button_widget.dart';
import 'package:gpsjournal/widgets/common_widget.dart';
import 'package:gpsjournal/widgets/image_widget.dart';
import 'package:gpsjournal/widgets/textfield_widget.dart';
import 'package:gpsjournal/widgets/topbar_widget.dart';

class UserProfileScreen extends StatefulWidget {
  final Function(int) navigatorAction;

  const UserProfileScreen({
    Key key,
    this.navigatorAction
  }) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      isTop: false,
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
              NavigateToRouter(context, MenuScreen(),
                  navigatorPop: (value) {
                    if (value != null) {
                      widget.navigatorAction(value);
                    }
                  });
            },
            rightImage: 'assets/icons/icon_menu.svg',
            actionRight: () {
              NavigateToRouter(context, MenuScreen(),
                  navigatorPop: (value) {
                    if (value != null) {
                      widget.navigatorAction(value);
                    }
                  });
            },
          ),
          SizedBox(height: 14,),
          AvatarWidget(uri: 'avatar',),
          SizedBox(height: offsetBase,),
          InnerTextWidget(
            margin: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetXB),
            controller: nameController,
            keyBoardType: TextInputType.text,
            hintText: 'Full name',
          ),
          InnerTextWidget(
            margin: EdgeInsets.symmetric(horizontal: offsetMd, vertical: offsetXB),
            controller: emailController,
            keyBoardType: TextInputType.text,
            hintText: 'Email',
          ),
          SizedBox(height: offsetBase,),
          ButtonWidget(
            title: 'Confirm',
            action: () {
              NavigateToRouter(context, MenuScreen(),
                navigatorPop: (value) {
                  if (value != null) {
                    widget.navigatorAction(value);
                  }
                }
              );
            },
          ),
        ],
      )
    );
  }
}
