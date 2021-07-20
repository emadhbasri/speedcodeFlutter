import 'package:flutter/material.dart';

import 'model.dart';

Color purple = Colors.purple[800];
const Duration sec1 = Duration(seconds: 1);
const Duration mil900 = Duration(milliseconds: 900);
const Duration mil800 = Duration(milliseconds: 800);
const Duration mil700 = Duration(milliseconds: 700);
const Duration mil600 = Duration(milliseconds: 600);
const Duration mil500 = Duration(milliseconds: 500);
const Duration mil400 = Duration(milliseconds: 400);
const Duration mil300 = Duration(milliseconds: 300);
const Duration mil200 = Duration(milliseconds: 200);
const Duration mil100 = Duration(milliseconds: 100);
const Cubic sbs= Cubic(0.21,0.49,0.6,1.68);
const Cubic sbs1= Cubic(0.21,0.49,0.59,1.37);


List<Shop> allShops = [
  Shop(1,'assets/images/NikeShop/nike.png', 'Brindle Room',
      CategoryType.Desert,'fast-food', '15-20 min', '2.5 km', false, 4.2),
  Shop(2,'assets/images/NikeShop/nike.png', 'Cupcake Delivery',
      CategoryType.Desert,'fast-food', '15-20 min', '2.5 km', false, 3.8),
  Shop(3,'assets/images/NikeShop/nike.png', 'New York Count Co.',
      CategoryType.Desert,'fast-food', '15-20 min', '2.5 km', false, 4.0),
  Shop(4,'assets/images/NikeShop/nike.png', 'Brindle Room',
      CategoryType.Pizza,'fast-food', '15-20 min', '2.5 km', false, 4.2),
  Shop(5,'assets/images/NikeShop/nike.png', 'Cupcake Delivery',
      CategoryType.Pizza,'fast-food', '15-20 min', '2.5 km', false, 3.8),
  Shop(6,'assets/images/NikeShop/nike.png', 'New York Count Co.',
      CategoryType.Pizza,'fast-food', '15-20 min', '2.5 km', false, 4.0),
  Shop(7,'assets/images/NikeShop/nike.png', 'Brindle Room',
      CategoryType.Burgers,'fast-food', '15-20 min', '2.5 km', false, 4.2),
  Shop(8,'assets/images/NikeShop/nike.png', 'Cupcake Delivery',
      CategoryType.Burgers,'fast-food', '15-20 min', '2.5 km', false, 3.8),
  Shop(9,'assets/images/NikeShop/nike.png', 'New York Count Co.',
      CategoryType.Burgers,'fast-food', '15-20 min', '2.5 km', false, 4.0)
];
List<Food> foods = [
  Food(id: 0,image: 'assets/images/NikeShop/nike.png',
    name: 'Honey Milk Donut',category: 'Most popular',price: 9.75,
    resepi: 'blueberry + sugar + flawour + some ingridients...',

  ),
  Food(id: 1,image: 'assets/images/NikeShop/nike.png',
      name: 'Raspberry Donut',category: 'Most popular',price: 12.95,
      resepi: 'blueberry + sugar + flawour + some ingridients...',
      desc: 'Naturally & Artificially Flavored\n'
          'Does not contain real Raspberry',
      desc1: 'Sed ut perspiciatis unde omnis iste natus error sit\n'
          'valuptatem accusantium doloremque laudantium',
      calories: '567 ccal',
      peope: 1,
      weight: '400g'

  ),
  Food(id: 2,image: 'assets/images/NikeShop/nike.png',
      name: 'Blueberry Donut',category: 'Most popular',price: 5.3,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 3,image: 'assets/images/NikeShop/nike.png',
      name: 'Sugared Donut',category: 'Most popular',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 3,image: 'assets/images/NikeShop/nike.png',
      name: 'Sugared Donut',category: 'Most popular',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),

  Food(id: 0,image: 'assets/images/NikeShop/nike.png',
      name: 'Honey Milk Donut',category: 'Burgers',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 1,image: 'assets/images/NikeShop/nike.png',
      name: 'Raspberry Donut',category: 'Burgers',price: 12.95,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 2,image: 'assets/images/NikeShop/nike.png',
      name: 'Blueberry Donut',category: 'Burgers',price: 5.3,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 3,image: 'assets/images/NikeShop/nike.png',
      name: 'Sugared Donut',category: 'Burgers',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 3,image: 'assets/images/NikeShop/nike.png',
      name: 'Sugared Donut',category: 'Burgers',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),

  Food(id: 0,image: 'assets/images/NikeShop/nike.png',
      name: 'Honey Milk Donut',category: 'Sandwiches',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 1,image: 'assets/images/NikeShop/nike.png',
      name: 'Raspberry Donut',category: 'Sandwiches',price: 12.95,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 2,image: 'assets/images/NikeShop/nike.png',
      name: 'Blueberry Donut',category: 'Sandwiches',price: 5.3,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 3,image: 'assets/images/NikeShop/nike.png',
      name: 'Sugared Donut',category: 'Sandwiches',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 3,image: 'assets/images/NikeShop/nike.png',
      name: 'Sugared Donut',category: 'Sandwiches',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),

  Food(id: 0,image: 'assets/images/NikeShop/nike.png',
      name: 'Honey Milk Donut',category: 'Salads',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 1,image: 'assets/images/NikeShop/nike.png',
      name: 'Raspberry Donut',category: 'Salads',price: 12.95,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 2,image: 'assets/images/NikeShop/nike.png',
      name: 'Blueberry Donut',category: 'Salads',price: 5.3,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 3,image: 'assets/images/NikeShop/nike.png',
      name: 'Sugared Donut',category: 'Salads',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
  Food(id: 3,image: 'assets/images/NikeShop/nike.png',
      name: 'Sugared Donut',category: 'Salads',price: 9.75,
      resepi: 'blueberry + sugar + flawour + some ingridients...'),
];