import 'package:draw_idea/views/pages/qr_code/qr_code.dart';
import 'package:draw_idea/views/pages/register_login/welcome_page.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../controller/register_controller.dart';
import '../../../services/firebase_auth_service.dart';
import '../../../utils/style.dart';
import '../../../utils/utility.dart';
import '../home/home_screen.dart';
import 'Widget/bezierContainer.dart';
import 'Widget/wave.dart';
import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  final RegisterController loginController = Get.find();
  SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();


  bool isLoadingOtp = false;
  Widget _backButton() {
    return InkWell(
      onTap: () {
        // Navigator.pop(context);
        Get.to(WelcomeScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left,
                  size: 30, color: Style.whitecolor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Username",
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Style.blackcolor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: _usernameController,
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
                  color: Style.blackcolor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                validator: (value) {
                  // add your custom validation here.
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                    return 'Please enter valid Email';
                  }
                  return null;
                },
                controller: _emailController,
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
                  color: Style.blackcolor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                validator: (value) {
                  // add your custom validation here.
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value!.length < 6) {
                    return 'Must be more than 6 charater';
                  }
                },
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        try {
          await FirebaseAuthService().signup(
              _emailController.text.trim(), _passwordController.text.trim());

          if (!mounted) return;
          setState(() {
            isLoadingOtp = true;
          });

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QRScanner()));
        } on FirebaseException catch (e) {
          debugPrint(e.message);
          _formKey.currentState!.validate();
          // Utility.showToast(msg: "Please enter valid Email and Password .");
        }
      },
      child: isLoadingOtp
          ? Center(
              child: CircularProgressIndicator(
                color: Style.systemblue,
              ),
            )
          : Container(
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
                'Register Now',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Style.whitecolor,
                    fontWeight: FontWeight.w600),
              ),
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
        margin: EdgeInsets.symmetric(vertical: 1),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Style.blackcolor,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Style.systemblue,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text(
        "Raffle Draw",
        style: GoogleFonts.poppins(
            fontSize: 25, color: Style.whitecolor, fontWeight: FontWeight.w600),
      ),
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
