import 'dart:developer';

import 'package:flutter_provider/dio/dio_config.dart';
import 'package:flutter_provider/model/homeModel/banner.dart';
import 'package:flutter_provider/model/homeModel/article.dart';



class HomeApi {
  // 轮播
  static Future fetchBanners() async {
    var response = await http.get('banner/json');
    return response.data
        .map<BannerData>((item) => BannerData.fromJsonMap(item))
        .toList();
  }

  // 置顶文章
  static Future fetchTopArticles() async {
    var response = await http.get('article/top/json');
    return response.data.map<Article>((item) => Article.fromMap(item)).toList();
  }

  // 文章
  static Future fetchArticles(int pageNum, {int cid}) async {
    await Future.delayed(Duration(seconds: 1)); //增加动效
    var response = await http.get('article/list/$pageNum/json',
        queryParameters: (cid != null ? {'cid': cid} : null));
    return response.data['datas']
        .map<Article>((item) => Article.fromMap(item))
        .toList();
  }
}