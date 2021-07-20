import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kidscare/common/utils/utils.dart';
import 'package:kidscare/common/values/values.dart';
import 'package:kidscare/pages/sign_in/sign_in.dart';

class GuidancePage extends StatefulWidget {
  GuidancePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GuidancePageState();
}

class _GuidancePageState extends State<GuidancePage> {
  int _currentIndex = 0;
  late PageController _controller = new PageController(
    initialPage: 0, // 默认显示页面
    keepPage: false, //是否保持加载页面状态
  );

  /// 引导图片
  Positioned _buildBackground(double width, double height) {
    return Positioned.fill(
      child: PageView(
        controller: _controller,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: [
          Image.asset(
            'assets/images/onboarding_contact.png',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/images/onboarding_nutrition.png',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/images/onboarding_calculate.png',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Image.asset(
            'assets/images/onboarding_information.png',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  /// 点指示器
  Positioned _buildIndfot() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: zhSetHeight(138),
      height: zhSetHeight(9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIndefot(_currentIndex == 0),
          _buildIndefot(_currentIndex == 1),
          _buildIndefot(_currentIndex == 2),
          _buildIndefot(_currentIndex == 3),
        ],
      ),
    );
  }

  /// skip next 按钮
  Positioned _buildSkipAndNextButtons() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: zhSetHeight(64),
      height: _currentIndex != 3 ? zhSetHeight(30) : 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => {
              setState(() {
                _currentIndex = _currentIndex > 0 ? (_currentIndex - 1) : 0;
                _controller.jumpToPage(_currentIndex);
              })
            },
            child: Text(
              'SKIP',
              style: TextStyle(
                color: AppColors.primaryTextAlpha,
                fontSize: zhSetFontSize(15),
              ),
            ),
          ),
          TextButton(
            onPressed: () => {
              setState(() {
                _currentIndex = _currentIndex < 3 ? (_currentIndex + 1) : 3;
                _controller.jumpToPage(_currentIndex);
              })
            },
            child: Text(
              'NEXT',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: zhSetFontSize(15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 开始按钮
  Positioned _buildFinalButton(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: zhSetHeight(46),
      height: zhSetHeight(57),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/sign-in");
            },
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: zhSetFontSize(15),
                ),
              ),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                return Colors.red;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return AppColors.primaryText;
              }),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.5),
                ),
              ),
              fixedSize: MaterialStateProperty.all(Size(
                  _currentIndex == 3 ? zhSetWidth(312) : 0,
                  _currentIndex == 3 ? zhSetHeight(57) : 0)),
              minimumSize: MaterialStateProperty.all(Size(0, 0)),
            ),
            child: Text('GET STARTED !'),
          ),
        ],
      ),
    );
  }

  /// 点
  Widget _buildIndefot(bool isSelect) {
    return AnimatedContainer(
      width: zhSetWidth(9),
      height: zhSetWidth(9),
      margin: EdgeInsets.only(left: zhSetWidth(12)),
      duration: Duration(milliseconds: 800),
      decoration: BoxDecoration(
          color: isSelect ? AppColors.primaryText : AppColors.primaryTextAlpha,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.primaryText,
        // 布局
        body: Stack(
          children: [
            _buildBackground(width, height),
            _buildIndfot(),
            _buildSkipAndNextButtons(),
            _buildFinalButton(context),
          ],
        ));
  }
}
