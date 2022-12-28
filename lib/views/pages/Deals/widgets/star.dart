

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/style.dart';

class Star extends StatelessWidget {
  const Star({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Row(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetwee,
          children: [
            Container(
              child: Icon(
                Icons.star,
                size: 15,
                color: Color(0xFFffd700),
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                size: 15,
                color: Color(0xFFffd700),
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                size: 15,
                color: Color(0xFFffd700),
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                size: 15,
                color: Color(0xFFffd700),
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                size: 15,
                color: Color(0xFFffd700),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
                child: Text(
                  "30 Reviews",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Style.greycolor,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
