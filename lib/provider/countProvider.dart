import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int _count = 8;

  int get value => _count;

  void addCount() {
    _count++;
    print(12);
    notifyListeners();
  }
}