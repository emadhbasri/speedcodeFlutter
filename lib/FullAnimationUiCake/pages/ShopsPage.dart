import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../AppState.dart';
import 'package:speedcode_flutter/functions.dart';
import '../items/ShopItem.dart';
import '../items/CategoryBar.dart';
import '../data.dart';
import '../model.dart';

class ShopsPage extends StatefulWidget {
  @override
  _ShopsPageState createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> with SingleTickerProviderStateMixin{
  // AnimationController _controller;
  bool changeIt=false;
  @override
  void initState() {
    // statusSet(statusBar: Colors.white);
    super.initState();
    // _controller = AnimationController(
    //     vsync: this, value: 0, duration: Duration(seconds: 5));
    // _controller.forward();
  }
  List<Shop> shops = [];
  Offset endOffsetBack = Offset(0, 0);
  Offset endOffset = Offset(0, 0);
  Offset startOffsetBack = Offset(doubleWidth(100), 0);
  Offset startOffset = Offset(doubleWidth(100), 0);

  GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return true;
    },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: doubleHeight(3.5),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                SizedBox(
                  width: doubleWidth(1),
                ),
                TweenAnimationBuilder(tween: Tween<double>(begin: 0,end: 1),
                    curve: sbs,
                    duration: sec1,
                    builder: (context, value, child) =>
                        Transform.scale(scale: value,child: GestureDetector(
                          onTap: (){
                            // AppState state = ;
                            // state/

                            Provider.of<AppState>(context,listen: false).changePage(PageName.Cart);
                          },
                          child: Container(
                            padding: EdgeInsets.all(doubleWidth(1.5)),
                            decoration: BoxDecoration(
                              // color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              CupertinoIcons.bag,
                              color: Colors.black,
                            ),
                          ),
                        ))),
                SizedBox(
                  width: doubleWidth(5),
                ),
                TweenAnimationBuilder(tween: Tween<double>(begin: 0,end: 1),
                    curve: sbs,
                    duration: sec1, builder: (context, value, child) =>
                        Transform.scale(
                          scale: value,
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                              padding: EdgeInsets.all(doubleWidth(1.5)),
                              decoration: BoxDecoration(
                                // color: Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                CupertinoIcons.suit_heart,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )),
                SizedBox(
                  width: doubleWidth(7),
                ),
              ],
            ),
            SizedBox(
              height: doubleHeight(2),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: doubleWidth(15),end: doubleWidth(5)),
              duration: sec1, builder: (context, value, child) =>
                Padding(
                  padding: EdgeInsets.only(left: value),
                  child: child,
                ),
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Hi, ',
                            style: TextStyle(
                              fontSize: doubleWidth(7.5),
                            )),
                        TextSpan(
                            text: 'Emad!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: doubleWidth(8),
                            ))
                      ])),),
            SizedBox(
              height: doubleHeight(3),
            ),
            Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: doubleHeight(14)),//7
                      child: AnimatedList(
                        key: _key,
                      initialItemCount: shops.length,
                        physics: BouncingScrollPhysics(),
                        // padding: EdgeInsets.only(top: doubleHeight(7)),
                        itemBuilder: (context, index,animation) {
                          if(index==0)
                            return ShopItem(
                              animation: animation,
                                shop: shops[index],havePading: false,
                            doIt: ()async{
                              setState(() {
                                changeIt=false;
                              });
                              setState(() {
                                startOffset=Offset(0, 0);
                                endOffset=Offset(doubleWidth(100), 0);
                              });
                              await Future.delayed(mil300);
                              setState(() {
                                startOffsetBack=Offset(0, 0);
                                endOffsetBack=Offset(doubleWidth(100), 0);
                              });
                              await Future.delayed(mil700);
                              AppState state = Provider.of<AppState>(context,listen: false);
                              state.shop=shops[index];
                              state.changePage(PageName.Shop);
                            });
                          else
                            return ShopItem(
                                animation: animation,
                                shop: shops[index],
                                doIt: ()async{
                                  setState(() {
                                    changeIt=false;
                                  });
                                  setState(() {
                                    startOffset=Offset(0, 0);
                                    endOffset=Offset(doubleWidth(100), 0);
                                  });
                                  await Future.delayed(mil300);
                                  setState(() {
                                    startOffsetBack=Offset(0, 0);
                                    endOffsetBack=Offset(doubleWidth(100), 0);
                                  });
                                  await Future.delayed(mil700);
                                  AppState state = Provider.of<AppState>(context,listen: false);
                                  state.shop=shops[index];
                                  state.changePage(PageName.Shop);
                                  print('asd');
                                });
                        },
                      ),
                    ),
                    SizedBox(
                      width: doubleWidth(100),
                      height: doubleHeight(14),
                      child: Stack(
                        children: [
                          TweenAnimationBuilder(
                            duration: mil700,
                            tween: Tween<Offset>(begin: startOffsetBack, end: endOffsetBack),
                            builder: (context, value, child) => Transform.translate(
                              offset: value,
                              child: child,
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: doubleWidth(95),
                                height: doubleHeight(14),
                                decoration: BoxDecoration(
                                    color: purple,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100),
                                      topLeft: Radius.circular(100),
                                    )),
                              ),
                            ),
                          ),
                          !changeIt?TweenAnimationBuilder(
                            duration: mil700,
                            curve: Curves.easeIn,
                            tween: Tween<Offset>(begin: startOffset, end: endOffset),
                            builder: (context, value, child) => Transform.translate(
                              offset: value,
                              child: child,
                            ),
                            child: CategoryBar(isTemp:true),
                            onEnd: (){
                              if(endOffset!=Offset(doubleWidth(100), 0)){
                                setState(() {
                                  changeIt=true;
                                });
                                addList();
                              }
                            },
                          ):CategoryBar(doIt: ()=>addList(),isTemp: false,),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
  addList()async{

    AppState state = Provider.of<AppState>(context,listen: false);
    List<Shop> shops1 = state.getShopItem();
    if(shops.isNotEmpty){
      removeList();
    }
    await Future.delayed(Duration(milliseconds: 100));

    for(int j=0;j<shops1.length;j++){
      _key.currentState.insertItem(j,duration: mil500);
      shops.add(shops1[j]);
      await Future.delayed(Duration(milliseconds: 200));
    }
  }
  removeList()async{
    print('shops.length ${shops.length}');
    while(shops.isNotEmpty){
      print('jj ');
      _key.currentState.removeItem(0,(context,animation)=>SizedBox(),);
      setState(() {
        shops.removeAt(0);
      });
    }
  }
}
