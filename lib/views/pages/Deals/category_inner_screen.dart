
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CategoryInnerScreen extends StatelessWidget {
  final index;
  final categorypicture;
  const CategoryInnerScreen({Key? key,required this.categorypicture,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child:  Image.asset(
                categorypicture[index],
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
