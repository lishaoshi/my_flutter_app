import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/provider/countProvider.dart';
import 'package:flutter_provider/pages/splash_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider/configs/router_config.dart';

void main(){
  Provider.debugCheckInvalidValueType = null;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
  runApp(MyApp());
    
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SplashPage(),
      initialRoute: RoutersName.splash,
      onGenerateRoute: Routers.generatorRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}