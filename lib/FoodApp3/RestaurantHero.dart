import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcode_flutter/functions.dart';
import 'Items/TheFood.dart';
import 'Items/mainPageFood.dart';
import 'Items/TabBar.dart';
import 'RestaurantHeroState.dart';
import 'Tabs/FirstHeader.dart';
import 'models.dart';

class RestaurantHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RestaurantHeroProvider(
      child: WillPopScope(
        onWillPop: () async {
          doDefaultStatusBar();
          return true;
        },
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Consumer<RestaurantHeroState>(
                  builder: (context, state, child) {
                return SizedBox.expand(
                  child: Stack(
                    children: [
                      TabBarItem(
                        FoodPageType.main,
                        show: false,
                        state: state,
                      ),
                      FirstHeader(true),
                      MainPageFoodLeft(show: true),
                      MainPageFoodRight(show: true),
                      TheFood(FoodPageType.slide, state)
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
