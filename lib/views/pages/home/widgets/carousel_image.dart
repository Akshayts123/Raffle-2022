

import 'package:flutter/cupertino.dart';

CarouselImage(String Image){
 return Container(
    margin: EdgeInsets.all(6.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      image: DecorationImage(
        image: AssetImage(
          Image,
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}