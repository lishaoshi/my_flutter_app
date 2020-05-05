//页面需要上拉加载、下拉刷新的公共model


// import 'package:flutter/material.dart';
// import 'package:flutter_provider/provider/view_state_model.dart';
import './view_state_model.dart';

abstract class ViewStateList<T> extends ViewStateModel {
  // static 

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
    await refresh(init: true);
  }
  

  //下拉刷新
  Future refresh({init: false}) async{
    setBusy();
    try {
       var data = await loadData(isFirst:true);
      list.clear();
      list.addAll(data);
      setIdle();
      print('请求完成');
    } catch(e, s) {
      if(init)list.clear();
      setError(e, s);
    }
    notifyListeners();
   
    // notifyListeners();
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
