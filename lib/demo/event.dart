import 'package:date_format/date_format.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * 事件
 */
class EventPage extends StatefulWidget {
  EventPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EventPageState createState() => _EventPageState();
}

//定义两个变量，container坐标
double _top = 0.0;
double _left = 0.0;

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
//    rootBundle.loadString('assets/result.json').then((msg)=>print(msg));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            Container(
                width: 400,
                height: 100,
                child: Stack(
                  //使用Stack组件去叠加视图，便于直接控制视图坐标
                  children: <Widget>[
                    Positioned(
                      top: _top,
                      left: _left,
                      //手势识别
                      child: GestureDetector(
                        child: Container(
                            color: Colors.green, width: 50, height: 50),
                        //子视图
                        onTap: () => print("Tap"),
                        //点击回调
                        onDoubleTap: () => print("Double Tap"),
                        //双击回调
                        onLongPress: () => print("Long Press"),
                        //长按回调
                        onPanUpdate: (e) {
                          //拖动回调
                          setState(() {
                            //更新位置
                            _left += e.delta.dx;
                            _top += e.delta.dy;
                          });
                        },
                      ),
                    )
                  ],
                )),

          Listener(
            child: Container(
              color: Colors.red, //背景色红色
              width: 50,
              height: 50,
            ),
            onPointerDown: (event) => print("down $event"), //手势按下回调
            onPointerMove: (event) => print("move $event"), //手势移动回调
            onPointerUp: (event) => print("up $event"), //手势抬起回调
          ),

            //事件层级传递，父子都设置点击事件，子View消费
            GestureDetector(
              onTap: () => print('Parent tapped'),//父视图的点击回调
              child: Container(
                color: Colors.pinkAccent,
                child: Center(
                  child: GestureDetector(
                    onTap: () => print('Child tapped'), //子视图的点击回调，先响应

                    onDoubleTap:() => print('onDoubleTap'),
                    child: Container(
                      color: Colors.blueAccent,
                      width: 200.0,
                      height: 100.0,
                    ),
                  ),
                ),
              ),
            ),

            //让父容器也能接收到手势,需要同时使用 RawGestureDetector 和 GestureFactory
            //父类和子类都接收点击事件
            RawGestureDetector(
              //自己构造父Widget的手势识别映射关系
              gestures: {
                //建立多手势识别器与手势识别工厂类的映射关系，从而返回可以响应该手势的recognizer
                MultipleTapGestureRecognizer:
                    GestureRecognizerFactoryWithHandlers<
                        MultipleTapGestureRecognizer>(
                  () => MultipleTapGestureRecognizer(),
                  (MultipleTapGestureRecognizer instance) {
                    instance.onTap = () => print('parent tapped '); //点击回调
                  },
                )
              },
              child: Container(
                color: Colors.pinkAccent,
                child: Center(
                  child: GestureDetector(
                    //子视图可以继续使用GestureDetector
                    onTap: () => print('Child tapped'),
                    child: Container(
                      color: Colors.cyanAccent,
                      width: 200.0,
                      height: 100.0,
                    ),
                  ),
                ),
              ),
            )
          ])),
    );
  }
}

//定义了一个继承自点击手势识别器 TapGestureRecognizer 的类，并重写了其 rejectGesture 方法，手动地把自己又复活了
class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
