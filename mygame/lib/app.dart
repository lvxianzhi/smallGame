import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mygame/common/style/colorsAndFontsStyle.dart';
import 'package:mygame/common/utils/utils_extention_widget.dart';

import 'gameOne.dart';
import 'gameTwo.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return First();
  }
}

//首页
class First extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: buildScaffold,
      ),
    );
  }
}

Widget buildScaffold(BuildContext context) {

  return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text("游戏选择页面", style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
      body: Column(children: [
        RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GameOne();
              }));
            },
            color: Colors.blue,
            child: Text(
              "跳转到第一个游戏",
              style: TextStyle(fontSize: 25, color: Colors.white),
            )),
        RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GameTwo();
              }));
            },
            color: Colors.blue,
            child: Text(
              "跳转到第二个游戏",
              style: TextStyle(fontSize: 25, color: Colors.white),
            )),

      ]));
}
