import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class Text_style_constant {
  static TextStyle H1_white = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 60,
      color: Color_constant.secondaryColor,
      fontWeight: FontWeight.w900);
  static TextStyle H4_white = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      color: Color_constant.secondaryColor,
      fontWeight: FontWeight.w400);
  static TextStyle H4_white_100 = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 12,
      color: Color_constant.secondaryColor,
      fontWeight: FontWeight.w100);
  static TextStyle H5_white_100 = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 10,
      color: Color_constant.secondaryColor,
      fontWeight: FontWeight.w100);
  static TextStyle H4_purple = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 12,
      color: Color_constant.primaryColor,
      fontWeight: FontWeight.w400);

  static TextStyle H3_purple = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      color: Color_constant.primaryColor,
      fontWeight: FontWeight.w600);

  static TextStyle H3_white = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 14,
      color: Color_constant.secondaryColor,
      fontWeight: FontWeight.w600);

  static TextStyle H2_purple = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 16,
      color: Color_constant.primaryColor,
      fontWeight: FontWeight.w800);

  static TextStyle H2_white = TextStyle(
      fontFamily: GoogleFonts.inter().fontFamily,
      fontSize: 32,
      color: Color_constant.secondaryColor,
      fontWeight: FontWeight.w800);

  // static TextStyle H2 = TextStyle(
  //     fontFamily: GoogleFonts.inter().fontFamily,
  //     fontSize: 18,
  //     // fontWeight: FontWeight.bold,
  //     color: Color_constant.primaryColor);

  // static TextStyle H4_white = TextStyle(
  //   fontFamily: GoogleFonts.inter().fontFamily,
  //   fontSize: 14,
  //   fontWeight: FontWeight.w200,
  //   color: Color_constant.secondaryColor,
  // );
  static TextStyle H4_white_bold = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color_constant.secondaryColor,
  );
  static TextStyle tab_style = TextStyle(
      fontSize: 12,
      color: Color(0xFF746E6E),
      // fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.inter().fontFamily);
  static TextStyle tab_style_bold = TextStyle(
      fontSize: 12,
      color: Color(0xFF746E6E),
      fontWeight: FontWeight.w900,
      fontFamily: GoogleFonts.inter().fontFamily);
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
