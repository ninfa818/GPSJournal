import 'package:flutter/material.dart';
import 'package:gpsjournal/models/paper_model.dart';
import 'package:gpsjournal/services/navigation_service.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/widgets/common_widget.dart';
import 'package:gpsjournal/widgets/topbar_widget.dart';

import 'menu_screen.dart';

class PaperShiftScreen extends StatefulWidget {
  final Function(int) navigatorAction;

  const PaperShiftScreen({
    Key key,
    this.navigatorAction
  }) : super(key: key);

  @override
  _PaperShiftScreenState createState() => _PaperShiftScreenState();
}

class _PaperShiftScreenState extends State<PaperShiftScreen> {
  List<PaperModel> papers = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 15; i++) {
      papers.add(PaperModel());
    }

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      isBottomRight: false,
      isBottomLeft: false,
      body: Column(
        children: [
          SizedBox(height: offsetLg,),
          TopBarWidget(
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
          SizedBox(height: offsetMd,),
          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: papers.length,
              itemBuilder: (context, index) {
                return papers[index].itemWidget(index + 1);
              }
            ),
          ),
        ],
      ),
    );
  }
}
