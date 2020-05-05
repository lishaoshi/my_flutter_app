import 'dart:developer';

import 'package:flutter/material.dart';
// import 'dart:ui';
import 'package:flutter_provider/view_model/product_model.dart';
import 'package:flutter_provider/widget/provider_widget/multil_provider.dart';
import 'package:flutter_provider/model/homeModel/product_model.dart';
import 'package:flutter_provider/widget/view_state_widget.dart';


class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<ProductPage> with SingleTickerProviderStateMixin{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => null;
  var _tab = [
    Tab(text:"类型1"),
   Tab(text:"类型二"),
    Tab(text:"类型三"),
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
    print(12);
    return  ProviderWidget(
              model: ProductTopCare(),
              onModelReady:(model) {
                model.initData();
              },
              builder: (_,model,__) {
                if(model.isBusy) {
                  return ViewStateBusyWidget();
                }
                List<Tree> treeList = model.list;
                return Builder(
                  builder: (_)=>Scaffold(
                    appBar: AppBar(
                      title: Stack(
                        children: <Widget>[
                          DeomDownButtomWidget(topTypeList:model.list),
                          Container(
                            margin: const EdgeInsets.only(right: 25),
                            child: TabBar(
                              tabs:List.generate(treeList.length, (index)=>Tab( text: treeList[index].name,)),
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
                  ),
                );
                 
              },
            );
  }
}



class DeomDownButtomWidget extends StatelessWidget {
  // DeomDownButtomWidget():super();
  final List topTypeList;
    DeomDownButtomWidget({Key key, @required this.topTypeList}) : super(key: key);

  Widget _dropDownButtom (BuildContext context, { List typeList }) {
    return Align(
             alignment: Alignment(0, 0),
             child:  Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Theme.of(context).primaryColor,
              ), 
              child:DropdownButtonHideUnderline(
                child: DropdownButton(
                  // value: dropdownValue,
                  elevation: 0,
                  focusColor: Colors.blue,
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
           );
  } 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _dropDownButtom(context);
  }
}


