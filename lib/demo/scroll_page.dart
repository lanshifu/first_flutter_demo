import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  ScrollPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  ScrollController _controller; //ListView控制器
  bool isToTop = false; //标示目前是否需要启用"Top"按钮

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      //为控制器注册滚动监听方法
      if (_controller.offset > 1000) {
        //如果ListView已经向下滚动了1000，则启用Top按钮
        setState(() {
          isToTop = true;
        });
      } else if (_controller.offset < 300) {
        //如果ListView向下滚动距离不足300，则禁用Top按钮
        setState(() {
          isToTop = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: NotificationListener<ScrollNotification>(  //添加NotificationListener作为父容器
        child: ListView.builder(
          controller: _controller, //初始化传入控制器
          cacheExtent: 20, //cacheExtent能提前加载设置的区域
          itemCount: 100, //列表元素总数
          itemBuilder: (context, index) =>
              ListTile(title: Text("Index : $index")), //列表项构造方法
        ),
        // ignore: missing_return
        onNotification: (scrollNotification) {
          //y移动的距离，刚开始是0，列表向下移动则增大，可以通过这个判断达到 ScrollController 的效果
          double offsetY = scrollNotification.metrics.pixels;
          if (offsetY == scrollNotification.metrics.maxScrollExtent) {
            print('加载更多的逻辑');
          }else if(offsetY == 0){
            print('到顶部了，可以下拉更新');
          }

          if (scrollNotification is ScrollStartNotification) {
            //滚动开始
            print('Scroll Start,offsetY = ${offsetY}');
          } else if (scrollNotification is ScrollUpdateNotification) {
            //滚动位置更新
            print('Scroll Update ,offsetY = ${offsetY}');
          } else if (scrollNotification is ScrollEndNotification) {
            //滚动结束
            print('Scroll End ,offsetY = ${offsetY}');
          }
        },
      ),

      //isToTop 才是可点击状态
      floatingActionButton: FloatingActionButton(
        onPressed: isToTop
            ? () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.ease); ////做一个滚动到顶部的动画
              }
            : null,
        tooltip: 'Increment',
        child: Text("top"),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); //销毁控制器
    super.dispose();
  }
}
