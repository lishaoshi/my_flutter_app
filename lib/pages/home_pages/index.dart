import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_provider/pages/home_pages/home_page.dart';


class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex = 0;
  PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body:PageView.builder(
        itemBuilder: (context, index){
          return HomePage();
        },
        itemCount: 5,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text('项目'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            title: Text('公众号'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_split),
            title: Text('体系'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_emoticon),
            title: Text('我的'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
        },
      ),
    );
  }
}