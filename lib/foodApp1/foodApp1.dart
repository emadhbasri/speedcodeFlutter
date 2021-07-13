import 'dart:math';

import 'package:flutter/material.dart';
import '../foodApp1/data.dart';
import '../functions.dart';

import 'Slider.dart';
import 'PageSecond.dart';

class FoodApp1 extends StatefulWidget {
  @override
  _FoodApp1State createState() => _FoodApp1State();
}

class _FoodApp1State extends State<FoodApp1> {
  @override
  void initState() {
    statusSet(statusBar: yellowBack, statusBarIconIsWhite: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 247, 247, 1),
      body: Stack(
        alignment: Alignment.topCenter,
        // fit: StackFit.loose,
        children: <Widget>[
          Container(
              width: double.maxFinite,
              height: doubleHeight(20),
              color: yellowBack),
          Transform.rotate(
            angle: pi / 4,
            child: Container(
              width: doubleHeight(43),
              height: doubleHeight(43),
              color: yellowBack,
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Delivery address',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(color: Color.fromRGBO(0, 0, 0, 0.4)),
                          ),
                          Text(
                            'Bielawska 12',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 25),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Card(
                            elevation: 10,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: IconButton(
                                onPressed: () {
                                  Go.pop(context, false);
                                },
                                icon: Icon(Icons.search),
                                iconSize: 23,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Card(
                            elevation: 10,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.account_circle),
                                iconSize: 23,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 7,
                  child: MySlider(),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, int index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 5, right: 5, top: 15, bottom: 10),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  elevation: 5,
                                  shape: CircleBorder(),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 35,
                                    child: Image.asset(
                                      categories[index].icon,
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  categories[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Divider(
                  indent: doubleWidth(5),
                  endIndent: doubleWidth(5),
                  height: 0,
                  thickness: 0.5,
                  color: Colors.black38,
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('All restaurants',
                                  style: Theme.of(context).textTheme.headline6),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Sorted By Fastest Delivery',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        fontSize: 15,
                                        color: Color.fromRGBO(0, 0, 0, 0.4)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  width: 0.5, color: Colors.black38)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.settings),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20, top: 5, left: 20, bottom: 20),
                    child: SliderBottomList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
