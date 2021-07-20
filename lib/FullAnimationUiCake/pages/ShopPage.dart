import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../AppState.dart';
import '../items/FoodItem.dart';
import 'package:speedcode_flutter/functions.dart';

import '../data.dart';
import '../model.dart';
class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    statusSet(statusBar: Colors.transparent);
    AppState state = Provider.of<AppState>(context, listen: false);
    selectedCategory = state.shop.categorysName.first;//todo
    super.initState();
  }

  String selectedCategory;

  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of<AppState>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        state.changePage(PageName.Shops);
        return false;
      },
      child: Material(
        // color: Colors.transparent,
        // backgroundColor: Colors.white,
        child: SizedBox.expand(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: doubleHeight(35),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(60, 30)),
                        image: DecorationImage(
                            image: AssetImage('assets/images/foodApp1/PageFirst1.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: doubleHeight(5)),
                    child: LimitedBox(
                      maxHeight: doubleHeight(7),
                      maxWidth: double.maxFinite,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.shop.categorysName.length,
                        itemBuilder: (context, index) {
                          String name = state.shop.categorysName[index];
                          if (selectedCategory == name)
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: doubleWidth(4),
                                  left: index == 0 ? doubleWidth(4) : 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    width: doubleWidth(2),
                                    height: doubleWidth(2),
                                  ),
                                  SizedBox(
                                    width: doubleWidth(2),
                                  ),
                                  Text(name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pink,
                                          fontSize: doubleWidth(4)))
                                ],
                              ),
                            );
                          else
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: doubleWidth(4),
                                  left: index == 0 ? doubleWidth(4) : 0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = name;
                                  });
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(name,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: doubleWidth(4))),
                                  ],
                                ),
                              ),
                            );
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: double.maxFinite,
                      child: Builder(
                        builder: (context) {
                          List<Food> myFood = foods.where((e) => e.category==selectedCategory).toList();
                          return ListView.separated(
                              padding: EdgeInsets.only(bottom: doubleHeight(3)),
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  GestureDetector(
                                      onTap: (){
                                        state.food=myFood[1];
                                        state.changePage(PageName.Food);
                                      },
                                      child: Container(child: FoodItem(myFood[index],))),
                              separatorBuilder: (context, index) => Divider(
                                color: Colors.grey,
                                indent: doubleWidth(5),
                                endIndent: doubleWidth(5),
                                height: doubleHeight(2.7),
                              ),
                              itemCount: myFood.length);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: doubleHeight(25),
                right: 0.0,
                child: TweenAnimationBuilder(
                  duration: Duration(seconds: 1),
                  tween: Tween<double>(begin: doubleWidth(5),end: doubleWidth(95)),

                  child:Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child:TweenAnimationBuilder(
                            duration: sec1,
                            tween: Tween<double>(begin: 0,end: 1),
                            builder: (context, value, child) =>
                            Opacity(
                              opacity: value,
                              child: child,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(state.shop.name + ' ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: doubleHeight(2.2))),
                                    Icon(
                                      !state.shop.like
                                          ? CupertinoIcons.suit_heart
                                          : CupertinoIcons.heart_solid,
                                      color: Colors.pink,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      color: Colors.orangeAccent,
                                    ),
                                    SizedBox(
                                      width: doubleWidth(1),
                                    ),
                                    Text(
                                      '${state.shop.star}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: doubleWidth(4)),
                                    ),
                                    Text(
                                      ' - ${state.shop.type} - \$\$ - ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontSize: doubleWidth(3.5)),
                                    ),
                                    Text(
                                      state.shop.time,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontSize: doubleWidth(3.5)),
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: doubleWidth(4),
                                          vertical: doubleHeight(0.6)),
                                      child: Text(
                                        'Free deliver',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: doubleWidth(4)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: doubleWidth(5),
                                    ),
                                    Text(
                                      '24 review\'s',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.grey,
                                          fontSize: doubleWidth(3.5)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      ),
                      Expanded(
                        child: TweenAnimationBuilder(
                          duration: sec1,
                          tween: Tween<double>(begin: 0,end: 1),
                          builder: (context, value, child) =>
                           Transform.scale(scale: value,child: child),
                          child: SizedBox(
                            height: doubleHeight(10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: doubleHeight(8),
                                width: doubleHeight(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[350],
                                          blurRadius: 20,
                                          spreadRadius: -3,
                                          offset: Offset(0, 5)),
                                      BoxShadow(
                                          color: Colors.grey[350],
                                          blurRadius: 20,
                                          spreadRadius: -3,
                                          offset: Offset(-5, 0)),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(state.shop.image),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  builder: (context, value, child) =>
                      Container(
                        height: doubleHeight(15),
                        width: value,
                        padding: EdgeInsets.only(
                          left: doubleWidth(10),
                          top: doubleHeight(1.5),
                          bottom: doubleHeight(1),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              topLeft: Radius.circular(50),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20,
                                  spreadRadius: -3,
                                  offset: Offset(0, 10)),
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20,
                                  spreadRadius: -3,
                                  offset: Offset(-10, 0)),
                            ]),
                        child: child,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
