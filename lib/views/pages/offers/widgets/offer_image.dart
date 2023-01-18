import 'package:flutter/cupertino.dart';

class FoodImages extends StatelessWidget {
  final foodimage;
  const FoodImages({Key? key, this.foodimage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(foodimage,width: 150,height: 150,fit: BoxFit.cover,),
    );
  }
}
