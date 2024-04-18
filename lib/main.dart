import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/favourites_provider.dart';
import 'package:flutter_application_1/controller/friendship_provider.dart';
import 'package:flutter_application_1/controller/image_provider.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/controller/password_recovery.dart';
import 'package:flutter_application_1/controller/profile_provider.dart';
import 'package:flutter_application_1/controller/register_provider.dart';
import 'package:flutter_application_1/controller/rooms_provider.dart';
import 'package:flutter_application_1/controller/update_password.dart';
import 'package:flutter_application_1/controller/users.dart';
import 'package:flutter_application_1/view/home/home_front_body.dart';
import 'package:flutter_application_1/view/home/home_page.dart';
import 'package:flutter_application_1/view/home/home_room_body.dart';
import 'package:flutter_application_1/view/login/login_page.dart';
import 'package:flutter_application_1/view/password_recovery/create_password_page.dart';
import 'package:flutter_application_1/view/password_recovery/email_verification.dart';
import 'package:flutter_application_1/view/password_recovery/forgot_password.dart';
import 'package:flutter_application_1/view/profile/edit_profile_page.dart';
import 'package:flutter_application_1/view/profile/friend_profile_page.dart';
import 'package:flutter_application_1/view/profile/friends_list_page.dart';
import 'package:flutter_application_1/view/profile/password_success_page.dart';
import 'package:flutter_application_1/view/profile/profile_page.dart';
import 'package:flutter_application_1/view/profile/update_password_page.dart';
import 'package:flutter_application_1/view/public_rooms/room_chat_page.dart';
import 'package:flutter_application_1/view/registration/registration_page.dart';
import 'package:flutter_application_1/view/registration/splash_screen.dart';
import 'package:flutter_application_1/view/settings/account_page.dart';
import 'package:flutter_application_1/view/settings/change_mob_num_page.dart';
import 'package:flutter_application_1/view/settings/change_mob_num_page2.dart';
import 'package:flutter_application_1/view/settings/change_mob_num_page_3.dart';
import 'package:flutter_application_1/widgets/email_text_field.dart';
import 'package:flutter_application_1/widgets/password_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(
      initialLocation: '/login_page',
      routes: [
        GoRoute(
            path: '/login_page',
            builder: (context, state) => const Login_page()),
        GoRoute(
            path: '/home_page', builder: (context, state) => const Home_page()),
        GoRoute(
            path: '/Profile_page',
            builder: (context, state) => const Profile_page()),
        GoRoute(
            path: '/home_front_body',
            builder: (context, state) => const Home_front_body()),
        GoRoute(
            path: '/home_room_body',
            builder: (context, state) => const Home_room_body()),
        GoRoute(
            path: '/create_password_page/:email_id',
            builder: (context, state) {
              final email_id = state.pathParameters['email_id'];
              return Create_password_page(
                email_id: email_id,
              );
            }),
        GoRoute(
            path: '/email_verification_page/:email_id',
            builder: (context, state) {
              final email_id = state.pathParameters['email_id']!;
              return Email_verification_page(
                email_id: email_id,
              );
            }),
        GoRoute(
            path: '/forget_password',
            builder: (context, state) => const Forgot_password()),
        GoRoute(
            path: '/edit_profile_page',
            builder: (context, state) {
              return Edit_profile_page();
            }),
        GoRoute(
            path: '/friend_list_page',
            builder: (context, state) => const Friends_list_page()),
        //      builder: (BuildContext context, GoRouterState state) {
        //   final name = state.params['name']!;
        //   return DetailScreen(
        //     name: name,
        //   );
        // },
        GoRoute(
            path: '/password_success_page',
            builder: (context, state) => const Password_success_page()),
        GoRoute(
            path: '/update_password_page',
            builder: (context, state) => const Update_password_page()),
        GoRoute(
            path: '/room_chat_page',
            builder: (context, state) => const Room_chat_page()),
        GoRoute(
            path: '/registration_page',
            builder: (context, state) => const Registration_page()),
        GoRoute(
            path: '/splash_page',
            builder: (context, state) => const Splash_page()),
        GoRoute(
            path: '/account_page',
            builder: (context, state) => const Account_page()),
        GoRoute(
            path: '/change_mob_num_page',
            builder: (context, state) => const Change_mob_number_page()),
        GoRoute(
            path: '/change_mob_num_page_2',
            builder: (context, state) => const Change_mob_number_page_2()),
        GoRoute(
            path: '/change_mob_number_page_3',
            builder: (context, state) => const Change_mob_number_page_3()),
        // GoRoute(
        //   path: '/chat_page',
        //   builder: (context, state) => const Chat_Page(),
        // )
        GoRoute(
          path: '/friend_profile_page',
          builder: (context, state) {
            return Friend_profile_page();
          },
        )
      ],
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Email_provider(),
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
        ChangeNotifierProvider(
          create: (context) => Update_password_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Rooms_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Favourites_provider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter,
        // routerDelegate: goRouter.routerDelegate,
        // routeInformationParser: goRouter.routeInformationParser,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
      ),
    );
  }
}
