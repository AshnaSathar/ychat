import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/controller/blocked_controller.dart';
import 'package:flutter_application_1/controller/login_provider.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Privacy_page extends StatefulWidget {
  const Privacy_page({super.key});
  @override
  State<Privacy_page> createState() => _Privacy_pageState();
}

class _Privacy_pageState extends State<Privacy_page> {
  @override
  Widget build(BuildContext context) {
    Provider.of<Block_Provider>(context, listen: false).get_block_list(
      user_id: Provider.of<Login_provider>(context, listen: false).user_id,
      token: Provider.of<Login_provider>(context, listen: false).token,
    );

    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Privacy", context: context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Who can see my personal info",
                  style: Text_style_constant.H4_white_100,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              context.push('/status_privacy_page');
            },
            child: ListTile(
              title: Text(
                "Last seen and online",
                style: Text_style_constant.H4_white,
              ),
              subtitle: Text(
                "My contacts",
                style: Text_style_constant.H4_white_100,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.push('/Profile_privacy_page');
            },
            child: ListTile(
              title: Text(
                "Profile",
                style: Text_style_constant.H4_white,
              ),
              subtitle: Text(
                "My contacts",
                style: Text_style_constant.H4_white_100,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.push('/block_page');
            },
            child: ListTile(
              title: Text(
                "Block List",
                style: Text_style_constant.H4_white,
              ),
              subtitle: Text(
                "${Provider.of<Block_Provider>(context).block_responseData?.blockedUsers.length ?? 0}",
                style: Text_style_constant.H4_white_100,
              ),
            ),
          )
        ],
      ),
    );
  }
}
