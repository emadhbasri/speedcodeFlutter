import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;
  Category(this.name, this.image);
}
class FoodCount{
  int count;
  Food food;
  FoodCount(this.count,this.food);
}

class Food{
  final int id;
  final String image;
  final String name;
  final String desc;
  final String desc1;
  final String resepi;
  final double price;
  final String category;
  final String weight;
  final String calories;
  bool like=false;
  final int peope;
  Food({this.id,this.image, this.name,this.category, this.desc,
    this.price,
    this.desc1, this.resepi, this.weight, this.calories, this.peope, });
}
class Shop{
  final int id;
  final String image;
  final String name;
  final CategoryType category;
  final String type;
  final String time;
  final String meter;
  final List<String> categorysName =[
    'Most popular',
    'Burgers',
    'Sandwiches',
    'Salads',
    'Others',
  ];
  bool like;
  final double star;
  Shop(this.id,this.image, this.name,this.category, this.type, this.time, this.meter, this.like, this.star, );
}

enum CategoryType{
  All,
  Burgers,
  Pizza,
  Desert
}

enum Tabs{
  home,
  search,
  note,
  profile
}

enum PageName{
  Shops,
  Shop,
  Food,
  Cart,
  fifth
}

