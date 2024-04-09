import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/view/login/login_page.dart';
import 'package:flutter_application_1/view/registration/registration_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_page extends StatefulWidget {
  const Splash_page({super.key});

  @override
  State<Splash_page> createState() => _Splash_pageState();
}

class _Splash_pageState extends State<Splash_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lets get started",
                style: Text_style_constant.H2_white_bold,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 8),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Color_constant.secondaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Registration_page(),
                    ));
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * .7,
                decoration: BoxDecoration(
                    color: Color_constant.secondaryColor,
                    borderRadius: BorderRadius.circular(5)),
                height: MediaQuery.sizeOf(context).height * .06,
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Color_constant.primaryColor,
                        fontFamily: GoogleFonts.inter().fontFamily),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Text_style_constant.content_style_white,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login_page(),
                            ));
                      },
                      child: Text("Sing In"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
