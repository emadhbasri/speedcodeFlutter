import 'package:flutter/material.dart';

import 'data.dart';

class Category {
  final String name;
  final String image;
  Category(this.name, this.image);
}

class FoodCount {
  int count;
  Food food;
  FoodCount(this.count, this.food);
}

class Food {
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
  bool like = false;
  final int peope;
  Food({
    this.id,
    this.image,
    this.name,
    this.category,
    this.desc,
    this.price,
    this.desc1,
    this.resepi,
    this.weight,
    this.calories,
    this.peope,
  });
}

class Shop {
  int id;
  String image;
  String name;
  CategoryType category;
  String type;
  String time;
  String meter;
  List<String> categorysName = [
    'Most popular',
    'Donuts',
    'Ice Creams',
    'Cakes',
    'Drinks',
  ];
  bool like;
  double star;
  Shop(
    this.id,
    this.image,
    this.name,
    this.category,
    this.type,
    this.time,
    this.meter,
    this.like,
    this.star,
  );
}

enum CategoryType { All, Burgers, Pizza, Desert }

enum Tabs { home, search, note, profile }

enum PageName { Shops, Shop, Food, Cart, fifth }