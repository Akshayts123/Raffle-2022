

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/style.dart';

class Heading extends StatelessWidget {
  final text;
  const Heading({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text, style: Style.text151),
    );
  }
}
