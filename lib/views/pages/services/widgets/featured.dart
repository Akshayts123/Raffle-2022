
import 'package:flutter/cupertino.dart';

import '../../../../utils/style.dart';

Featured_box(String image,String heading,String subtext){
  return Container(
    decoration: new BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: new DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
            image),
      ),
    ),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          height: 100,
          width:170,
          child: Column(
            children: [
              Text(heading,style: Style.text26,),
              SizedBox(
                height: 5,
              ),
              Text(subtext,style: Style.text5111,),
            ],
          ),
        ),
      ],
    ),
  );
}