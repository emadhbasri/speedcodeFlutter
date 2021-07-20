import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';









//for navigate between screens
abstract class Go {
  static void push(BuildContext context, Widget page, {bool full: false}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => page, fullscreenDialog: full))
        .catchError((e) => print('Error 1 $e'));
  }
  static void custom(BuildContext context, Widget page,
      {bool full: false, Cubic first = const Cubic(0.175, 0.885, 0.32, 1.1), Cubic second = Curves.easeOutCirc}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            fullscreenDialog: false,
            pageBuilder: (context, Animation<double> animation,
                Animation<double> secondAnimation) {
              return page;
            },
            transitionsBuilder: (context, Animation<double> animation,
                Animation<double> secondAnimation, Widget widget) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0)
                    .animate(CurvedAnimation(
                    curve: Curves.linear, //Curves.easeOutBack
                    parent: animation,
                    reverseCurve: Curves.linear)),
                child: widget,
              );
            })).catchError((e) => print('Error $e'));
  }


  static void pushSlideAnim(BuildContext context, Widget page,
      {bool full: false, Cubic first = const Cubic(0.175, 0.885, 0.32, 1.1), Cubic second = Curves.easeOutCirc}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            fullscreenDialog: full,
            pageBuilder: (context, Animation<double> animation,
                Animation<double> secondAnimation) {
              return page;
            },
            transitionsBuilder: (context, Animation<double> animation,
                Animation<double> secondAnimation, Widget widget) {
              return SlideTransition(
                position: Tween(begin: Offset(1, 0), end: Offset(0, 0))
                    .animate(CurvedAnimation(
                    curve: first, //Curves.easeOutBack
                    parent: animation,
                    reverseCurve: second)),
                child: widget,
              );
            })).catchError((e) => print('Error $e'));
  }

  static void replaceHero(BuildContext context, Widget newPage,
      {bool full: false,Duration dur=const Duration(seconds: 1)}) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          reverseTransitionDuration: dur,
            transitionDuration: dur,
            pageBuilder: (_, __, ___) => newPage,
            fullscreenDialog: full));
  }

}


// Color.fromRGBO(149, 100, 162, 1);





