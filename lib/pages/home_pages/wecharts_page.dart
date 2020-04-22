import 'package:flutter/material.dart';


class WechartsPage extends StatefulWidget {
  WechartsPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<WechartsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('my WechartsPage page!'),
      ),
    );
  }
}