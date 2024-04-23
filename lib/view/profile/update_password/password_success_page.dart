import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class Password_success_page extends StatefulWidget {
  const Password_success_page({super.key});

  @override
  State<Password_success_page> createState() => _Password_success_pageState();
}

class _Password_success_pageState extends State<Password_success_page> {
  @override
  void initState() {
    super.initState();
    navigateToHomePageAfterDelay();
  }

  void navigateToHomePageAfterDelay() async {
    Timer(Duration(seconds: 1, milliseconds: 55), () {
      context.go('/home_page');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 55,
                child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.modulate),
                    child: Lottie.asset('assets/UbbqZSfzTg.json',
                        fit: BoxFit.cover))),
            // CircleAvatar(
            //   radius: 65,
            //   backgroundColor: Color(0xFFFFFFFF).withOpacity(0.5),
            //   child: CircleAvatar(
            //     backgroundColor: Color(0xFFFFFFFF).withOpacity(0.7),
            //     maxRadius: 50,
            //     child: Icon(
            //       Icons.check,
            //       size: 85,
            //       color: Color_constant.primaryColor,
            //     ),
            //   ),
            // ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Password changed",
                  style: Text_style_constant.H3_white,
                ),
              ),
            ),
            Center(
              child: Text(
                "successfully!",
                style: Text_style_constant.H3_white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Your password has been changed successfully, we will let you know if there are more problems with your account",
                  style: Text_style_constant.H4_white,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
