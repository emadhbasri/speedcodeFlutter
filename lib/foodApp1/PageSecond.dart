import 'package:flutter/material.dart';
import 'data.dart';

class SliderBottomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: slideBottomList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0).copyWith(bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 5,
                        spreadRadius: -2,
                        offset: Offset(0, 5))
                  ]),
              width: double.maxFinite,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              slideBottomList[index].name,
                              style: textTheme.headline6,
                            ),
                            Text(
                              slideBottomList[index].desc,
                              style: textTheme.bodyText2,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            slideBottomList[index].image,
                            height: 45,
                            width: 45,
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 0.5,
                      child: Container(
                        color: Colors.black38,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 20,
                          color: Color.fromRGBO(255, 221, 0, 1),
                        ),
//                        Image.asset(ims+'food/star.png',width: 20,height: 20,),
                        Text(slideBottomList[index].star.toString(),
                            style: textTheme.bodyText1),
                        Text(
                          ' (${slideBottomList[index].count})   ',
                          style: TextStyle(
                              color: Color.fromRGBO(150, 150, 150, 1)),
                        ),
                        Icon(
                          Icons.timer,
                          size: 20,
                          color: Color.fromRGBO(204, 204, 204, 1),
                        ),
                        Text(' ${slideBottomList[index].time}    ',
                            style: textTheme.bodyText1),
                        Icon(
                          Icons.monetization_on,
                          size: 20,
                          color: Color.fromRGBO(204, 204, 204, 1),
                        ),
                        Text('   ${slideBottomList[index].price}',
                            style: textTheme.bodyText1),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
