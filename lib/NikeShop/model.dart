import 'package:flutter/material.dart';
class ProductShoes {
  final int id;
  final String name;
  final int price;
  final int priceNow;
  final List<String> images;
  final int numberBack;
  final List<double> sizes;
  final String desc;
  final Color color;
  ProductShoes(this.id, this.name, this.price, this.priceNow, this.images,
      this.numberBack, this.sizes, this.desc, this.color);
}
