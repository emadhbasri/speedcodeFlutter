import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'LoginSignUpAnimation/Pages/LoginPage.dart';
import 'NikeShop/pages/NikeShop.dart';
import 'foodApp1/foodApp1.dart';
import 'foodApp2/foodApp2.dart';
import 'functions.dart';

void main() {
  runApp(MyApp());
}

class UiItems {
  final VideoPlayerController video;
  final String title;
  final String subtitle;
  final Function page;
  const UiItems({this.video, this.title, this.subtitle, this.page});
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
      PageController(initialPage: 0, viewportFraction: 0.6);
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
          video:
              VideoPlayerController.asset('assets/images/UiItems/NikeShop.mp4'),
          title: 'NikeShop',
          subtitle: 'E-commerce design for shopping Clothing.\n'
          'Using hero, navigation transition controller and NotifyListener.',
          page: () async {
            await statusSet(
                statusBar: Colors.transparent,
                statusBarIconIsWhite: false,
                navigationBar: Colors.white,
                navigationBarLineIsWhite: false);
            await Go.push(context, NikeShop());
            doDefaultStatusBar();
          }),
      UiItems(
          video:
              VideoPlayerController.asset('assets/images/UiItems/foodApp1.mp4'),
          title: 'FoodApp1',
          subtitle: 'Design for restaurant menu.',
          page: () async {
            await Go.push(context, FoodApp1());
            doDefaultStatusBar();
          }),
      UiItems(
          video:
              VideoPlayerController.asset('assets/images/UiItems/foodApp2.mp4'),
          title: 'FoodApp2',
          subtitle: 'Design for restaurant menus, offers, info, etc.\n'
          'Using navigation transition and flutter_swiper package.',
          page: () async {
            await statusSet(
                statusBar: Colors.transparent,
                statusBarIconIsWhite: false,
                navigationBar: Colors.white,
                navigationBarLineIsWhite: false);
            await Go.push(context, FoodApp2());
            doDefaultStatusBar();
          }),
      UiItems(
          video: VideoPlayerController.asset(
              'assets/images/UiItems/LoginSignUpAnimation.mp4'),
          title: 'LoginSignUpAnimation',
          subtitle: 'Login SignUp Animation.\n'
          'Using MyAnimatedWidget, provider and IndexedStack.',
          page: () async {
            await statusSet(
                statusBar: Colors.transparent,
                statusBarIconIsWhite: false,
                navigationBar: Colors.white,
                navigationBarLineIsWhite: false);
            await Go.push(context, ProviderLogin());
            doDefaultStatusBar();
          }),
    ];
    init();
    super.initState();
  }

  init() async {
    for (int j = 0; j < _list.length; j++) {
      await _list[j].video.initialize();
      await _list[j].video.setLooping(true);

    }
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
                  _currentIndex = index;
                });
              },
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return _pageItemBuilder(
                  item: _list[index],
                  index: index,
                  // currentIndex: _currentIndex,
                );
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

  _pageItemBuilder({UiItems item, int index}) {
    print('index $index');
    for(int j=0;j<_list.length;j++){
        if(_currentIndex==j)
          _list[j].video.play();
        else
          _list[j].video.pause();
    }
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: _currentIndex != index ? 0.5 : 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: item.video.value.isInitialized
                ? AspectRatio(
              aspectRatio: item.video.value.aspectRatio,
              child: VideoPlayer(item.video),
            )
                : Container()),
      ),
    );
  }
}
