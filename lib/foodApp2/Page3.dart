import 'dart:ui';

import 'package:flutter/material.dart';
import '../../functions.dart';
import 'dataTypes.dart';
class Page3 extends StatelessWidget {
  final String back;
  final String image;
  final String name;
  final String desc;
  final String star;
  Page3(this.back, this.image, this.name, this.desc, this.star);

  final List<Page3Scrole> _page3Scrole = [
    Page3Scrole(
        Color.fromRGBO(68, 138, 202, 1),
        Color.fromRGBO(42, 102, 176, 1),
        20,
        'Save more than 1000',
        'Cashback',
        'Pay your bill Dineout Pay and get 20% cashback'),
    Page3Scrole(
        Color.fromRGBO(134, 112, 201, 1),
        Color.fromRGBO(79, 47, 176, 1),
        10,
        'Save more than 1000',
        'Cashback',
        'Pay your bill Dineout Pay and get 10% cashback'),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        statusSet(
            statusBar: Colors.white, statusBarIconIsWhite: false);
        return true;
      },
      child: Scaffold(
          body: Stack(
            children: <Widget>[
              Hero(
                tag: 'hero3',
                child: Container(
                  height: doubleHeight(40),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(ims + back))),
                ),
              ),
              SizedBox.expand(
                child: DraggableScrollableSheet(
                  maxChildSize: 0.65,
                  initialChildSize: 0.65,
                  minChildSize: 0.644444444444,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero)),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        controller: scrollController,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              child: Center(
                                child: Container(
                                  width: 70,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromRGBO(216, 221, 229, 1)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10)
                                  .copyWith(top: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Material(
                                    elevation:3,
                                    borderRadius: BorderRadius.circular(100),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        width: doubleWidth(12),
                                        height: doubleWidth(12),
                                        padding: EdgeInsets.all(doubleWidth(1)),
                                        child: Image.asset(ims + image,
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: doubleWidth(3)),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Text(
                                        name,
                                        style: Theme.of(context).textTheme.headline6.copyWith(
                                        ),
                                      ),
                                      Text(
                                        desc,
                                        style: Theme.of(context).textTheme.caption.copyWith(
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Card(
                                    color: Colors.green,
                                    elevation: 0,
                                    shape: StadiumBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 7),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            star,
                                            style: TextStyle(height: 1,color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 2,
                              color: Color.fromRGBO(229, 229, 229, 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10)
                                  .copyWith(bottom: 5),
                              child: FlatButton(
                                padding: EdgeInsets.zero,
                                color: Color.fromRGBO(250, 229, 229, 1),
                                highlightColor: Colors.yellow,

//                          focusColor: Color.fromRGBO(250, 229, 229, 1),
//                          hoverColor: Color.fromRGBO(250, 229, 229, 1),
                                splashColor: Colors.yellow,
                                onPressed: () {},
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        RichText(
                                          text: TextSpan(
                                              style: TextStyle(height: 1,
                                                  color: Color.fromRGBO(210, 6, 6, 1),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900),
                                              children: [
                                                TextSpan(text: 'View Info '),
                                                TextSpan(
                                                    text: '(Menu,Address & more)',
                                                    style: TextStyle(height: 1,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w900)),

                                              ]),

                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color.fromRGBO(210, 6, 6, 1),
                                          size: 22,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20)
                                  .copyWith(bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Gourmet Passport',
                                      style: TextStyle(height: 1,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30)),
                                  Text(
                                      'Lorem Ipsum is simply dummy text of the printing.',
                                      style: TextStyle(height: 1,
                                          color: Color.fromRGBO(150, 150, 150, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15)),
                                  SizedBox(height: 10),
                                  Material(
                                    borderRadius: BorderRadius.circular(5),
                                    elevation: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(5),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(198, 132, 2, 1),
                                                Color.fromRGBO(232, 187, 36, 1)
                                              ])),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Row(
//                                    mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                    crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '1+1',
                                              style: TextStyle(height: 1,
                                                  color: Colors.white,
                                                  fontSize: 50,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Main course',
                                                  style: Theme.of(context).textTheme
                                                      .headline6.copyWith(
                                                      color: Colors.white
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'One coupon entitles you ti one \n' +
                                                      'complimentary main course... See More',
                                                  style: Theme.of(context).textTheme
                                                      .caption.copyWith(
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Material(
                                    borderRadius: BorderRadius.circular(5),
                                    elevation: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
//                                    color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(5),
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(198, 132, 2, 1),
                                                Color.fromRGBO(232, 187, 36, 1)
                                              ])),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        child: Row(
//                                    mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                    crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '1+1',
                                              style: TextStyle(height: 1,
                                                  color: Colors.white,
                                                  fontSize: 50,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Drinks',
                                                  style: Theme.of(context).textTheme
                                                      .headline6.copyWith(
                                                      color: Colors.white
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'One coupon entitles you ti one \n' +
                                                      'complimentary main course... See More',
                                                  style: Theme.of(context).textTheme
                                                      .caption.copyWith(
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Payment Offers',
                                        style: TextStyle(height: 1,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 27)
                                ),
                                    Text(
                                        'Lorem Ipsum is simply dummy text of the printing.',
                                        style: TextStyle(height: 1,
                                            color: Color.fromRGBO(150, 150, 150, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: doubleHeight(1),
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: doubleWidth(4)
                                ),
                                child: Row(
                                  children: List.generate(_page3Scrole.length, (index) =>
                                      Container(
                                        margin: EdgeInsets.only(right: 20),
                                        padding: EdgeInsets.only(bottom: doubleHeight(1)),
                                        child: Material(
                                          elevation: 3,
                                          child: Container(
                                            width: doubleWidth(80),
                                            color: Colors.white,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Container(
                                                  width: doubleWidth(25,width: doubleWidth(80)),
                                                  height: doubleHeight(11),
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          begin: Alignment.topCenter,
                                                          end: Alignment.bottomCenter,
                                                          colors: [
                                                            _page3Scrole[index].c1,
                                                            _page3Scrole[index].c2
                                                          ]),
                                                      borderRadius: BorderRadius.only(
                                                          topLeft:Radius.zero,
                                                          bottomRight: Radius.circular(100),
                                                          topRight: Radius.circular(100),
                                                          bottomLeft: Radius.zero
                                                      )),
                                                  child: Center(
                                                    child: RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: _page3Scrole[index]
                                                                .persent
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontSize: 40)),
                                                        TextSpan(
                                                            text: '%',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 15))
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(7),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          _page3Scrole[index].top,
                                                          style: TextStyle(height: 1,
                                                              color: Color.fromRGBO(
                                                                  8, 215, 103, 1),
                                                              fontSize: 16),
                                                        ),
                                                        SizedBox(height: 4,),
                                                        Text(
                                                          _page3Scrole[index].mid,
                                                          style: TextStyle(height: 1,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 20),
                                                        ),
                                                        SizedBox(height: 4,),
                                                        Text(
                                                          _page3Scrole[index].down,
                                                          style: TextStyle(height: 1,
                                                              color: Color.fromRGBO(
                                                                  150, 150, 150, 1),
                                                              fontSize: 15),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}