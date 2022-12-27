import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/style.dart';

class CatogoryItems extends StatelessWidget {
  final image;
  final title;
  const CatogoryItems({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
                image: AssetImage(image))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // width: 150,
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      height: 1.2,
                      color: Style.whitecolor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
