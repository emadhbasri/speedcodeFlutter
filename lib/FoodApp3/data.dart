import 'package:flutter/material.dart';

import 'models.dart';

List<Color> defaultColor = [
  Color.fromRGBO(72, 140, 159, 1),
  Color.fromRGBO(170, 206, 217, 1),
  Color.fromRGBO(170, 206, 217, 1),
  Color.fromRGBO(211, 230, 235, 1)
];

final List<FoodInfoOffer> page3Scrole = [
  FoodInfoOffer(
      Color.fromRGBO(68, 138, 202, 1),
      Color.fromRGBO(42, 102, 176, 1),
      20,
      'Save more than 1\$',
      'Cashback',
      'Pay your bill to us Pay and get 10% cashback'),
  FoodInfoOffer(
      Color.fromRGBO(134, 112, 201, 1),
      Color.fromRGBO(79, 47, 176, 1),
      10,
      'Save more than 1\$',
      'Cashback',
      'Pay your bill to us Pay and get 10% cashback'),
];

List<Food> foods = [
  Food(
      'Restaurant Food',
      'Food',
      'desc desc desc desc desc desc desc desc desc desc ',
      'assets/images/foodApp3/food1.jpg',
      35,
      150,
      defaultColor),
  Food(
      'Restaurant Food',
      'Food',
      'desc desc desc desc desc desc desc desc desc desc ',
      'assets/images/foodApp3/food2.jpg',
      35,
      150,
      defaultColor),
  Food(
      'Restaurant Food',
      'Food',
      'desc desc desc desc desc desc desc desc desc desc ',
      'assets/images/foodApp3/food3.jpg',
      35,
      150,
      defaultColor),
  Food(
      'Restaurant Food',
      'Food',
      'desc desc desc desc desc desc desc desc desc desc ',
      'assets/images/foodApp3/food4.jpg',
      35,
      150,
      defaultColor),
];
