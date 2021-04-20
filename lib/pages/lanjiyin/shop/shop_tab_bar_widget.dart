import 'package:doubanapp/bean/shop_tab_item_bean.dart';
import 'package:doubanapp/constant/color_constant.dart';
import 'package:doubanapp/widgets/common_view.dart';
import 'package:flutter/material.dart';

class ShopTabBarView extends StatelessWidget {
  final TabController tabController;
  final List<ShopTabItemBean> dataList;

  ShopTabBarView({Key key, @required this.dataList,@required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build FlutterTabBarView');
    List<Widget> viewList = [];
    dataList.forEach((item){
      viewList.add(Page1(item.goodsList));
    });

    return TabBarView(
      children: viewList,
      controller: tabController,
    );
  }
}

class Page1 extends StatelessWidget {
  final List<Goods_list> goods_list;

  Page1(this.goods_list);

  @override
  Widget build(BuildContext context) {
    print('build Page1');
    if(goods_list!=null&&goods_list.length>0){
      return Container(
        child: ListView.builder(itemCount:goods_list.length,itemBuilder: (BuildContext context, int index) {
          return ShopItem(goods_list[index]);
        }),
      );
    }else{
      return CommonView.getEmptyView();
    }


  }
}

class ShopItem extends StatefulWidget {
  final Goods_list goodsInfo;

  ShopItem(this.goodsInfo);

  @override
  _ShopItemState createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {


  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        child: Padding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 130,
                height: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image(image: NetworkImage(widget.goodsInfo.thumbUrl),),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Text(widget.goodsInfo.goodsName,style: TextStyle(fontSize: 16,color: ColorConstant.corlor_333333),maxLines: 2,),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  _getLabelImage(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.goodsInfo.sale,style: TextStyle(fontSize: 12,color: ColorConstant.corlor_999999),),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(widget.goodsInfo.priceDiscountRange,style: TextStyle(fontSize: 16,color: ColorConstant.corlor_ff8932),),
                              )
                            ],
                          ),
                        ),
                      )


                    ],
                  ),
                  margin: EdgeInsets.only(left: 15,right:15),
                ),
              )

            ],
          ),
          padding: EdgeInsets.all(5),
        ),
      ),
    );
  }

  List<Widget> _getLabelImage() {
    List<Widget> list = [];
    widget.goodsInfo.labelImgUrl.forEach((item){
      list.add(SizedBox(
        height: 16,
        child: Image(image: NetworkImage(item),)),
      );
    });
    return list;
  }
}

