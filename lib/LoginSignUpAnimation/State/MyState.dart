import 'package:flutter/material.dart';
import '../dataTypes.dart';

class MyState extends ChangeNotifier {
  LogSign type;
  String username = '';
  String email = '';
  String password = '';

  int page = 0;
  void incrementPage() {
    page++;
    notifyListeners();
  }

  void decrementPage() {
    page--;
    notifyListeners();
  }
}
