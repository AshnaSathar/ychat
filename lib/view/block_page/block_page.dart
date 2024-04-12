import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class Block_page extends StatefulWidget {
  const Block_page({super.key});

  @override
  State<Block_page> createState() => _Block_pageState();
}

class _Block_pageState extends State<Block_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: app_bar(title: "Blocked Contacts", context: context),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("Name"),
                  leading: CircleAvatar(
                    backgroundColor: Colors.black12,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemCount: 5));
  }
}
