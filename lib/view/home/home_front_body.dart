import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/widgets/search_bar.dart';

class Home_front_body extends StatefulWidget {
  const Home_front_body({super.key});

  @override
  State<Home_front_body> createState() => _Home_front_bodyState();
}

class _Home_front_bodyState extends State<Home_front_body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchbarCustom(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Julie",
                        style: TextStyle(
                            color: Color_constant.name_color,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.green,
                    ),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://i0.wp.com/eacademy.edu.vn/wp-content/uploads/2023/photos1/1/WhatsApp-DP-Cute-309.jpg?resize=720%2C900&ssl=1"),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
