import 'dart:async';

import 'package:flutter/material.dart';
import 'package:doubanapp/pages/container_page.dart';
import 'package:doubanapp/util/screen_utils.dart';
import 'package:doubanapp/constant/constant.dart';
import 'package:fluttertoast/fluttertoast.dart';
///打开APP首页
class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  var container = ContainerPage();

  bool showAd = true;

  @override
  Widget build(BuildContext context) {
    print('build splash');
    return Stack(
      children: <Widget>[
        Offstage(
          child: container,
          offstage: showAd,
        ),
        Offstage(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                       image:AssetImage(Constant.ASSETS_IMG + 'splash_details.png'),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment(1.0, 0.0),
                          child: Container(
                            margin: const EdgeInsets.only(right: 30.0, top: 20.0),
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 2.0, bottom: 2.0),
                            child: CountDownWidget(
                              onCountDownFinishCallBack: (bool value) {
                                if (value) {
                                  setState(() {
                                    showAd = false;
                                  });
                                }
                              },
                            ),
                            decoration: BoxDecoration(
                                color: Color(0x66333333),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(20.0))),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            width: ScreenUtils.screenW(context),
            height: ScreenUtils.screenH(context),
          ),
          offstage: !showAd,
        )
      ],
    );
  }
}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 6;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: TextStyle(fontSize: 17.0,color: Colors.white),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}