
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../functions.dart';
import 'Page3.dart';
import 'dataTypes.dart';
class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int ind = 0;

  List<SlideDetails> slideList = [
    SlideDetails('foodApp2/restaurant3.jpg', 'foodApp2/food_style.png', 'Cafe Emad',
        '4315 Montrose boulevard ..', '4.8'),
    SlideDetails('foodApp2/restaurant1.jpeg', 'foodApp2/food_style.png', 'Cafe Emad',
        '4315 Montrose boulevard ..', '4.8'),
    SlideDetails('foodApp2/restaurant4.jpg', 'foodApp2/food_style.png', 'Cafe Emad',
        '4315 Montrose boulevard ..', '4.8'),
    SlideDetails('foodApp2/restaurant2.jpg', 'foodApp2/food_style.png', 'Cafe Emad',
        '4315 Montrose boulevard ..', '4.8'),
  ];

  List<HotDetails> hotDetails = [
    HotDetails('foodApp2/offer3.jpg', 'Jurassic world', '1h 12m'),
    HotDetails('foodApp2/offer2.jpg', 'Jurassic world', '1h 12m'),
    HotDetails('foodApp2/offer1.jpg', 'Jurassic world', '1h 12m'),
    HotDetails('foodApp2/offer4.jpg', 'Jurassic world', '1h 12m'),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        await statusSet(statusBar: Colors.transparent,
            statusBarIconIsWhite: false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 0, right: 0, left: 0, top: 27),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: doubleHeight(4),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: doubleWidth(5)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('TRENDING',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)),
                        Row(
                          children: <Widget>[
                            Text(
                              'New York',
                              style: TextStyle(
                                  fontSize: 15,
//                          fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(182, 186, 189, 1)),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 23,
                            )
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.menu)
                  ],
                ),
              ),
              SizedBox(
                height: 27,
              ),
              SizedBox(
                height: doubleHeight(45),
                width: double.infinity,
                child: Container(
                  child: Swiper(
                    onTap: (index) {
                      statusSet(statusBar: Colors.transparent,
                          statusBarIconIsWhite: true);
                      Go.pushSlideRightAnim(context, Page3(
                        slideList[index].back,
                        slideList[index].image,
                        slideList[index].name,
                        slideList[index].desc,
                        slideList[index].star,
                      ));
                    },
                    scrollDirection: Axis.horizontal,
                    itemWidth: doubleWidth(70),
                    layout: SwiperLayout.STACK,
                    onIndexChanged: (int index) {
                      ind = index;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      if (ind == index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              image: DecorationImage(
                                  image: AssetImage(ims + slideList[index].back),
                                  fit: BoxFit.fill)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
//                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/${slideList[index].image}'),
                                  backgroundColor: Colors.white,
                                ),
                                title: Text(
                                  slideList[index].name,
                                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  slideList[index].desc,
                                  style: Theme.of(context).textTheme.caption.copyWith(
                                    color: Colors.white,

                                  ),
                                ),
                                trailing: Card(
                                  color: Colors.green,
                                  elevation: 0,
                                  shape: StadiumBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 7),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          slideList[index].star,
                                          style:
                                          TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  margin: EdgeInsets.zero,
                                ),
                              ),
                              SizedBox(height: doubleHeight(1)),
                            ],
                          ),
                        );
                      } else {
                        return Opacity(
                          opacity: 0.9,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                image: DecorationImage(
                                    image:
                                    AssetImage(ims + slideList[index].back),
                                    fit: BoxFit.fill)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
//                            crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/${slideList[index].image}'),
                                    backgroundColor: Colors.white,
                                  ),
                                  title: Text(
                                    slideList[index].name,
                                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: Text(
                                    slideList[index].desc,
                                    style: Theme.of(context).textTheme.caption.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing: Card(
                                    color: Colors.green,
                                    elevation: 0,
                                    shape: StadiumBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 7),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            slideList[index].star,
                                            style:
                                            TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    margin: EdgeInsets.zero,
                                  ),
                                ),
                                SizedBox(height: doubleHeight(1)),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    itemCount: slideList.length,
//                  pagination: new SwiperPagination(builder: SwiperPagination.dots),
//              control: new SwiperControl(),
                  ),
                ),
              ),
              SizedBox(height: doubleHeight(1)),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 27),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HOT DEALS',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(95, 129, 225, 1)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(hotDetails.length, (index) =>
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            width: doubleWidth(35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                  elevation: 2,
                                borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              ims + hotDetails[index].image),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.circular(10)),
                                    height: 180,
                                    width: 150,
                                  ),
                                ),
                                SizedBox(height: doubleHeight(1)),
                                Text(
                                  hotDetails[index].name,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                SizedBox(height: doubleHeight(0.5)),
                                Text(
                                  hotDetails[index].time,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black45),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}