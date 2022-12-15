import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../controller/register_controller.dart';
import '../../../utils/style.dart';
import 'Widget/bezierContainer.dart';
import 'Widget/wave.dart';
import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  final RegisterController loginController = Get.find();
  SignUpPage({Key ?key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        // Get.to(LoginPage());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left,size: 30, color: Style.whitecolor),
            ),

          ],
        ),
      ),
    );
  }

  Widget _entryField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Username",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color:Style.blackcolor,
              fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true)),
          SizedBox(
            height: 20,
          ),
          Text(
            "Email id",
            style: GoogleFonts.poppins(
                fontSize: 14,
                color:Style.blackcolor,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true)),
          SizedBox(
            height: 20,
          ),
          Text(
            "Password",
            style: GoogleFonts.poppins(
                fontSize: 14,
                color:Style.blackcolor,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Style.systemblue, Style.systemblue])),
      child: Text(
        'Register Now',style: GoogleFonts.poppins(
          fontSize: 16,
          color:Style.whitecolor,
          fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',style: GoogleFonts.poppins(
                fontSize: 12,
                color:Style.blackcolor,
                fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',style: GoogleFonts.poppins(
                fontSize: 12,
                color:Style.systemblue,
                fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text("Raffle Draw",style: GoogleFonts.poppins(
          fontSize: 25,
          color:Style.whitecolor,
          fontWeight: FontWeight.w600),),
    );
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Style.whitecolor,
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: BezierContainer(),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    // SizedBox(height: height * .1),
                    SizedBox(
                      height: 80,
                    ),
                    _entryField(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .10),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
