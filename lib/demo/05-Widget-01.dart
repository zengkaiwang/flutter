
import 'package:flutter/material.dart';

//Flutter中一些常用的的基础Widget

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("HelloWorld"),
        ),
        body: MyHomeBody(),
      ),
    );
  }
}


class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text(
          "我是Text组件",
          style: TextStyle(
              fontSize: 20,
              color: Colors.purple
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "Text组件的.rich()用法", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
              TextSpan(text: "苏轼", style: TextStyle(fontSize: 18, color: Colors.redAccent)),
              TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。")
            ],
          ),
          style: TextStyle(fontSize: 20, color: Colors.purple),
          textAlign: TextAlign.center,
        ),
        FloatingActionButton(
          child: Text("FloatingActionButton按钮"),
          onPressed: () {
            print("FloatingActionButton Click");
          },
        ),
        RaisedButton(
          child: Text("RaisedButton按钮"),
          onPressed: () {
            print("RaisedButton Click");
          },
        ),
        FlatButton(
          child: Text("FlatButton按钮"),
          onPressed: () {
            print("FlatButton Click");
          },
        ),
        OutlineButton(
          child: Text("OutlineButton按钮"),
          onPressed: () {
            print("OutlineButton Click");
          },
        ),
        RaisedButton(
          child: Text("按钮自定义样式", style: TextStyle(color: Colors.white)),
          color: Colors.orange, // 按钮的颜色
          highlightColor: Colors.orange[700], // 按下去高亮颜色
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // 圆角的实现
          onPressed: () {
            print("同意协议");
          },
        ),
        Container(
          child: Image.network(
            "http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
            alignment: Alignment.topCenter,
            repeat: ImageRepeat.repeatY,
            color: Colors.red,
            colorBlendMode: BlendMode.colorDodge,
          ),
          width: 50,
          height: 50,
          color: Colors.yellow,
        )
      ],
    );
  }
}