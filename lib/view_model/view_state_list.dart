//页面需要上拉加载、下拉刷新的公共model


import 'package:flutter/material.dart';

abstract class ViewStateList<T> with ChangeNotifier {
  static 

  //当前页数量
  int _currentPage = 0;

  //页面数据
  List<T> list = [];

  //每页限制条数
  int _limit = 20;

  //get some data
  int get page => _currentPage;

  int get limit => _limit;
  

  //set data
  set setLimit(val) {
    _limit = val;
  }
  
  set setCurrentPage(val) {
    _currentPage = val;
  }

  initData() async{
    print('console home initdata');
    await refresh(init: true);
    // return "end initData";
  }
  

  //下拉刷新
  Future refresh({init: false}) async{
    var data = await loadData(isFirst:true);
    list.addAll(data);
    notifyListeners();
  }

//isFirst  判断是不是第一次加载
Future loadData({isFirst: false, limit: 15});

//上拉加载
Future loadMore() async{
  _currentPage++;
  List<T> data = await loadData();
  list.addAll(data);
         notifyListeners();

}

}
