import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppState.dart';

import 'package:speedcode_flutter/functions.dart';

import '../data.dart';
import '../model.dart';



class ShopItem extends StatefulWidget {
  final Shop shop;
  final bool havePading;
  final Function doIt;
  final Animation<double> animation;
  const ShopItem({Key key, this.shop, this.havePading = true, this.doIt, this.animation})
      : super(key: key);

  @override
  _ShopItemState createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem>
    with SingleTickerProviderStateMixin   {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: sec1, value: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of(context, listen: false);
    var defaultCurv = CurvedAnimation(parent: widget.animation,curve: sbs1);
    return GestureDetector(
      onTap: () {
        widget.doIt();
        _controller.animateTo(1.0, duration: mil200).then((value) => _controller
            .animateTo(0.0, duration: mil200)
            .then((value) => _controller.animateTo(0.5, duration: mil200)));
        // widget.doIt();
      },
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.95, end: 1.05).animate(
            CurvedAnimation(parent: _controller, curve: Curves.linear)),
        child: Container(
          color: Colors.white,
          margin: widget.havePading
              ? EdgeInsets.only(top: doubleHeight(1))
              : EdgeInsets.zero,
          width: double.maxFinite,
          height: doubleHeight(15),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(doubleWidth(5)),
                    child:  ScaleTransition(
                      scale: Tween<double>(begin: 0, end: 1).animate(defaultCurv),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(widget.shop.image)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[100],
                                  blurRadius: 20,
                                  spreadRadius: -3,
                                  offset: Offset(0, 10)),
                              BoxShadow(
                                  color: Colors.grey[100],
                                  blurRadius: 20,
                                  spreadRadius: -3,
                                  offset: Offset(10, 0)),
                              BoxShadow(
                                  color: Colors.grey[100],
                                  blurRadius: 20,
                                  spreadRadius: -3,
                                  offset: Offset(0, -10)),
                              BoxShadow(
                                  color: Colors.grey[100],
                                  blurRadius: 20,
                                  spreadRadius: -3,
                                  offset: Offset(-10, 0)),
                            ]),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(left: doubleWidth(2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizeTransition(
                          axis: Axis.horizontal,
                          axisAlignment: -1,
                          sizeFactor: Tween<double>(begin: 0, end: 1).animate(defaultCurv),
                          child: Text(widget.shop.name,style:
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: doubleHeight(2.2)),),

                        ),
                        FadeTransition(
                          opacity: Tween<double>(begin: 0, end: 1).animate(defaultCurv),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.orangeAccent,
                              ),
                              SizedBox(
                                width: doubleWidth(1),
                              ),
                              Text(
                                '${widget.shop.star}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: doubleWidth(4)),
                              ),
                              Text(
                                ' - ${widget.shop.type} - \$\$',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: doubleWidth(4)),
                              ),
                            ],
                          ),
                        ),

                        SlideTransition(
                          position: Tween<Offset>(begin: Offset(0,1), end: Offset.zero).animate(defaultCurv),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(237, 239, 243, 1),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: doubleWidth(2), vertical: doubleHeight(0.6)),
                                child: Row(
                                  children: [
                                    Icon(CupertinoIcons.clock, color: purple),
                                    SizedBox(
                                      width: doubleWidth(1),
                                    ),
                                    Text(
                                      widget.shop.time,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: purple,
                                          fontSize: doubleWidth(4)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: doubleWidth(3),
                              ),
                              Text(
                                widget.shop.meter,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: doubleWidth(4)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: SizedBox.expand(
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                          padding: EdgeInsets.only(right: doubleWidth(5)),
                          child: GestureDetector(
                            onTap: () {
                              state.likeShop(widget.shop.id, !widget.shop.like);
                            },
                            child:
                            ScaleTransition(
                              scale: Tween<double>(begin: 0, end: 1).animate(defaultCurv),
                              child: Icon(
                                !widget.shop.like
                                    ? CupertinoIcons.suit_heart
                                    : CupertinoIcons.heart_solid,
                                color: Colors.pink,
                              ),
                            ),

                          )),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}