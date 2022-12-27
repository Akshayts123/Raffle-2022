

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/style.dart';

class FloatingAction extends StatelessWidget {
  const FloatingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      child: FloatingActionButton(
        backgroundColor: Style.systemblue,
        child: Icon(
          Icons.ac_unit,
          color: Style.whitecolor,
        ),
        onPressed: () {
        },
      ),
    );
  }
}
