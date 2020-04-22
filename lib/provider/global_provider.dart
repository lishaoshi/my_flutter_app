import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/toTopScroll.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import './home_provider.dart';
import './theme_provider.dart';

//平台依赖的provider 
List<SingleChildWidget> platformProvider = [
  ChangeNotifierProvider(create: (context)=>ThemeModel(),),
];

List<SingleChildWidget> providers = [
  // ChangeNotifierProvider(create: (context)=>HomeProvider(),),
  // ChangeNotifierProvider(create: (context)=>ToTopScroll(),),
  ...platformProvider,
];



