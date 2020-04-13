import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/home_pages/home_page.dart';


//一些pages
import 'package:flutter_provider/pages/home_pages/index.dart';
import 'package:flutter_provider/pages/splash_page.dart';
import 'package:flutter_provider/router_page_build.dart/index.dart';



class RoutersName {
  RoutersName();
  static const String home = "/home";
  static const String splash = "/";
}


class Routers {

  static Route<dynamic> generatorRoute(RouteSettings settings) {
    switch(settings.name) {
      case RoutersName.splash:
        return NoAnimRouteBuilder(SplashPage());
      case RoutersName.home:
        return NoAnimRouteBuilder(HomePage());
    }
  }

}


//路由跳转类
class RouterNavigator {
  static pushName(BuildContext context,  String name, String agr) {
    Navigator.of(context).pushNamed(name, arguments: agr);
  }

  static pushReplaceName(BuildContext context, String name, String agr) {
     Navigator.of(context).pushReplacementNamed(name, arguments: agr);
  }
}