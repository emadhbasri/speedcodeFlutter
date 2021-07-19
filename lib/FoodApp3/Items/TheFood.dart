import 'package:flutter/material.dart';
import 'package:speedcode_flutter/functions.dart';
import '../FoodInfo.dart';
import '../RestaurantHeroState.dart';
import '../Tabs/SearchTab.dart';
import '../Tabs/MainTab.dart';
import '../data.dart';
import '../models.dart';

class Plate extends StatelessWidget {
  final bool padding;
  final String image;
  final Alignment alignment;
  const Plate(this.padding, this.image, this.alignment);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding:
            padding ? EdgeInsets.only(top: doubleHeight(72)) : EdgeInsets.zero,
        child: Hero(
          tag: 'circleplate',
          child: ClipRRect(
            borderRadius: BorderRadius.circular(padding ? 100 : 200),
            child: Container(
              width: padding ? doubleWidth(40) : doubleWidth(60),
              height: padding ? doubleWidth(40) : doubleWidth(60),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TheFood extends StatefulWidget {
  final RestaurantHeroState state;
  final FoodPageType foodPageType;
  TheFood(this.foodPageType, this.state);

  @override
  _TheFoodState createState() => _TheFoodState();
}

class _TheFoodState extends State<TheFood> {
  double ds;

  double de;

  bool goLeft = false;

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
        color: Color.fromRGBO(72, 140, 159, 1),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(72, 140, 159, 1),
              blurRadius: 25,
              spreadRadius: -2,
              offset: Offset(10, 0)),
          BoxShadow(
              color: Color.fromRGBO(170, 206, 217, 1),
              blurRadius: 5,
              spreadRadius: -2,
              offset: Offset(10, 10))
        ],
        gradient: LinearGradient(
          colors: widget.state.selectedFood.colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ));

    switch (widget.foodPageType) {
      case FoodPageType.main:
        return GestureDetector(
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                width: double.maxFinite,
                height: doubleHeight(90),
                margin: EdgeInsets.only(top: doubleHeight(10)),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SizedBox.expand(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () async{
                            await statusSet(
                                statusBar: Colors.transparent,
                                statusBarIconIsWhite: false,
                                navigationBar: Colors.white,
                                navigationBarLineIsWhite: false);
                            Go.pushSlideRightAnim(
                                context, FoodInfo(widget.state.selectedFood));
                          },
                          child: Align(
                            alignment: Alignment(0, -0.2), //
                            child: Hero(
                              tag: 'boardAnim',
                              child: Container(
                                height: doubleHeight(70),
                                width: doubleWidth(70),
                                decoration: boxDecoration,
                                child: Column(
                                  children: [
                                    SizedBox(height: doubleHeight(5)),
                                    Expanded(
                                      child: Container(
                                        height: double.maxFinite,
                                        width: double.maxFinite,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: doubleWidth(8),
                                                  right: doubleWidth(7)),
                                              child: Material(
                                                color: Colors.transparent,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            widget
                                                                .state
                                                                .selectedFood
                                                                .name,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                wordSpacing: 2,
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    doubleWidth(
                                                                        5))),
                                                        Icon(
                                                          Icons.favorite_border,
                                                          color: Colors.white,
                                                          size: doubleWidth(5),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                        widget
                                                            .state
                                                            .selectedFood
                                                            .shortname,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            wordSpacing: 2,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                doubleWidth(
                                                                    7.5))),
                                                    SizedBox(
                                                        height:
                                                            doubleHeight(1)),
                                                    Text(
                                                        widget.state
                                                            .selectedFood.desc,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            wordSpacing: 2,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                doubleWidth(
                                                                    3))),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Material(
                                              color: Colors.transparent,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: doubleHeight(3),
                                                    left: doubleWidth(5)),
                                                child: Text(
                                                    '${widget.state.selectedFood.cl}cl',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        wordSpacing: 2,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize:
                                                            doubleWidth(7.5))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () async{
                              await statusSet(
                                  statusBar: Colors.transparent,
                                  statusBarIconIsWhite: false,
                                  navigationBar: Colors.white,
                                  navigationBarLineIsWhite: false);
                              Go.pushSlideRightAnim(
                                  context, FoodInfo(widget.state.selectedFood));
                            },
                            child: Plate(false, widget.state.selectedFood.image,
                                Alignment(0.8, 0))),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onHorizontalDragUpdate: (DragUpdateDetails e) {
                  de = e.globalPosition.dx;
                },
                onHorizontalDragEnd: (e) {
                  if (ds < de)
                    Go.replaceHero(
                        context,
                        SearchTab(
                          foods: foods,
                        ));
                },
                onHorizontalDragStart: (DragStartDetails e) {
                  ds = e.globalPosition.dx;
                },
              )
            ],
          ),
        );
      case FoodPageType.slide:
        return GestureDetector(
          onTap: () {
            Go.replaceHero(context, MainTab());
          },
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 1.15),
                  child: Hero(
                    tag: 'boardAnim',
                    child: Container(
                      width: double.maxFinite,
                      height: doubleHeight(30),
                      decoration: boxDecoration,
                      child: Column(
                        children: [
                          SizedBox(height: doubleHeight(2)),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: Colors.white,
                              height: doubleHeight(0.3),
                              width: doubleWidth(30),
                            ),
                          ),
                          SizedBox(height: doubleHeight(2)),
                          Expanded(
                            child: Container(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              padding: EdgeInsets.only(
                                left: doubleWidth(10),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.state.selectedFood.name,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            wordSpacing: 2,
                                            color: Colors.white,
                                            fontSize: doubleWidth(7.5))),
                                    Text(widget.state.selectedFood.shortname,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            wordSpacing: 2,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: doubleWidth(7.5))),
                                    SizedBox(height: doubleHeight(2)),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: doubleWidth(2),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Container(
                                          width: doubleWidth(12),
                                          height: doubleWidth(12),
                                          child: Image.asset(
                                            widget.state.selectedFood.image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Plate(true, widget.state.selectedFood.image, Alignment(1.5, 0)),
              ],
            ),
          ),
        );
      case FoodPageType.search:
        return GestureDetector(
          onTap: () {
            Go.replaceHero(context, MainTab());
          },
          child: Align(
            alignment: Alignment(5, 1.2), //
            child: Hero(
              tag: 'boardAnim',
              child: Container(
                height: doubleHeight(70),
                width: doubleWidth(70),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(72, 140, 159, 1),
                    gradient: LinearGradient(
                      colors: widget.state.selectedFood.colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(height: doubleHeight(5)),
                    Expanded(
                      child: Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      default:
        return SizedBox();
    }
  }
}
