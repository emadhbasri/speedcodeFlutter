import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppState.dart';
import 'package:speedcode_flutter/functions.dart';

import '../data.dart';
import '../model.dart';

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of<AppState>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        state.changePage(PageName.Shop);
        return false;
      },
      child: Material(
          child: SizedBox.expand(
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(top: doubleHeight(15)),
                child: Container(
              width: double.maxFinite,
              height: doubleHeight(37), //35
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                          child: Container(
                            height: doubleHeight(33),
                            child: Image.asset(state.food.image,),
                          ))),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          props('Weight', state.food.weight),
                          props('Calories', state.food.calories),
                          props('Peope', '${state.food.peope} person'),
                        ],
                      ))
                ],
              ),
            )),
            Positioned(
              left: doubleWidth(5),
              top: doubleHeight(56),
              child: Padding(
                padding: EdgeInsets.only(right: doubleWidth(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.food.name,
                        style: TextStyle(
                            fontSize: doubleWidth(5),
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: doubleHeight(1)),
                    Text('\$${state.food.price}',
                        style: TextStyle(
                            fontSize: doubleWidth(5),
                            color: Colors.pinkAccent[100])),
                    SizedBox(height: doubleHeight(1.5)),
                    Text(state.food.desc,
                        style: TextStyle(
                            fontSize: doubleWidth(3.5),
                            color: Colors.black)),
                    SizedBox(height: doubleHeight(1.5)),
                    Text(state.food.desc1,
                        style: TextStyle(
                            fontSize: doubleWidth(3.2),
                            color: Colors.black)),

                  ],
                ),
              ),
            ),

            TweenAnimationBuilder(
                tween: Tween<double>(begin: state.begin,end: state.end),
                duration: mil500,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: doubleWidth(5)),
                  child: Container(
                    width: doubleWidth(90),
                    height: doubleHeight(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.all(doubleWidth(2)),
                              child:
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[400],
                                          blurRadius: 20,
                                          spreadRadius: -3,
                                          offset: Offset(0, 0)),
                                    ]
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    elevation: 0,
                                    child: InkWell(
                                      onTap: (){
                                        state.likeFood(state.food.id, !state.food.like);
                                      },
                                      child: Center(
                                        child: Icon(
                                          !state.food.like
                                              ? CupertinoIcons.suit_heart
                                              : CupertinoIcons.heart_solid,
                                          color: Colors.pink,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        Expanded(flex:3,
                            child: Container(
                              child: Container(
                                padding: EdgeInsets.all(doubleWidth(2)),
                                child:
                                Container(
                                  decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey[400],
                                            blurRadius: 20,
                                            spreadRadius: -3,
                                            offset: Offset(0, 0)),
                                      ]
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Card(
                                      color: Colors.pinkAccent,
                                      margin: EdgeInsets.zero,
                                      elevation: 0,
                                      child: InkWell(
                                        splashColor: Colors.pink,
                                        onTap: (){
                                          print('asdasd ${state.cart.length}');
                                          state.addCart(state.food);
                                          state.changePage(PageName.Cart);
                                        },
                                        child: Center(
                                          child: Text('ADD TO CART',
                                              style: TextStyle(
                                                  fontSize: doubleWidth(4),
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                builder: (context, value, child) => Positioned(
      left: 0,
      bottom: value,
                  child: child,
      ))
          ],
        ),
      )),
    );
  }

  Column props(String key, String val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(key,
            style: TextStyle(
              color: Colors.black,
            )),
        SizedBox(height: doubleHeight(1)),
        Text(val,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
      ],
    );
  }
}
