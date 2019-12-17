//有这些属性
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdatedItem extends StatelessWidget {
  final UpdateItemModel model; //数据模型
  //构造函数语法糖，用来给model赋值
  UpdatedItem({Key key, this.model, this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    //用Column将上下两部分合体
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //水平方向距左对齐
          mainAxisSize: MainAxisSize.min, //包裹内容
          children: <Widget>[
            buildTopRow(context), //上半部分

            buildBottomRow(context) //下半部分buildBottomRow
          ]),
    );
  }

  //第一行
  Widget buildTopRow(BuildContext context) {
    return Row(
      children: <Widget>[
        //图标
        Padding(
          padding: EdgeInsets.all(4),
          child: CachedNetworkImage(
            imageUrl: model.appIcon,
            width: 80,
            height: 80,
          ),
        ),

        Expanded(
          //Expanded控件，用来拉伸中间区域
          child: Column(
            //Column控件，用来垂直摆放子Widget
            mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
            crossAxisAlignment: CrossAxisAlignment.start, //水平方向居左对齐
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(model.appName, maxLines: 1),
              ), //App名字
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text(model.appDate, maxLines: 1),
              ), //App更新日期
            ],
          ),
        ),

        //打开按钮
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: FlatButton(
            child: Text("打开"),
            color: Colors.green,
            //设置背景色为黄色
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(3.0)),
            //设置斜角矩形边框
            colorBrightness: Brightness.light,
            //确保文字按钮为深色
            onPressed: () => print('FlatButton pressed'),
          ),
        )
      ],
    );
  }

  Widget buildBottomRow(BuildContext context) {
    //第二行上下布局，两个text
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0), //左边距和右边距为15
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //水平方向距左对齐
        children: <Widget>[
          //展开
          Text(model.appDescription),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("版本：${model.appVersion} • ${model.appSize} MB"),
          )
        ],
      ),
    );
  }
}

class UpdateItemModel {
  String appIcon; //App图标
  String appName; //App名称
  String appSize; //App大小
  String appDate; //App更新日期
  String appDescription; //App更新文案
  String appVersion; //App版本
  //构造函数语法糖，为属性赋值
  UpdateItemModel(
      {this.appIcon,
      this.appName,
      this.appSize,
      this.appDate,
      this.appDescription,
      this.appVersion});
}

class UpdateWidget extends StatefulWidget {
  final UpdateItemModel model;

  const UpdateWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UpdateWidget(model);
  }
}

class _UpdateWidget extends State<UpdateWidget> {
  UpdateItemModel model;
  bool open = false;

  _UpdateWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //水平方向距左对齐
          mainAxisSize: MainAxisSize.min, //包裹内容
          children: <Widget>[
            buildTopRow(context), //上半部分
            buildBottomRow(context) //下半部分
          ]),
    );
  }

  //第一行
  Widget buildTopRow(BuildContext context) {
    return Row(
      children: <Widget>[
        //图标
        Padding(
          padding: EdgeInsets.all(4),
          child: CachedNetworkImage(
            imageUrl: model.appIcon,
            width: 80,
            height: 80,
          ),
        ),

        Expanded(
          //Expanded控件，用来拉伸中间区域
          child: Column(
            //Column控件，用来垂直摆放子Widget
            mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
            crossAxisAlignment: CrossAxisAlignment.start, //水平方向居左对齐
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Text(model.appName, maxLines: 1),
              ), //App名字
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text(model.appDate, maxLines: 1),
              ), //App更新日期
            ],
          ),
        ),

        //打开按钮
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: FlatButton(
            child: Text("打开"),
            color: Colors.green,
            //设置背景色为黄色
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(3.0)),
            //设置斜角矩形边框
            colorBrightness: Brightness.light,
            //确保文字按钮为深色
            onPressed: () => print('FlatButton pressed'),
          ),
        )
      ],
    );
  }

  Widget buildBottomRow(BuildContext context) {
    //第二行上下布局，两个text
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0), //左边距和右边距为15
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //水平方向距左对齐
        children: <Widget>[
          Text(
            widget.model.appDescription,
            maxLines: open ? 100 : 2,
          ),

          //更多按钮放在右边,左边被填满即可
          Row(
            mainAxisAlignment: MainAxisAlignment.end, //右对齐
            children: <Widget>[
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 6, 0),
                  child: Text(
                    open ? '收起' : '更多',
                    style: TextStyle(color: Color(0xFF007AFE), fontSize: 14),
                  ),
                ),
                onTapDown: (_) => setState(() => open = !open),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("版本：${model.appVersion} • ${model.appSize} MB"),
          )
        ],
      ),
    );
  }
}
