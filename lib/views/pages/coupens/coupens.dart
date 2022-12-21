import 'package:confetti/confetti.dart';
import 'package:draw_idea/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scratcher/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/home_controller.dart';

class ScrachCoupens extends StatefulWidget {
  ScrachCoupens({Key? key}) : super(key: key);

  @override
  State<ScrachCoupens> createState() => _ScrachCoupensState();
}

class _ScrachCoupensState extends State<ScrachCoupens> {
  final HomeController _coffeeController = Get.find();
  late ScrollController _scrollController;
  late ConfettiController _controller;
  RxBool reward = true.obs;
  bool lastStatus = true;
  List<int> alreadyAddedIndices = [];
  final scratchKey = GlobalKey<ScratcherState>();
  var courseid = 0;
  var coursename = "default";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 2,
            pinned: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: isShrink ? Colors.white : Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                "My Rewards",
                style: TextStyle(
                  color: isShrink ? Colors.white : Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            expandedHeight: 200,
            backgroundColor: Style.systemblue,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 300.0,
                // child:
                // ClipPath(
                //   clipper: CurveClipper(),
                child: Container(
                  child: Image.asset(
                    "assets/slide.png",
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  width: 300.0,
                  // ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RawMaterialButton(
                      onPressed: () {},
                      constraints: BoxConstraints(),
                      elevation: 1.0,
                      fillColor: Style.whitecolor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 50,
                            width: double.infinity,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Upcoming rewards on your path",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Style.blackcolor,
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.blue,
                                )
                              ],
                            ))),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 10, bottom: 10),
                      child: Text(
                        "My Rewards",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Style.blackcolor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    shrinkWrap: true,
                    children: List.generate(
                      _coffeeController.getHomesList.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            alreadyAddedIndices.contains(index)
                                ? showGeneralDialog(
                                    context: context,
                                    barrierLabel: "Barrier",
                                    barrierDismissible: true,
                                    barrierColor: Colors.black.withOpacity(0.7),
                                    transitionDuration:
                                        Duration(milliseconds: 1),
                                    pageBuilder: (_, __, ___) {
                                      return Center(
                                          child: Container(
                                        width: 200,
                                        height: 200,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          // image: DecorationImage(
                                          //   image: AssetImage(
                                          //         _coffeeController.getHomesList[index]
                                          //           .game ?? ""),
                                          //   fit: BoxFit.cover,
                                          // ),
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: DefaultTextStyle(
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none),
                                                  child: Text(
                                                    "25% upto \$500",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 30,
                                                        color: Style.blackcolor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: DefaultTextStyle(
                                                  style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none),
                                                  child: Text(
                                                    "off on your 1st 5 uber rides",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 13,
                                                        color: Style.blackcolor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Stack(
                                                clipBehavior: Clip.none,
                                                children: <Widget>[
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  100.0),
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            child: Image.asset(
                                                              _coffeeController
                                                                      .getHomesList[
                                                                          index]
                                                                      .scrach ??
                                                                  "",
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: -20,
                                                    right: -10,
                                                    child: Container(
                                                      child: Image.asset(
                                                        "assets/staring.jpg",
                                                        width: 80.0,
                                                        height: 80.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                    },
                                  )
                                : showGeneralDialog(
                                    context: context,
                                    barrierLabel: "Barrier",
                                    barrierDismissible: true,
                                    barrierColor: Colors.black.withOpacity(0.7),
                                    transitionDuration:
                                        Duration(milliseconds: 1),
                                    pageBuilder: (_, __, ___) {
                                      return Center(
                                        child: Container(
                                          // color: Colors.white,
                                          width: 200,
                                          height: 200,
                                          child: Column(
                                            children: [
                                              Scratcher(
                                                key: scratchKey,
                                                brushSize: 60,
                                                threshold: 75,

                                                // color: Colors.red,
                                                image: Image.asset(
                                                  _coffeeController
                                                          .getHomesList[index]
                                                          .reward ??
                                                      "",
                                                  fit: BoxFit.fill,
                                                ),
                                                onChange: (value) async {
                                                  setState(() {
                                                    // change as per your code
                                                    // courseid = index;
                                                    // coursename=index.toString();
                                                    // add index in list if not available
                                                    // tapping again, remove index from list
                                                    // scratchKey.currentState?. reveal();
                                                    if (value > 70) {
                                                      alreadyAddedIndices
                                                          .add(index);
                                                      // _controller?.play();
                                                      // scratchKey.currentState?. reveal(duration: Duration(milliseconds: 200));

                                                    } else {
                                                      alreadyAddedIndices
                                                          .remove(index);
                                                    }
                                                    // alreadyAddedIndices.contains(index)?alreadyAddedIndices.add(index):alreadyAddedIndices.add(index);
                                                  });
                                                  // SharedPreferences prefs = await SharedPreferences.getInstance();
                                                  // prefs?.setBool("reward", true);
                                                  print(
                                                      "Scratch progress: $value%");
                                                },

                                                onThreshold: () =>
                                                    _controller?.play(),
                                                child: Container(
                                                  height: 200,
                                                  width: 200,
                                                  color: Colors.white,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 200,
                                                        height: 200,
                                                        padding:
                                                            EdgeInsets.all(
                                                                10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          // image: DecorationImage(
                                                          //   image: AssetImage(
                                                          //         _coffeeController.getHomesList[index]
                                                          //           .game ?? ""),
                                                          //   fit: BoxFit.cover,
                                                          // ),
                                                          border: Border.all(
                                                              width: 1,
                                                              color: Colors
                                                                  .grey),
                                                          // borderRadius:
                                                          //     BorderRadius
                                                          //         .all(
                                                          //   Radius.circular(
                                                          //       10.0),
                                                          // ),
                                                        ),
                                                        child: Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                child:
                                                                    DefaultTextStyle(
                                                                  style: TextStyle(
                                                                      decoration:
                                                                          TextDecoration.none),
                                                                  child: Text(
                                                                    "25% upto \$500",
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            30,
                                                                        color: Style
                                                                            .blackcolor,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                child:
                                                                    DefaultTextStyle(
                                                                  style: TextStyle(
                                                                      decoration:
                                                                          TextDecoration.none),
                                                                  child: Text(
                                                                    "off on your 1st 5 uber rides",
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            13,
                                                                        color: Style
                                                                            .blackcolor,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Stack(
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    child:
                                                                        Row(
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius: BorderRadius.all(
                                                                              Radius.circular(100.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius: BorderRadius.circular(100),
                                                                            child: Image.asset(
                                                                              _coffeeController.getHomesList[index].scrach ?? "",
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    top: -20,
                                                                    right:
                                                                        -10,
                                                                    child:
                                                                        Container(
                                                                      child: Image
                                                                          .asset(
                                                                        "assets/staring.jpg",
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            80.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              ConfettiWidget(
                                                blastDirectionality:
                                                    BlastDirectionality
                                                        .explosive,
                                                confettiController:
                                                    _controller,
                                                particleDrag: 0.05,
                                                emissionFrequency: 0.02,
                                                numberOfParticles: 100,
                                                gravity: 0.05,
                                                shouldLoop: false,
                                                colors: [
                                                  Colors.green,
                                                  Colors.red,
                                                  Colors.yellow,
                                                  Colors.blue,
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                      // },
                                      // transitionBuilder: (_, anim, __, child) {
                                      //   Tween<Offset> tween;
                                      //   if (anim.status == AnimationStatus.reverse) {
                                      //     tween = Tween(begin: Offset(0, 0), end: Offset.zero);
                                      //   } else {
                                      //     tween = Tween(begin: Offset(0, 0), end: Offset.zero);
                                      //   }
                                      //
                                      //   return SlideTransition(
                                      //     position: tween.animate(anim),
                                      //     child: FadeTransition(
                                      //       opacity: anim,
                                      //       child: child,
                                      //     ),
                                      //   );
                                    },
                                  );
                            // LogoutOverlay();
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: (alreadyAddedIndices.contains(index))
                                  ? Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        // image: DecorationImage(
                                        //   image: AssetImage(
                                        //         _coffeeController.getHomesList[index]
                                        //           .game ?? ""),
                                        //   fit: BoxFit.cover,
                                        // ),
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                "25% upto \$500",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 23,
                                                    color: Style.blackcolor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                "off on your 1st 5 uber rides",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    color: Style.blackcolor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Stack(
                                              clipBehavior: Clip.none,
                                              children: <Widget>[
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                100.0),
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          child: Image.asset(
                                                            _coffeeController
                                                                    .getHomesList[
                                                                        index]
                                                                    .scrach ??
                                                                "",
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  top: -20,
                                                  right: -10,
                                                  child: Container(
                                                    child: Image.asset(
                                                      "assets/staring.jpg",
                                                      width: 80.0,
                                                      height: 80.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(_coffeeController
                                                  .getHomesList[index].reward ??
                                              ""),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                    )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> changereward() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool('reward') ?? false;
  }

  removescratch(){
    setState(() {
      scratchKey.currentState?. reveal();
    });
  }
  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _controller = new ConfettiController(duration: new Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
