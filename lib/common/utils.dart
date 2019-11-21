import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double setHeight(double height){
  return ScreenUtil.getInstance().setHeight(height) as double;
}

double setWidth(double width){
  return ScreenUtil.getInstance().setWidth(width) as double;
}

double setSp(double fontSize){
  return ScreenUtil.getInstance().setSp(fontSize) as double;
}

String formatDate(DateTime dateTime){
  return dateTime.day.toString() + "." + dateTime.month.toString() + "." + dateTime.year.toString();
}

Widget flightShuttleBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext
) {
  return DefaultTextStyle(
    style: DefaultTextStyle.of(toHeroContext).style,
    child: toHeroContext.widget
  );
}