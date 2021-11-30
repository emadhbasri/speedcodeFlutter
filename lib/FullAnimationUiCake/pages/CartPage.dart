import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:speedcode_flutter/functions.dart';
import '../AppState.dart';
import '../items/CartItem.dart';
import '../data.dart';
import '../model.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  bool _animIsCompleted = false;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: mil700, value: 0)
      ..addListener(() {
        ///showBottomButtons
        if (_controller.isCompleted) {
          _animIsCompleted = true;
        }
        if (_animIsCompleted && _controller.value == 0.8) {
          _showBottomButtons();
        }
        ///showBottomButtons
        ///showOthers
        if(_controller.value >= 0.1)
          _showTrashButton();

        if(_controller.value >= 0.15)
          _showCartText();

        if(_controller.value >= 0.2)
          _showDeliver();

        if(_controller.value >= 0.25)
          _showShopsName();



        ///showOthers



      });
    statusSet(
        navigationBar: Color.fromRGBO(247, 218, 204, 1),
        navigationBarLineIsWhite: true);
    super.initState();
  }

  bool isBack = true;
  AnimationController _controller;
  bool showBottomButtons = false;
  _showBottomButtons() {
    if (!showBottomButtons)
      setState(() {
        showBottomButtons = true;
      });
  }

  bool showTrashButton = false;
  _showTrashButton() {
    if (!showTrashButton)
      setState(() {
        showTrashButton = true;
      });
  }

  bool showCartText = false;
  _showCartText() {
    if (!showCartText)
      setState(() {
        showCartText = true;
      });
  }

  bool showDeliver = false;
  _showDeliver() {
    if (!showDeliver)
      setState(() {
        showDeliver = true;
      });
  }

  bool showShopsName = false;
  _showShopsName() {
    if (!showShopsName)
      setState(() {
        showShopsName = true;
      });
  }

  // bool showBottomButtons = false;
  // _showBottomButtons() {
  //   if (!showBottomButtons)
  //     setState(() {
  //       showBottomButtons = true;
  //     });
  // }



  String address = '797_CASSIE_SPURS';
  String date = 'NOW';

  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of<AppState>(context, listen: false);
    print('_controller.value ${_controller.value}');
    return WillPopScope(
      onWillPop: () async {
        statusSet(navigationBar: Colors.white, navigationBarLineIsWhite: false);
        // state.changePage(PageName.Food);
        state.changePage(PageName.Shops);
        return false;
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(247, 218, 204, 1),
        body: Stack(
          children: [
            AnimationBackgroud(
              controller: _controller,
            ),
            Material(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: doubleWidth(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: doubleHeight(5)),
                    if(showTrashButton)
                      TweenAnimationBuilder(
                        curve: sbs,
                        duration: mil500,
                        tween: Tween<double>(begin: 0.8, end: 1),
                        builder: (context, scale, child) => Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                        child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            state.cart.clear();
                            state.notify();
                            state.changePage(PageName.Food);
                          },
                          icon: Icon(
                            CupertinoIcons.trash,
                            color: Colors.white,
                          ),
                        ),
                    ),
                      )
                    else Opacity(opacity: 0,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            state.cart.clear();
                            state.notify();
                            state.changePage(PageName.Food);
                          },
                          icon: Icon(
                            CupertinoIcons.trash,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    if(showCartText)
                      TweenAnimationBuilder(
                        curve: sbs,
                        duration: mil500,
                        tween: Tween<double>(begin: 0.8, end: 1),
                        builder: (context, scale, child) => Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                        child: Text(
                        'Cart',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: doubleWidth(8)),
                    ),
                      )
                    else
                      Opacity(
                        opacity: 0,
                        child: Text(
                          'Cart',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: doubleWidth(8)),
                        ),
                      ),
                    SizedBox(height: doubleHeight(1)),
                    if(showDeliver)
                      TweenAnimationBuilder(
                        curve: sbs,
                        duration: mil500,
                        tween: Tween<double>(begin: 0.8, end: 1),
                        builder: (context, scale, child) => Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                        child: Row(
                        children: [
                          Text(
                            'DELIVER TO',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: doubleWidth(3.5)),
                          ),
                          SizedBox(width: doubleWidth(3)),
                          Text(
                            address,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: doubleWidth(3)),
                          ),
                          PopupMenuButton(
                              elevation: 0,
                              onSelected: (e) {
                                setState(() {
                                  address = e;
                                });
                              },
                              offset: Offset(0, 50),
                              padding: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.only(left: doubleWidth(1)),
                                child: Icon(
                                  CupertinoIcons.chevron_down,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: '797_CASSIE_SPURS',
                                  child: Text(
                                    '797_CASSIE_SPURS',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: doubleWidth(3.5)),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: '798_CASSIE_SPURS',
                                  child: Text(
                                    '798_CASSIE_SPURS',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: doubleWidth(3.5)),
                                  ),
                                ),
                              ]),
                          Spacer(),
                          Text(
                            date,
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: doubleWidth(3)),
                          ),
                          PopupMenuButton(
                              elevation: 0,
                              onSelected: (e) {
                                setState(() {
                                  date = e;
                                });
                              },
                              offset: Offset(0, 50),
                              padding: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.only(left: doubleWidth(1)),
                                child: Icon(
                                  CupertinoIcons.chevron_down,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 'NOW',
                                  child: Text(
                                    'NOW',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: doubleWidth(3)),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'TOMARROW',
                                  child: Text(
                                    'TOMARROW',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: doubleWidth(3)),
                                  ),
                                ),
                              ])
                        ],
                    ),
                      )
                    else
                      Opacity(
                        opacity: 0,
                        child: Row(
                          children: [
                            Text(
                              'DELIVER TO',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: doubleWidth(3.5)),
                            ),
                            SizedBox(width: doubleWidth(3)),
                            Text(
                              address,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: doubleWidth(3)),
                            ),
                            PopupMenuButton(
                                elevation: 0,
                                onSelected: (e) {
                                  setState(() {
                                    address = e;
                                  });
                                },
                                offset: Offset(0, 50),
                                padding: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.only(left: doubleWidth(1)),
                                  child: Icon(
                                    CupertinoIcons.chevron_down,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: '797_CASSIE_SPURS',
                                    child: Text(
                                      '797_CASSIE_SPURS',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: doubleWidth(3.5)),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: '798_CASSIE_SPURS',
                                    child: Text(
                                      '798_CASSIE_SPURS',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: doubleWidth(3.5)),
                                    ),
                                  ),
                                ]),
                            Spacer(),
                            Text(
                              date,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: doubleWidth(3)),
                            ),
                            PopupMenuButton(
                                elevation: 0,
                                onSelected: (e) {
                                  setState(() {
                                    date = e;
                                  });
                                },
                                offset: Offset(0, 50),
                                padding: EdgeInsets.zero,
                                child: Padding(
                                  padding: EdgeInsets.only(left: doubleWidth(1)),
                                  child: Icon(
                                    CupertinoIcons.chevron_down,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 'NOW',
                                    child: Text(
                                      'NOW',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: doubleWidth(3)),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 'TOMARROW',
                                    child: Text(
                                      'TOMARROW',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: doubleWidth(3)),
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ),
                    SizedBox(height: doubleHeight(3)),
                    if(showShopsName)
                      TweenAnimationBuilder(
                        curve: sbs,
                        duration: mil500,
                        tween: Tween<double>(begin: 0.8, end: 1),
                        builder: (context, scale, child) => Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                        child: Row(
                        children: [
                          Text(
                            'FROM',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: doubleWidth(3.5)),
                          ),
                          SizedBox(width: doubleWidth(3)),
                          Text(
                            state.shop.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: doubleWidth(4)),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: doubleWidth(2),
                                vertical: doubleHeight(0.5)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 1, color: Colors.pink[100])),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  CupertinoIcons.time,
                                  color: Colors.pink[100],
                                  size: 15,
                                ),
                                SizedBox(width: doubleWidth(2)),
                                Text(
                                  '15-20 min',
                                  style: TextStyle(
                                      color: Colors.pink[100],
                                      fontSize: doubleWidth(3)),
                                ),
                              ],
                            ),
                          )
                        ],
                    ),
                      )
                    else
                      Opacity(
                        opacity: 0,
                        child: Row(
                          children: [
                            Text(
                              'FROM',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: doubleWidth(3.5)),
                            ),
                            SizedBox(width: doubleWidth(3)),
                            Text(
                              state.shop.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: doubleWidth(4)),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: doubleWidth(2),
                                  vertical: doubleHeight(0.5)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1, color: Colors.pink[100])),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    CupertinoIcons.time,
                                    color: Colors.pink[100],
                                    size: 15,
                                  ),
                                  SizedBox(width: doubleWidth(2)),
                                  Text(
                                    '15-20 min',
                                    style: TextStyle(
                                        color: Colors.pink[100],
                                        fontSize: doubleWidth(3)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.cart.length,
                        itemBuilder: (context, index) => CartItem(
                          foodCount: state.cart[index],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: doubleHeight(1)),
                        physics: BouncingScrollPhysics(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (showBottomButtons)
              Align(
                alignment: Alignment(0, 0.85),
                child: SizedBox(
                  width: doubleWidth(90),
                  height: doubleHeight(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: TweenAnimationBuilder(
                        curve: sbs,
                        duration: mil500,
                        tween: Tween<double>(begin: 0.8, end: 1),
                        builder: (context, scale, child) => Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          padding: EdgeInsets.all(doubleWidth(2)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(1),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.grey[400]),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                            ),
                            child: Text(
                              '\$22.70',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                      )),
                      Expanded(
                          flex: 3,
                          child: TweenAnimationBuilder(
                            curve: sbs,
                            duration: mil500,
                            tween: Tween<double>(begin: 0.8, end: 1),
                            builder: (context, scale, child) => Transform.scale(
                              scale: scale,
                              child: child,
                            ),
                            child: Container(
                              width: double.maxFinite,
                              height: double.maxFinite,
                              padding: EdgeInsets.all(doubleWidth(2)),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.all(Colors.pink),
                                  elevation: MaterialStateProperty.all(1),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.pinkAccent),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.grey[400]),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                                child: Text('CHECKOUT',
                                    style: TextStyle(
                                        fontSize: doubleWidth(4),
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimationBackgroud extends StatefulWidget {
  final AnimationController controller;

  const AnimationBackgroud({Key key, this.controller}) : super(key: key);
  @override
  _AnimationBackgroudState createState() => _AnimationBackgroudState();
}

class _AnimationBackgroudState extends State<AnimationBackgroud> {
  Animation<double> heightAnim;
  @override
  void initState() {
    super.initState();
    heightAnim = Tween<double>(begin: doubleHeight(10), end: doubleHeight(100))
        .animate(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      builder: (context, value, child) => Transform.translate(
        offset: value,
        child: child,
      ),
      child: AnimatedBuilder(
        animation: heightAnim,
        builder: (context, child) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            color: purple,
          ),
          height: heightAnim.value,
          width: double.maxFinite,
        ),
      ),
      tween:
          Tween<Offset>(begin: Offset(doubleWidth(90), 0), end: Offset.zero), //
      duration: mil700,
      onEnd: () {
        print('onEnd');
        widget.controller.forward().then(
            (value) => widget.controller.animateTo(0.8, duration: mil200));
      },
    );
  }
}


