import 'package:flutter/material.dart';


class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('my ProductPage page!'),
      ),
    );
  }
}