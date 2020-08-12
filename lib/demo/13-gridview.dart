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
    {"name": '张三'},
    {"name": '张三'},
    {"name": '张三'},
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
//    return _gridView();
    return _gridViewBuilder();
  }

  // GridView.builder的用法
  Widget _gridViewBuilder() {
    return GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.2),
      itemCount: anchors.length,
      itemBuilder: (context, index) {
        return Text(anchors[index]['name']);
      },
    );
  }

  // GridView的基本用法
  Widget _gridView() {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1),
        children: List.generate(100, (index) {
          return Container(
            color: Colors.purple,
            alignment: Alignment(0, 0),
            child: Text("item$index",
                style: TextStyle(fontSize: 20, color: Colors.white)),
          );
        }));
  }
}
