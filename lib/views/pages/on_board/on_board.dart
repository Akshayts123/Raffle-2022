import 'package:draw_idea/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../home/home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  // static String id = 'IntroScreen';
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor:Style.whitecolor,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,

      globalBackgroundColor:Style.backgroundwhite,
      autoScrollDuration: null,

      // globalHeader: Align(
      //   alignment: Alignment.topRight,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 16, right: 16),
      //       child: _buildImage('flutter.png', 100),
      //     ),
      //   ),
      // ),
      globalFooter: Container(
        width: double.infinity,
        height: 60,
        color: Style.systemblue,
        child: TextButton(
          child:  Text(
            'Let\'s go right away!',
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Style.whitecolor,
                fontWeight: FontWeight.w600),
          ),
          onPressed: () => Get.to(HomeScreen()),
        ),
      ),
      pages: [
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Hooray! Luck has found its way to your arms! ...',
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color:Style.blackcolor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Flutter is Googles portable UI toolkit for crafting beautiful, web, and desktop from a single codebase.',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Style.greycolor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset("assets/win.png",),
            ],
          ),
          decoration: PageDecoration(
            titleTextStyle:
            TextStyle(fontSize: 48.0, fontWeight: FontWeight.w700),
            bodyTextStyle: bodyStyle,
            bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Style.backgroundwhite,
            imagePadding: EdgeInsets.zero,
          ),
          // reverse: false,
        ),
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Image.asset("assets/purchase.png",),
              SizedBox(
                height: 70,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'You are a few taps away from experiencing your dream journey! ',
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color:Style.whitecolor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Flutter is Googles portable UI toolkit for crafting beautiful, web, and desktop from a single codebase.',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color:Style.greycolor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),

            ],
          ),
          decoration: PageDecoration(
            titleTextStyle:
            TextStyle(fontSize: 48.0, fontWeight: FontWeight.w700),
            bodyTextStyle: bodyStyle,
            bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Color(0xFF070A0F),
            imagePadding: EdgeInsets.zero,
          ),
          // reverse: false,
        ),


        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Congratulations, winner. The odds are in favor of you!',
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: Style.blackcolor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Flutter is Googles portable UI toolkit for crafting beautiful, web, and desktop from a single codebase.',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Style.greycolor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset("assets/giftcoupen.png",),
            ],
          ),
          decoration: PageDecoration(
            titleTextStyle:
            TextStyle(fontSize: 48.0, fontWeight: FontWeight.w700),
            bodyTextStyle: bodyStyle,
            bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            pageColor: Style.backgroundwhite,
            imagePadding: EdgeInsets.zero,
          ),
          // reverse: false,
        ),
      ],
      onDone: () => Get.to(HomeScreen()),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back ,color: Style.systemblue,),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward,color: Style.systemblue,),
      done: const Text('Done', style: TextStyle(color: Style.systemblue,fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: Style.systemblue,
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      // dotsContainerDecorator: const ShapeDecoration(
      //   color: Colors.white,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
      //   ),
      // ),
    );
  }
}
