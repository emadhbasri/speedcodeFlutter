import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:speedcode/foodApp1/foodApp1.dart';
import 'package:speedcode/testNav.dart';

// import 'Restaurant Full Animation App/AppState.dart';
// import 'Restaurant Full Animation App/RestaurantFullAnimationApp1.dart';
import 'functions.dart';

final getIt = GetIt.instance;
void main() {
  // GetIt.I.registerLazySingleton(() => RestaurantFullAnimationApp1State());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Emad H Basri',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    statusSet(
        statusBar: Colors.white,
        statusBarIconIsWhite: false,
        navigationBar: Colors.white,
        navigationBarLineIsWhite: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              ListTile(
                title: Text(
                  'FoodApp1',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  await Go.push(context, FoodApp1());
                  statusSet(
                      statusBar: Colors.white, statusBarIconIsWhite: false);
                },
              ),
              // ListTile(
              //   title: Text(
              //     'Restaurant Full Animation App',
              //     style: Theme.of(context)
              //         .textTheme
              //         .headline5
              //         .copyWith(fontWeight: FontWeight.bold),
              //   ),
              //   onTap: () async {
              //     statusSet(
              //       statusBar: Colors.transparent,
              //       statusBarIconIsWhite: false,
              //     );
              //     await Go.push(context, RestaurantFullAnimationApp1());
              //     statusSet(
              //       statusBar: Colors.white,
              //       statusBarIconIsWhite: false,
              //     );
              //   },
              // ),
            ],
          ),
        )));
  }
}
