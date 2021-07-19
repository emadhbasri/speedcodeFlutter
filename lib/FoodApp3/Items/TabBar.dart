import 'package:flutter/material.dart';
import 'package:speedcode_flutter/functions.dart';
import '../RestaurantHeroState.dart';
import '../Tabs/MainTab.dart';
import '../Tabs/SearchTab.dart';
import '../data.dart';
import '../models.dart';

class TabBarItem extends StatelessWidget {
  final RestaurantHeroState state;
  final FoodPageType foodPageType;
  final bool show;
  const TabBarItem(this.foodPageType, {this.show, this.state});
  @override
  Widget build(BuildContext context) {
    switch (foodPageType) {
      case FoodPageType.main:
        if (show)
          return Align(
            alignment: Alignment(-1, -1),
            child: Container(
              width: double.maxFinite,
              height: doubleHeight(10),
              padding: EdgeInsets.only(
                  left: doubleWidth(10), right: doubleWidth(10)),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'tabs',
                      child: Container(
                        width: doubleWidth(33, width: doubleWidth(80)),
                        height: doubleHeight(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.orangeAccent,
                                  blurRadius: 5,
                                  spreadRadius: -2,
                                  offset: Offset(0, 5))
                            ]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        print('state $state');
                        Go.replaceHero(
                            context,
                            SearchTab(
                              foods: foods,
                            ));
                      },
                      child: Hero(
                        tag: 'SearchTab',
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: doubleWidth(33, width: doubleWidth(80)),
                            height: doubleHeight(5),
                            child: Center(
                              child: Text(
                                'Search',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'MainTab',
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          width: doubleWidth(33, width: doubleWidth(80)),
                          height: doubleHeight(5),
                          child: Center(
                            child: Text(
                              'Main',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Hero(
                        tag: 'tab3',
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: doubleWidth(33, width: doubleWidth(80)),
                            height: doubleHeight(5),
                            child: Center(
                              child: Text(
                                'Tab 3',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        else
          return Align(
            alignment: Alignment(-1, -1.5),
            child: Container(
              width: double.maxFinite,
              height: doubleHeight(10),
              padding: EdgeInsets.only(
                  left: doubleWidth(10), right: doubleWidth(10)),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'tabs',
                      child: Container(
                        width: doubleWidth(33, width: doubleWidth(80)),
                        height: doubleHeight(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.orangeAccent,
                                  blurRadius: 5,
                                  spreadRadius: -2,
                                  offset: Offset(0, 5))
                            ]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Go.replaceHero(
                            context,
                            SearchTab(
                              foods: foods,
                            ));
                      },
                      child: Hero(
                        tag: 'SearchTab',
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: doubleWidth(33, width: doubleWidth(80)),
                            height: doubleHeight(5),
                            child: Center(
                              child: Text(
                                'Search',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'MainTab',
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          width: doubleWidth(33, width: doubleWidth(80)),
                          height: doubleHeight(5),
                          child: Center(
                            child: Text(
                              'Main',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Hero(
                        tag: 'tab3',
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: doubleWidth(33, width: doubleWidth(80)),
                            height: doubleHeight(5),
                            child: Center(
                              child: Text(
                                'Tab 3',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        break;
      case FoodPageType.search:
        return Container(
          width: double.maxFinite,
          height: doubleHeight(10),
          padding:
              EdgeInsets.only(left: doubleWidth(10), right: doubleWidth(10)),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Hero(
                  tag: 'tabs',
                  child: Container(
                    width: doubleWidth(33, width: doubleWidth(80)),
                    height: doubleHeight(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.orangeAccent,
                              blurRadius: 5,
                              spreadRadius: -2,
                              offset: Offset(0, 5))
                        ]),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Hero(
                  tag: 'SearchTab',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: doubleWidth(33, width: doubleWidth(80)),
                      height: doubleHeight(5),
                      child: Center(
                        child: Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Go.replaceHero(context, MainTab());
                  },
                  child: Hero(
                    tag: 'MainTab',
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: doubleWidth(33, width: doubleWidth(80)),
                        height: doubleHeight(5),
                        child: Center(
                          child: Text(
                            'Main',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Hero(
                    tag: 'tab3',
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: doubleWidth(33, width: doubleWidth(80)),
                        height: doubleHeight(5),
                        child: Center(
                          child: Text(
                            'Tab 3',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case FoodPageType.slide:
        return SizedBox();
      default:
        return SizedBox();
    }
  }
}
