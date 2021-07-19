import 'package:flutter/material.dart';
import 'package:speedcode_flutter/functions.dart';

class FirstHeader extends StatelessWidget {
  final bool show;
  const FirstHeader(this.show);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-1, show ? -1 : -1.5),
      child: Hero(
        tag: 'firstHeader',
        child: Material(
          child: Container(
            width: double.maxFinite,
            height: doubleHeight(10),
            padding:
                EdgeInsets.only(left: doubleWidth(10), right: doubleWidth(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Restaurant Hero',
                  style: TextStyle(
                      wordSpacing: 2,
                      fontSize: doubleWidth(7),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.menu,
                  size: doubleWidth(7),
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
