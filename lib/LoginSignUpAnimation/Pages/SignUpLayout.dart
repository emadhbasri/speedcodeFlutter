import 'package:flutter/material.dart';
import '../../../functions.dart';
import '../dataTypes.dart';
import '../State/MyState.dart';

class SignUpLayout extends StatefulWidget {
  final MyState model;
  final Animation<double> controller;
  const SignUpLayout(this.model, this.controller);
  @override
  _SignUpLayoutState createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout>
    with SingleTickerProviderStateMixin {
  bool _obscureText = true;
  String _password = '';
  String _email = '';
  String _rePassword = '';
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
          Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: doubleHeight(3),
          ),
          Text('EMAIL',
              style: TextStyle(
                  color: Color.fromRGBO(120, 120, 120, 1), fontSize: doubleHeight(1.5))),
          SizedBox(
            height: doubleHeight(0.5),
          ),
          SizedBox(
            height: doubleHeight(8),
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
            height: doubleHeight(2),
          ),
          Text('PASSWORD',
              style: TextStyle(
                  color: Color.fromRGBO(120, 120, 120, 1), fontSize: doubleHeight(1.5))),
          SizedBox(
            height: doubleHeight(0.5),
          ),
          SizedBox(
            height: doubleHeight(8),
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
            height: doubleHeight(2),
          ),
          Text('RE-ENTER PASSWORD',
              style: TextStyle(
                  color: Color.fromRGBO(120, 120, 120, 1), fontSize: doubleHeight(1.5))),
          SizedBox(
            height: doubleHeight(0.5),
          ),
          SizedBox(
            height: doubleHeight(8),
            child: TextField(
              onChanged: (e) {
                _rePassword = e;
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
            height: doubleHeight(2),
          ),
          Align(
            alignment: Alignment.center,
            child: widget.controller.value == 0.0
                ? Container(
                    width: double.maxFinite,
                    child: Text(
                      'SIGN UP',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: doubleHeight(2.5)),

                    ))
                : SizeTransition(
                  sizeFactor: _sizeAnimation,
                  axis: Axis.horizontal,
                  child: GestureDetector(
                    onTap: () async {
                      widget.model.type = LogSign.signUp;
                      widget.model.email = _email;
                      widget.model.password = _password;
                      widget.model.incrementPage();
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: doubleHeight(2.5)),
                    ),
                  ),
                ),
          )
        ],
      ),
    );
  }


  void checkDone() {
    if (_password.trim() != '' &&
        _password == _rePassword &&
        _email.trim() != '') {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}
