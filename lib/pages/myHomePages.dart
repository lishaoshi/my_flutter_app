import 'package:flutter/material.dart';
import 'package:flutter_provider/configs/resous_manege.dart';

//十六进制的倒计时数字
int maxCount = 0x3;
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _flutterLogo;
  AnimationController _bottomAnimated;
  //倒计时数字
  int _count = maxCount;
  @override
  void initState() {
    _flutterLogo = AnimationController(
      vsync: this, duration: Duration(milliseconds: 1500)
    );
    _bottomAnimated = AnimationController(
      vsync: this, duration: Duration(seconds: 4)
    );
    _bottomAnimated.forward();
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(curve: Curves.easeInOutBack, parent: _flutterLogo));
    _animation.addStatusListener((state){
      if(state == AnimationStatus.completed) {
        _flutterLogo.reverse();
      } else if(state == AnimationStatus.dismissed) {
        _flutterLogo.forward();
      }
    });
    _flutterLogo.forward();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              ImageHelper.wrapAssets('splash_bg.png'),
              fit: BoxFit.fill,
            ),
           
            AnimateFlutterLogo(animation: _animation,),
            Align(
              child: BottomAnimate(animation: _animation,),
              alignment: Alignment(0, 0.7),
            ),
            Align(
              child: RightNum(
                animation:StepTween(begin: 3,end: 0).animate(_bottomAnimated),
              ),
              alignment: Alignment(0.9, 0.96)
            )
          ]
      )
    );
  }
}



class AnimateFlutterLogo extends AnimatedWidget {
  AnimateFlutterLogo({key,  Animation<double> animation}):super(key:key, listenable: animation);
  // final Animation animation;
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable; 
    return AnimatedAlign(
       duration: Duration(milliseconds: 10),
      alignment: Alignment(0, 0.2+animation.value*0.3),
      curve: Curves.bounceIn,
      child: Image.asset(
        ImageHelper.wrapAssets('splash_flutter.png'),
        width: 280,
        height: 120,
      ),
    );
  }
}


//底部的动画
class BottomAnimate extends AnimatedWidget {
  BottomAnimate({key, Animation<double> animation}):super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          ImageHelper.wrapAssets('splash_fun.png'),
          width: 140 * animation.value,
          height: 80 * animation.value,
        ),
        Image.asset(
          ImageHelper.wrapAssets('splash_android.png'),
          width: 200 * (1 - animation.value),
          height: 80 * (1 - animation.value),
        ),
      ],
    );
  }
}

//右边倒计时
class RightNum extends AnimatedWidget {
  RightNum({key, Animation<int> this.animation}):super(key: key, listenable: animation){

  }
  final Animation<int> animation;
  @override
  Widget build(BuildContext context) {
    
    var value = animation.value;
    return Container(
     padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
     decoration: BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.all(Radius.circular(16.0))
     ),
      child: Text(
      '${value}秒 | 跳过',
      style: TextStyle(
        color: Colors.white
      )
    ),
    );
  }
}