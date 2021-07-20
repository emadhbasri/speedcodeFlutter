import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppState.dart';
import 'package:speedcode_flutter/functions.dart';
import 'data.dart';
import 'model.dart';
import 'pages/FoodPage.dart';
import 'pages/ShopsPage.dart';

import 'pages/CartPage.dart';
import 'pages/End.dart';
import 'pages/ShopPage.dart';

import 'dart:math' as math;

class FullAnimationUiCake extends StatefulWidget {
  @override
  _FullAnimationUiCakeState createState() => _FullAnimationUiCakeState();
}

class _FullAnimationUiCakeState extends State<FullAnimationUiCake>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  Animation<double> animation1;
  Animation<double> animation2;

  AnimationController _controller1;
  Animation<double> _animationSize;
  Animation<Offset> _animationAlign;

  bool done=false;
  PageName currentPage;

  changePage1()async{
    _controller.animateTo(1.0,duration: mil700,curve: Curves.easeOutSine);
  }
  changePage2()async{
    _controller.animateTo(0.0,duration: mil700);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, value: 0, duration: sec1, reverseDuration: sec1);
    animation = Tween<double>(begin: 0, end: 60)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0, 0.1)));
    animation1 = Tween<double>(begin: 1.0, end: 0.9)
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0, 0.1)));

    animation2 = Tween<double>(begin: 0.9, end: 0.1).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.1, 1.0)));



    _controller1 = AnimationController(vsync: this,duration: Duration(seconds: 1),value: 0);
    _animationSize=Tween<double>(begin: 0.1,end: 1)
        .animate(CurvedAnimation(parent: _controller1,curve: Interval(0.3,1.0)));
  }

  @override
  Widget build(BuildContext context) {
    statusSet(statusBar: Colors.transparent);
    _animationAlign=Tween<Offset>(begin: Offset(screenSize.width, 0),end: Offset(0.0, 0))
        .animate(CurvedAnimation(parent: _controller1,curve: Interval(0.0,0.3)));
    return Scaffold(
      backgroundColor: purple,
      body: MultiProvider(
          providers: [
            ListenableProvider<AppState>(
              create: (context) => AppState(),
            )
          ],
          child: Stack(
            children: [
              Consumer<AppState>(
                builder: (context, value, child) {
                  // value.func1=changePage1();
                  // value.func2=changePage2();
                  // value.con
                  value.controller=_controller;
                  return Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: double.maxFinite,
                      height: doubleHeight(10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: doubleWidth(13)),
                        child: Consumer<AppState>(
                            builder: (context, value, child) =>
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    value.tab==Tabs.home? TabDot('Home')
                                        :IconButton(
                                      icon: Icon(CupertinoIcons.home,color: Colors.white,size: doubleWidth(7)),
                                      onPressed: (){
                                        Provider.of<AppState>(context,listen: false).setTab(Tabs.home);
                                      },
                                      padding: EdgeInsets.zero,
                                    ),
                                    value.tab==Tabs.search?TabDot('Search'):
                                    IconButton(icon: Icon(CupertinoIcons.search,color: Colors.white,size: doubleWidth(7)),
                                      onPressed: (){

                                        Provider.of<AppState>(context,listen: false).setTab(Tabs.search);
                                      },
                                      padding: EdgeInsets.zero,
                                    ),
                                    value.tab==Tabs.note?TabDot('Note'):
                                    IconButton(icon: Icon(CupertinoIcons.doc_plaintext,color: Colors.white,size: doubleWidth(7)),
                                      onPressed: (){
                                        Provider.of<AppState>(context,listen: false).setTab(Tabs.note);
                                      },
                                      padding: EdgeInsets.zero,
                                    ),
                                    value.tab==Tabs.profile?TabDot('Profile'):
                                    IconButton(icon: Icon(CupertinoIcons.profile_circled,color: Colors.white,size: doubleWidth(7)),
                                      onPressed: (){
                                        Provider.of<AppState>(context,listen: false).setTab(Tabs.profile);
                                      },
                                      padding: EdgeInsets.zero,
                                    ),

                                  ],
                                )
                        ),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: animation,
                  child: Consumer<AppState>(
                    builder: (context, value, child) {
                      Widget now;
                      switch (value.page) {
                        case PageName.Shops:
                          now= ShopsPage();
                          break;
                        case PageName.Shop:
                          now= ShopPage();
                          break;
                        case PageName.Food:
                          now= FoodPage();
                          break;
                        case PageName.Cart:
                          now= CartPage();
                          break;
                        case PageName.fifth:
                          now= End();
                          break;
                        default:
                          now= SizedBox();
                          break;
                      }
                      return AnimatedSwitcher(
                        child: now,
                        duration: sec1,
                        transitionBuilder: (child, animation) => FadeTransition(
                            opacity: animation.drive(Tween<double>(begin: 0,end: 1)),
                          child: child,
                        ),
                      );
                      // return AnimatedCrossFade(
                      //     firstChild: value.firstChild,
                      //     secondChild: value.secondChild,
                      //     crossFadeState: value.crossFadeState,
                      //     duration: mil200);

                    },
                  ),
                  builder: (context, child) =>
                      ClipPath(
                    clipper: MyClip(
                        radius: animation.value,
                        heightSize: _controller.value <= 0.1
                            ? animation1.value
                            : animation2.value),
                    child: child,
                  ),
                ),
              ),
              Consumer<AppState>(
                builder: (context, state, child) {
                  return Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: double.maxFinite,
                      height: doubleHeight(10),
                      child: GestureDetectorVertical(
                        onDown: () {
                          state.end=doubleHeight(5);
                          state.begin=doubleHeight(12);
                          state.notify();
                          print('down');
                          _controller.animateTo(0.0,duration: mil300);
                        },
                        onTop: () {
                          state.begin=doubleHeight(5);
                          state.end=doubleHeight(12);
                          state.notify();
                          _controller.animateTo(0.1,duration: mil300);
                          print('top');
                        },
                      ),
                    ),
                  );
                },
              ),


              AnimatedBuilder(
                animation: _animationSize,
                builder: (context, child) =>
                    Transform.translate(
                      offset: _animationAlign.value,
                      child: ClipRect(
                        child: Align(
                          alignment : AlignmentDirectional(-1.0, 1),
                          heightFactor: math.max(_animationSize.value, 0.0),
                          child: Container(
                            width: doubleWidth(100),
                            height: doubleHeight(100),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                                color: Colors.yellow
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
              //       if(done){
              //         _controller.forward().then((value) => _controller.reverse());
              //       }else{
              //         _controller.forward().then((value) => _controller.animateBack(0.9));
              //       }

            ],
          )),
    );
  }
}

class TabDot extends StatelessWidget {
  final String text;
  const TabDot(this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: doubleWidth(2),
          height: doubleWidth(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
        ),
        SizedBox(width: doubleWidth(1)),
        Text(text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500
          ),)
      ],
    );
  }
}

class MyClip extends CustomClipper<Path> {
  final double radius;
  final double heightSize;
  MyClip({this.radius, this.heightSize});
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    double height = size.height * heightSize;
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, height - radius)
      ..arcToPoint(Offset(size.width - radius + 10, height),
          radius: Radius.elliptical(radius, radius + 50))
      ..lineTo(radius - 5, height)
      ..arcToPoint(Offset(0, height - radius),
          radius: Radius.elliptical(radius, radius + 50))
      ..lineTo(0, radius)
      ..close();

    return path;
  }
}
