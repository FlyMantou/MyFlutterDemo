import 'package:doubanapp/pages/lanjiyin/home/home_page.dart';
import 'package:doubanapp/pages/lanjiyin/shop/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:doubanapp/pages/group/group_page.dart';
import 'package:doubanapp/pages/movie/book_audio_video_page.dart';
import 'package:doubanapp/pages/person/person_center_page.dart';
import 'package:doubanapp/pages/shop_page.dart';

import 'home/home_page.dart';
import 'lanjiyin/course/course_page.dart';
import 'lanjiyin/forum/forum_page.dart';
import 'lanjiyin/mine/mine_page.dart';

///这个页面是作为整个APP的最外层的容器，以Tab为基础控制每个item的显示与隐藏
class ContainerPage extends StatefulWidget {
  ContainerPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

class _ContainerPageState extends State<ContainerPage> {
  final ShopPageWidget shopPageWidget = ShopPageWidget();
  List<Widget> pages;

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  final itemNames = [
    _Item(
      '题库',
      'assets/images/tiku_tab_selected_icon.png',
      'assets/images/tiku_tab_unselected_icon.png',
    ),
    _Item(
      '课程',
      'assets/images/course_tab_selected_icon.png',
      'assets/images/course_tab_unselected_icon.png',
    ),
    _Item(
      '论坛',
      'assets/images/forun_tab_selected_icon.png',
      'assets/images/forum_tab_unselected_icon.png',
    ),
    _Item(
      '商城',
      'assets/images/find_tab_selected_icon.png',
      'assets/images/find_tab_unselect_icon.png',
    ),
    _Item(
      '我的',
      'assets/images/person_tab_selected_icon.png',
      'assets/images/person_tab_unselected_icon.png',
    )
  ];

  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();
    print('initState _ContainerPageState');
    if (pages == null) {
      pages = [
        TiKuHomePage(),
        CourseHomePage(),
        ForumHomePage(),
        ShopHomePage(),
        MineHomePage()
      ];
    }
    if (itemList == null) {
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
              icon: Image.asset(
                item.normalIcon,
                width: 20.0,
                height: 20.0,
              ),
              title: Text(
                item.name,
                style: TextStyle(fontSize: 12.0),
              ),
              activeIcon:
                  Image.asset(item.activeIcon, width: 20.0, height: 20.0)))
          .toList();
    }
  }

  int _selectIndex = 0;

//Stack（层叠布局）+Offstage组合,解决状态被重置的问题
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  void didUpdateWidget(ContainerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
//    Scaffold({
//    Key key,
//    this.appBar,
//    this.body,
//    this.floatingActionButton,
//    this.floatingActionButtonLocation,
//    this.floatingActionButtonAnimator,
//    this.persistentFooterButtons,
//    this.drawer,
//    this.endDrawer,
//    this.bottomNavigationBar,
//    this.bottomSheet,
//    this.backgroundColor,
//    this.resizeToAvoidBottomPadding = true,
//    this.primary = true,
//    })
    print('build _ContainerPageState');
    return Scaffold(
      body: new Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
          _getPagesWidget(4),
        ],
      ),
//        List<BottomNavigationBarItem>
//        @required this.icon,
//    this.title,
//    Widget activeIcon,
//    this.backgroundColor,
//       backgroundColor: Color.fromARGB(255, 248, 248, 248),
      backgroundColor: Color(0xff3982f7),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          ///这里根据点击的index来显示，非index的page均隐藏
          setState(() {
            _selectIndex = index;
            //这个是用来控制比较特别的shopPage中WebView不能动态隐藏的问题
            shopPageWidget
                .setShowState(pages.indexOf(shopPageWidget) == _selectIndex);
          });
        },
        //图标大小
        iconSize: 24,
        //当前选中的索引
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        fixedColor: Color(0xff3982f7),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
      ),
    );
  }
}
