import 'package:draw_idea/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  backgroundColor: Colors.black,
  canvasColor: Colors.black,
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Color(0xFF2C2C2C)),
  textTheme: TextTheme(
    headlineSmall: GoogleFonts.poppins(
        color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
    titleSmall: GoogleFonts.poppins(
        color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.poppins(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.poppins(
        color: Colors.white, fontSize: 14,height: 2, fontWeight: FontWeight.w600),
    bodySmall: GoogleFonts.poppins(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.poppins(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
    labelLarge: GoogleFonts.poppins(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
  ),
  selectedRowColor: Colors.white,
  indicatorColor: Colors.white,
  highlightColor: Style.systemblue,
  primaryColorDark: Color(0xFF2C2C2C),
  splashColor: Color(0xFF2C2C2C),
  focusColor: Colors.white,
  hoverColor: Colors.black,
  dividerColor: Colors.white,
  errorColor: Color(0xFF2C2C2C),
  cardColor: Color(0xFF2C2C2C),
  buttonColor: Colors.deepPurple,
  bottomAppBarColor: Colors.deepPurple,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.deepPurple,
    textTheme: ButtonTextTheme.primary,
  ),
);
ThemeData lightTheme = ThemeData(
  backgroundColor: Color(0xFFFFF9E9),
  canvasColor: Colors.white,
  textTheme: TextTheme(
    headlineSmall: GoogleFonts.poppins(
        color: Colors.black, fontSize: 19, fontWeight: FontWeight.w600),
    titleSmall: GoogleFonts.poppins(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
    titleMedium: GoogleFonts.poppins(
        color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.poppins(
        color: Colors.black, fontSize: 14,height: 2, fontWeight: FontWeight.w600),
    bodySmall: GoogleFonts.poppins(
        color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500),
    bodyLarge: GoogleFonts.poppins(
        color: Colors.grey,height: 2, fontSize: 14, fontWeight: FontWeight.w500),
    labelLarge: GoogleFonts.poppins(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
  ),
  selectedRowColor:Colors.grey,
  indicatorColor: Colors.black54,
  highlightColor: Style.systemblue,
  splashColor: Colors.grey[200],
  primaryColorDark: Colors.black45,
  focusColor: Colors.black,
  hoverColor: Colors.black,
  dividerColor: Colors.white70,
  errorColor: Colors.grey[200],
  cardColor: Colors.white,
  buttonColor: Colors.cyan,
  bottomAppBarColor: Colors.cyan,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.cyan,
    textTheme: ButtonTextTheme.primary,
  ),
);
