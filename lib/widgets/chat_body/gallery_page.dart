import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class Gallery_page extends StatefulWidget {
  const Gallery_page({super.key});

  @override
  State<Gallery_page> createState() => _Gallery_pageState();
}

class _Gallery_pageState extends State<Gallery_page> {
  @override
  Widget build(BuildContext context) {
    List images = [
      "assets/image9.avif",
      "assets/image20.jpeg",
      "assets/image11.jpeg",
      "assets/image12.webp",
      "assets/image13.jpeg",
      "assets/image19.jpeg",
      "assets/image20.jpeg",
      "assets/image16.jpeg",
      "assets/image16.jpeg",
      "assets/image20.jpeg",
      "assets/image14.jpeg",
      "assets/image4.jpeg",
      "assets/image6.jpeg",
      "assets/image10.jpeg",
      "assets/image9.avif",
      "assets/image13.jpeg",
      "assets/image8.jpeg",
      "assets/image7.jpeg",
      "assets/image5.webp",
      "assets/image2.jpeg",
      "assets/image1.avif",
      "assets/image 20.png",
      "assets/imag3.jpeg"
    ];
    return Scaffold(
      appBar: app_bar(title: "Gallery", context: context),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 18,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                // height: MediaQuery.sizeOf(context).height * .05,
                // width: MediaQuery.sizeOf(context).width * .06,
                child: Image.asset(
              images[index],
              fit: BoxFit.fill,
            )),
          );
        },
      ),
    );
  }
}
