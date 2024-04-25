import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class Notifications_page extends StatefulWidget {
  const Notifications_page({super.key});
  @override
  State<Notifications_page> createState() => _Notifications_pageState();
}

class _Notifications_pageState extends State<Notifications_page> {
  @override
  bool isSwitched = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(title: "Notifications", context: context),
      body: Column(
        children: [
          Row(
            children: [
              Text("Enable/Disable"),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Transform.scale(
                    scale: .5,
                    child: Switch(value: isSwitched, onChanged: toggleSwitch)),
              )
            ],
          )
        ],
      ),
    );
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }
}
