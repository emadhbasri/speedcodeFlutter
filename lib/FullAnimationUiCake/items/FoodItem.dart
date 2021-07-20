import 'package:flutter/material.dart';

import 'package:speedcode_flutter/functions.dart';

import '../model.dart';


class FoodItem extends StatelessWidget {
  final Food food;
  const FoodItem(this.food);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: doubleWidth(5)),
      width: double.maxFinite,
      height: doubleHeight(8),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Container(
                    width: doubleHeight(5),
                    height: doubleHeight(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/images/foodApp1/PageFirst1.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(width: doubleWidth(3),),
                  Container(
                    width: doubleWidth(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(food.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize:doubleWidth(3.5)
                            )),
                        Text(food.resepi,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize:doubleWidth(3)
                            )),
                      ],
                    ),
                  )
                ],
              )),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('\$${food.price}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize:doubleWidth(4)
                      )),
                  Text('Add to cart',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize:doubleWidth(3.5)
                      ))
                ],
              )),
        ],
      ),
    );
  }
}
