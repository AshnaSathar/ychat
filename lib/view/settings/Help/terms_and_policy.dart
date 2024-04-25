import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class Terms_and_privacy_page extends StatefulWidget {
  const Terms_and_privacy_page({super.key});
  @override
  State<Terms_and_privacy_page> createState() => _Terms_and_privacy_pageState();
}

class _Terms_and_privacy_pageState extends State<Terms_and_privacy_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color_constant.primaryColor,
      appBar: app_bar(title: "Terms and privacy policy", context: context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Text(
            //   "Welcome to YNOTZ!",
            //   style: Text_style_constant.H4_white_bold,
            // )
            ListTile(
              title: Text(
                "Welcome to YNOTZ!",
                style: Text_style_constant.H4_white,
              ),
              subtitle: Text(
                "\n These Terms of Use (or \"Terms\") govern your use of YNOTZ, except where we expressly state that separate terms (and not these) apply, and provide information about the YNOTZ Service (the \"Service\"), outlined below. When you create an YNOTZ account or use YNOTZ, you agree to these Terms. The Meta Terms of Service do not apply to this Service.",
                style: Text_style_constant.H5_white_100,
                textAlign: TextAlign.justify,
              ),
            ),
            ListTile(
              title: Text(
                "The YNOTZ Service",
                style: Text_style_constant.H4_white,
              ),
              subtitle: Text(
                "\n We agree to provide you with the Instagram Service. The Service includes all of the Instagram products, features, applications, services, technologies, and software that we provide to advance Instagram's mission: To bring you closer to the people and things you love. The Service is made up of the following aspects:\n\n Offering personalized opportunities to create, connect, communicate, discover and share.People are different. So we offer  features to help you create, share, grow your presence, and communicate with people on and off Instagram. We also want to strengthen your relationships through shared experiences that you actually care about. So we build systems that try to understand who and what you and others care about, and use that information to help you create, find, join and share in experiences that matter to you. Part of that is highlighting content, features, offers and accounts that you might be interested in, and offering ways for you to experience Instagram, based on things that you and others do on and off Instagram.",
                style: Text_style_constant.H5_white_100,
                textAlign: TextAlign.justify,
              ),
            ),
            ListTile(
                subtitle: Text(
                  "We develop and use tools and offer resources to our community members that help to make their experiences positive and inclusive, including when we think they might need help. We also have teams and systems that work to combat abuse and violations of our Terms and policies, as well as harmful and deceptive behavior. We use all the information we have-including your information-to try to keep our platform secure. We also may share information about misuse or harmful content with other Meta Companies or law enforcement. Learn more in the Privacy Policy.Developing and using technologies that help us consistently serve our growing community. \n \n Organizing and analyzing information for our growing community is central to our Service. A big part of our Service is creating and using cutting-edge technologies that help us personalize, protect, and improve our Service on an incredibly large scale for a broad global community. Technologies like artificial intelligence and machine learning give us the power to apply complex processes across our Service. Automated technologies also help us ensure the functionality and integrity of our Service.",
                  style: Text_style_constant.H5_white_100,
                  textAlign: TextAlign.justify,
                ),
                title: Text(
                  "Fostering a positive, inclusive, and safe environment.",
                  style: Text_style_constant.H4_white_100,
                  // textAlign: TextAlign.justify,s
                )),
          ],
        ),
      ),
    );
  }
}
