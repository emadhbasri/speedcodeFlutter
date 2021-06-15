
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
  Color statusBar = Colors.transparent,
  Color navigationBar = Colors.white,
  bool statusBarIconIsWhite=false,
  bool navigationBarLineIsWhite=false,
}) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(statusBar, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(statusBarIconIsWhite);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(navigationBarLineIsWhite);
    await FlutterStatusbarcolor.setNavigationBarColor(navigationBar,
        animate: true);
  } catch (e) {
    print(e.toString());
  }
}

//for navigate between screens
abstract class Go   {

  static Future<void> push(BuildContext context, Widget page) async{
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => page))
        .catchError((e) => print('Error push $e'));
  }

  static void pop(BuildContext context, dynamic data) {
    Navigator.pop(context, data);
  }

}



