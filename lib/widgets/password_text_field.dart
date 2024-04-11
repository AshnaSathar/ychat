import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:provider/provider.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.context,
    required this.controller,
  }) : super(key: key);

  final BuildContext context;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<Password_provider>(
      builder: (context, passwordProvider, _) {
        return TextField(
          controller: controller,
          obscureText: !passwordProvider.isVisible(controller),
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Password",
            hintStyle: Text_style_constant.H4_white,
            labelStyle: Text_style_constant.H4_white,
            suffixIconColor: Color_constant.secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color_constant.secondaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color_constant.secondaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color_constant.secondaryColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color_constant.secondaryColor),
            ),
            suffixIcon: InkWell(
              onTap: () {
                if (passwordProvider != null) {
                  print('Password provider is not null');
                  passwordProvider.toggleVisibility(controller);
                } else {
                  print('Password provider is null');
                }
              },
              child: Icon(
                passwordProvider != null &&
                        passwordProvider.isVisible(controller)
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Password_provider extends ChangeNotifier {
  final Map<TextEditingController, bool> _visibilityMap = {};

  bool isVisible(TextEditingController controller) {
    return _visibilityMap[controller] ?? false;
  }

  void toggleVisibility(TextEditingController controller) {
    _visibilityMap[controller] = !(_visibilityMap[controller] ?? false);
    notifyListeners();
  }
}
