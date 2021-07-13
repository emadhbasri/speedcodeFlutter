import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'foodApp1/foodApp1.dart';
import 'foodApp2/foodApp2.dart';
import 'functions.dart';
void main() {
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
              ListTile(
                title: Text(
                  'FoodApp2',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  await statusSet(statusBar: Colors.transparent,
                      statusBarIconIsWhite: false);
                  await Go.push(context, FoodApp2());
                  statusSet(
                      statusBar: Colors.white, statusBarIconIsWhite: false);
                },
              ),
            ],
          ),
        )));
  }
}
