

import 'package:draw_idea/views/pages/register_login/loginPage.dart';
import 'package:draw_idea/views/widgets/floatingpopup/popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/register_controller.dart';
import '../../../utils/darkLight.dart';
import '../badge/badge.dart';

class drawer extends StatefulWidget {

   drawer({Key? key,}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

RxBool darkMode = false.obs;
RxBool _isLightTheme = false.obs;
class _drawerState extends State<drawer> {
  @override
  void initState() {
    super.initState();
    getThemeStatus();
  }
  @override

  Widget build(BuildContext context) {

    return  SafeArea(
      child: Container(

        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Obx(() =>
              //       _isLightTheme.value ? Text('Light Mode'.tr) : Text('Dark Mode'.tr),
              //       ),
              //       ObxValue(
              //             (data) => Switch(
              //           value: _isLightTheme.value,
              //           onChanged: (val) {
              //             _isLightTheme.value = val;
              //             Get.changeThemeMode(
              //               _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
              //             );
              //             _saveThemeStatus();
              //           },
              //         ),
              //         false.obs,
              //       ),
              //     ],
              //   ),
              // ),

              Padding(
                padding:
                const EdgeInsets.only(right: 20.0,top: 20,bottom: 20),
                child: badge(),
              ),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       primary: context.theme.buttonColor,
              //       padding:
              //       const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              //       textStyle: const TextStyle(
              //           fontSize: 16, fontWeight: FontWeight.bold),
              //     ),
              //     onPressed:(){
              //       Get.changeThemeMode( ThemeMode.light );
              //       Get.changeThemeMode(  ThemeMode.dark );
              //
              //     },
              //     child: const Text('Change Theme')),
              Obx(() {
                return ListTile(
                  leading: _isLightTheme.value ? Icon(Icons.sunny): Icon(Icons.brightness_2_rounded),
                  title: _isLightTheme.value ? Text('Light Mode'.tr) : Text('Dark Mode'.tr),
                  trailing: Switch(
                    value: _isLightTheme.value,
                    onChanged: (val) {
                      _isLightTheme.value = val;
                      Get.changeThemeMode(
                        _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                      );
                      _saveThemeStatus();
                    },
                  ),
                );
              }),
              Container(
                margin: EdgeInsets.only(left: 70,right: 20),
                width: 200,
                height: 1,
                color: Colors.white,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.people),
                title: Text('Recharge for others'),
              ),
              Container(
                margin: EdgeInsets.only(left: 70,right: 20),
                width: 200,
                height: 1,
                color: Colors.white,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.paypal_outlined),
                title: Text('Pay bill for others'),
              ),
              Container(
                margin: EdgeInsets.only(left: 70,right: 20),
                width: 200,
                height: 1,
                color: Colors.white,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.music_note_sharp),
                title: Text('Music'),
              ),
              Container(
                margin: EdgeInsets.only(left: 70,right: 20),
                width: 200,
                height: 1,
                color: Colors.white,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.movie_filter_sharp),
                title: Text('Movies & TV'),
              ),
              Container(
                margin: EdgeInsets.only(left: 70,right: 20),
                width: 200,
                height: 1,
                color: Colors.white,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.games),
                title: Row(
                  children: [
                    Text('Games'),
                    popfree()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 70,right: 20),
                width: 200,
                height: 1,
                color: Colors.white,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.star_rate_outlined),
                title: Text('Jobs & Education'),
              ),
              Container(
                margin: EdgeInsets.only(left: 70,right: 20),
                width: 200,
                height: 1,
                color: Colors.white,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.music_note_sharp),
                title: Text('Caller Tune'),
              ),
              Container(
                margin: EdgeInsets.only(left: 70,right: 20),
                width: 200,
                height: 1,
                color: Colors.white,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.traffic),
                title: Row(
                  children: [
                    Text('Draw'),
                    popoffer()
                  ],
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 70,right: 20),
              //   width: 200,
              //   height: 1,
              //   color: Colors.white,
              // ),
              // ListTile(
              //   onTap: () {},
              //   leading: Icon(Icons.flight),
              //   title: Text('International Draw'),
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 70,right: 20),
              //   width: 200,
              //   height: 1,
              //   color: Colors.white,
              // ),
              // ListTile(
              //   onTap: () {},
              //   leading: Icon(Icons.delivery_dining),
              //   title: Text('Home Delivery'),
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 70,right: 20),
              //   width: 200,
              //   height: 1,
              //   color: Colors.white,
              // ),
              // ListTile(
              //   onTap: () {},
              //   leading: Icon(Icons.language),
              //   title: Row(
              //     children: [
              //       Text('Change Language'),
              //       popnew()
              //     ],
              //   ),
              // ),

              Spacer(),
              Center(
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

_saveThemeStatus() async {
  SharedPreferences pref = await _prefs;
  pref.setBool('theme', _isLightTheme.value);
}

getThemeStatus() async {
  var _isLight = _prefs.then((SharedPreferences prefs) {
    return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
  }).obs;
  _isLightTheme.value = (await _isLight.value)!;
  Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);}