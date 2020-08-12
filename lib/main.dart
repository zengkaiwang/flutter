import 'package:flutter/material.dart';
import 'pages/home/home.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("HelloWorld"),
        // ),
        // body: Text('wzk11'),
        body: Tabs(),
      ),
    );
  }
}

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex;
  _TabsState(index) {
    this._currentIndex = index;
  }

  List _pageList = [
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Flutter App"),
//      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex, //配置对应的索引值选中
        onTap: (int index) {
          setState(() {
            //改变状态
            this._currentIndex = index;
          });
        },
        iconSize: 36.0, //icon的大小
        fixedColor: Colors.red, //选中的颜色
        type: BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("分类")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("设置"))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: UserAccountsDrawerHeader(
                  accountName: Text("张三"),
                  accountEmail: Text("8888@163.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "http://pic23.nipic.com/20120830/9686992_180336646144_2.jpg"),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                        "http://pic31.nipic.com/20130801/11604791_100539834000_2.jpg"),
                    fit: BoxFit.cover,
                  )),
                  otherAccountsPictures: <Widget>[
                    Image.network(
                        "http://k.zol-img.com.cn/dcbbs/22000/a21999018_01000.jpg"),
                    Image.network(
                        "http://pic38.nipic.com/20140211/17882171_143443301183_2.jpg"),
                  ],
                ))
              ],
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text("我的空间"),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.people)),
              title: Text("用户中心"),
              onTap: () {
                Navigator.of(context).pop(); //隐藏侧边栏
                Navigator.pushNamed(context, '/user');
              },
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("设置中心"),
            ),
            Divider(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text('右侧侧边栏'),
      ),
    );
  }
}
