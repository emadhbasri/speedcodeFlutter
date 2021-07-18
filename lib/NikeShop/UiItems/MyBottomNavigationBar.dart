import 'package:flutter/material.dart';
class MyBottomNavigationBar extends StatelessWidget {
  final bool isVisible;
  const MyBottomNavigationBar(this.isVisible);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isVisible?Alignment(-1, 1):Alignment(-1, 1.3),
      child: Hero(
        tag: 'BottomNavigationBar',
        child: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              activeIcon: Icon(Icons.home, color: Colors.black),
              icon: Icon(Icons.home, color: Colors.grey),label: '',
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.search, color: Colors.black),
                icon: Icon(Icons.search, color: Colors.grey),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite_border, color: Colors.black),
                icon: Icon(Icons.favorite_border, color: Colors.grey),
                label: ''),
            BottomNavigationBarItem(
                activeIcon:
                Icon(Icons.shopping_basket_outlined, color: Colors.black),
                icon: Icon(Icons.shopping_basket_outlined, color: Colors.grey),
                label: ''),
            BottomNavigationBarItem(
                activeIcon:
                Icon(Icons.account_circle_sharp, color: Colors.black),
                icon: Icon(Icons.account_circle_sharp, color: Colors.grey),
                label: ''),
          ],
        ),
      ),
    );
  }
}
