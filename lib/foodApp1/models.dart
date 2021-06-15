class SlideData {
  bool like;
  final String image;
  final String name;
  final String desc;
  final double star;
  int count;
  final String time;
  final String price;

  SlideData({
    this.like = false,
    this.image,
    this.name = 'Nickel & Dinner1',
    this.desc = 'American (Traditional), Breakfast1',
    this.star = 3.9,
    this.count = 384,
    this.time = '10-20 min',
    this.price = '50,20',
  });
}

class SliderBottomData {
  final String image;
  final String name;
  final String desc;
  final double star;
  final int count;
  final String time;
  final String price;

  SliderBottomData({
    this.image,
    this.name,
    this.desc,
    this.star = 4.9,
    this.count = 284,
    this.time = '15-25 min',
    this.price = '\$20',
  });
}

class CategoryData {
  final String icon;
  final String name;
  CategoryData(this.icon, this.name);
}
