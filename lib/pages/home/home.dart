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
//    return _slivers();
    return showCustomScrollView();
//    return _customScroll();
  }

  // Slivers的用法
  Widget _slivers() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  alignment: Alignment(0, 0),
                  color: Colors.orange,
                  child: Text("item$index"),
                );
              }, childCount: 20),
            ),
          ),
        )
      ],
    );
  }

  // Slivers的组合使用
  Widget showCustomScrollView() {
    return CustomScrollView(
//      scrollDirection: Axis.horizontal,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Coderwhy Demo'),
            background: Image(
              image: NetworkImage(
                "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //横向滑动区域
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 100.0,
                  child: Card(
                    color: Colors.primaries[index],
                  ),
                );
              },
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: new Text('grid item $index'),
              );
            },
            childCount: 11,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 100.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return new Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: new Text('list item $index'),
            );
          }, childCount: 20),
        ),
      ],
    );
  }

  // appbar吸顶效果
  Widget _customScroll() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 230.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('复仇者联盟'),
            background: Image.network(
              'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 4,
          children: List.generate(8, (index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }).toList(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((content, index) {
            return Container(
              height: 85,
              alignment: Alignment.center,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Text(
                '$index',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }, childCount: 25),
        )
      ],
    );
  }
}
