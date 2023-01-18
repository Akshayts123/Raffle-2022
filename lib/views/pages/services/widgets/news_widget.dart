
import 'package:flutter/cupertino.dart';

import '../../../../utils/style.dart';

NewsWidget(String text,String text2,String image,){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 230,
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                text,style: Style.text7,),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                text2,style: Style.text27,),
            )
          ],
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
      ),
    ],
  );
}