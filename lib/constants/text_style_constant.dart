import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Text_style_constant {
  static TextStyle H1 = TextStyle(
      fontFamily: 'Inter',
      fontSize: 50,
      fontWeight: FontWeight.w900,
      color: Colors.white);

  static TextStyle H2 = TextStyle(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontSize: 18,
      // fontWeight: FontWeight.bold,
      color: Color_constant.primaryColor);
  static TextStyle H2_white = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      color: Color_constant.secondaryColor);
  static TextStyle H2_white_bold = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color_constant.secondaryColor);
  static TextStyle content_style = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 14,
    color: Color_constant.secondaryColor,
  );
  static TextStyle content_style_white = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w200,
    color: Color_constant.secondaryColor,
  );
  static TextStyle content_style_white_bold = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color_constant.secondaryColor,
  );
  static TextStyle content_style_bold = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color_constant.secondaryColor);
  static TextStyle normal_text = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      color: Color_constant.name_color);
}
