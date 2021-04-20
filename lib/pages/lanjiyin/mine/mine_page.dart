import 'package:doubanapp/constant/constant.dart';
import 'package:doubanapp/router.dart';
import 'package:doubanapp/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:doubanapp/widgets/title_bar.dart' as title;
import 'package:flutter/material.dart';

class MineHomePage extends StatefulWidget {
  @override
  _MineHomePageState createState() => _MineHomePageState();
}

class _MineHomePageState extends State<MineHomePage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 215,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: 215,
                    child: Image(
                      image: AssetImage(
                          "assets/images/bg_personal_header_blue.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/images/douban_film_list.png"),
                                ),
                              ),
                              margin: EdgeInsets.only(left: 15),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "逍遥才子",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Container(
                                    child: Text(
                                      "西医考研（专硕）     积分：652",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                    margin: EdgeInsets.only(top: 6),
                                  )
                                ],
                              ),
                              margin: EdgeInsets.only(top: 4, left: 13.5),
                            ),
                          ],
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 8,
                              child: LinearProgressIndicator(
                                value: .5,
                                backgroundColor: Color(0x66f5f5f5),
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              ),
                            ),
                          ),
                          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "距离考研还剩240天",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(""),
                                ),
                                Text(
                                  "修改资料  ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5.5,
                                  height: 11,
                                  child: Image(image: AssetImage(Constant.ASSETS_IMG+"arrow_right_white.png"),),
                                )

                              ],
                            ),
                          ),
                          margin: EdgeInsets.only(top: 21),
                        )
                      ],
                    ),
                    padding: EdgeInsets.only(top: 75),
                  ),
                  Positioned(
                    child: SizedBox(
                      child: Image(
                          image: AssetImage("assets/images/my_home_night.png")),
                      width: 16,
                      height: 17,
                    ),
                    top: 30,
                    right: 18,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 15, right: 15),
                    child: _getMineItem(0),
                  ),
                  _getSplitLine(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 15, right: 15),
                    child: _getMineItem(1),
                  ),
                  _getSplitLine(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 15, right: 15),
                    child: _getMineItem(2),
                  ),
                  _getSplitLine(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 15, right: 15),
                    child: _getMineItem(3),
                  ),
                  _getSplitLine(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 15, right: 15),
                    child: _getMineItem(4),
                  ),
                ],
              ),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 15, right: 15),
                    child: _getMineItem(5),
                  ),

                ],
              ),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 15, right: 15),
                    child: _getMineItem(6),
                  ),
                  _getSplitLine(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 15, right: 15),
                    child: _getMineItem(7),
                  ),
                  _getSplitLine(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 15, right: 15),
                    child: _getMineItem(8),
                  ),

                ],
              ),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
            )
          ],
        ),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(color: Color(0xfff8f8f8)),
      ),
    );
  }

  Widget _getSplitLine() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        width: double.infinity,
        height: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xffececec)),
        ),
      ),
    );
  }

  Widget _getMineItem(type) {
    List<Widget> list = [];
    switch (type) {
      case 0:
        list.add(SizedBox(
          width: 16,
          height: 16,
          child: Image(image: AssetImage(Constant.ASSETS_IMG+"icon_my_cupon.png"),),
        ));
        list.add(Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("优惠券"),
        ));
        break;
      case 1:
        list.add(SizedBox(
          width: 16,
          height: 16,
          child: Image(image: AssetImage(Constant.ASSETS_IMG+"my_home_message.png"),),
        ));
        list.add(Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("我的消息"),
        ));
        break;
      case 2:
        list.add(SizedBox(
          width: 16,
          height: 16,
          child: Image(image: AssetImage(Constant.ASSETS_IMG+"my_home_follow.png"),),
        ));
        list.add(Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("我的关注"),
        ));
        break;
      case 3:
        list.add(SizedBox(
          width: 16,
          height: 16,
          child: Image(image: AssetImage(Constant.ASSETS_IMG+"my_home_comment.png"),),
        ));
        list.add(Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("我的评论"),
        ));
        break;
      case 4:
        list.add(SizedBox(
          width: 16,
          height: 16,
          child: Image(image: AssetImage(Constant.ASSETS_IMG+"my_home_coll.png"),),
        ));
        list.add(Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("我的收藏"),
        ));
        break;
      case 5:
        list.add(SizedBox(
          width: 16,
          height: 16,
          child: Image(image: AssetImage(Constant.ASSETS_IMG+"my_home_order.png"),),
        ));
        list.add(Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("我的订单"),
        ));
        break;
      case 6:
        list.add(SizedBox(
          width: 16,
          height: 16,
          child: Image(image: AssetImage(Constant.ASSETS_IMG+"my_home_update.png"),),
        ));
        list.add(Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("版本更新"),
        ));
        break;
      case 7:
        list.add(SizedBox(
          width: 16,
          height: 16,
          child: Image(image: AssetImage(Constant.ASSETS_IMG+"my_home_setting.png"),),
        ));
        list.add(Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("设置"),
        ));
        break;
      case 8:
        list.add(SizedBox(
          width: 16,
          height: 16,
          child: Image(image: AssetImage(Constant.ASSETS_IMG+"my_home_customer.png"),),
        ));
        list.add(Container(
          margin: EdgeInsets.only(left: 10),
          child: Text("客服"),
        ));
        break;
    }
    list.add(Expanded(
      child: Text(""),
    ));
    list.add(SizedBox(
      width: 5.5,
      height: 11,
      child: Image(image: AssetImage(Constant.ASSETS_IMG+"icon_arrow_right.png"),),
    ));
    return Row(
      children: list,
    );
  }

  Widget _getBody() {
    return Container(
      child: Text("课程"),
    );
  }

  gotoDetail() {
    Router.push(context, Router.questionDetailPage,
        {'chapter_title': '第一章 生物化学', 'id': '1'});
  }
}
