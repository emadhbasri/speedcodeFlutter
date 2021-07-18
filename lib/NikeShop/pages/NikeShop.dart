import 'package:flutter/material.dart';
import 'package:speedcode_flutter/NikeShop/pages/ProductPage.dart';
import 'package:speedcode_flutter/functions.dart';

import '../data.dart';
import '../model.dart';
import '../UiItems/MyBottomNavigationBar.dart';

class NikeShop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(
              child: Column(
                children: [
                  Container(
                    width: doubleWidth(20),
                    height: doubleHeight(7),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/NikeShop/nike.png')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(padding: EdgeInsets.only(bottom: doubleHeight(7)),
                        itemCount: products.length,
                        itemBuilder: (context, index) =>
                            productItems(products[index],context),
                        physics: BouncingScrollPhysics(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            MyBottomNavigationBar(true),
          ],
        ),
      ),
    );
  }

  productItems(ProductShoes productShoes,context) {
    return GestureDetector(
      onTap: () {
        var first = Curves.linear;
        var second = Curves.linear;
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 800),
                reverseTransitionDuration: Duration(milliseconds: 500),
                fullscreenDialog: false,
                pageBuilder: (context, Animation<double> animation,
                    Animation<double> secendAnimation) {
                  return ProductPage(
                    animationValue: animation,
                    shoe: productShoes,
                  );
                },
                transitionsBuilder: (context, Animation<double> animation,
                    Animation<double> secendAnimation, Widget widget) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(
                        CurvedAnimation(
                            curve: Interval(
                                0.5, 0.7,
                                curve: first), //Curves.easeOutBack
                            parent: animation,
                            reverseCurve: Interval(
                                0.5, 0.7,
                                curve: second))),
                    child: widget,
                  );
                })).catchError((e) => print('Error 1 $e'));
      },
      child: Hero(
        tag: 'Container${productShoes.id}',
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: doubleHeight(50),
            margin: EdgeInsets.fromLTRB(doubleWidth(3), doubleWidth(3), doubleWidth(3), 0),
            padding: EdgeInsets.all(doubleWidth(5)),
            decoration: BoxDecoration(
                color: productShoes.color,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: double.maxFinite,
                            child: Text(
                              productShoes.numberBack.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1,
                                  color: Colors.black.withOpacity(0.03),
                                  fontWeight: FontWeight.bold,
                                  fontSize: doubleWidth(40)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              width: doubleHeight(80, height: doubleHeight(80, height: doubleHeight(40))),
                              height: doubleHeight(80, height: doubleHeight(80, height: doubleHeight(40))),
                              child: Image.asset(productShoes.images.first)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: doubleHeight(2)),
                Text(
                  productShoes.name,
                  style: TextStyle(color: Color.fromRGBO(168, 168, 170, 1), fontSize: doubleWidth(4)),
                ),
                SizedBox(height: doubleHeight(1.5)),
                Text(
                  '\$${productShoes.price}',
                  style: TextStyle(
                      color: Colors.pink,
                      decoration: TextDecoration.lineThrough,
                      fontSize: doubleWidth(4)),
                ),
                Container(
                  width: double.maxFinite,
                  height: doubleHeight(15, height: doubleHeight(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.black45,
                        size: doubleWidth(7),
                      ),
                      Text(
                        '\$${productShoes.priceNow}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: doubleWidth(7)),
                      ),
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black45,
                        size: doubleWidth(7),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
