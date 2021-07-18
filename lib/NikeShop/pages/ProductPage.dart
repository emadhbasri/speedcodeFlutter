
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedcode_flutter/NikeShop/UiItems/MyBottomNavigationBar.dart';

import '../../functions.dart';
import '../model.dart';
import 'TheBottomSheet.dart';

// ProductPage
class ProductPage extends StatefulWidget {
  final ProductShoes shoe;
  final Animation<double> animationValue;
  const ProductPage({Key key, this.animationValue, this.shoe})
      : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
        value: 0,
        reverseDuration:
        Duration(milliseconds: 200));
    Future.delayed(Duration(milliseconds: 500))
        .then((value) => _controller.forward());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double data = 0;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.linear);
        _controller.reverse();
        Go.pop(context,false);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              NotificationListener(
                onNotification: (Notification notif) {
                  if (notif is ScrollUpdateNotification) {

                    double data1 = notif.metrics.pixels;
                    if (data < data1) {
                      _controller.reverse();
                      print('down');
                    } else if (data > data1) {
                      _controller.forward();
                      print('up');
                    }
                    data = data1;
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: doubleHeight(7)),
                      productItems(widget.shoe),
                      AlignTransition(
                        alignment: AlignmentTween(
                            begin: Alignment(5, 0), end: Alignment(0, 0))
                            .animate(CurvedAnimation(
                            curve: Interval(0.6, 1,
                                curve: Cubic(0.175, 0.885, 0.32, 1.1)),
                            reverseCurve: Curves.linear,
                            parent: widget.animationValue)),
                        // alignment: Alignment(5,0),//Alignment(4,0),
                        child: Container(
                          width: doubleWidth(90),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: doubleWidth(55),
                                    child: Builder(
                                      builder: (context) {
                                        List ll = widget.shoe.name.split(',');
                                        return Text(
                                          '${ll[0]}\n,${ll[1]}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: doubleWidth(8)),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: doubleWidth(35),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$${widget.shoe.price}',
                                          style: TextStyle(
                                              color: Colors.pink,
                                              decoration:
                                              TextDecoration.lineThrough,
                                              fontSize: doubleWidth(4)),
                                        ),
                                        Text(
                                          '\$${widget.shoe.priceNow} ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: doubleWidth(7)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: doubleHeight(3)),
                                  width: double.maxFinite,
                                  child: Text(
                                    'AVAILABLE SIZES',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                margin: EdgeInsets.only(top: doubleHeight(3)),
                                child: Wrap(
                                  spacing: doubleWidth(10),
                                  runSpacing: doubleHeight(1),
                                  children: widget.shoe.sizes
                                      .map((e) => Container(
                                    child: Builder(
                                      builder: (context) {
                                        String out = e.toString();
                                        if (e
                                            .toString()
                                            .contains('.0')) {
                                          out = e.round().toString();
                                        }

                                        return Text(
                                          'US$out',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: doubleWidth(4)),
                                        );
                                      },
                                    ),
                                  ))
                                      .toList(),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: doubleHeight(3)),
                                  width: double.maxFinite,
                                  child: Text(
                                    'DESCRIPTION',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: doubleHeight(3)),
                                  width: double.maxFinite,
                                  child: Text(
                                    widget.shoe.desc,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: doubleHeight(3)),
                                  width: double.maxFinite,
                                  child: Text(
                                    'DESCRIPTION',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: doubleHeight(3)),
                                  width: double.maxFinite,
                                  child: Text(
                                    widget.shoe.desc,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: doubleHeight(3)),
                                  width: double.maxFinite,
                                  child: Text(
                                    'DESCRIPTION',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: doubleHeight(3)),
                                  width: double.maxFinite,
                                  child: Text(
                                    widget.shoe.desc,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: doubleHeight(7),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () async {
                        await _pageController.animateToPage(0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                        Go.pop(context,false);
                      },
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Colors.black,
                        size: doubleWidth(7),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: doubleWidth(20),
                          height: doubleHeight(7),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/images/NikeShop/nike.png',
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox()
                  ],
                ),
              ),
              AlignTransition(
                alignment: AlignmentTween(
                    begin: Alignment(0.92, 1.5), end: Alignment(0.92, 0.95))
                    .animate(CurvedAnimation(
                    curve: Cubic(.94, 0, .57, 1.76),
                    reverseCurve: Curves.linear,
                    parent: _controller)),
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          useRootNavigator: true,
                          context: context,
                          // barrierColor: Colors.black.withOpacity(0.8),
                          backgroundColor: Colors.transparent,
                          builder: (context){
                            return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                child: TheBottomSheet(shoe: widget.shoe,));
                          }
                      );
                    },
                    style: ButtonStyle(
                        padding:
                        MaterialStateProperty.all(EdgeInsets.all(doubleWidth(4))),
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(CircleBorder())),
                    child: Hero(
                      tag:'shopping_basket_outlined',
                      child: Icon(
                        Icons.shopping_basket_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              AlignTransition(
                alignment: AlignmentTween(
                    begin: Alignment(-0.92, 1.5),
                    end: Alignment(-0.92, 0.95))
                    .animate(CurvedAnimation(
                    curve: Cubic(.94, 0, .57, 1.76),
                    reverseCurve: Curves.linear,
                    parent: _controller)),
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding:
                        MaterialStateProperty.all(EdgeInsets.all(doubleWidth(4))),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(CircleBorder())),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
              MyBottomNavigationBar(false)
            ],
          ),
        ),
      ),
    );
  }

  productItems(ProductShoes shoe) {
    print('Hero Container${widget.shoe.id}');
    return Hero(
      tag: 'Container${widget.shoe.id}',
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.maxFinite,
          height: doubleHeight(50),
          padding: EdgeInsets.symmetric(vertical: doubleHeight(2)),
          decoration: BoxDecoration(
              color: widget.shoe.color,
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
                            widget.shoe.numberBack.toString(),
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
                        alignment: Alignment.center,
                        child: Container(
                          width: double.maxFinite,
                          height: doubleHeight(80, height: doubleHeight(80, height: doubleHeight(40))),
                          child: PageView.builder(
                            physics: BouncingScrollPhysics(),
                            onPageChanged: (index) =>
                                setState(() => currentIndex = index),
                            itemCount: widget.shoe.images.length,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Image.asset(widget.shoe.images.first);
                              } else {
                                return Image.asset(widget.shoe.images[index]);
                              }
                            },
                            scrollDirection: Axis.horizontal,
                            controller: _pageController,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.only(bottom: doubleHeight(3)),
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: widget.shoe.images
                                .map((e) =>
                                    dotBuilder(widget.shoe.images.indexOf(e)))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dotBuilder(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: currentIndex == index ? doubleWidth(1.5) : doubleWidth(1),
      height: currentIndex == index ? doubleWidth(1.5) : doubleWidth(1),
      margin: EdgeInsets.only(left: doubleWidth(2)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: currentIndex == index ? Colors.black : Color.fromRGBO(230, 230, 230, 1)),
    );
  }
}
