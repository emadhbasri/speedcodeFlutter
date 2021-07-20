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
doDefaultStatusBar() {
  statusSet(
      statusBar: Color.fromRGBO(47, 49, 62, 1),
      statusBarIconIsWhite: true,
      navigationBar: Color.fromRGBO(47, 49, 62, 1),
      navigationBarLineIsWhite: true);
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
  static void replaceHero(BuildContext context, Widget newPage,
      {bool full: false,dur=const Duration(seconds: 1)}) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: dur,
            pageBuilder: (_, __, ___) => newPage,
            fullscreenDialog: full));
  }
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
  static void replaceSlideAnim(BuildContext context, Widget page,
      {bool full: false, var first, var second}) {
    if (first == null) first = Cubic(0.175, 0.885, 0.32, 1.1);
    if (second == null) second = Curves.easeOutCirc;
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            fullscreenDialog: full,
            pageBuilder: (context, Animation<double> animation,
                Animation<double> secendAnimation) {
              return page;
            },
            transitionsBuilder: (context, Animation<double> animation,
                Animation<double> secendAnimation, Widget widget) {
              return SlideTransition(
                position: Tween(begin: Offset(1, 0), end: Offset(0, 0))
                    .animate(CurvedAnimation(
                    curve: first, //Curves.easeOutBack
                    parent: animation,
                    reverseCurve: second)),
                child: widget,
              );
            })).catchError((e) => print('Error 1 $e'));
  }
  static void pop(BuildContext context, dynamic data) {
    Navigator.pop(context, data);
  }
  static Future<dynamic> pushSlideRightAnim(BuildContext context, Widget page,
      {bool isModal = false, var first, var second}) async{
    if (first == null) first = Cubic(0.175, 0.885, 0.32, 1.1);
    if (second == null) second = Curves.easeOutCirc;
    return await Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            opaque: !isModal,
            pageBuilder: (context, Animation<double> animation,
                Animation<double> secendAnimation) =>page,
            transitionsBuilder: (context, Animation<double> animation,
                Animation<double> secendAnimation, Widget widget) {
              return SlideTransition(
                position: Tween(begin: Offset(1,0), end: Offset(0, 0))
                    .animate(CurvedAnimation(
                    curve: first, //Curves.easeOutBack
                    parent: animation,
                    reverseCurve: second)),
                child: widget,
              );
            })).catchError((e) => print('Error 1 $e'));
  }
}

class GestureDetectorVertical extends StatefulWidget {
  final Function onDown;
  final Function onTop;
  final Function onTap;
  final Widget child;
  GestureDetectorVertical({Key key, this.onDown, this.onTop, this.child, this.onTap}) : super(key: key);

  @override
  _GestureDetectorVerticalState createState() => _GestureDetectorVerticalState();
}

class _GestureDetectorVerticalState extends State<GestureDetectorVertical> {
  double ds;

  double de;

  bool doIt=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails e) {
        de = e.globalPosition.dy;
        if (ds > de && doIt==false){
          //top
          doIt=true;
          widget.onTop();
        }else if(ds < de && doIt==false){
          //down
          doIt=true;
          widget.onDown();
        }
      },
      onVerticalDragEnd: (e) async{
        doIt=false;
        de=null;
      },
      onVerticalDragStart: (DragStartDetails e) {
        ds = e.globalPosition.dy;
      },
      onTap: widget.onTap,
      child: widget.child,
    );
  }
}

class GestureDetectorHorizontal extends StatefulWidget {
  final Function onRight;
  final Function onLeft;
  final Widget child;
  const GestureDetectorHorizontal({Key key, this.onRight, this.onLeft, this.child}) : super(key: key);
  @override
  _GestureDetectorHorizontalState createState() => _GestureDetectorHorizontalState();
}

class _GestureDetectorHorizontalState extends State<GestureDetectorHorizontal> {
  double ds;
  double de;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails e) {
        de = e.globalPosition.dx;
      },
      onHorizontalDragEnd: (e) async{
        if (ds > de)
          //left
          widget.onLeft();
        else
          //right
          widget.onRight();
      },
      onHorizontalDragStart: (DragStartDetails e) {
        ds = e.globalPosition.dx;
      },
      child: widget.child,
    );
  }
}

