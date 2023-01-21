

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';

class NewConnectWidget extends StatelessWidget {
  final img;
  final btndesc;
  final index;
   NewConnectWidget({Key? key,required this.img,required this.btndesc,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {},
                constraints: BoxConstraints(),
                elevation: 2.0,
                fillColor: context.theme.cardColor,
                child: Image.asset(
                  img,
                  width: 25.0,
                  color: context.theme.indicatorColor,
                  height: 25.0,
                  fit: BoxFit.cover,
                ),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 13),
                  width: 85,
                  child: Text(
                    btndesc,
                    style: context.theme.textTheme.titleSmall,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );  }
}
