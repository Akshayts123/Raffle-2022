

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';

class CoupenController extends GetxController{
  late ScrollController scrollController;
  late ConfettiController controller;
  bool reward = true;
  bool lastStatus = true;
  List<int> alreadyAddedIndices = [];
  final scratchKey = GlobalKey<ScratcherState>();
  var courseid = 0;
  double? closing = 0;
  var coursename = "default";
  bool isExpired = true;
  final expirationDate = DateTime(2021, 12, 20);
  final TextEditingController emailController = TextEditingController();
  // final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}