import 'package:flutter/material.dart';
import 'package:speedcode_flutter/functions.dart';

class MainPageFoodRight extends StatelessWidget {
  final bool show;
  const MainPageFoodRight({Key key, this.show}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: show ? Alignment(1, -0.6) : Alignment(5, -0.6),
      child: Hero(
        tag: 'rt1hero2',
        child: Container(
            width: doubleWidth(60),
            height: doubleHeight(60),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 1),
                  child: Material(
                    color: Colors.transparent, //Colors.transparent
                    child: Container(
                      height: doubleHeight(22),
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: doubleWidth(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Restaurant Hero',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  wordSpacing: 2,
                                  color: Colors.black,
                                  fontSize: doubleWidth(6))),
                          SizedBox(height: doubleHeight(1)),
                          Text('description descr descr descr descr descr',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  wordSpacing: 2,
                                  color: Colors.grey, //Colors.grey
                                  fontSize: doubleWidth(4))),
                          SizedBox(height: doubleHeight(1)),
                          Text('150\$',
                              style: TextStyle(
                                  wordSpacing: 2,
                                  color: Colors.grey,
                                  fontSize: doubleWidth(8))),
                          SizedBox(height: doubleHeight(1)),
                          Container(
                            width: doubleWidth(40),
                            child: RaisedButton(
                              onPressed: () {},
                              shape: StadiumBorder(),
                              color: Colors.orange,
                              textColor: Colors.white,
                              child: Text('buy'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: doubleWidth(7),
                  top: doubleHeight(5),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 20,
                              spreadRadius: 5,
                              offset: Offset(15, 15))
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Container(
                        width: doubleHeight(30),
                        height: doubleHeight(30),
                        color: Colors.white,
                        child: Image.asset(
                          'assets/images/foodApp3/food1.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class MainPageFoodLeft extends StatelessWidget {
  final bool show;
  const MainPageFoodLeft({Key key, this.show}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: show ? Alignment(-1, -0.6) : Alignment(-3, -0.6),
      child: Hero(
        tag: 'rt1hero1',
        child: Container(
          width: doubleWidth(40),
          height: doubleHeight(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      spreadRadius: -2,
                      offset: Offset(0, 5))
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: doubleWidth(30),
                      height: doubleWidth(30),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/foodApp3/restaurant1.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      spreadRadius: -2,
                      offset: Offset(0, 5))
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: doubleWidth(30),
                      height: doubleWidth(30),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/foodApp3/restaurant3.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      spreadRadius: -2,
                      offset: Offset(0, 5))
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      width: doubleWidth(30),
                      height: doubleWidth(30),
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/foodApp3/restaurant2.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
