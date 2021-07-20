import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppState.dart';

import 'package:speedcode_flutter/functions.dart';

import '../model.dart';
import 'CategoryItem.dart';


// class CategoryBar1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: double.maxFinite,
//         height: doubleHeight(14),
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.centerRight,
//               child: Container(
//                 width: doubleWidth(95),
//                 height: double.maxFinite,
//                 decoration: BoxDecoration(
//                     color: Color.fromRGBO(247, 218, 204, 1),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(100),
//                       topLeft: Radius.circular(100),
//                     )),
//               ),
//             ),
//             Stack(
//                 children: itemMaker1([
//                   Category('All', 'assets/images/FullAnimationUiCake/assiani.png'),
//                   Category('Burgers', 'assets/images/FullAnimationUiCake/burgeri.png'),
//                   Category('Pizza', 'assets/images/FullAnimationUiCake/breakfasti.png'),
//                   Category('Desert', 'assets/images/FullAnimationUiCake/chicken_legi.png')
//                 ])),
//           ],
//         ));
//   }
//
//
// }

class CategoryBar extends StatefulWidget {
  final bool isTemp;
  final Function doIt;
  const CategoryBar({Key key, this.doIt, this.isTemp}) : super(key: key);
  @override
  _CategoryBarState createState() => _CategoryBarState();
}
class _CategoryBarState extends State<CategoryBar>
    with TickerProviderStateMixin {
  bool isWorking=false;
  AnimationController _controllerRight;
  AnimationController _controllerMiddleLeft;
  AnimationController _controllerMiddleRight;
  AnimationController _controllerLeft;
  @override
  void initState() {
    super.initState();

    if (!widget.isTemp) {
      _controllerRight = AnimationController(
          vsync: this, value: 0, duration: Duration(seconds: 1));
      _controllerMiddleRight = AnimationController(
          vsync: this, value: 0, duration: Duration(seconds: 1));
      _controllerMiddleLeft = AnimationController(
          vsync: this, value: 0, duration: Duration(seconds: 1));
      _controllerLeft = AnimationController(
          vsync: this, value: 0, duration: Duration(seconds: 1));
    }
  }

  bool isLeft = true;
  List<Widget> itemMaker(List<Category> category, context) {
    print('itemMaker');
    AppState state = Provider.of<AppState>(context, listen: false);

    List<CategoryType> cate = [
      CategoryType.All,
      CategoryType.Burgers,
      CategoryType.Pizza,
      CategoryType.Desert,
    ];

    List<Alignment> alRight = [
      Alignment(1.5, 0),
      Alignment(2.03, 0),
      Alignment(2.56, 0),
      Alignment(3.1, 0),
    ];
    List<Alignment> alMiddle = [
      Alignment(-0.8, 0),
      Alignment(-0.27, 0),
      Alignment(0.26, 0),
      Alignment(0.8, 0),
    ];
    List<Alignment> alLeft = [
      Alignment(-3.1, 0),
      Alignment(-2.57, 0),
      Alignment(-2.04, 0),
      Alignment(-1.5, 0),
    ];

    List<Interval> inter = [
      Interval(0, 1, curve: Curves.easeOutQuad),
      Interval(0.2, 1, curve: Curves.easeOutQuad),
      Interval(0.4, 1, curve: Curves.easeOutQuad),
      Interval(0.8, 1, curve: Curves.easeOutQuad),
    ];
    List<Interval> interRev = [
      Interval(0.8, 1, curve: Curves.easeOutQuad),
      Interval(0.4, 1, curve: Curves.easeOutQuad),
      Interval(0.2, 1, curve: Curves.easeOutQuad),
      Interval(0, 1, curve: Curves.easeOutQuad),
    ];

    List<Widget> out = [];
    for (int j = 0; j < 4; j++) {
      Function doIt = () {
        state.setCategoryType(cate[j]);
        widget.doIt();
      };

      ///right
      out.add(CategoryItem(
          controller: _controllerRight,
          doIt: doIt,
          image: category[j].image,
          selected: cate[j] == state.categoryType,
          interval: inter[j],
          name: category[j].name,
          tween: AlignmentTween(begin: alRight[j], end: alMiddle[j])));

      ///middleRight
      if (isLeft)
        out.add(CategoryItem(
            selected: cate[j] == state.categoryType,
            doIt: doIt,
            name: category[j].name,
            image: category[j].image,
            interval: Interval(0.0, 0.5, curve: Curves.linear),
            controller: _controllerMiddleRight,
            tween: AlignmentTween(begin: alMiddle[j], end: alRight[j])));

      ///middleLeft
      if (!isLeft)
        out.add(CategoryItem(
            selected: cate[j] == state.categoryType,
            doIt: doIt,
            name: category[j].name,
            image: category[j].image,
            interval: Interval(0.0, 0.5, curve: Curves.linear),
            controller: _controllerMiddleLeft,
            tween: AlignmentTween(begin: alMiddle[j], end: alLeft[j])));

      ///left
      out.add(CategoryItem(
          selected: cate[j] == state.categoryType,
          doIt: doIt,
          name: category[j].name,
          image: category[j].image,
          interval: interRev[j],
          controller: _controllerLeft,
          tween: AlignmentTween(begin: alLeft[j], end: alMiddle[j])));
    }
    return out;
  }
  List<Widget> itemMaker1(List<Category> category) {
    List<Alignment> alMiddle = [
      Alignment(-0.8, 0),
      Alignment(-0.27, 0),
      Alignment(0.26, 0),
      Alignment(0.8, 0),
    ];

    List<Widget> out = [];
    for (int j = 0; j < 4; j++) {
      out.add(CategoryItem(
          image: category[j].image,
          selected: j == 0,
          name: category[j].name,
          alignment: alMiddle[j]));
    }
    return out;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: doubleHeight(14),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: doubleWidth(95),
                height: double.maxFinite,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 218, 204, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      topLeft: Radius.circular(100),
                    )),
              ),
            ),
            if(!widget.isTemp)
            Stack(
                children: itemMaker([
                  Category('All', 'assets/images/FullAnimationUiCake/assiani.png'),
                  Category('Burgers', 'assets/images/FullAnimationUiCake/burgeri.png'),
                  Category('Pizza', 'assets/images/FullAnimationUiCake/breakfasti.png'),
                  Category('Desert', 'assets/images/FullAnimationUiCake/chicken_legi.png')
                ], context))
            else
              Stack(
                  children: itemMaker1([
                    Category('All', 'assets/images/FullAnimationUiCake/assiani.png'),
                    Category('Burgers', 'assets/images/FullAnimationUiCake/burgeri.png'),
                    Category('Pizza', 'assets/images/FullAnimationUiCake/breakfasti.png'),
                    Category('Desert', 'assets/images/FullAnimationUiCake/chicken_legi.png')
                  ])),
            if(!widget.isTemp)
            GestureDetectorHorizontal(
              onLeft: () async {
                // print('')
                if(isWorking)return;
                isWorking=true;
                setState(() {
                  isLeft = false;
                });
                _controllerMiddleLeft.forward();
                await Future.delayed(Duration(milliseconds: 100));
                setState(() {});
                _controllerRight.forward().then((value) {
                  _controllerRight.value = 0;
                  _controllerMiddleLeft.value = 0;
                  _controllerMiddleRight.value = 0;
                  _controllerLeft.value = 0;
                  isWorking=false;
                });

              },
              onRight: () async {
                if(isWorking)return;
                isWorking=true;
                setState(() {
                  isLeft = true;
                });
                _controllerMiddleRight.forward();
                await Future.delayed(Duration(milliseconds: 100));
                _controllerLeft.forward().then((value) {
                  _controllerRight.value = 0;
                  _controllerMiddleLeft.value = 0;
                  _controllerMiddleRight.value = 0;
                  _controllerLeft.value = 0;
                  isWorking=false;
                });

              },
            )
          ],
        ));
  }
}