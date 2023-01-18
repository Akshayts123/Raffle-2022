

import 'package:draw_idea/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySearch extends StatelessWidget {
  const CategorySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                        BorderSide(width: 0.5, color: Colors.grey)),
                    hintText: 'Search',
                    hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 14,height: 1),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.search),
                      width: 18,
                    )),
              ),
            ),
          ],
        ));
  }
}
