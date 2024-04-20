import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Help_center extends StatefulWidget {
  const Help_center({super.key});

  @override
  State<Help_center> createState() => _Help_centerState();
}

class _Help_centerState extends State<Help_center> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Help Center", context: context),
      body: Column(
        children: [
          //
          Container(
            color: Color(0xFF9442F7),
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  maxLines: 10,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    hintText: "Tell us how we can help",
                    hintStyle: Text_style_constant.H4_white_100,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                  style: Text_style_constant.H4_white_100),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "By clicking Next, you acknowledge Ynotz may review diagnostic and performance information and the metadata associated with your account to troubleshoot and solve your reported issue.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: GoogleFonts.inder().fontFamily,
                fontSize: 10,
                color: Color_constant.secondaryColor,
                fontWeight: FontWeight.w200,
              ),
            ),
          )
        ],
      ),
    );
  }
}
