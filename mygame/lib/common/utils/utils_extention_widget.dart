import 'package:flutter/cupertino.dart';


extension WidgetExtensionUtil on Widget {

  Widget gestureDetectorExtension(Function() onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: this,
    );
  }

}