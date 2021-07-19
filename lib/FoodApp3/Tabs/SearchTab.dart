import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcode_flutter/functions.dart';
import '../Items/SearchPage.dart';
import '../Items/TabBar.dart';
import '../Items/TheFood.dart';
import '../Items/mainPageFood.dart';
import '../RestaurantHero.dart';
import '../RestaurantHeroState.dart';
import '../models.dart';
import 'FirstHeader.dart';
import 'MainTab.dart';

class SearchTab extends StatefulWidget {
  final List<Food> foods;
  const SearchTab({
    Key key,
    this.foods,
  }) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controller1;
  AnimationController _controller2;
  AnimationController _controller3;
  double ds;
  double de;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      value: 0,
    );

    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
      value: 0,
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      value: 0,
    );

    _controller3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
      value: 0,
    );

    _controller.forward();
    _controller1.forward();
    _controller2.forward();
    _controller3.forward();
  }

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
            body:
                Consumer<RestaurantHeroState>(builder: (context, state, child) {
              return SingleChildScrollView(
                child: Container(
                  width: doubleWidth(100),
                  height: doubleHeight(95),
                  child: Stack(
                    children: [
                      FirstHeader(false),
                      TabBarItem(
                        FoodPageType.search,
                        show: true,
                        state: state,
                      ),
                      MainPageFoodLeft(show: false),
                      MainPageFoodRight(show: false),
                      Container(
                        color: Colors.transparent,
                        width: double.maxFinite,
                        height: doubleHeight(90),
                        margin: EdgeInsets.only(top: doubleHeight(10)),
                        child: Stack(
                          children: [
                            TheFood(FoodPageType.search, state),
                            Plate(false, state.selectedFood.image,
                                Alignment(5.8, 1)),
                            Align(
                              alignment: Alignment(0, -0.9),
                              child: FadeTransition(
                                opacity: Tween<double>(begin: 0, end: 1)
                                    .animate(CurvedAnimation(
                                        parent: _controller,
                                        curve: Interval(0, 0.2),
                                        reverseCurve: Interval(0, 0.1))),
                                child: Material(
                                  color: Colors.transparent,
                                  child: DecoratedBoxTransition(
                                    decoration: DecorationTween(
                                            begin: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            end: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.05),
                                                      blurRadius: 10,
                                                      spreadRadius: 0,
                                                      offset: Offset(0, 15)),
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.05),
                                                      blurRadius: 20,
                                                      spreadRadius: 0,
                                                      offset: Offset(5, 15)),
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.05),
                                                      blurRadius: 20,
                                                      spreadRadius: 0,
                                                      offset: Offset(-5, 15)),
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.05),
                                                      blurRadius: 5,
                                                      spreadRadius: -2,
                                                      offset: Offset(0, -5)),
                                                ]))
                                        .animate(CurvedAnimation(
                                            parent: _controller,
                                            curve: Interval(0.3, 1))),
                                    position: DecorationPosition.background,
                                    child: Container(
                                      width: doubleWidth(70),
                                      height: doubleHeight(6),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: Colors.orangeAccent,
                                            ),
                                            border: InputBorder.none,
                                            hintText: 'search ...'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SearchItemText(state, _controller3, widget.foods[0],
                                Alignment(-0.2, 1)),
                            SerachItemImage(
                                state,
                                _controller3,
                                widget.foods[0],
                                Alignment(-0.65, 1.05),
                                Alignment(-0.65, 0.85)),
                            SearchItemText(state, _controller2, widget.foods[1],
                                Alignment(-0.2, 0.51)),
                            SerachItemImage(
                                state,
                                _controller2,
                                widget.foods[1],
                                Alignment(-0.65, 1.1),
                                Alignment(-0.65, 0.39)),
                            SearchItemText(state, _controller1, widget.foods[2],
                                Alignment(-0.2, -0.02)),
                            SerachItemImage(
                                state,
                                _controller1,
                                widget.foods[2],
                                Alignment(-0.65, 1.15),
                                Alignment(-0.65, -0.07)),
                            SearchItemText(state, _controller, widget.foods[3],
                                Alignment(-0.2, -0.48)),
                            SerachItemImage(state, _controller, widget.foods[3],
                                Alignment(-0.65, 1.2), Alignment(-0.65, -0.55)),
                            GestureDetector(
                              onHorizontalDragUpdate: (DragUpdateDetails e) {
                                de = e.globalPosition.dx;
                              },
                              onHorizontalDragEnd: (e) {
                                if (ds > de) Go.replaceHero(context, MainTab());
                              },
                              onHorizontalDragStart: (DragStartDetails e) {
                                ds = e.globalPosition.dx;
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        )),
      ),
    );
  }
}
