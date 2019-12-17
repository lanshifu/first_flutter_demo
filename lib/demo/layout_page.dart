import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_flutter_demo/demo/update_item.dart';
import 'package:first_flutter_demo/demo/whell_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //String appIcon; //App图标
      //  String appName; //App名称
      //  String appSize; //App大小
      //  String appDate; //App更新日期
      //  String appDescription; //App更新文案
      //  String appVersion; //App版本
      body: Column(
        children: <Widget>[
          Cake(),
UpdateWidget(model: UpdateItemModel(
    appIcon:
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573062103858&di=9afaf13bb5d35c0d6e96bfa9936c4340&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fb0994bc6144de6842d1aa3762d38fef08f19ac2052e0-gdubAZ_fw658",
    appName: "微信App，多一点文字，啦啦啦啦啦绿绿绿绿",
    appSize: "20",
    appDate: "2019",
    appDescription:
    "升级啦，赶紧的，提升性能，增强安全，微信App，多一点文字，啦啦啦啦啦绿绿绿绿微信App，多一点文字，啦啦啦啦啦绿绿绿绿微信App，多一点文字，啦啦啦啦啦绿绿绿绿",
    appVersion: "2.0"),),

//          UpdatedItem(
//              model: UpdateItemModel(
//                  appIcon:
//                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573062103858&di=9afaf13bb5d35c0d6e96bfa9936c4340&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fb0994bc6144de6842d1aa3762d38fef08f19ac2052e0-gdubAZ_fw658",
//                  appName: "微信App，多一点文字，啦啦啦啦啦绿绿绿绿",
//                  appSize: "20",
//                  appDate: "2019",
//                  appDescription:
//                      "升级啦，赶紧的，提升性能，增强安全，微信App，多一点文字，啦啦啦啦啦绿绿绿绿微信App，多一点文字，啦啦啦啦啦绿绿绿绿微信App，多一点文字，啦啦啦啦啦绿绿绿绿",
//                  appVersion: "2.0"))
        ],
      ),
    );
  }
}
