import 'package:flutter/material.dart';
import 'package:speedcode_flutter/functions.dart';
import '../Tabs/MainTab.dart';
import '../models.dart';

class SerachItemImage extends StatelessWidget {
  final state;
  final controller;
  final Food food;
  final Alignment alignmentBegin;
  final Alignment alignmentEnd;
  const SerachItemImage(this.state, this.controller, this.food,
      this.alignmentBegin, this.alignmentEnd);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.setSelectedFood(food);
        Go.replaceHero(context, MainTab());
      },
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(controller),
        child: AlignTransition(
          alignment: AlignmentTween(begin: alignmentBegin, end: alignmentEnd)
              .animate(controller),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: Offset(0, 20)),
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(5, 15)),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Container(
                height: doubleWidth(70,
                    width: doubleWidth(40, width: doubleWidth(80))),
                width: doubleWidth(70,
                    width: doubleWidth(40, width: doubleWidth(80))),
                child: Image.asset(
                  food.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchItemText extends StatelessWidget {
  final state;
  final controller;
  final Food food;
  final Alignment alignment;
  const SearchItemText(this.state, this.controller, this.food, this.alignment);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.setSelectedFood(food);
        Go.replaceHero(context, MainTab());
      },
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: controller, curve: Interval(0.8, 1))),
        child: Align(
          alignment: alignment,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: doubleWidth(80),
              height: doubleHeight(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: double.maxFinite,
                    width: doubleWidth(60, width: doubleWidth(80)),
                    padding: EdgeInsets.symmetric(vertical: doubleHeight(1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: doubleWidth(4.5)),
                        ),
                        SizedBox(height: doubleHeight(1)),
                        Text(
                          '${food.price}\$',
                          style: TextStyle(
                              color: Color.fromRGBO(168, 168, 170, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: doubleWidth(3.5)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
