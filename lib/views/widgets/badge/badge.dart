import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/register_controller.dart';
import '../../../utils/style.dart';
import '../../pages/register_login/loginPage.dart';

class badge extends StatefulWidget {
  @override
  _badgeState createState() => _badgeState();
}

class _badgeState extends State<badge> {
  final RegisterController loginController = Get.find();
  int _counter = 0;
  RxBool guest = true.obs;
  bool showElevatedButtonBadge = true;
  late SharedPreferences prefs;
  main() async {
    guest.value = await loginController.main();
  }

  @override
  void initState() {
    setState(() {
      main();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return expandedBadge();
  }

  Widget expandedBadge() {
    return GestureDetector(
      onTap: () async{
        // logoutUser();
        await FirebaseAuth.instance.signOut();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs?.setBool("guest", false);
        prefs?.setBool("isLoggedIn", false);
        if (!mounted) return;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  LoginPage();
        }));
      },
      child: Container(
        child: Obx(
          () => Badge(
            badgeColor: guest.value == true ? Colors.green : Colors.red,

            // badgeContent: Text('10'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.power_settings_new_outlined,
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Obx(
                  () => guest.value == true
                      ? Text(
                          'login ',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Style.whitecolor,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(
                          ' logout',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Style.whitecolor,
                              fontWeight: FontWeight.w500),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs?.setBool("isLoggedIn", false);
    prefs?.setBool("guest", false);
    print('shared prefs ::::::: ' + prefs.getBool('guest').toString());
    Get.to(LoginPage());
  }
}
