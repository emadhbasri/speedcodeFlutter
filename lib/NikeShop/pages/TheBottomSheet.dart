import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedcode_flutter/functions.dart';

import '../model.dart';

class TheBottomSheet extends StatefulWidget {
  final ProductShoes shoe;
  const TheBottomSheet({Key key, this.shoe}) : super(key: key);
  @override
  _TheBottomSheetState createState() => _TheBottomSheetState();
}

class _TheBottomSheetState extends State<TheBottomSheet>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controller1;

  @override
  void initState() {
    _controller = AnimationController(//800
        vsync: this, duration: Duration(milliseconds: 300), value: 0);
    _controller1 = AnimationController(//700
        vsync: this, duration: Duration(milliseconds: 300), value: 0);

    animationB = Tween<double>(begin: doubleWidth(50), end: doubleHeight(8))
        .animate(CurvedAnimation(curve: Interval(0, 0.5), parent: _controller));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  List<double> shoeSize = [];
  
  var animationB;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: doubleWidth(100),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment(0, -1),
            child: SlideTransition(
              position: Tween<Offset>(begin: Offset.zero, end: Offset(0, 0.83))
                  .animate(_controller1),
              child: ScaleTransition(
                alignment: Alignment.topCenter,
                scale: Tween<double>(begin: 1, end: 0.42 //0.75
                        )
                    .animate(CurvedAnimation(
                        curve: Interval(0.7, 1), parent: _controller)),
                child: ScaleTransition(
                  alignment: Alignment.topCenter,
                  scale: Tween<double>(begin: 1, end: 0.35).animate(
                      CurvedAnimation(
                          curve: Interval(0, 0.5), parent: _controller)),
                  child: DecoratedBoxTransition(
                    decoration: DecorationTween(
                            begin: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              color: Colors.white,
                            ),
                            end: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(200),
                            ))
                        .animate(CurvedAnimation(
                            curve: Interval(0, 0.5), parent: _controller)),
                    position: DecorationPosition.background,
                    child: FadeTransition(
                      opacity:Tween<double>(begin: 1,end:0).animate(CurvedAnimation(
                          curve: Interval(0, 0.3), parent: _controller)),
                      child: Container(
                        height: doubleWidth(100),
                        width: doubleWidth(100),
                        child: Column(
                          children: [
                            SizedBox(
                              height: doubleHeight(20),
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: doubleHeight(20),
                                    width: doubleHeight(20),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: doubleWidth(5)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              List ll =
                                                  widget.shoe.name.split(',');
                                              return Text(
                                                '${ll[0]}\n,${ll[1]}',
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(168, 168, 170, 1),
                                                    fontSize: doubleWidth(4)),
                                              );
                                            },
                                          ),
                                          SizedBox(height: doubleHeight(1.5)),
                                          Text(
                                            '\$${widget.shoe.priceNow} ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: doubleWidth(5)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Color.fromRGBO(230, 230, 230, 1),
                              endIndent: doubleWidth(5),
                              indent: doubleWidth(5),
                              thickness: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: doubleWidth(10),
                                  height: doubleWidth(10),
                                  child: Image.asset('assets/images/NikeShop/nike.png'),
                                ),
                                SizedBox(width: doubleWidth(1)),
                                Text(
                                  'SELECT SIZE',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(168, 168, 170, 1),
                                      fontSize: doubleWidth(3.7)),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: doubleWidth(2)),
                              child:Wrap(
                                spacing: doubleWidth(1),
                                runSpacing: doubleHeight(1),
                                children: widget.shoe.sizes.map((e){
                                  String out = e.toString();
                                  if (e
                                      .toString()
                                      .contains('.0')) {
                                    out = e.round().toString();
                                  }
                                  if(shoeSize.contains(e)){
                                    return RaisedButton(
                                      padding: EdgeInsets.symmetric(vertical: doubleHeight(2)),
                                      child: Text('US $out'),
                                      onPressed: (){
                                        shoeSize.remove(e);
                                        setState(() {
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      color: Colors.black,
                                      textColor: Colors.white,

                                    );
                                  }else{
                                    return OutlineButton(
                                      padding: EdgeInsets.symmetric(vertical: doubleHeight(2)),
                                      child: Text('US $out'),
                                      onPressed: (){
                                        shoeSize.add(e);
                                        setState(() {

                                        });
                                      },
                                      textColor: Colors.black,

                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),

                                    );
                                  }
                                }).toList(),
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SlideTransition(
            position: Tween<Offset>(begin: Offset.zero, end: Offset(0, 0.8))
                .animate(_controller1),
            child: AlignTransition(
              alignment: AlignmentTween(
                      begin: Alignment(-1, -1), end: Alignment(0, -0.9))
                  .animate(CurvedAnimation(
                      curve: Interval(0, 0.5), parent: _controller)),
              child: ScaleTransition(
                alignment: Alignment.topCenter,
                scale: Tween<double>(begin: 1, end: 0.45 //0.75
                        )
                    .animate(CurvedAnimation(
                        curve: Interval(0.7, 1), parent: _controller)),
                child: ScaleTransition(
                  alignment: Alignment.topCenter,
                  scale: Tween<double>(begin: 1, end: 0.6).animate(
                      CurvedAnimation(
                          curve: Interval(0, 0.5), parent: _controller)),
                  child: Container(
                    height: doubleHeight(20),
                    width: doubleHeight(20),
                    child: Center(
                      child: Container(
                        height: doubleHeight(15),
                        width: doubleHeight(15),
                        child: Image.asset(
                          widget.shoe.images.first,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.95),
            child: GestureDetector(
              onTap: () {
                if (shoeSize.isEmpty) return;
                _controller.forward().then((value) => _controller1.forward().then((value) => Go.pop(context,false)));
                // _controller.animateTo(1,duration: Duration(seconds: 1),curve: Curves.linear);
                print('click');
              },
              child: AnimatedBuilder(
                key: Key('AnimatedBuilder'),
                animation: animationB,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                        color: shoeSize.isEmpty ? Colors.black45 : Colors.black,
                        borderRadius: BorderRadius.circular(100)),
                    width: animationB.value,
                    height: doubleHeight(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        SizeTransition(
                            axis: Axis.horizontal,
                            axisAlignment: -1,
                            sizeFactor: Tween<double>(begin: 1, end: 0).animate(
                                CurvedAnimation(
                                    parent: _controller,
                                    curve: Interval(0, 0.5))),
                            child: SizedBox(width: doubleWidth(4)),),
                        DefaultTextStyleTransition(
                          key: Key('DefaultTextStyleTransition'),
                          style: TextStyleTween(
                                  begin: TextStyle(
                                      color: Colors.white,
                                      fontSize: doubleWidth(4),
                                      fontWeight: FontWeight.bold),
                                  end: TextStyle(
                                      color: Colors.white,
                                      fontSize: 0,
                                      fontWeight: FontWeight.bold))
                              .animate(CurvedAnimation(
                                  parent: _controller,
                                  curve: Interval(0, 0.5))),
                          child: Text(
                            'ADD TO CART',
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
