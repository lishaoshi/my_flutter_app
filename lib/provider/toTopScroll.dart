import 'package:flutter/material.dart';



class ToTopScroll with ChangeNotifier {


  ScrollController _scrollController = ScrollController();

  //设置滚动高度来显示banner
  double _height;

  double get height => _height;

  //是否显示banner
  bool showAppBar = false;

  ToTopScroll({double height=120}) {
    _height = height;
  }

  ScrollController get controller => _scrollController;

   initPage() {
      _scrollController.addListener((){
        if(_scrollController.offset > height && !showAppBar) {
          showAppBar = true;
          notifyListeners();
        } else if(_scrollController.offset < height && showAppBar) {
          showAppBar = false;
          notifyListeners();
        }
      });
    }

    add() {
      showAppBar = !showAppBar;
      notifyListeners();
    }







}