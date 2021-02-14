import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpsjournal/models/pdf_model.dart';
import 'package:gpsjournal/services/navigation_service.dart';
import 'package:gpsjournal/themes/color_theme.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/utils/shadow.dart';
import 'package:gpsjournal/widgets/common_widget.dart';
import 'package:gpsjournal/widgets/topbar_widget.dart';

import 'menu_screen.dart';

class PDFDownloadScreen extends StatefulWidget {
  final Function(int) navigatorAction;

  const PDFDownloadScreen({
    Key key,
    this.navigatorAction
  }) : super(key: key);

  @override
  _PDFDownloadScreenState createState() => _PDFDownloadScreenState();
}

class _PDFDownloadScreenState extends State<PDFDownloadScreen> {
  List<PDFModel> pdfs = [];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 15; i++) {
      pdfs.add(PDFModel());
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
                  itemCount: pdfs.length,
                  itemBuilder: (context, index) {
                    return pdfs[index].itemWidget(index + 1);
                  }
              ),
            ),
          ],
        )
    );
  }
}
