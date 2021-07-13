import 'package:flutter/material.dart';

class HotDetails {
  final String image;
  final String name;
  final String time;
  HotDetails(this.image, this.name, this.time);
}

class SlideDetails {
  final String back;
  final String image;
  final String name;
  final String desc;
  final String star;
  SlideDetails(this.back, this.image, this.name, this.desc, this.star);
}



class Page3Scrole {
  final Color c1;
  final Color c2;
  final int persent;
  final String top;
  final String mid;
  final String down;
  Page3Scrole(this.c1, this.c2, this.persent, this.top, this.mid, this.down);
}

const String ims = 'assets/images/';