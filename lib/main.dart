//groupie


import 'package:draw_idea/controller/home_controller.dart';
import 'package:draw_idea/services/api.dart';
import 'package:draw_idea/utils/app_pages.dart';
import 'package:draw_idea/utils/app_routes.dart';
import 'package:draw_idea/utils/darkLight.dart';
import 'package:draw_idea/utils/theme2.dart';
import 'package:draw_idea/views/pages/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/theme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return GetMaterialApp(
        // theme: Themes.light,
        // darkTheme: Themes.dark,
        // themeMode: ThemeService().theme,
        theme: darkTheme,
        darkTheme: lightTheme,
        themeMode: ThemeMode.system,
        title: 'Billion Dollar App',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        getPages: AppPages.routes,
        initialRoute: Routes.SPLASH,
      );

  }
}

