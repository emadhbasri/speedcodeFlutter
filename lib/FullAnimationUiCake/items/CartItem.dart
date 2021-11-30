import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppState.dart';

import 'package:speedcode_flutter/functions.dart';

import '../data.dart';
import '../model.dart';


class CartItem extends StatelessWidget {
  final FoodCount foodCount;
  const CartItem({Key key, this.foodCount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of<AppState>(context, listen: false);
    return Container(
      width: double.maxFinite,
      height: doubleHeight(10),
      child: Row(
        children: [
          Expanded(flex:2,child:
          Padding(
            padding: EdgeInsets.all(doubleWidth(2)),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    foodCount.food.image
                    ,fit: BoxFit.fill,)),
            ),
          )),
          Expanded(child: Center(
            child: Text('x${foodCount.count}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: doubleWidth(4)
              ),
            ),
          )),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.only(left: doubleWidth(3),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(foodCount.food.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: doubleWidth(4)
                        ),
                      ),
                      GestureDetector(
                          onTap: (){
                            state.removeCartIndex(foodCount: foodCount);
                          },
                          child: Icon(Icons.close,color: Colors.white,size: 19)),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${foodCount.food.price}',
                        style: TextStyle(
                            color: Colors.pink[100],
                            fontWeight: FontWeight.bold,
                            fontSize: doubleWidth(3)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Card(
                            margin: EdgeInsets.zero,
                            elevation: 0,
                            color: Colors.pink[100],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: InkWell(
                              onTap: (){
                                state.addCountItem(foodCount: foodCount);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(doubleWidth(0.7)),
                                child: Icon(Icons.add,color: purple,size: 17,),
                              ),
                            ),
                          ),
                          SizedBox(width: doubleWidth(3)),
                          Card(
                            margin: EdgeInsets.zero,
                            elevation: 0,
                            color: Colors.white.withOpacity(0.4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: InkWell(
                              onTap: (){
                                state.lessCart(foodCount);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(doubleWidth(0.7)),
                                child: Icon(Icons.remove,color: Colors.white,size: 17,),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
