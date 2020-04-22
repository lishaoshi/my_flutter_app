import 'package:flutter/material.dart';


class TixiPage extends StatefulWidget {
  TixiPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<TixiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('my tixi page!'),
      ),
    );
  }
}