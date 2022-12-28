

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/style.dart';

class HeadingInner extends StatelessWidget {
  final text;
  const HeadingInner({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text, style: GoogleFonts.poppins(
          fontSize: 22,
          color: Style.blackcolor,
          fontWeight: FontWeight.w600),),
    );
  }
}
