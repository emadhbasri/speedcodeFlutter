import 'package:flutter/material.dart';
import '../../../functions.dart';
import '../dataTypes.dart';
import '../State/MyState.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout(this.model);
  final MyState model;

  @override
  _LoginLayoutState createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout>
    with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  String _password = '';
  String _email = '';
  AnimationController _controller;
  Animation<double> _sizeAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _sizeAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: _controller,
    );

    _sizeAnimation.addListener(() {
      setState(() {
        statusSet();
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              print(doubleHeight(55));
            },
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: doubleHeight(5),
          ),
          Text('EMAIL',
              style: TextStyle(color: Color.fromRGBO(120, 120, 120, 1),fontSize: doubleHeight(1.5))),
          SizedBox(
            height: doubleHeight(0.5),
          ),
          SizedBox(
            height: doubleHeight(7),
            child: TextField(
              onChanged: (e) {
                _email = e;
                checkDone();
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: doubleHeight(3),
          ),
          Text('PASSWORD',
              style: TextStyle(color: Color.fromRGBO(120, 120, 120, 1),fontSize: doubleHeight(1.5))),
          SizedBox(
            height: doubleHeight(0.5),
          ),
          SizedBox(
            height: doubleHeight(7),
            child: TextField(
              onChanged: (e) {
                _password = e;
                checkDone();
              },
              obscureText: _obscureText,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          size: 17,
                        ),
                        SizedBox(width: doubleWidth(1)),
                        Text('show'),
                        SizedBox(width: doubleWidth(1)),
                      ],
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: doubleHeight(1.5),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forget Password?',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: doubleHeight(1.5),
              ),
            ),
          ),
          SizedBox(
            height: _sizeAnimation.value==0?0:doubleHeight(1),
          ),
          _sizeAnimation.value==0?SizedBox():Align(
            alignment: Alignment.center,
            child: SizeTransition(
              sizeFactor: _sizeAnimation,
              axis: Axis.horizontal,
              child: GestureDetector(
                onTap: () {
                  widget.model.type = LogSign.login;
                  widget.model.email = _email;
                  widget.model.password = _password;
                  widget.model.incrementPage();
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: doubleHeight(2.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkDone() {
    if (_password.trim() != '' && _email.trim() != '') {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

}
