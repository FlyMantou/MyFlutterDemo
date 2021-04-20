import 'package:doubanapp/bean/shop_tab_item_bean.dart';
import 'package:doubanapp/http/API.dart';
import 'package:doubanapp/pages/lanjiyin/shop/shop_tab_bar_widget.dart';
import 'package:doubanapp/router.dart';
import 'package:doubanapp/widgets/loading_widget.dart';
import 'package:doubanapp/widgets/my_tab_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:doubanapp/widgets/title_bar.dart' as title;
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ShopHomePage extends StatefulWidget {
  @override
  _ShopHomePageState createState() => _ShopHomePageState();

}
List<Widget> tabList;
TabController _tabController;
class _ShopHomePageState extends State<ShopHomePage>  with SingleTickerProviderStateMixin {
  bool loading = false;
  var tabBar;

  List<ShopTabItemBean> dataList = [];
  var api = API();
  @override
  Widget build(BuildContext context) {
    return title.TitleBar(
      title: "商城",
      padding: const EdgeInsets.all(0.0),
      body: LoadingWidget.containerLoadingBody(
        _getBody(),
        loading: loading,
      ),
      isBackShow: false,
      titleColor: Color(0xff3982f7),
      backgroundColor: Color(0xff3982f7),
    );
  }


  @override
  void initState() {
    super.initState();
    tabBar = HomePageTabBar();
    api.getShopList((data){
      print("huanghai-->${data.length}");
      setState(() {
        dataList = data;
      });
      tabList = getTabList();
      print("huanghai tablist-->${tabList.length}");
      _tabController = TabController(vsync: this, length: tabList.length);
    });

  }

  List<Widget> getTabList() {
    print("huanghai-->${dataList.length}");
    return dataList
        .map((item) => Text(
      '${item.cateName}',
      style: TextStyle(fontSize: 15),
    ))
        .toList();
  }

  Widget _getBody() {
    if(dataList.length>0){
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: DefaultTabController(
                length: tabList.length, child: _getNestedScrollView(tabBar))),
      );
    }else{
      return Container(
        color: Colors.white,
        child: Text("加载中"));
    }

  }


  Widget _getNestedScrollView(Widget tabBar) {
    String hintText = '用一部电影来形容你的2018';
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: _SliverAppBarDelegate(
                    maxHeight: 49.0,
                    minHeight: 49.0,
                    child: Container(
                      color: Colors.white,
                      child: tabBar,
                    )))
          ];
        },
        body: ShopTabBarView(
          tabController: _tabController,
          dataList: dataList,
        ));
  }

  gotoDetail() {
    Router.push(context, Router.questionDetailPage, {'chapter_title':'第一章 生物化学','id':'1'});
  }
}

class HomePageTabBar extends StatefulWidget {
  HomePageTabBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageTabBarState();
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max((minHeight ?? kToolbarHeight), minExtent);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _HomePageTabBarState extends State<HomePageTabBar> {
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;

  @override
  void initState() {
    super.initState();
    selectColor = Colors.black;
    unselectedColor = Color.fromARGB(255, 117, 117, 117);
    selectStyle = TextStyle(fontSize: 18, color: selectColor);
    unselectedStyle = TextStyle(fontSize: 18, color: selectColor);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Tab小部件列表
//    List<Widget>  @required this.tabs,
    //组件选中以及动画的状态
//   TabController this.controller,
    //Tab是否可滑动(false->整个tab会把宽度填满，true-> tab包裹)
//  bool  this.isScrollable = false,
    //选项卡下方的导航条的颜色
//   Color this.indicatorColor,
    //选项卡下方的导航条的线条粗细
//   double this.indicatorWeight = 2.0,
//  EdgeInsetsGeometry  this.indicatorPadding = EdgeInsets.zero,
//   Decoration this.indicator,
//   TabBarIndicatorSize this.indicatorSize,导航条的长度，（tab：默认等分；label：跟标签长度一致）
//  Color  this.labelColor,所选标签标签的颜色
//  TextStyle  this.labelStyle,所选标签标签的文本样式
//  EdgeInsetsGeometry  this.labelPadding,,所选标签标签的内边距
// Color   this.unselectedLabelColor,未选定标签标签的颜色
//  TextStyle  this.unselectedLabelStyle,未选中标签标签的文字样式
//   void Function(T value) this.onTap,按下时的响应事件

    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TabBar(
        tabs: tabList,
        isScrollable: true,
        controller: _tabController,
        indicatorColor: selectColor,
        labelColor: selectColor,
        labelStyle: selectStyle,
        unselectedLabelColor: unselectedColor,
        unselectedLabelStyle: unselectedStyle,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}