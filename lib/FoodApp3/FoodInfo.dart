import 'package:flutter/material.dart';
import 'package:speedcode_flutter/functions.dart';
import 'data.dart';
import 'models.dart';

class FoodInfo extends StatelessWidget {
  final Food food;
  const FoodInfo(this.food);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        await statusSet(
            statusBar: Colors.white,
            statusBarIconIsWhite: false,
            navigationBar: Colors.white,
            navigationBarLineIsWhite: false);
        return true;
      },
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            width: doubleWidth(100),
            height: doubleHeight(40),
            child: Image.asset(
              food.image,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: doubleHeight(65),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero)),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: doubleHeight(1.2)),
                    child: Center(
                      child: Container(
                        width: doubleWidth(20),
                        height: doubleHeight(0.7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(216, 221, 229, 1)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                            horizontal: doubleWidth(10), vertical: 10)
                        .copyWith(top: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'assets/images/foodApp3/brand.png',
                            fit: BoxFit.fill,
                          ),
                          padding: EdgeInsets.all(doubleWidth(2)),
                          width: doubleWidth(13),
                          height: doubleWidth(13),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              food.name,
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              food.shortname,
                              style: TextStyle(
                                  height: 1,
                                  fontSize: 15,
                                  color: Color.fromRGBO(150, 150, 150, 1)),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(100)),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 7),
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
                                food.star.toString(),
                                style: TextStyle(height: 1, color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(229, 229, 229, 1),
                    thickness: 2,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                            .copyWith(bottom: 5),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(250, 229, 229, 1)),
                      ),
                      onPressed: () {},
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        height: 1,
                                        color: Color.fromRGBO(210, 6, 6, 1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                    children: [
                                      TextSpan(text: ' View Info '),
                                      TextSpan(
                                          text: 'Address & More',
                                          style: TextStyle(
                                              height: 1,
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
                        Text('Suggestions',
                            style: TextStyle(
                                height: 1,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30)),
                        Text('Lorem Ipsum is simply dummy text of printing',
                            style: TextStyle(
                                height: 1.3,
                                color: Color.fromRGBO(150, 150, 150, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 15)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
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
                                    style: TextStyle(
                                        height: 1,
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Main course',
                                        style: TextStyle(
                                            height: 1,
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'One coupon entitles you  \n' +
                                            'complimentary main course',
                                        style: TextStyle(
                                            height: 1,
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
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
                                    style: TextStyle(
                                        height: 1,
                                        color: Colors.white,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Drinks',
                                        style: TextStyle(
                                            height: 1,
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'One coupon entitles you  \n' +
                                            'complimentary drinks',
                                        style: TextStyle(
                                            height: 1,
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Payment Offers',
                              style: TextStyle(
                                  height: 1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27)),
                          Text('Lorem Ipsum is simply dummy text of printing',
                              style: TextStyle(
                                  height: 1,
                                  color: Color.fromRGBO(150, 150, 150, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: doubleHeight(11),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: page3Scrole.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: doubleWidth(4),
                              right: index == page3Scrole.length - 1
                                  ? doubleWidth(4)
                                  : 0),
                          child: Container(
                            child: Card(
                              elevation: 1,
                              child: Container(
                                width: doubleWidth(70),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Container(
                                      height: double.maxFinite,
                                      width:
                                          doubleWidth(25, width: doubleWidth(70)),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                page3Scrole[index].c1,
                                                page3Scrole[index].c2
                                              ]),
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(100),
                                              topRight: Radius.circular(100))),
                                      child: Center(
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: page3Scrole[index]
                                                    .persent
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
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
                                        padding: const EdgeInsets.all(7)
                                            .copyWith(right: 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              page3Scrole[index].top,
                                              style: TextStyle(
                                                  height: 1,
                                                  color: Color.fromRGBO(
                                                      8, 215, 103, 1),
                                                  fontSize: doubleHeight(1.9)),
                                            ),
                                            Text(
                                              page3Scrole[index].mid,
                                              style: TextStyle(
                                                  height: 1,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: doubleHeight(2.1)),
                                            ),
                                            Text(
                                              page3Scrole[index].down,
                                              style: TextStyle(
                                                  height: 1,
                                                  color: Color.fromRGBO(
                                                      150, 150, 150, 1),
                                                  fontSize: doubleHeight(1.6)),
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
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
