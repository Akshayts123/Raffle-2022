

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/style.dart';

class Tags extends StatelessWidget {
  String tags;
   Tags({Key? key,required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      child: Card(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)

        ),
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(tags,style: Style.text9,),
            Icon(Icons.close_rounded,size: 15,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
