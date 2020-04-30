import 'package:flutter/material.dart';
import 'dart:ui';


class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<ProductPage> with TickerProviderStateMixin {
  var _tab = [
    Tab(text:"sdfsgdfggh"),
   Tab(text:"tasdfsdfb2"),
    Tab(text:"ssdfsdgdfg"),
    Tab(text:"tasfdsdfsdfb3"),
    Tab(text:"tab5sdfsdfd")
  ];
  TabController _tabController;
  String dropdownValue ="One";


  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      vsync: this,
      length: 5
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
             Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.red,
                ), 
                child:DropdownButtonHideUnderline(
                  child: DropdownButton(
                    // value: dropdownValue,
                    elevation: 0,
                    // disabledHint: Text("qweqwe"),
                    // isDense: false,
                    underline: Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    // disabled: true,
                    style: Theme.of(context).primaryTextTheme.subtitle,
                    items: <DropdownMenuItem>[
                      DropdownMenuItem(
                        value: "One",
                        child: Text("类型一"),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Text("类型二",),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Text("类型三"),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Text("类型四"),
                      ),
                    ],
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    onChanged:(index) {
                      print(index);
                    },
                    isExpanded: true
                  ),
                ),
              ),
            Container(
              margin: const EdgeInsets.only(right: 25),
              child: TabBar(
                tabs: _tab,
                controller: _tabController,
                isScrollable: true,
              
              )
            ),
           
            
          ],
        ),
      ),
      body: Center(
        child: Text('my ProductPage page!'),
      ),
    );
  }
}