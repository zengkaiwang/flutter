import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> anchors = [
    {"name": '张三'},
    {"name": '张三'},
    {"name": '张三'},
    {"name": '张三'},
    {"name": '李四'}
  ];

  Divider blueColor = Divider(color: Colors.blue);
  Divider redColor = Divider(color: Colors.red);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: anchors.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(anchors[index]['name']);
      },
      separatorBuilder: (context, index) {
        return index % 2 == 0 ? redColor : blueColor;
      },
    );
  }
}
