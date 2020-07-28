
import 'package:flutter/material.dart';

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
        body: MyHomeBody3(),
      ),
    );
  }
}

// ListView的基本使用
class MyHomeBody extends StatelessWidget {

  final TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.redAccent);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text("我是ListView的第一项", style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text("我是ListView的第二项。", style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("我是ListView的第三项", style: textStyle),
        ),
        ListTile(
          leading: Icon(Icons.people, size: 36,),
          title: Text("联系人"),
          subtitle: Text("联系人信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.email, size: 36,),
          title: Text("邮箱"),
          subtitle: Text("邮箱地址信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}

// ListView参数scrollDirection 水平滚动
class MyHomeBody2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      itemExtent: 200,
      children: <Widget>[
        Container(color: Colors.red, width: 200),
        Container(color: Colors.green, width: 200),
        Container(color: Colors.blue, width: 200),
        Container(color: Colors.purple, width: 200),
        Container(color: Colors.orange, width: 200),
      ],
    );
  }
}

// ListView.build基本使用
class MyHomeBody3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 80,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("标题$index"), subtitle: Text("详情内容$index"));
        }
    );
  }
}