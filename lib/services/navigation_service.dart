import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpsjournal/utils/dimens.dart';
import 'package:gpsjournal/widgets/common_widget.dart';

void NavigateToRouter(
    BuildContext context,
    Widget screen,
    {
      bool replace = false,
      Function(dynamic) navigatorPop,
    }) {
  if (replace) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute<Object>(
            builder: (context) => screen
        )
    ).then((value) => {
      if (navigatorPop != null) navigatorPop(value)
    });
  } else {
    Navigator.of(context).push(
        MaterialPageRoute<Object>(
            builder: (context) => screen
        )
    ).then((value) => {
      if (navigatorPop != null) navigatorPop(value)
    });
  }
}

Future<dynamic> showCustomModalBottomSheet({
  @required BuildContext context,
  @required Widget bodyWidget,
  @required Widget titleWidget,
  bool scrollControl = false,
}) async {
  return await showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: scrollControl,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(offsetBase),
        topLeft: Radius.circular(offsetBase),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (context) => Container(
      height: scrollControl? MediaQuery.of(context).size.height - kToolbarHeight : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: offsetSm,),
          BottomSheetTopStrip(),
          titleWidget,
          DividerWidget(),
          bodyWidget,
          SizedBox(height: offsetMd,),
        ],
      ),
    ),
    isDismissible: true,
  );
}

Future<dynamic> showCustomDialog ({
  @required BuildContext context,
  @required Widget titleWidget,
  @required Widget bodyWidget,
  @required Widget bottomWidget,
}) async {
  return await showDialog<dynamic>(
      context: context,
    builder: (context) => GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(offsetBase),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(offsetBase),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(offsetBase), topRight: Radius.circular(offsetBase)),
                  ),
                  child: titleWidget
                ),
                DividerWidget(),
                bodyWidget,
                DividerWidget(),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(offsetBase), bottomRight: Radius.circular(offsetBase)),
                    ),
                  child: bottomWidget
                )
              ],
            ),
          ),
        ),
      ),
    )
  );
}