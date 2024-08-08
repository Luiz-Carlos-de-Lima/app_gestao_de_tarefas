import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => MediaQuery.of(this).size.width - mediaQuery.padding.left - mediaQuery.padding.right;
  double get screenHeight => MediaQuery.of(this).size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;
  double get screenShortestSide => MediaQuery.of(this).size.shortestSide;
  double get screenLongestSide => MediaQuery.of(this).size.longestSide;

  double percentWidth(double percent) => screenWidth * percent;
  double percenteHeigth(double percent) => screenHeight * percent;
  double percenteOfPixel(double pixels) {
    double valueInPixels = pixels;
    double valueInPercentage = (valueInPixels / screenWidth) * 100.0;
    return (screenWidth * (valueInPercentage / 100.0));
  }

  double widgetWidthPercentage(GlobalKey key) {
    Size widgetSize = _getSizeWidget(key);
    return widgetSize.width / screenWidth;
  }

  double getWidgetHeight(GlobalKey key) {
    Size widgetSize = _getSizeWidget(key);
    return widgetSize.height;
  }

  Size _getSizeWidget(GlobalKey key) {
    RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    Size widgetSize = renderBox?.size ?? Size.zero;
    return widgetSize;
  }
}
