
import 'package:draw_idea/utils/style.dart';
import 'package:flutter/cupertino.dart';

ServiceImageText(String image,String serviceText){
  return Column(
    children: [
      Image.asset(
        image,
        width: 50,
        height: 50,
        fit: BoxFit.contain,
      ),
      Text(serviceText,style: Style.text2,),
    ],
  );
}