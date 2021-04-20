import 'package:doubanapp/bean/home_item_bean.dart';
import 'package:doubanapp/http/API.dart';
import 'package:doubanapp/router.dart';
import 'package:doubanapp/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:doubanapp/widgets/title_bar.dart' as title;
import 'package:flutter/material.dart';

class TiKuHomePage extends StatefulWidget {
  @override
  _TiKuHomePageState createState() => _TiKuHomePageState();
}

class _TiKuHomePageState extends State<TiKuHomePage> {
  bool loading = false;
  var api = API();
  List<HomeItemBean> dataList;

  @override
  void initState() {
    super.initState();
    api.getHomeList((data) {
      setState(() {
        dataList = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return title.TitleBar(
      title: "题库",
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

  Widget _getBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            child: GestureDetector(
              onTap: () => gotoDetail(),
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/bg_live_playing.png"),
                  ),
                  Container(
                    child: Align(
                      child: Text(
                        "进入答题",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
                alignment: Alignment.center,
              ),
            ),
            padding: EdgeInsets.all(10),
          ),
          Expanded(
            child: Container(
              child: dataList != null
                  ? Container(
                child: SizedBox(
                  height: 200,
                  child: ListView(
                    children: _buildChapterList(),
                  ),
                ),
              )
                  : Text("加载中"),
            ),
          )
        ],
      ),
    );
  }

  gotoDetail() {
    Router.push(context, Router.questionDetailPage,
        {'chapter_title': '第一章 生物化学', 'id': '1'});
  }

  gotoAnswerCard(String title) {
    Router.push(context, Router.answerCardPage,
        {'chapter_title': title, 'id': '1'});
  }

  List<Widget> _buildChapterList() {
    List<Widget> list = [];
    dataList.forEach((item) {
      list.add(Container(
        child: _getItemExpand(item),
        alignment: Alignment.centerLeft,
      ));
    });
    return list;
  }

  Widget _getItemExpand(HomeItemBean bean) {
    if (bean.list != null && bean.list.length > 0) {
      return ExpansionTile(
        title: Text(bean.title,textAlign: TextAlign.left,),
        children: bean.list.map((item) => _getItemExpand(item)).toList(),
      );
    } else {
      return GestureDetector(
        onTap: ()=>gotoAnswerCard(bean.title),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              child: Text(bean.title,textAlign: TextAlign.left,),
              margin: EdgeInsets.only(left: 15),
            ),
          ),
        ),
      );
    }
  }
}
