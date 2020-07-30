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
        body: ParentWidget(),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String _text = 'color is blue';

  @override
  void initState() {
    print('parent initState');
    super.initState();
    _text = 'color is blue';
  }

  @override
  void didChangeDependencies() {
    print('parent didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    print('parent didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('parent deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('parent dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('parent build');

    return new Scaffold(
      appBar: AppBar(
        title: Text('Flutter layout demo'),
      ),
      body: ChildWidget(
          text: _text,
          onChanged: (bool newValue) {
            setState(() {
              print('parent setState');
              _text = '王增凯color is ${newValue ? "red" : "blue"}';
            });
          }),
    );
  }
}

// -------------ChildWidget-----------------------
class ChildWidget extends StatefulWidget {
  final String text;
  final ValueChanged<bool> onChanged;
  const ChildWidget({
    this.text,
    this.onChanged,
  });

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  bool _isBlue = false;

  @override
  void initState() {
    print('child initState');
    super.initState();
    _isBlue = true;
  }

  // Called when a dependency of this State object changes.
  @override
  void didChangeDependencies() {
    print('child didChangeDependencies');
    super.didChangeDependencies();
  }

  // Called whenever the widget configuration changes.
  @override
  void didUpdateWidget(Widget oldWidget) {
    print('child didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  // Called when this object is removed from the tree.
  @override
  void deactivate() {
    print('child deactivate');
    super.deactivate();
  }

  // Called when this object is removed from the tree permanently.
  @override
  void dispose() {
    print('child dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('child build');

    return GestureDetector(
      onTap: () {
        setState(() {
          print('child setState');
          _isBlue = !_isBlue;
        });

        widget.onChanged(!_isBlue);
      },
      child: Column(
        children: <Widget>[
          Container(
            color: _isBlue ? Colors.blue : Colors.red,
            height: 150,
            alignment: Alignment.center,
            child: Text('请点击我；\n'
                '背景色是子组件更改，文字是父组件更改；\n'
                '${widget.text}'),
          ),
          GrandsonWidget(),
        ],
      ),
    );
  }
}

// -------------GrandsonWidget-----------------------
class GrandsonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('grandson build');

    return Container(child: Text('孙子组件是吃瓜群众，只为了观察生命周期方法调用'));
  }
}

// CustomScrollView-Slivers
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(20),
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
}

// CustomScrollView-Slivers的组合使用
class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return showCustomScrollView();
  }

  Widget showCustomScrollView() {
    return new CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
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
        new SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: new Text('grid item $index'),
              );
            },
            childCount: 10,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
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
}
