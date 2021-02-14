import 'package:flutter/material.dart';
import 'package:gpsjournal/screens/main/day_start_screen.dart';
import 'package:gpsjournal/screens/main/paper_shift_screen.dart';
import 'package:gpsjournal/screens/main/pdf_download_screen.dart';
import 'package:gpsjournal/screens/main/tour_list_screen.dart';
import 'package:gpsjournal/screens/main/user_profile_screen.dart';
import 'package:gpsjournal/services/navigation_service.dart';
import 'package:gpsjournal/themes/color_theme.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentIndex = 0;

  void onMenuCallback(int index) {
    switch (index) {
      case 0:
      case 1:
      case 2:
        setState(() {
          _currentIndex = index;
        });
        break;
      case 3:
        NavigateToRouter(context, DayStartScreen());
        break;
      case 4:
        NavigateToRouter(context, TourListScreen());
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screens = <int, Widget Function()>{
      0: () => UserProfileScreen(
        navigatorAction: (value) {
          onMenuCallback(value);
        },
      ),
      1: () => PaperShiftScreen(
        navigatorAction: (value) {
          onMenuCallback(value);
        },
      ),
      2: () => PDFDownloadScreen(
        navigatorAction: (value) {
          onMenuCallback(value);
        },
      ),
    };

    return Scaffold(
      backgroundColor: backgroundColor,
      body: _screens[_currentIndex](),
    );
  }
}
