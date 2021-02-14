import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpsjournal/themes/text_theme.dart';

class TourModel {
  String street;
  String city;
  String date;
  String subtitle;
  String startTime;
  String endTime;
  String durTime;
  String distance;
  String dis;
  List<String> tags;

  TourModel({
    this.street = 'Bastian Schweinsteiger',
    this.city = 'Hamburg',
    this.date = '24 / 06 / 2020',
    this.subtitle = 'Neda 01',
    this.startTime = '12:05',
    this.endTime = '12:45',
    this.durTime = '40 min',
    this.distance = '50 Km',
    this.dis = '40 m',
    this.tags = const ['fehrbellin', 'lindow', 'oranienburg', 'fehrbellin', 'lindow'],
  });

  Widget itemWidget(index) {
    return Container(
      color: index % 2 == 0? Colors.white : Colors.transparent,
      padding: EdgeInsets.only(left: 58, right: 30, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$street | $city', style: boldTextStyle.copyWith(fontSize: 16),),
          SizedBox(height: 12,),
          Text('$date | $subtitle', style: boldTextStyle.copyWith(fontSize: 12),),
          SizedBox(height: 12,),
          Text('$startTime | $endTime | $durTime | $distance | $dis', style: boldTextStyle.copyWith(fontSize: 8),),
          SizedBox(height: 14,),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  children: [
                    for (var tag in tags) Container(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xffFFF4EF),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(tag, style: mediumTextStyle.copyWith(fontSize: 10.0, color: Color(0xff8E98B7)),),
                    )
                  ],
                ),
              ),
              SvgPicture.asset('assets/icons/icon_cloud.svg'),
            ],
          )
        ],
      ),
    );
  }

  Widget itemWigetV2(index) {
    String imageAsset = 'assets/images/map_${(index % 4) + 1}.png';
    return Container(
      width: double.infinity,
      height: 185,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Image.asset(imageAsset, fit: BoxFit.cover,),
    );
  }

  Widget itemDetailWidget() {
    return Container(
      color: Color(0xffF3F4F7).withOpacity(0.35),
      padding: EdgeInsets.all(10.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$street | $city', style: boldTextStyle.copyWith(fontSize: 10),),
          SizedBox(height: 8,),
          Text('$date', style: mediumTextStyle.copyWith(fontSize: 10),),
          SizedBox(height: 8,),
          Text('$startTime | $endTime | $durTime | $distance | $dis', style: boldTextStyle.copyWith(fontSize: 8),),
          SizedBox(height: 8,),
          Wrap(
            children: [
              for (var tag in tags) Container(
                margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xffFFF4EF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(tag, style: mediumTextStyle.copyWith(fontSize: 10.0, color: Color(0xff8E98B7)),),
              )
            ],
          ),
        ],
      ),
    );
  }

}