import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mygame/app.dart';

void main() {
  runApp(
    //屏幕尺寸适配
    ScreenUtilInit(
      designSize: Size(375, 690),
      builder: () => MyApp(),
    ),
  );
  // 强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
