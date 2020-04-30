import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_provider/model/homeModel/banner.dart';
import 'package:flutter_provider/api/home.dart';
import 'package:flutter_provider/model/homeModel/article.dart';
import 'package:flutter_provider/view_model/view_state_list.dart';


class HomeProvider extends ViewStateList {
    List<BannerData> _banners = [];

    //置顶列表
    List<Article> _topArticle = [];

    //正常列表
    List<Article> _article = [];



    //获取属性
    List<BannerData> get banners => _banners;
    List<Article> get topArticle => _topArticle;
    List<Article> get article => _article;




    @override
    Future loadData({isFirst: false, limit: 15}) async{
      List<Future> futrueList = [];
      setLimit = limit;
      if(isFirst) {
        futrueList.add(HomeApi.fetchBanners());
        futrueList.add(HomeApi.fetchTopArticles());
      }
      futrueList.add(HomeApi.fetchArticles(page));
      var data = await Future.wait(futrueList);
      print("this is data >>>$data");
      if(isFirst) {
         _banners = (data[0]);
        _topArticle = data[1];
        return data[2];
      } else {
       return data[0];
      }
    }

    //上拉加载
    // Future loadMore() async{
    //   setCurrentPage = page+1;
    //   loadData();
    // }

}