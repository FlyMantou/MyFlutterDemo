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
              onTap: ()=>gotoDetail(),
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
                  )
                ],
                alignment: Alignment.center,
              ),
            ),
            padding: EdgeInsets.all(10),
          )
        ],
      ),
    );
  }

  gotoDetail() {
    Router.push(context, Router.questionDetailPage, {'chapter_title':'第一章 生物化学','id':'1'});
  }
}
