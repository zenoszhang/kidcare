import 'package:flutter/material.dart';
import 'package:kidscare/common/utils/utils.dart';
import 'package:kidscare/common/values/values.dart';

Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 140,
  String title = "button",
  Color fontColor = AppColors.primaryText,
  double fontSize = 18,
  String fontName = "SFProDisplay",
  FontWeight fontWeight = FontWeight.w400,
  LinearGradient? gradient,
  Color bgColor = AppColors.primaryText,
  Color shadowColor = AppColors.primaryTextAlpha,
}) {
  return Container(
    width: zhSetWidth(width),
    height: zhSetHeight(height),
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: Radii.k100pxRadius,
        gradient: gradient,
        boxShadow: [
          BoxShadow(
              color: shadowColor,
              offset: Offset(5, 5),
              blurRadius: 24.0,
              spreadRadius: 10.0)
        ]),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontSize: zhSetFontSize(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}

Widget btnTextButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 140,
  String title = "button",
  Color fontColor = AppColors.primaryText,
  double fontSize = 18,
  String fontName = "SFProDisplay",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: zhSetWidth(width),
    height: zhSetHeight(height),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontSize: zhSetFontSize(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}
