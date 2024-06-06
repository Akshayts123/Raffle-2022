import 'package:draw_idea/views/pages/qr_code/qr_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../controller/register_controller.dart';
import '../../../utils/style.dart';

import 'home_screen.dart';

class homemenu extends StatefulWidget {

  homemenu({Key? key}) : super(key: key);

  @override
  State<homemenu> createState() => _homemenuState();
}

class _homemenuState extends State<homemenu> {
  main() async {
    loginController.guest.value = await loginController.main();
  }
  var navigation =0;
  @override
  void initState() {
    setState((){
      main();
    });
    super.initState();
  }
  final RegisterController loginController = Get.find();

  final HomeController _coffeeController = Get.find();
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 85,
        child:   Obx(() =>
        loginController.guest.value == true ? guesticon():user() ,),
      ),
    );
  }

  Widget guesticon () {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 5),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount:3,
        itemBuilder: (BuildContext context, int index) {

          return Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextButton(
                    style: ButtonStyle(),
                    onPressed: () {

                    },
                    child: Column(
                      children: [
                        Image.asset(
                          _coffeeController.getHomesList[index].gif ?? "",
                          width: 35.0,
                          height: 35.0,
                          color: Style.whitecolor,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          _coffeeController.getHomesList[index].Name ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Style.whitecolor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  Widget user (){
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 5),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _coffeeController.getHomesList.length,
        itemBuilder: (BuildContext context, int index) {

          if(index == 0){
            return GestureDetector(
              onTap: (){

              },
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: TextButton(
                        style: ButtonStyle(),
                        onPressed: () {
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              _coffeeController.getHomesList[index].gif ?? "",
                              width: 35.0,
                              height: 35.0,
                              color: Style.whitecolor,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              _coffeeController.getHomesList[index].Name ?? "",
                              style: TextStyle(
                                  fontSize: 15, color: Style.whitecolor,fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 0, top: 0),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFC502),
                          borderRadius: BorderRadius.circular(15)),
                      width: 50,
                      height: 5,
                    ),
                  ],
                ),
              ),
            );
          }
          return  Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: TextButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      setState(() {
                        navigation = index;
                        (navigation == 1)
                            ? Get.to(QRScanner())
                            : Get.to(HomeScreen());
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          _coffeeController.getHomesList[index].gif ?? "",
                          width: 35.0,
                          height: 35.0,
                          color: Style.whitecolor,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          _coffeeController.getHomesList[index].Name ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 15, color:Style.whitecolor,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

}
