import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

/**
 * 资源管理
 */
class ResourcePage extends StatefulWidget {
  ResourcePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {


  @override
  void initState() {
//    rootBundle.loadString('assets/result.json').then((msg)=>print(msg));
  }

  @override
  Widget build(BuildContext context) {

    //第三方日期格式化库
    print("lxb日期格式化："+formatDate(DateTime.now(), [mm, '月', dd, '日', hh, ':', n]));
    //输出2019年06月30日01:56
    print("lxb日期格式化："+formatDate(DateTime.now(), [m, '月第', w, '周']));//输出6月第5周

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text('111',),
          Text('111',),
          Image.asset('assets/ic_launcher.png',width: 100,height: 100,),
          Image.network('https://static001.geekbang.org/resource/image/7d/eb/7d5a36a8727ed68f241719b7768262eb.jpg',width: 100,height: 100,),
            Text('222',),

        ],
      ),
    ),);
  }
}
