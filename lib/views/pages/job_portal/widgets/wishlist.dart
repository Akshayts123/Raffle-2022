

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../utils/style.dart';

Wishlist(){
  RxBool  isBluetoothOn = true.obs;
 return Obx(() => InkWell(
    onTap: () {
      isBluetoothOn.value = !isBluetoothOn.value;
    },
    child: Icon(
      isBluetoothOn.value ? Icons.bookmark_border : Icons.bookmark,
      color: Style.systemblue,
      size: 30,
    ),
  ),
  );
}