import 'package:flutter/material.dart';
import 'package:kidscare/common/utils/screen.dart';
import 'package:kidscare/common/utils/utils.dart';
import 'package:kidscare/common/utils/validatr.dart';
import 'package:kidscare/common/values/colors.dart';
import 'package:kidscare/common/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // email 控制器
  final TextEditingController _emailController = new TextEditingController();
  // password 控制器
  final TextEditingController _passwordController = new TextEditingController();

  /// 执行登录
  _handleSignIn() {
    if (!zhIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请输入正确的email地址');
      return;
    }
    if (!zhCheckStringLength(_passwordController.value.text, 6)) {
      toastInfo(msg: '密码长度不能少于6位');
      return;
    }
  }

  /// logo
  Widget _buildLogo() {
    return Container(
      width: zhSetWidth(192),
      height: zhSetHeight(38),
      margin: EdgeInsets.only(top: zhSetHeight(168)),
      child: Image.asset(
        'assets/images/Logo.png',
        fit: BoxFit.none,
      ),
    );
  }

  /// 登录表单
  Widget _buildSignInForm() {
    return Container(
      width: zhSetWidth(335),
      margin: EdgeInsets.only(top: zhSetHeight(145)),
      child: Column(
        children: [
          // email input
          inputTextEdit(
            controller: _emailController,
            hintText: "Username or email address",
            icon: Iconfont.youjian,
            marginTop: 0,
          ),
          // password input
          inputTextEdit(
            controller: _passwordController,
            hintText: "Password",
            icon: Iconfont.mima,
            isPassword: true,
            marginTop: 34,
          ),
          // sign in button
          Container(
            margin: EdgeInsets.only(
              top: zhSetHeight(41),
            ),
            child: btnFlatButtonWidget(
              onPressed: _handleSignIn,
              title: "Sign In",
              gradient: LinearGradient(colors: [
                AppColors.linearGradientStart,
                AppColors.linearGradientEnd,
              ]),
              width: 335,
              height: 54,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  /// 注册、重置按钮
  Widget _buildSignupButton() {
    return Container(
      width: zhSetWidth(335),
      margin: EdgeInsets.only(
        bottom: zhSetHeight(123),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // forgot password
          btnTextButtonWidget(
            onPressed: () {},
            title: "Forgot Password",
            fontColor: AppColors.textButton1,
            width: 200,
            height: 40,
          ),
          // sign up
          btnTextButtonWidget(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/sign-up",
              );
            },
            title: "Don‘t have an account? Sign Up",
            fontColor: AppColors.line1,
            width: 330,
            height: 40,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildSignInForm(),
            Spacer(),
            _buildSignupButton(),
          ],
        ),
      ),
    );
  }
}
