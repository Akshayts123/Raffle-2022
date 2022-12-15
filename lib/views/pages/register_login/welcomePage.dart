import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/register_login/signup.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'Widget/bezierContainer.dart';
import 'loginPage.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: 160,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Style.whitecolor, width: 2),
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //       color: Color(0xffdf8e33).withAlpha(100),
            //       offset: Offset(2, 4),
            //       blurRadius: 8,
            //       spreadRadius: 2)
            // ],
            color: Style.whitecolor),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Style.blackcolor),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: 160,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Style.whitecolor, width: 2),
        ),
        child: Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Style.whitecolor),
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
    return Scaffold(
      body:SingleChildScrollView(
        child:Stack(
          children: [
            Positioned(
                child: BezierContainer()),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height,
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
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF070A0F),Color(0xFF070A0F)])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    _title(),

                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Image.asset(
                       "assets/purchase.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 250,
                    ),
                    Row(
                      children: [
                        _submitButton(),
                        SizedBox(
                          width: 20,
                        ),
                        _signUpButton(),
                      ],
                    )

                    // SizedBox(
                    //   height: 20,
                    // ),


                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
