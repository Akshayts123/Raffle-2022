import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/home/home_screen.dart';
import 'package:draw_idea/views/pages/register_login/phone_page.dart';
import 'package:draw_idea/views/pages/register_login/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/register_controller.dart';
import '../../../services/firebase_auth_service.dart';
import '../qr_code/qr_code.dart';
import 'Widget/bezierContainer.dart';
import 'Widget/wave.dart';
import 'loginPage.dart';

class WelcomeScreen extends StatefulWidget {

  WelcomeScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final RegisterController loginController = Get.find();
  Widget _backButton() {
    return  new WillPopScope(
      onWillPop: () async {
        Get.offNamed('/WelcomeScreen');
        return true;
      },
      child: InkWell(
        onTap: () {
          // Navigator.pop(context);
          // Get.to(SignUpPage());
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
      ),
    );
  }


  Widget _submitButton1() {
    return GestureDetector(
      onTap: ()async {
        // final response = await loginController.Login();
        // if(response == 200) {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        // }

        // loginController.Login();
        Get.to(LoginPhonePage());
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.phone_android,size: 30,color: Style.whitecolor,)
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Style.systemblue,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Phone Verification',
                  style: Style.text22,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitButton2() {
    return GestureDetector(
      onTap: ()async {
        // final response = await loginController.Login();
        // if(response == 200) {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        // }

        // loginController.Login();
        Get.to(SignUpPage());
      },
      child:Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.email,size: 30,color: Style.whitecolor,)
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Style.systemblue,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Email Registration',
                  style: Style.text22,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitButton3() {
    return GestureDetector(
      onTap: ()async {
        // final response = await loginController.Login();
        // if(response == 200) {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        // }

        // loginController.Login();
        Get.to(LoginPage());
      },
      child:Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.login,size: 30,color: Style.whitecolor,)
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Style.systemblue,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Email Login',
                  style: Style.text22,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,color: Colors.grey[400],
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,color: Colors.grey[400],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _guestButton() {
    return InkWell(
      onTap: (){
        Get.to(QRScanner());
        // logoutUser();
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.account_circle,size: 30,color: Style.whitecolor,)
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Style.greycolor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Log in as Guest',
                  style: Style.text22,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget socialMedia(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RawMaterialButton(

            onPressed: () {},
            constraints: BoxConstraints(),
            elevation: 3.0,
            fillColor: Style.whitecolor,
            child:Image.asset(
              "assets/google.png",
              width: 30.0,
              height: 30.0,
              fit: BoxFit.cover,
            ),
            padding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
          ),
          RawMaterialButton(

            onPressed: () {},
            constraints: BoxConstraints(),
            elevation: 3.0,
            fillColor: Style.whitecolor,
            child:Image.asset(
              "assets/face.png",
              width: 30.0,
              height: 30.0,
              fit: BoxFit.cover,
            ),
            padding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
          ),
          RawMaterialButton(

            onPressed: () {},
            constraints: BoxConstraints(),
            elevation: 3.0,
            fillColor: Style.whitecolor,
            child:Image.asset(
              "assets/twitter.png",
              width: 30.0,
              height: 30.0,
              fit: BoxFit.cover,
            ),
            padding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
          ),
          RawMaterialButton(

            onPressed: () {},
            constraints: BoxConstraints(),
            elevation: 3.0,
            fillColor: Style.whitecolor,
            child:Image.asset(
              "assets/insta.png",
              width: 30.0,
              height: 30.0,
              fit: BoxFit.cover,
            ),
            padding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text("Raffle Draw",style:Style.text16),
    );
  }



  @override
  Widget build(BuildContext context) {


    final height = MediaQuery.of(context).size.height;
    return  new WillPopScope(
      onWillPop: () async {
        Get.to(WelcomeScreen());
        return true;
      },
      child: Scaffold(
          backgroundColor: Style.whitecolor,
          body: Container(
            height: height,
            child: Stack(
              children: <Widget>[

                Positioned(
                    child: BezierContainer()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        SizedBox(height: height * .2),
                        _title(),
                        SizedBox(height: 100),
                        SizedBox(height: 20),
                        _submitButton1(),
                        SizedBox(height: 20),
                        _submitButton2(),
                        SizedBox(height: 20),
                        _submitButton3(),
                        SizedBox(height: 20),
                        _divider(),
                        _guestButton(),
                        SizedBox(
                          height: 10,
                        ),
                        socialMedia(),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )),
    );
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
//      home: isLoggedIn ? HomeScreen() : WelcomeScreen(),
//    ));
// }

}
