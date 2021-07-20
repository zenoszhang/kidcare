import 'package:flutter/material.dart';
import 'package:kidscare/common/utils/utils.dart';
import 'package:kidscare/common/values/values.dart';

Widget inputTextEdit({
  required TextEditingController controller,
  required String hintText,
  TextInputType keyboardType = TextInputType.text,
  IconData? icon,
  bool isPassword = false,
  double marginTop = 34,
}) {
  return Container(
    height: zhSetHeight(40),
    margin: EdgeInsets.only(top: zhSetHeight(marginTop)),
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(
      color: AppColors.primaryText,
      border: Border(
        bottom: BorderSide(
          color: AppColors.line1,
          width: zhSetWidth(1),
          style: BorderStyle.solid,
        ),
      ),
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.only(
          left: zhSetWidth(10),
          bottom: zhSetHeight(18),
        ),
        border: InputBorder.none,
        icon: icon != null
            ? Padding(
                padding: EdgeInsets.fromLTRB(
                  zhSetWidth(20),
                  0,
                  0,
                  zhSetHeight(15),
                ),
                child: Icon(
                  icon,
                  size: zhSetWidth(24),
                ),
              )
            : null,
      ),
      style: TextStyle(
          color: Colors.black,
          fontFamily: "SFProDisplay",
          fontWeight: FontWeight.w400,
          fontSize: zhSetFontSize(15)),
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
    ),
  );
}
