import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcode/functions.dart';

class TestNav extends StatefulWidget {
  const TestNav({Key key}) : super(key: key);

  @override
  _TestNavState createState() =>
      _TestNavState();
}

class _TestNavState
    extends State<TestNav> {
  bool cc = true;
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<AppState>(
      create: (context) => AppState(),
      child: Consumer<AppState>(
        builder: (context, state, child) => Scaffold(
            appBar: AppBar(),
            backgroundColor: Colors.white,
            body: Stack(
              children: [

                     Align(
                       alignment: state.boxIsLeft?Alignment.topLeft:Alignment.topRight,
                       child: GestureDetector(
                          onTap: () async {
                            Go.push(context, Modal(
                              appState: state,
                            ),isModal: true);
//
                          },
                          child: Hero(
                            tag: 'test',
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                     )


              ],
            )),
      ),
    );
  }
}

class Modal extends StatelessWidget {
  final AppState appState;
  const Modal({Key key, this.appState}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<AppState>(
      create: (context) => appState,
      child: Consumer<AppState>(
          builder: (context, state, child) => Scaffold(
              backgroundColor: Colors.transparent.withOpacity(0.1),
              appBar: AppBar(),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200),
                  GestureDetector(
                    onTap: (){
                      print('doIt');
                      print('state $state');
                      state.boxIsLeft=!state.boxIsLeft;
                      state.notify();
                    },
                    child: Hero(
                      tag: 'test',
                      child: Container(
                        width: 150,
                        height: 150,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}

class AppState extends ChangeNotifier {
  notify() => notifyListeners();
  bool boxIsLeft = true;
}
