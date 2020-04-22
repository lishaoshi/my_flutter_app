import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider/provider/countProvider.dart';
import 'package:flutter_provider/pages/splash_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider/configs/router_config.dart';
import 'package:flutter_provider/provider/global_provider.dart';
import 'package:flutter_provider/provider/theme_provider.dart';

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
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeModel>(
        builder: (_, themeProvider, child) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: themeProvider.themeData(),
              darkTheme: themeProvider.themeData(platformDarkModel: true),
              initialRoute: RoutersName.splash,
              onGenerateRoute: Routers.generatorRoute,
              debugShowCheckedModeBanner: false,
            );
        },
      )
    );
  }
}