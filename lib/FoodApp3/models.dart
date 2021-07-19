import 'package:flutter/material.dart';

enum FoodPageType { main, slide, search }

class Food {
  final String name;
  final String shortname;
  final String desc;
  final String image;
  final int price;
  final int cl;
  final double star = 4.8;
  final List<Color> colors;
  Food(this.name, this.shortname, this.desc, this.image, this.price, this.cl,
      this.colors);
}

class FoodInfoOffer {
  final Color c1;
  final Color c2;
  final int persent;
  final String top;
  final String mid;
  final String down;
  FoodInfoOffer(this.c1, this.c2, this.persent, this.top, this.mid, this.down);
}
