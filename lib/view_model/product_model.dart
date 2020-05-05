import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/view_model/view_state_list.dart';
import 'package:flutter_provider/view_model/view_state_model.dart';
import 'package:flutter_provider/model/homeModel/product_model.dart';
import 'package:flutter_provider/api/home.dart';


class ProductTopCare extends ViewStateList {

  @override
  Future loadData({isFirst: false, limit: 15}) async{
    List<Tree> data = [];
    data = await HomeApi.fetchProjectCategories();
    print("data is >> $data");
    debugger();
    return data;
  }
}

