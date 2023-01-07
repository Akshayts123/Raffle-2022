import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/home/home_screen.dart';
import 'package:draw_idea/views/pages/register_login/otp_page.dart';
import 'package:draw_idea/views/pages/register_login/signup.dart';
import 'package:draw_idea/views/pages/register_login/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/appDimens.dart';
import '../../../controller/register_controller.dart';
import '../../../services/firebase_auth_service.dart';
import '../../../utils/appColors.dart';
import 'Widget/bezierContainer.dart';
import 'Widget/wave.dart';

class LoginPhonePage extends StatefulWidget {

  LoginPhonePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPhonePageState createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  final TextEditingController textEditingController = TextEditingController();
  final RegisterController loginController = Get.find();
  Widget _backButton() {
    return new WillPopScope(
      onWillPop: () async {
        Get.to(WelcomeScreen());
        return true;
      },
      child: InkWell(
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
            "Mobile No",
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: Style.blackcolor,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          emailMobileView(),
        ],
      ),
    );
  }

  Widget emailMobileView() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfff3f3f4),
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0, 1),
        //     blurRadius: 2,
        //     color: Colors.black54,
        //   ),
        // ],
        // border: Border.all(color: AppColors.blackColor, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 10,right: 10
            ),
            child: Text(
              "+91",
              style: TextStyle(fontSize: 16, color: AppColors.greyText),
            ),
          ),
          // Container(
          //   color: AppColors.blackColor,
          //   width: 0.5,
          //   height: 50,
          // ),
          Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
          ),
          Expanded(
            child: TextField(
              controller: textEditingController,
              obscureText: false,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }

  continueClick() {
    FocusScope.of(context).requestFocus(new FocusNode());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OtpPage(
          mobile: textEditingController.text,
          countrycode: "+91",
        ),
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        // final response = await loginController.Login();
        // if(response == 200) {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        // }
        
        continueClick();
        // loginController.Login();
      },
      child: Container(
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
          'Continue',
          style: GoogleFonts.poppins(
              fontSize: 17,
              color: Style.whitecolor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // Widget _divider() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Row(
  //       children: <Widget>[
  //         SizedBox(
  //           width: 20,
  //         ),
  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 10),
  //             child: Divider(
  //               thickness: 1,
  //             ),
  //           ),
  //         ),
  //         Text('or'),
  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 10),
  //             child: Divider(
  //               thickness: 1,
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           width: 20,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _guestButton() {
  //   return InkWell(
  //     onTap: () {
  //       logoutUser();
  //     },
  //     child: Container(
  //       height: 50,
  //       margin: EdgeInsets.symmetric(vertical: 20),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(Radius.circular(10)),
  //       ),
  //       child: Row(
  //         children: <Widget>[
  //           Expanded(
  //             flex: 1,
  //             child: Container(
  //                 decoration: BoxDecoration(
  //                   color: Colors.black54,
  //                   borderRadius: BorderRadius.only(
  //                       bottomLeft: Radius.circular(5),
  //                       topLeft: Radius.circular(5)),
  //                 ),
  //                 alignment: Alignment.center,
  //                 child: Icon(
  //                   Icons.account_circle,
  //                   size: 30,
  //                   color: Style.whitecolor,
  //                 )),
  //           ),
  //           Expanded(
  //             flex: 5,
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: Style.greycolor,
  //                 borderRadius: BorderRadius.only(
  //                     bottomRight: Radius.circular(5),
  //                     topRight: Radius.circular(5)),
  //               ),
  //               alignment: Alignment.center,
  //               child: Text(
  //                 'Log in as Guest',
  //                 style: GoogleFonts.poppins(
  //                     fontSize: 16,
  //                     color: Style.whitecolor,
  //                     fontWeight: FontWeight.w400),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget socialMedia() {
  //   return Container(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         RawMaterialButton(
  //           onPressed: () {},
  //           constraints: BoxConstraints(),
  //           elevation: 3.0,
  //           fillColor: Style.whitecolor,
  //           child: Image.asset(
  //             "assets/google.png",
  //             width: 30.0,
  //             height: 30.0,
  //             fit: BoxFit.cover,
  //           ),
  //           padding: EdgeInsets.all(10.0),
  //           shape: CircleBorder(),
  //         ),
  //         RawMaterialButton(
  //           onPressed: () {},
  //           constraints: BoxConstraints(),
  //           elevation: 3.0,
  //           fillColor: Style.whitecolor,
  //           child: Image.asset(
  //             "assets/face.png",
  //             width: 30.0,
  //             height: 30.0,
  //             fit: BoxFit.cover,
  //           ),
  //           padding: EdgeInsets.all(10.0),
  //           shape: CircleBorder(),
  //         ),
  //         RawMaterialButton(
  //           onPressed: () {},
  //           constraints: BoxConstraints(),
  //           elevation: 3.0,
  //           fillColor: Style.whitecolor,
  //           child: Image.asset(
  //             "assets/twitter.png",
  //             width: 30.0,
  //             height: 30.0,
  //             fit: BoxFit.cover,
  //           ),
  //           padding: EdgeInsets.all(10.0),
  //           shape: CircleBorder(),
  //         ),
  //         RawMaterialButton(
  //           onPressed: () {},
  //           constraints: BoxConstraints(),
  //           elevation: 3.0,
  //           fillColor: Style.whitecolor,
  //           child: Image.asset(
  //             "assets/insta.png",
  //             width: 30.0,
  //             height: 30.0,
  //             fit: BoxFit.cover,
  //           ),
  //           padding: EdgeInsets.all(10.0),
  //           shape: CircleBorder(),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
              Positioned(child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _title(),
                      SizedBox(height: 50),
                      _entryField(),
                      SizedBox(height: 30),
                      _submitButton(),
                      SizedBox(height: 20),
                      // _divider(),
                      // _guestButton(),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // socialMedia(),

                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ));
  }

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs?.setBool("guest", true);
    prefs?.setBool("isLoggedIn", true);
    Get.to(HomeScreen());
  }
// Future<void> main() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    var status = prefs.getBool('isLoggedIn') ?? false;
//   var isLoggedIn = (prefs.getBool('isLoggedIn') == null) ? false : prefs.getBool('isLoggedIn');
//    runApp(MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: isLoggedIn ? HomeScreen() : loginPage(),
//    ));
// }

}
