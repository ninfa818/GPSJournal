import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpsjournal/models/tour_model.dart';
import 'package:gpsjournal/screens/main/tour_detail_screen.dart';
import 'package:gpsjournal/services/navigation_service.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/themes/text_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/screen.dart';
import 'package:gpsjournal/widgets/button_widget.dart';
import 'package:gpsjournal/widgets/menu_widget.dart';
import 'package:gpsjournal/widgets/textfield_widget.dart';
import 'package:gpsjournal/widgets/topbar_widget.dart';

class TourListScreen extends StatefulWidget {
  @override
  _TourListScreenState createState() => _TourListScreenState();
}

class _TourListScreenState extends State<TourListScreen> {
  var isMenu = false;
  var isVersion2 = true;
  double width = 270;

  List<TourModel> tours = [];

  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 15; i++) {
      tours.add(TourModel());
    }

    setState(() {

    });
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
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
                SizedBox(height: offsetBase,),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: false,
                      itemCount: tours.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            NavigateToRouter(context, TourDetailScreen(model: tours[index]));
                          },
                            child: isVersion2
                                ? tours[index].itemWigetV2(index)
                                : tours[index].itemWidget(index));
                      }
                  ),
                ),
              ],
            ),
            MenuWidget(
              isMenu: isMenu,
              width: width,
              height: 600,
              screen: screen,
              isExtra: true,
              onExtraEvent: () {
                setState(() {
                  isMenu = !isMenu;
                });
              },
              body: isVersion2
                  ? getV2Widget()
                  : getV1Widget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getV1Widget() {
    return Container(
      child: Column(
        children: [
          Spacer(),
          Text('TIME', style: boldTextStyle.copyWith(fontSize: 40.0),),
          SizedBox(height: offsetBase,width: double.infinity,),
          Text('DATE', style: boldTextStyle.copyWith(fontSize: 40.0),),
          SizedBox(height: offsetBase,),
          Text('CITY', style: boldTextStyle.copyWith(fontSize: 40.0),),
          SizedBox(height: offsetBase,),
          Text('NAME', style: boldTextStyle.copyWith(fontSize: 40.0),),
          SizedBox(height: offsetBase,),
          Text('LENGTH', style: boldTextStyle.copyWith(fontSize: 40.0),),
          SizedBox(height: offsetBase,),
          Text('HEIGHT', style: boldTextStyle.copyWith(fontSize: 40.0),),
          SizedBox(height: offsetLg,),
          InnerTextWidget(
            margin: EdgeInsets.symmetric(horizontal: offsetBase),
            controller: searchController,
            keyBoardType: TextInputType.text,
            hintText: 'Type in search ...',
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget getV2Widget() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: offsetBase),
            color: Color(0xffEAEBEF),
            height: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text('TIME', style: boldTextStyle.copyWith(fontSize: 30.0),),
                SizedBox(height: 18,width: double.infinity,),
                Text('DATE', style: boldTextStyle.copyWith(fontSize: 30.0),),
                SizedBox(height: 18,width: double.infinity,),
                Text('CITY', style: boldTextStyle.copyWith(fontSize: 30.0),),
                SizedBox(height: 18,width: double.infinity,),
                Text('NAME', style: boldTextStyle.copyWith(fontSize: 30.0),),
                SizedBox(height: 18,width: double.infinity,),
                Text('LENGTH', style: boldTextStyle.copyWith(fontSize: 30.0),),
                SizedBox(height: 18,width: double.infinity,),
                Text('HEIGHT', style: boldTextStyle.copyWith(fontSize: 30.0),),
                Spacer(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: offsetBase, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Start date', style: mediumTextStyle.copyWith(fontSize: 12),),
                ),
                SizedBox(height: 4,),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 16.0),
                  child: Text('End date', style: mediumTextStyle.copyWith(fontSize: 12),),
                ),
                SizedBox(height: 4,),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 16.0),
                  child: Text('Enter tag...', style: mediumTextStyle.copyWith(fontSize: 12),),
                ),
                SizedBox(height: 4,),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        margin: EdgeInsets.zero,
                        background: backgroundColor,
                        fontColor: primaryColor,
                        title: 'Sort',
                          action: () {

                      }),
                    ),
                    SizedBox(width: 12.0,),
                    Expanded(
                      child: ButtonWidget(
                          margin: EdgeInsets.zero,
                          title: 'Clear',
                          action: () {

                          }),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}
