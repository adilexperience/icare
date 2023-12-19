import 'package:eyeq/controllers/utils/common_functions.dart';
import 'package:eyeq/controllers/utils/local_assets.dart';
import 'package:eyeq/views/auth/register_screen.dart';
import 'package:eyeq/views/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controllers/utils/app_colors.dart';
import '../dashboard.dart';
import '../widgets/primary_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSecured = true;

  void toggleObscure() {
    isSecured = !isSecured;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: height * 0.1),
              SvgPicture.asset(
                LocalAssets.blueApplicationIcon,
                width: height * 0.130,
              ),
              SizedBox(height: height * 0.05),
              Text(
                "Log In",
                style: CommonFunctions.largeTextStyle,
              ),
              SizedBox(height: height * 0.03),
              AppTextField(
                fieldHeading: 'Email Address',
                controller: emailController,
                hintText: 'example@eyeq.com',
                keyboardType: TextInputType.emailAddress,
                fillcolor: AppColors.lightGreyColor,
                maxlines: 1,
                togglePassword: false,
                isTextHidden: false,
                validator: (val) {
                  RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (val.isEmpty || !regex.hasMatch(val)) {
                    return "Must have:\nAt least one upper case\nAt least one lower case\nAt least one digit\nLength no less than 8.";
                  }
                },
              ),
              SizedBox(height: height * 0.02),
              AppTextField(
                fieldHeading: 'Password',
                controller: passwordController,
                hintText: '***********',
                keyboardType: TextInputType.text,
                fillcolor: AppColors.lightGreyColor,
                maxlines: 1,
                togglePassword: true,
                customSuffix: Icon(
                  isSecured ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: AppColors.textLightColor,
                ),
                toggleFunction: () => toggleObscure(),
                isTextHidden: isSecured,
                validator: (val) {
                  RegExp regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (val.isEmpty || !regex.hasMatch(val)) {
                    return "Must have:\nAt least one upper case\nAt least one lower case\nAt least one digit\nLength no less than 8.";
                  }
                },
              ),
              SizedBox(height: height * 0.02),
              Text(
                "Forgot Password?",
                style: CommonFunctions.mediumTextStyle,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: height * 0.04),
              PrimaryCard(
                onPressed: () => CommonFunctions.pushScreenAndRemoveUntil(
                  context,
                  const DashboardScreen(),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 15.0,
                ),
                cardColor: AppColors.primaryColor,
                child: Center(
                  child: Text(
                    "Login",
                    style: CommonFunctions.mediumTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              InkWell(
                onTap: () => CommonFunctions.pushScreen(
                  context,
                  const RegisterScreen(),
                ),
                child: Text(
                  "Don't have an account already? Signup",
                  style: CommonFunctions.mediumTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
