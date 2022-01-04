import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mygame/common/style/colorsAndFontsStyle.dart';
import 'package:mygame/common/utils/utils_extention_widget.dart';

class GameOne extends StatefulWidget {
  GameOne();

  @override
  _GameOneState createState() => _GameOneState();
}

class _GameOneState extends State<GameOne> {
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

  //分数
  int score = 0;

  //声明Timer变量
  late Timer _timer;

  //记录当前的时间
  int curentTimer = 20000;

  initState() {
    super.initState();

    //随机生成几个数字放进数组
    for (int i = 0; i < 6; i++) {
      list.add(rng.nextInt(10));
    }

    //把数组重复2次添加进new_list
    new_list.addAll(list);
    new_list.addAll(list);

    //把new_list的数的顺序打乱
    for (int i = 0; i < new_list.length; i++) {
      int currentRandom = rng.nextInt(new_list.length - 1);
      int current = new_list[i];
      new_list[i] = new_list[currentRandom];
      new_list[currentRandom] = current;
    }

    //循环执行rrrrrrr
    //循环执行
    //间隔0.1秒
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      //自减
      curentTimer -= 100;

      ///到0秒后停止
      if (curentTimer <= 0) {
        _timer.cancel();

      }
      setState(() {});
    });
  }

  dispose() {
    super.dispose();

    //取消计时器
    _timer.cancel();
  }

  Color focusColor = MyColors.color_FFA200;

  Color noFocusColor = MyColors.color_FEB255;

  Color whiteColor = MyColors.color_FFFFFF;
  /*一个渐变颜色的正方形集合*/
  List<Widget> Boxs() => List.generate(12, (index) {
        return new_list[index] != -2
            ? Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == indexTemp ? focusColor : noFocusColor,
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
                  //当有-2出现时，分数++
                  if (new_list[index] == -2) {
                    score++;
                  }
                });
              })
            :
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
          title: Text('初级连连看'),
        ),
        body: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 40, bottom: 40, left: 25, right: 30),
              child: Row(
                children: [
                  Text(
                    '时间： ${(curentTimer / 1000).toInt()}',
                    style: fontsStyle.color333333Size16RegularStyle,
                  ),
                  Spacer(),
                  Text(
                    '分数： ${score}',
                    style: fontsStyle.color333333Size16RegularStyle,
                  ),
                ],
              ),
            ),
            Center(
              child: Wrap(
                spacing: 2, //主轴上子控件的间距
                runSpacing: 5, //交叉轴上子控件之间的间距
                children: Boxs(), //要显示的子控件集合
              ),
            ),
          ],
        ));
  }
}
