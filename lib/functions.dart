import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

Size screenSize;
double doubleHeight(double value, {double height: 0}) {
  if (height == 0) height = screenSize.height;
  return (height * value) / 100;
}

double doubleWidth(double value, {double width: 0}) {
  if (width == 0) width = screenSize.width;
  return (width * value) / 100;
}

statusSet({
  Color statusBar,
  Color navigationBar,
  bool statusBarIconIsWhite,
  bool navigationBarLineIsWhite,
}) async {
  try {
    if(statusBar!=null)
      await FlutterStatusbarcolor.setStatusBarColor(statusBar, animate: true);
    if(statusBarIconIsWhite!=null)
      FlutterStatusbarcolor.setStatusBarWhiteForeground(statusBarIconIsWhite);
    if(navigationBar!=null)
      await FlutterStatusbarcolor.setNavigationBarColor(navigationBar,
          animate: true);
    if(navigationBarLineIsWhite!=null)
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(
          navigationBarLineIsWhite);
  } catch (e) {
    print(e.toString());
  }
}

//for navigate between screens
abstract class Go {
  static Future<void> push(BuildContext context, Widget page,
      {bool isModal = false,Duration duration = const Duration(
          milliseconds: 300
      )}) async {
    Route _route;
    if (isModal)
      _route = PageRouteBuilder(
          transitionDuration: duration,
          opaque: false, pageBuilder: (BuildContext context, _, __) => page);
    else
      _route = MaterialPageRoute(builder: (context) => page);
    await Navigator.push(context, _route)
        .catchError((e) => print('Error push $e'));
  }
  static Future<void> replace(BuildContext context, Widget page,
      {bool isModal = false,Duration duration = const Duration(
        milliseconds: 300
      )}) async {
    Route _route;
    if (isModal)
      _route = PageRouteBuilder(
        barrierColor: Colors.transparent,
          transitionDuration: duration,
          opaque: false, pageBuilder: (BuildContext context, _, __) => page);
    else
      _route = MaterialPageRoute(builder: (context) => page);
    await Navigator.pushReplacement(context, _route)
        .catchError((e) => print('Error push $e'));
  }

  static void pop(BuildContext context, dynamic data) {
    Navigator.pop(context, data);
  }
}
