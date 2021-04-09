import 'dart:convert';

import 'package:doubanapp/bean/question_bean.dart';
import 'package:doubanapp/http/API.dart';
import 'package:doubanapp/http/mock_request.dart';
import 'package:doubanapp/util/common_utils.dart';
import 'package:doubanapp/widgets/loading_widget.dart';
import 'package:doubanapp/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:doubanapp/widgets/title_bar.dart' as title;

class QuestionDetailPage extends StatefulWidget {
  final String id;
  final String chapter_title;

  const QuestionDetailPage(this.chapter_title, this.id, {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionDetailPageState();
  }
}

class _QuestionDetailPageState extends State<QuestionDetailPage>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<int> indexNotifier = ValueNotifier(0);

  List<QuestionBean> questionList;

  QuestionBean currentBean;

  int currentIndex = 0;

  double titleSize = 16.0;
  bool loading = true;

  @override
  void initState() {
    print('initState');
    requestAPI();
    indexNotifier.addListener(() {
      print('huanghai-->' + '收到消息 ${indexNotifier.value}');
      changeIndex(indexNotifier.value);
    });
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return title.TitleBar(
      title: widget.chapter_title,
      textColor: Color(0xff333333),
      padding: const EdgeInsets.all(0.0),
      body: LoadingWidget.containerLoadingBody(
        _getBody(),
        loading: loading,
      ),
    );
  }

  _getBody() {
    print('_getBody');
    if (getCurrentQuestion() != null) {
      return Container(
        child: Column(
          children: <Widget>[
            _getQuestionHead(),
            Container(
              child: Expanded(
                child: PageView(
                    children: _getQuestionWidgetList(),
                    onPageChanged: (page) {
                      setState(() {
                        currentIndex = page;
                      });
                    }),
              ),
            ),
            _getQuestionFooter(),
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      );
    } else {
      return Text('加载中');
    }
  }

  void refresh() {}

  @override
  void didUpdateWidget(QuestionDetailPage oldWidget) {
    print("index-->$currentIndex");
    super.didUpdateWidget(oldWidget);
  }

  void onQuestionPageChanged() {}
  AnimationController _animationController;

  Widget _getQuestionFooter() {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xffeeeeee)))),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 35,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Color(0xffeeeeee)),
                          left: BorderSide(color: Color(0xffeeeeee)),
                          bottom: BorderSide(color: Color(0xffeeeeee)),
                          right: BorderSide(color: Color(0xffeeeeee))),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: TextField(
                      enabled: false,
                      textAlignVertical: TextAlignVertical.center,
                      maxLines: 1,
                      cursorColor: Color(0xff666666),
                      decoration: InputDecoration(
                        hintText: "写评论",
                        prefixIcon: Icon(Icons.edit),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(37),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(37),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => handleIconClick(0),
                      child: IconButton(icon: Icon(Icons.star)),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => handleIconClick(1),
                      child: IconButton(icon: Icon(Icons.note_add)),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => handleIconClick(2),
                      child: IconButton(icon: Icon(Icons.message)),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => handleIconClick(3),
                      child: IconButton(icon: Icon(Icons.delete_forever)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void handleIconClick(int type) {
    var text = "";
    switch (type) {
      case 0: //收藏
        text = "点击收藏";
        break;
      case 1: //笔记
        text = "点击笔记";
        break;
      case 2: //评论
        text = "点击评论";
        break;
      case 3: //删除
        text = "点击删除";
        break;
    }
    showToast(text);
  }

  Widget _getQuestionHead() {
    print("_getQuestionHead");
    return Container(
      child: Stack(
        children: <Widget>[
          SizedBox(
            child: LinearProgressIndicator(
                value: (currentIndex + 1) / questionList.length,
                backgroundColor: Colors.transparent,
                // valueColor: ColorTween(begin: Color(0xffbbdefb), end: Colors.blue)
                //     .animate(_animationController),
                valueColor: AlwaysStoppedAnimation(Color(0xffbbdefb))),
            height: 35,
          ),
          Container(
            alignment: Alignment.topLeft,
            height: 35,
            child: Stack(
              children: <Widget>[
                Align(
                  child: Row(
                    children: <Widget>[
                      Text("【" +
                          getQuestionType(getCurrentQuestion().type) +
                          "】"),
                      Text("【" + getCurrentQuestion().number + "】"),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Align(
                  child: Text("${currentIndex + 1}/${questionList.length}"),
                  alignment: Alignment.centerRight,
                )
              ],
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          )
        ],
      ),
      color: Color(0xfff0f0f0),
    );
  }

  String getQuestionType(String type) {
    switch (type) {
      case "1":
        return "单选题";
        break;
      case "2":
        return "多选题";
        break;
      case "3":
        return "判断题";
        break;
      case "4":
        return "填空题";
        break;
      case "5":
        return "名词解释题";
        break;
      case "6":
        return "问答题";
        break;
      default:
        return "单选题";
    }
  }

  List<Widget> _getQuestionWidgetList() {
    List<Widget> list = [];
    for (var bean in questionList) {
      list.add(QuestionContainerWidget(indexNotifier, questionBean: bean));
    }
    return list;
  }

  void requestAPI() async {
    var _request = MockRequest();
    var result = await _request.get(API.QUESTION_LIST);
    var resultList = result['list'];
    questionList = resultList
        .map<QuestionBean>((item) => QuestionBean.fromJson(item))
        .toList();
    loading = false;
    setState(() {});
  }

  QuestionBean getCurrentQuestion() {
    if (questionList != null && questionList.length > currentIndex) {
      currentBean = questionList[currentIndex];
      return currentBean;
    }
    return null;
  }

  void changeIndex(int i) {
    if (questionList.length > i) {
      currentIndex = i;
      setState(() {});
    }
  }
}

//答题页每一个页面，包含 选择题，填空题，主观题，以及顶部解析，底部解析等组件
class QuestionContainerWidget extends StatefulWidget {
  final QuestionBean questionBean;
  final ValueNotifier indexNotifier;

  const QuestionContainerWidget(this.indexNotifier,
      {Key key, this.questionBean})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    print('huanghai-->' + (indexNotifier == null ? 'null' : 'not null'));
    print(questionBean.title);
    return _QuestionDetailContainerState(questionBean, indexNotifier);
  }
}

class _QuestionDetailContainerState extends State<QuestionContainerWidget> {
  QuestionBean questionBean;
  ValueNotifier indexNotifier;

  _QuestionDetailContainerState(this.questionBean, this.indexNotifier);

  @override
  void didUpdateWidget(QuestionContainerWidget oldWidget) {
    // questionBean = widget.questionBean;
    print("didUpdateWidget-->child");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('_QuestionDetailContainerState-->build-->' + questionBean.title);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            ChoiceLayout(questionBean),
            ExplainLayout(questionBean)
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        alignment: Alignment.topLeft,
        color: Color(0xfff8f8f8),
      ),
    );
  }

  Widget buildNextButton() {
    return Container(
      child: InkWell(
        child: Column(
          children: <Widget>[
            Text(
              '下一题',
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        onTap: onNextClick,
      ),
      width: 200,
      height: 40,
      color: Colors.blue,
    );
  }

  onNextClick() {
    print('点击');
    int current = indexNotifier.value;
    indexNotifier.value = current + 1;
  }
}

//选择题组件
class ChoiceLayout extends StatefulWidget {
  final QuestionBean questionBean;

  const ChoiceLayout(this.questionBean, {Key key}) : super(key: key);

  @override
  _ChoiceLayoutState createState() => _ChoiceLayoutState(questionBean);
}

class _ChoiceLayoutState extends State<ChoiceLayout>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  QuestionBean questionBean;

  _ChoiceLayoutState(this.questionBean);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didUpdateWidget(ChoiceLayout oldWidget) {
    // questionBean = widget.questionBean;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(questionBean.sNum + '. ' + questionBean.title,
              style: TextStyle(fontSize: 18)),
          buildChoice()
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      width: double.maxFinite,
      color: Color(0xffffffff),
      padding: const EdgeInsets.all(10.0),
    );
  }

  Widget buildChoice() {
    Widget widget;
    List<Widget> list = [];
    for (var option in questionBean.option) {
      list.add(Container(
        child: Row(
          children: <Widget>[
            _getCheckImage(option),
            Expanded(
              child: Container(
                child: Text(
                  option.key + '. ' + option.value,
                  style: TextStyle(fontSize: 16),
                ),
                margin: EdgeInsets.only(left: 15),
              ),
            )
          ],
        ),
        margin: EdgeInsets.only(top: 10),
        width: double.maxFinite,
      ));
    }
    widget = Column(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
    return widget;
  }

  Image _getCheckImage(Option option) {
    if (questionBean.answer.contains(option.key)) {
      //正确答案
      return Image(
        image: AssetImage("assets/images/icon_options_select_right_green.png"),
        width: 23,
      );
    } else {
      //错误答案
      return Image(
        image: AssetImage("assets/images/icon_options_select_wrong.png"),
        width: 23,
      );
    }
  }
}

class ExplainLayout extends StatefulWidget {
  QuestionBean questionBean;

  ExplainLayout(this.questionBean);

  @override
  _ExplainLayoutState createState() => _ExplainLayoutState();
}

class _ExplainLayoutState extends State<ExplainLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _getExplainLayout(),
      ),
      color: Color(0xffffffff),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.all(10.0),
    );
  }

  List<Widget> _getExplainLayout() {
    List<Widget> list = [];
    list.add(_buildHardLayout());
    list.add(_buildStaticsLayout());
    list.add(_buildRightAnswerLayout());
    if (widget.questionBean.syllabus.isNotEmpty) {
      list.add(_buildSyllabusLayout());
    }
    if (widget.questionBean.recovery.isNotEmpty) {
      list.add(_buildRecoveryLayout());
    }
    if (widget.questionBean.restoren.isNotEmpty) {
      list.add(_buildRestoreLayout());
    }
    if (widget.questionBean.explainn.isNotEmpty) {
      list.add(_buildExplainLayout());
    }
    return list;
  }

  Widget _buildHardLayout() {
    return Row(
      children: <Widget>[
        Text(
          "难度:   ",
          style: TextStyle(fontSize: 13),
        ),
        RatingBar(10),
      ],
    );
  }

  Widget _buildStaticsLayout() {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            "统计:   ",
            style: TextStyle(fontSize: 13),
          ),
          Expanded(
            child: Text(getStaticsText()),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      margin: EdgeInsets.only(top: 10),
    );
  }

  Widget _buildRightAnswerLayout() {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            "【正确答案】",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: Text("${widget.questionBean.answer}"),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      margin: EdgeInsets.only(top: 10),
    );
  }

  Widget _buildSyllabusLayout() {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Column(
          children: <Widget>[
            Text(
              "【考点大纲】",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            Text("${widget.questionBean.syllabus}"),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      margin: EdgeInsets.only(top: 12),
    );
  }

  Widget _buildRecoveryLayout() {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Column(
          children: <Widget>[
            Text(
              "【九版还原】",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            Text("${widget.questionBean.recovery}")
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      margin: EdgeInsets.only(top: 12),
    );
  }

  Widget _buildRestoreLayout() {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Column(
          children: <Widget>[
            Text(
              "【八版还原】",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            Text("${widget.questionBean.restoren}"),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      margin: EdgeInsets.only(top: 12),
    );
  }

  Widget _buildExplainLayout() {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Column(
          children: <Widget>[
            Text(
              "【答案解析】",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            Text("${widget.questionBean.explainn}"),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      margin: EdgeInsets.only(top: 12),
    );
  }

  String getStaticsText() {
    double self_right = double.parse(widget.questionBean.userRightCount);
    double self_wrong = double.parse(widget.questionBean.userWrongCount);
    double self_count = self_right + self_wrong;
    double self_rate = self_right * 100 / self_count;

    double right = double.parse(widget.questionBean.rightCount);
    double wrong = double.parse(widget.questionBean.wrongCount);
    double count = right + wrong;
    double rate = right * 100 / count;

    var collect = widget.questionBean.collectCount;
    return "本人作答 $self_count 次，对 $self_right 次，正确率 $self_rate %，全站正确率 $rate %，$collect 人收藏。";
  }
}
