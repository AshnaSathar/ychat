import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:image_picker/image_picker.dart';

Widget iconcreation(
    {required context,
    required IconData icon,
    required Color color,
    required String text}) {
  return Column(
    children: [
      CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.08,
        backgroundColor: color,
        child: InkWell(
          onTap: () async {
            switch (icon) {
              case Icons.insert_drive_file:
                break;
              case Icons.camera_alt:
                print("camera");
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);
                print(image);
                break;
              case Icons.image_rounded:
                print("gallery");
                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                print(image);
                break;
              case Icons.headphones:
                print("audio");

                break;
              case Icons.contact_page:
                print("contact");

                break;
            }
          },
          child: Icon(
            icon,
            color: Color_constant.primaryColor,
            size: MediaQuery.of(context).size.width * 0.07,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(text)
    ],
  );
}

// class CameraPermissions extends StatefulWidget {
//   const CameraPermissions({super.key});

//   @override
//   State<CameraPermissions> createState() => _CameraPermissionsState();
// }

// class _CameraPermissionsState extends State<CameraPermissions> {
//   late CameraController controller;
//   late List<CameraDescription> cameras;
//   bool showCamera = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
