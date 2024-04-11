import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/chat_body/chat_icon_creation.dart';

Widget bottomsheet({required context}) {
  return Container(
    height: MediaQuery.sizeOf(context).height * .32,
    width: MediaQuery.sizeOf(context).width,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                iconcreation(
                    context: context,
                    icon: Icons.insert_drive_file,
                    color: Color.fromARGB(255, 110, 103, 239),
                    text: "Document"),
                SizedBox(
                  width: 40,
                ),
                iconcreation(
                    context: context,
                    icon: Icons.camera_alt,
                    color: Color.fromARGB(255, 247, 106, 96),
                    text: "Camera"),
                SizedBox(
                  width: 40,
                ),
                iconcreation(
                    context: context,
                    icon: Icons.image_rounded,
                    color: Colors.pink,
                    text: "Gallery"),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      context: context,
                      icon: Icons.headphones,
                      color: Colors.orange,
                      text: "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      context: context,
                      icon: Icons.contact_page,
                      color: Colors.blue,
                      text: "Contact"),
                  SizedBox(
                    width: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      margin: EdgeInsets.all(18),
    ),
  );
}
