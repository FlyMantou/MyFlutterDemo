import 'package:doubanapp/bean/home_item_bean.dart';
import 'package:doubanapp/bean/online_question_bean.dart';
import 'package:doubanapp/constant/color_constant.dart';
import 'package:doubanapp/http/API.dart';
import 'package:doubanapp/router.dart';
import 'package:doubanapp/widgets/common_view.dart';
import 'package:doubanapp/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:doubanapp/widgets/title_bar.dart' as title;
import 'package:flutter/material.dart';

class AnswerCardPage extends StatefulWidget {
  final String chapter_title;

  AnswerCardPage(this.chapter_title);

  @override
  _AnswerCardPageState createState() => _AnswerCardPageState();
}

class _AnswerCardPageState extends State<AnswerCardPage> {
  bool loading = true;
  var api = API();
  List<OnlineQuestionBean> dataList;

  @override
  void initState() {
    super.initState();
    loading = true;
    api.getAnswerCardList((data) {
      setState(() {
        loading = false;
        dataList = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return title.TitleBar(
      title: widget.chapter_title,
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
    if(dataList!=null&&dataList.length>0){
      List<Widget> list = [];
      dataList.forEach((item){
        list.add(_getGridItem(item));
      });
      return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
        ),
        children: list,
      );
    }else if(dataList!=null&&dataList.length==0){
      return CommonView.getEmptyView();
    }else{
      return Text("");
    }
  }

  Widget _getGridItem(OnlineQuestionBean bean) {
    var textColor = (bean.userAnswer!=null&&bean.userAnswer!="")?ColorConstant.corlor_ffffff:ColorConstant.corlor_999999;
    var bgColor = Colors.transparent;
    var borderColor = ColorConstant.corlor_999999;
    if(bean.userAnswer!=""){
      if(bean.answer==bean.userAnswer){
        bgColor = ColorConstant.corlor_62c598;
        borderColor = Colors.transparent;
      }else{
        bgColor = ColorConstant.corlor_f16e69;
        borderColor = Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(bean.sNum,style: TextStyle(color: textColor),),
      ),
    );

  }
}
