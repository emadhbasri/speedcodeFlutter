import 'package:flutter/material.dart';
import '../../functions.dart';
import 'Pages/LoginLayout.dart';
import 'Pages/SignUpLayout.dart';
import 'dataTypes.dart';
import 'package:provider/provider.dart';
import 'State/MyState.dart';

class MyAnimatedWidget extends AnimatedWidget {
  final List<Animation<double>> animations;
  final Animation<double> controller;
  final bool isLogin;
  const MyAnimatedWidget(
      {Key key,
      @required this.controller,
      @required this.animations,
      @required this.isLogin})
      : super(key: key, listenable: controller);

  Widget build(BuildContext context) {
    Animation<double> width = animations[0];
    Animation<double> height = animations[1];
    Animation<double> radius = animations[2];
    MyState model = Provider.of<MyState>(context);
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, //isLogin?Colors.white:Colors.transparent
            borderRadius: BorderRadius.circular(radius.value)),
        width: width.value,
        height: height.value,
        padding: EdgeInsets.symmetric(vertical: doubleHeight(3), horizontal: doubleWidth(5)),
        child: isLogin ? LoginLayout(model) : SignUpLayout(model, controller));
  }
}
