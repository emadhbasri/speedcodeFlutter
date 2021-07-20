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

class _CartPageState extends State<CartPage> {

  String address='797_CASSIE_SPURS';
  String date = 'NOW';
  @override
  Widget build(BuildContext context) {
    AppState state = Provider.of<AppState>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        state.changePage(PageName.Food);
        return false;
      },
      child: Material(
        color: purple,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:doubleWidth(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: doubleHeight(5)),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(CupertinoIcons.trash,color: Colors.white,),
                ),
              ),
              Text('Cart',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: doubleWidth(8)
                          ),
                        ),
              SizedBox(height: doubleHeight(1)),
              Row(
                children: [
                  Text('DELIVER TO',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: doubleWidth(3.5)
                              ),
                            ),
                  SizedBox(width:doubleWidth(3)),
                  Text(address,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: doubleWidth(3)
                    ),
                  ),
                  PopupMenuButton(
                    elevation: 0,
                    onSelected: (e){
                      setState(() {
                        address=e;
                      });
                    },
                    offset: Offset(0,50),
                    padding: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.only(left: doubleWidth(1)),
                      child: Icon(CupertinoIcons.chevron_down,
                        color: Colors.white,size: 18,),
                    ),
                      itemBuilder: (context) =>
                      [
                        PopupMenuItem(
                          value: '797_CASSIE_SPURS',
                          child: Text('797_CASSIE_SPURS',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: doubleWidth(3.5)
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: '798_CASSIE_SPURS',
                          child: Text('798_CASSIE_SPURS',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: doubleWidth(3.5)
                            ),
                          ),
                        ),
                      ]
                  ),

                  Spacer(),
                  Text(date,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: doubleWidth(3)
                    ),
                  ),
                  PopupMenuButton(
                    elevation: 0,
                    onSelected: (e){
                      setState(() {
                        date=e;
                      });
                    },
                      offset: Offset(0,50),
                    padding: EdgeInsets.zero,
                      child: Padding(
                        padding: EdgeInsets.only(left: doubleWidth(1)),
                        child: Icon(CupertinoIcons.chevron_down,
                            color: Colors.white,size: 18,),
                      ),
                     itemBuilder: (context) =>
                    [
                      PopupMenuItem(
                        value: 'NOW',
                        child:  Text('NOW',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: doubleWidth(3)
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'TOMARROW',
                        child:  Text('TOMARROW',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: doubleWidth(3)
                          ),
                        ),
                      ),
                    ]
                  )
                ],
              ),
              SizedBox(height: doubleHeight(3)),
              Row(
                children: [
                  Text('FROM',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: doubleWidth(3.5)
                    ),
                  ),
                  SizedBox(width:doubleWidth(3)),
                  Text(state.shop.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: doubleWidth(4)
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: doubleWidth(2),vertical: doubleHeight(0.5)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: Colors.pink[100])
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.time,color: Colors.pink[100],size: 15,),
                        SizedBox(width: doubleWidth(2)),
                        Text('15-20 min',
                                    style: TextStyle(
                                        color: Colors.pink[100],
                                        fontSize: doubleWidth(3)
                                    ),
                                  ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    ...state.cart.map((e) => CartItem(
                      foodCount: e,
                    )).toList()
                    //todo End shop add delivery
                  ],

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
