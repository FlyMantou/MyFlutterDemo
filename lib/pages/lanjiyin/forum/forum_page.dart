import 'package:doubanapp/router.dart';
import 'package:doubanapp/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:doubanapp/widgets/title_bar.dart' as title;
import 'package:flutter/material.dart';

class ForumHomePage extends StatefulWidget {
  @override
  _ForumHomePageState createState() => _ForumHomePageState();
}

class _ForumHomePageState extends State<ForumHomePage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return title.TitleBar(
      title: "论坛",
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
      child: Text("课程"),
    );
  }

  gotoDetail() {
    Router.push(context, Router.questionDetailPage, {'chapter_title':'第一章 生物化学','id':'1'});
  }
}
