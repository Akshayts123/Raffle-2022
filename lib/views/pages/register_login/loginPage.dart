import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/home/home_screen.dart';
import 'package:draw_idea/views/pages/qr_code/qr_code.dart';
import 'package:draw_idea/views/pages/register_login/signup.dart';
import 'package:draw_idea/views/pages/register_login/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/register_controller.dart';
import '../../../services/firebase_auth_service.dart';
import '../../../utils/utility.dart';
import 'Widget/bezierContainer.dart';
import 'Widget/wave.dart';

class LoginPage extends StatefulWidget {

  LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegisterController loginController = Get.find();
  bool isLoadingOtp = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  Widget _backButton() {
    return  new WillPopScope(
      onWillPop: () async {
        Get.to(WelcomeScreen());
        return true;
      },
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
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

  Widget _entryField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(
              "Email id",
              style: Style.text911
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
                style: TextStyle(color: context.theme.hoverColor),
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
              style: Style.text911
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
                style: TextStyle(color: context.theme.hoverColor),
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
    return  GestureDetector(
      onTap: ()async {

        // final response = await loginController.Login();
        // if(response == 200) {
        //   Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        // }

        try {
          await FirebaseAuthService().login(
              _emailController.text.trim(),
              _passwordController.text.trim());
          if (FirebaseAuth.instance.currentUser != null) {
            if (!mounted) return;
            setState((){isLoadingOtp = true;});
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  QRScanner()));
          }
        }on FirebaseException catch (e) {
          debugPrint("error is ${e.message}");
          _formKey.currentState!.validate();
          // Utility.showToast(msg: "Please enter valid Email and Password .");
          // showDialog(
          //     context: context,
          //     builder: (context) => AlertDialog(
          //         title: const Text(
          //             " Invalid Username or password. Please register again or make sure that username and password is correct",style: TextStyle(color: Style.blackcolor),),
          //         actions: [
          //           Container(
          //             color: Style.systemblue,
          //             child: TextButton(
          //               child: const Text("Register Now",style: TextStyle(color: Style.whitecolor),),
          //               onPressed: () {
          //                 Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) =>
          //                          SignUpPage()));
          //               },
          //             ),
          //           )
          //         ]));
        }
        // loginController.Login();
      },
      child:  isLoadingOtp ? Center(
        child: CircularProgressIndicator(
          color: Style.systemblue,
        ),
      ):Container(
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
          'Login',style: Style.text41
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
  //
  // Widget _guestButton() {
  //   return InkWell(
  //     onTap: (){
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
  //               decoration: BoxDecoration(
  //                 color: Colors.black54,
  //                 borderRadius: BorderRadius.only(
  //                     bottomLeft: Radius.circular(5),
  //                     topLeft: Radius.circular(5)),
  //               ),
  //               alignment: Alignment.center,
  //               child: Icon(Icons.account_circle,size: 30,color: Style.whitecolor,)
  //             ),
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
  //               child: Text('Log in as Guest',
  //                   style: GoogleFonts.poppins(
  //                   fontSize: 16,
  //                   color:Style.whitecolor,
  //                   fontWeight: FontWeight.w400),),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget socialMedia(){
  //   return Container(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         RawMaterialButton(
  //
  //           onPressed: () {},
  //           constraints: BoxConstraints(),
  //           elevation: 3.0,
  //           fillColor: Style.whitecolor,
  //           child:Image.asset(
  //             "assets/google.png",
  //             width: 30.0,
  //             height: 30.0,
  //             fit: BoxFit.cover,
  //           ),
  //           padding: EdgeInsets.all(10.0),
  //           shape: CircleBorder(),
  //         ),
  //         RawMaterialButton(
  //
  //           onPressed: () {},
  //           constraints: BoxConstraints(),
  //           elevation: 3.0,
  //           fillColor: Style.whitecolor,
  //           child:Image.asset(
  //             "assets/face.png",
  //             width: 30.0,
  //             height: 30.0,
  //             fit: BoxFit.cover,
  //           ),
  //           padding: EdgeInsets.all(10.0),
  //           shape: CircleBorder(),
  //         ),
  //         RawMaterialButton(
  //
  //           onPressed: () {},
  //           constraints: BoxConstraints(),
  //           elevation: 3.0,
  //           fillColor: Style.whitecolor,
  //           child:Image.asset(
  //             "assets/twitter.png",
  //             width: 30.0,
  //             height: 30.0,
  //             fit: BoxFit.cover,
  //           ),
  //           padding: EdgeInsets.all(10.0),
  //           shape: CircleBorder(),
  //         ),
  //         RawMaterialButton(
  //
  //           onPressed: () {},
  //           constraints: BoxConstraints(),
  //           elevation: 3.0,
  //           fillColor: Style.whitecolor,
  //           child:Image.asset(
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
  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',style: Style.text23
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',style: Style.text24
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text("Raffle Draw",style: Style.text16),
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
                  SizedBox(height: 50),
                  _entryField(),
                  SizedBox(height: 20),
                  _submitButton(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password ?',style:Style.text23),
                  ),
                  // _divider(),
                  // _guestButton(),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // socialMedia(),
                  SizedBox(height: height * .0),
                  _createAccountLabel(),
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
