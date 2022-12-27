import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style{
  static const systemblue =  Color(0xFFED2736);
  static const greycolor=   Colors.grey;
  static const whitecolor=   Colors.white;
  static const blackcolor=   Colors.black;
  static const backgroundwhite=   Colors.white;
  static const headerText = TextStyle(color: systemblue, fontSize: 28, fontWeight: FontWeight.w700);
  static const normalText = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  static TextStyle mainheading  =  GoogleFonts.poppins(color: Colors.black, fontSize: 19, fontWeight: FontWeight.w600);

}

class Pods{
  static const LEFT_PADDING = EdgeInsets.only(left: 10);
  static const LEFT_WIDE_PADDING = EdgeInsets.only(left: 15);
  static const TOP_PADDING = EdgeInsets.only(top: 10);
  static const TOP_SMALL_PADDING = EdgeInsets.only(top: 5);
  static const RIGHT_PADDING = EdgeInsets.only(top: 10);
  static const HEADING_PADDING =EdgeInsets.only(left: 10,bottom: 15,top: 20);
}
