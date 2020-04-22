//页面需要上拉加载、下拉刷新的公共model


import 'package:flutter/material.dart';

abstract class ViewStateList with ChangeNotifier {
  static 

  //当前页数量
  int _currentPage = 0;

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
    await refresh(init: true);
  }

  //下拉刷新
  Future refresh({init: false}) async{
    await loadData(isFirst:true);
  }

//isFirst  判断是不是第一次加载
Future loadData({isFirst: false, limit: 15});

}
