import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcode_flutter/functions.dart';
import '../Items/mainPageFood.dart';
import '../Items/TabBar.dart';
import '../Items/TheFood.dart';
import '../RestaurantHero.dart';
import '../RestaurantHeroState.dart';
import '../models.dart';
import 'FirstHeader.dart';

class MainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RestaurantHeroProvider(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              Go.replaceHero(context, RestaurantHero());
              return false;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Consumer<RestaurantHeroState>(
                  builder: (context, state, child) {
                return SizedBox.expand(
                  child: Stack(
                    children: [
                      FirstHeader(false),
                      TabBarItem(
                        FoodPageType.main,
                        show: true,
                        state: state,
                      ),
                      MainPageFoodLeft(show: false),
                      MainPageFoodRight(show: false),
                      TheFood(FoodPageType.main, state)
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
