import 'package:draw_idea/controller/home_controller.dart';
import 'package:draw_idea/services/api.dart';
import 'package:draw_idea/utils/app_pages.dart';
import 'package:draw_idea/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return GetMaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            headline6: GoogleFonts.exo2(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: 'Billion Dollar App',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        getPages: AppPages.routes,
        initialRoute: Routes.SPLASH,
      );

  }
}

