import 'package:eyeq/controllers/utils/common_functions.dart';
import 'package:eyeq/controllers/utils/local_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    runSplashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(LocalAssets.whiteApplicationIcon),
        ],
      ),
    );
  }

  void runSplashTimer() {
    // run splash timer and process auth
    Future.delayed(const Duration(seconds: 2), () {
      CommonFunctions.pushScreenAndRemoveUntil(
        context,
        const LoginScreen(),
      );
    });
  }
}
