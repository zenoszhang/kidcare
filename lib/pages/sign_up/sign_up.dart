import 'package:flutter/material.dart';
import 'package:kidscare/common/utils/utils.dart';
import 'package:kidscare/common/utils/validatr.dart';
import 'package:kidscare/common/values/values.dart';
import 'package:kidscare/common/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// email
  final TextEditingController _emailController = new TextEditingController();

  /// full name
  final TextEditingController _nameController = new TextEditingController();

  /// moble phone
  final TextEditingController _mobileController = new TextEditingController();

  /// password
  final TextEditingController _passwordController = new TextEditingController();

  _handleSignUp() {
    if (!zhIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请输入正确的email地址');
      return;
    }
    if (!zhIsName(_nameController.value.text)) {
      toastInfo(msg: '请输入正确的姓名');
      return;
    }
    if (!zhIsMobile(_mobileController.value.text)) {
      toastInfo(msg: '请输入正确的手机号');
      return;
    }
    if (!zhCheckStringLength(_passwordController.value.text, 6)) {
      toastInfo(msg: '密码长度不能少于6位');
      return;
    }
  }

  _handleSignIn() {
    Navigator.pop(context);
  }

  _handleAgreeTerms() {}
  // logo
  Widget _buildLogo() {
    return Container(
      width: zhSetWidth(192),
      height: zhSetHeight(38),
      margin: EdgeInsets.only(top: zhSetHeight(117)),
      child: Image.asset(
        'assets/images/Logo.png',
        fit: BoxFit.none,
      ),
    );
  }

  // sign up form
  Widget _buildSignUpForm() {
    return Container(
      width: zhSetWidth(335),
      margin: EdgeInsets.only(
        top: zhSetHeight(91),
      ),
      child: Column(
        children: [
          inputTextEdit(
            controller: _emailController,
            hintText: "Email address",
            icon: Iconfont.youjian,
            marginTop: 0,
          ),
          inputTextEdit(
            controller: _nameController,
            hintText: "Full Name",
            icon: Iconfont.bianji,
          ),
          inputTextEdit(
            controller: _mobileController,
            hintText: "Phone Number",
            icon: Iconfont.dianhua,
          ),
          inputTextEdit(
            controller: _passwordController,
            hintText: "Password",
            icon: Iconfont.mima,
          ),
          Container(
            margin: EdgeInsets.only(
              top: zhSetHeight(41),
            ),
            child: btnFlatButtonWidget(
              onPressed: _handleSignUp,
              title: "Sign Up",
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

  // sign in
  Widget _buildSignIn() {
    return Container(
      width: zhSetWidth(335),
      margin: EdgeInsets.only(
        bottom: zhSetHeight(89),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // agree terms
          btnTextButtonWidget(
            onPressed: _handleAgreeTerms,
            title: "By creating an account you agree to the Terms of user",
            fontColor: AppColors.textButton1,
            fontSize: 15,
            width: 240,
            height: 50,
          ),
          // sign in
          btnTextButtonWidget(
            onPressed: _handleSignIn,
            title: "Already have an account? Sign In",
            fontColor: AppColors.line1,
            fontSize: 15,
            width: 330,
            height: 30,
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
            _buildSignUpForm(),
            Spacer(),
            _buildSignIn(),
          ],
        ),
      ),
    );
  }
}
