
import 'package:flutter/material.dart';

class MyCounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // 将创建的State返回
    return MyCounterState();
  }
}


class MyCounterState extends State<MyCounterWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.redAccent,
                child: Text("+1", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
              ),
              RaisedButton(
                color: Colors.orangeAccent,
                child: Text("-12", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
              )
            ],
          ),
          Text("当前计数：$counter", style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }
}