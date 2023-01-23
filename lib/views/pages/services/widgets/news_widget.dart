
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/style.dart';
class NewsWidget extends StatelessWidget {
  String text;
  String text2;
  String image;
   NewsWidget({Key? key,required this.text,required this.text2,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  text,style:  context
                    .theme.textTheme.titleMedium,),
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
}

