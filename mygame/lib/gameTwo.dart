import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mygame/common/style/colorsAndFontsStyle.dart';
import 'package:mygame/common/utils/utils_extention_widget.dart';

class GameTwo extends StatefulWidget {

  GameTwo();

  @override
  _GameTwoState createState() => _GameTwoState();
}

class _GameTwoState extends State<GameTwo> {
  //随机数生成类
  var rng = new Random();

  //用于存放生成的随机数
  List list = [];

  //用于判断当前下标
  int indexTemp = -1;

  //用于判断当前数组的下标对应的值
  int currentTemp = -1;

  //用于拼接两个list
  List new_list = [];


  initState() {
    super.initState();

    for(int i=0;i<6;i++) {
      list.add(rng.nextInt(10));
    }

    //把数组重复2次添加进new_list
    new_list.addAll(list);
    new_list.addAll(list);

    //把new_list的数的顺序打乱
    for(int i = 0; i < new_list.length; i++){
      int currentRandom = rng.nextInt(new_list.length-1);
      int current = new_list[i];
      new_list[i] = new_list[currentRandom];
      new_list[currentRandom] = current;
    }


  }

  Color focusColor = MyColors.color_FFA200;

  Color noFocusColor = MyColors.color_FFFFFF;

  Color whiteColor = MyColors.color_FFFFFF;

  /*一个渐变颜色的正方形集合*/
  List<Widget> Boxs() => List.generate(12, (index) {

    return new_list[index] != -2 ?Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color:  index == indexTemp ? focusColor : noFocusColor,
        border:   Border.all(color: Color(0xFFFF0000), width: 0.5),
      ),
      child: Text(
        "${new_list[index]}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ).gestureDetectorExtension(() {

      //不是在当前位置一直点，且下一个的值与当前值相等时
      if (indexTemp != index && currentTemp == new_list[index]) {
        //上一个的index对应的值变化
        new_list[indexTemp] = -2;
        //点过去的index对应的值变化
        new_list[index] = -2;
      }

      setState(() {
        //用于储存当前下标
        indexTemp = index;
        //用于储存当前数组的下标对应的值
        currentTemp = new_list[index];

      });

    }) :
    //值为-2时变空
    Container(
      width: 100,
      height: 100,
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('初级翻牌子'),
        ),
        body: Center(
          child: Wrap(
            spacing: 2, //主轴上子控件的间距
            runSpacing: 5, //交叉轴上子控件之间的间距
            children: Boxs(), //要显示的子控件集合
          ),
        ));
  }
}
