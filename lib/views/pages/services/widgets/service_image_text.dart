
import 'package:draw_idea/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class ServiceImageText extends StatelessWidget {
  String image;
  String serviceText;
   ServiceImageText({Key? key,required this.image,required this.serviceText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        ),
        Text(serviceText,style:context.theme.textTheme.titleSmall,),
      ],
    );
  }
}
