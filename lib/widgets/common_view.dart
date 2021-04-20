


import 'package:doubanapp/constant/color_constant.dart';
import 'package:doubanapp/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CommonView{
  static Widget getEmptyView(){
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 80,
              height: 80,
              child: Image(image: AssetImage(Constant.ASSETS_IMG+"search_no_data.png"),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text("暂无数据",style: TextStyle(fontSize: 15,color: ColorConstant.corlor_999999),),
            )
          ],
        ),
      ),
    );
  }
}


