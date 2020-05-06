import 'dart:developer';

import 'package:flutter/material.dart';
// import 'dart:ui';
import 'package:flutter_provider/view_model/product_model.dart';
import 'package:flutter_provider/widget/provider_widget/multil_provider.dart';
import 'package:flutter_provider/model/homeModel/product_model.dart';
import 'package:flutter_provider/widget/view_state_widget.dart';
import 'package:provider/provider.dart';


class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<ProductPage> with SingleTickerProviderStateMixin{

  ValueNotifier<int> _muneIndex;
  TabController tabController;

  


  @override
  void initState() {
    _muneIndex = ValueNotifier(0);
    // TODO: implement initState
    super.initState();
  }
   @override
  void dispose() {
    _muneIndex.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  ProviderWidget(
              model: ProductTopCare(),
              onModelReady:(model) {
                model.initData();
              },
              builder: (_,model,__) {
                if(model.isBusy) {
                  return ViewStateBusyWidget();
                }
                return ValueListenableProvider<int>.value(
                    value: _muneIndex,
                    child: DefaultTabController(
                            length: model.list.length,
                            initialIndex: _muneIndex.value,
                            child:
                              Builder(
                                builder: (context) {
                                  if(tabController == null) {
                                    tabController = DefaultTabController.of(context);
                                    tabController.addListener(() {
                                      print(tabController.index);
                                      _muneIndex.value = tabController.index;
                                    });
                                  }
                                return Scaffold(
                                    appBar: AppBar(
                                      title: Stack(
                                        children: <Widget>[
                                          DeomDownButtomWidget(topTypeList:model.list),
                                          Container(
                                            margin: const EdgeInsets.only(right: 25),
                                            color: Theme.of(context).primaryColor.withAlpha(100),
                                            child: TabBar(
                                                  tabs:List.generate(model.list.length, (index)=>Tab( text: model.list[index].name,)),
                                                  isScrollable: true,
                                                )
                                            )
                                        ],
                                      ),
                                    ),
                                  
                                    body: TabBarView(
                                      children: List.generate(model.list.length,
                                        (index) => Center(
                                          child: Text("${model.list[index].id}")
                                        ),
                                    ),
                                )

                              );
                                })
                 
                )
                ); 
              }
    );
}
}



class DeomDownButtomWidget extends StatelessWidget {
  // DeomDownButtomWidget():super();
  final List topTypeList;
  DeomDownButtomWidget({Key key, @required this.topTypeList}) : super(key: key);

  Widget _dropDownButtom (BuildContext context, { List typeList }) {
    int currentIndex = Provider.of<int>(context);
    var theme = Theme.of(context);
    var subhead = theme.primaryTextTheme.subhead;
    return Align(
             child:  Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Theme.of(context).primaryColor,
              ), 
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    elevation: 0,
                    value: currentIndex,
                    style: subhead,
                    items: List.generate(topTypeList.length,(index)=>DropdownMenuItem(value: index,child: Text("${topTypeList[index].name}",style: currentIndex == index
                        ? subhead.apply(
                            fontSizeFactor: 1.15,
                            color: theme.brightness == Brightness.light
                                ? Colors.white
                                : theme.accentColor)
                        : subhead.apply(color: subhead.color.withAlpha(200),)))),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    onChanged:(value) {
                      // print(index);
                      DefaultTabController.of(context).animateTo(value);
                    },
                    isExpanded: true,
                  ),
                ),
              ),
             alignment: Alignment(1.1, -1),
           );
  } 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _dropDownButtom(context);
  }
}


