import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/image_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/password_recovery.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/controller/register_provider.dart';
import 'package:flutter_application_1/controller/users.dart';
import 'package:flutter_application_1/view/friend_profile.dart';
import 'package:flutter_application_1/view/login/login_page.dart';
import 'package:flutter_application_1/view/profile/profile_page.dart';
import 'package:flutter_application_1/widgets/email_text_field.dart';
import 'package:flutter_application_1/widgets/password_text_field.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => email_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Password_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Login_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Password_recovery_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Register_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Profile_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => All_users_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Friendship_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => File_provider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login_page(),
      ),
    );
  }
}
