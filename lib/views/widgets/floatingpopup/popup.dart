import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class popnew extends StatelessWidget {
  const popnew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 50,
      height: 20,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(3)),
      child: Center(
        child: Text(
          "NEW",
          style: GoogleFonts.poppins(fontSize: 11,color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class popoffer extends StatelessWidget {
  const popoffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 50,
      height: 20,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(3)),
      child: Center(
        child: Text(
          "offer",
          style: GoogleFonts.poppins(fontSize: 11,color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
class popfree extends StatelessWidget {
  const popfree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 70,
      height: 20,
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(3)),
      child: Center(
        child: Text(
          "Free trial",
          style: GoogleFonts.poppins(fontSize: 11,color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
