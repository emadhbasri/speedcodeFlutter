import 'dart:ui';

import 'package:flutter/material.dart';
import '../../functions.dart';
import 'dataTypes.dart';
import 'Page2.dart';


class FoodApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                      image: AssetImage('assets/images/foodApp2/intro.jpg'),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Hola!\n'
                    'Emad HB',
                    style: TextStyle(height: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 50),
                  ),
                  SizedBox(height: doubleHeight(3),),
                  Text(
                    'Best restaurants, offering\n'
                    'discounts on food & drinks.',
                    style: TextStyle(height: 1,
                        color: Colors.white,
//                      fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(height: doubleHeight(2),),
                  RawMaterialButton(
                    onPressed: () {
                      Go.pushSlideRightAnim(context, Page2());
                      statusSet(
                          statusBar: Colors.white, statusBarIconIsWhite: false);
                    },
                    fillColor: Color.fromRGBO(228, 40, 61, 1),
//                    fillColor: Colors.deepOrange,
                    splashColor: Colors.deepOrange,
                    shape: StadiumBorder(),
                    elevation: 0,
                    child: Padding(
                      padding:
                      EdgeInsets.only(right: 10, top: 10, bottom: 10, left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Let\' Go',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            width: 0,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}



