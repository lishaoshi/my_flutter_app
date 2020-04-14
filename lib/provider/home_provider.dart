import 'package:flutter/material.dart';
import 'package:flutter_provider/model/banner.dart';
import 'package:flutter_provider/api/home.dart';


class HomeProvider with ChangeNotifier {
    List<BannerData> _banners = [];


    void homeInitData() async{
      List<Future> futrueList = [HomeApi.fetchBanners()];
      var data = await Future.wait(futrueList);
      print(data);
    }

}