import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/view/home/home_page.dart';
import 'package:flutter_application_1/view/password_recovery/forgot_password.dart';
import 'package:flutter_application_1/view/registration/splash_screen.dart';
import 'package:flutter_application_1/widgets/bottom_sheet.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:flutter_application_1/widgets/password_text_field.dart';
import 'package:provider/provider.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<Login_provider>();
    ;
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Ynotz",
              style: Text_style_constant.H1_white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                focusColor: Color_constant.secondaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Color_constant.secondaryColor,
                  ),
                ),
                hintText: "User name",
                hintStyle: Text_style_constant.H4_white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color_constant.secondaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color_constant.secondaryColor,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PasswordTextField(
              context: context,
              controller: passwordController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                if (usernameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  bool success = await loginProvider.post_db(
                    user_name: usernameController.text,
                    password: passwordController.text,
                  );
                  if (success) {
                    usernameController.clear();
                    passwordController.clear();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home_page(),
                        ));
                  } else {
                    show_bottom_sheet(
                      context: context,
                      data_to_display: "Invalid username or password",
                    );
                  }
                } else {
                  show_bottom_sheet(
                    context: context,
                    data_to_display: "Username or password is empty",
                  );
                }
              },
              child: Button(text: "Sign In", context: context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: Text_style_constant.H4_white_bold,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Splash_page(),
                        ));
                  },
                  child: Text("SIGN UP"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Forgot_password(),
                  ),
                );
              },
              child: Text(
                "Forgot password?",
                style: Text_style_constant.H4_white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
