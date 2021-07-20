import 'package:flutter/material.dart';
import 'package:speedcode_flutter/functions.dart';

import '../data.dart';



class End extends StatefulWidget {
  static List<String> data = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  @override
  _EndState createState() => _EndState();
}

class _EndState extends State<End> {
  List<String> list = [];

  GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  addList() async {
    await Future.delayed(sec1);
    for (int j = 0; j < End.data.length; j++) {
      list.add(End.data[j]);
      _key.currentState.insertItem(j);
      await Future.delayed(mil500);
    }
  }

  @override
  Widget build(BuildContext context) {
    addList();
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Stack(
        children: [
        Align(
        alignment: Alignment.center,
          child: GestureDetector(
            onTap: (){

            },
          ),
        ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: doubleWidth(100),
              height: doubleHeight(70),
              color: Colors.grey,
              child: AnimatedList(
                key: _key,
                physics: BouncingScrollPhysics(),

                initialItemCount: list.length,
                  itemBuilder: (context, index, animation) => ScaleTransition(
                      scale:
                          animation.drive(Tween<double>(begin: 0.0, end: 1.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(list[index],
                            style: TextStyle(color: Colors.black)),
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
