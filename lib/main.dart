import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'LoginSignUpAnimation/Pages/LoginPage.dart';
import 'foodApp1/foodApp1.dart';
import 'foodApp2/foodApp2.dart';
import 'functions.dart';

void main() {
  runApp(MyApp());
}

class UiItems {
  final List<String> image;
  final String title;
  final String subtitle;
  final Function page;
  const UiItems({this.image, this.title, this.subtitle, this.page});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emad H Basri',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) {
          screenSize = MediaQuery.of(context).size;
          return Home();
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _controller =
      PageController(initialPage: 999, viewportFraction: 0.6);
  int _currentIndex = 0;
  List<UiItems> _list;
  doDefaultStatusBar() {
    statusSet(
        statusBar: Color.fromRGBO(47, 49, 62, 1),
        statusBarIconIsWhite: true,
        navigationBar: Color.fromRGBO(47, 49, 62, 1),
        navigationBarLineIsWhite: true);
  }

  @override
  void initState() {
    doDefaultStatusBar();
    _list = [
      UiItems(
          image: ['assets/images/UiItems/foodApp1.jpg'],
          title: 'FoodApp1',
          subtitle: '',
          page: () async {
            await Go.push(context, FoodApp1());
            doDefaultStatusBar();
          }),
      UiItems(
          image: [
            'assets/images/UiItems/foodApp2_1.jpg',
            'assets/images/UiItems/foodApp2_2.jpg',
            'assets/images/UiItems/foodApp2_3.jpg',
          ],
          title: 'FoodApp2',
          subtitle: '',
          page: () async {
            await statusSet(
                statusBar: Colors.transparent, statusBarIconIsWhite: false);
            await Go.push(context, FoodApp2());
            doDefaultStatusBar();
          }),
      UiItems(
          image: ['assets/images/UiItems/LoginSignUpAnimation.gif'],
          title: 'LoginSignUpAnimation',
          subtitle: '',
          page: () async {
            await statusSet(
                statusBar: Colors.transparent, statusBarIconIsWhite: false);
            await Go.push(context, ProviderLogin());
            doDefaultStatusBar();
          }),
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(47, 49, 62, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 49, 62, 1),
        elevation: 0,
        centerTitle: true,
        title: Text('Emad H Basri'),
      ),
      body: Column(
        children: [
          SizedBox(height: doubleHeight(2)),
          SizedBox(
            width: double.maxFinite,
            height: doubleHeight(50),
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index % _list.length;
                });
              },
              itemBuilder: (context, index) {
                return _pageItemBuilder(
                    _list[index % _list.length], index % _list.length);
              },
            ),
          ),
          SizedBox(height: doubleHeight(1)),

          Text(_list[_currentIndex].title,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white)),
          Text(_list[_currentIndex].subtitle ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.white)),
          Spacer(),
          ElevatedButton(
              onPressed: () {
                _list[_currentIndex].page();
              },
              child: Text(
                'LAUNCH',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(Colors.grey.withOpacity(0.5)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(5),
                shape: MaterialStateProperty.all(StadiumBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                    horizontal: doubleWidth(8), vertical: doubleHeight(2))),
              )),
          SizedBox(height: doubleHeight(2)),
        ],
      ),
    );
  }

  _pageItemBuilder(UiItems item, int index) {
    return Opacity(
      opacity: _currentIndex != index ? 0.5 : 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              item.image.first,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
