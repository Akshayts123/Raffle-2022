import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/style.dart';

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Grogu',
      'Mace Windu',
      'Obi-Wan Kenobi',
      'Han Solo',
      'Luke Skywalker',
      'Darth Vader',
      'Yoda',
      'Ahsoka Tano',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.blackcolor,
        leading: TextButton( onPressed: (){Get.back();},child: Icon(Icons.arrow_back_ios,color: Style.whitecolor,)),
      ),
      backgroundColor: Style.blackcolor,
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(
              Fortune.randomInt(0, items.length),
            );
          });
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                curve: FortuneCurve.spin,
                selected: selected.stream,
                items: [
                  FortuneItem( style: FortuneItemStyle(borderWidth: 10,borderColor: Colors.grey,color: Colors.pinkAccent),
                    child: Container(
                      child: Text('Han Solo1'),
                    ),
                  ),
                  FortuneItem(style: FortuneItemStyle(borderWidth: 10,borderColor: Colors.grey,color: Colors.green),
                    child: Container(
                      child: Text('Han Solo2'),
                    ),
                  ),FortuneItem(style: FortuneItemStyle(borderWidth: 10,borderColor: Colors.grey,color: Colors.yellowAccent),
                    child: Container(
                      child: Text('Han Solo3'),
                    ),
                  ),FortuneItem(style: FortuneItemStyle(borderWidth: 10,borderColor: Colors.grey,color: Colors.orange),
                    child: Container(
                      child: Text('Han Solo4'),
                    ),
                  ),FortuneItem(style: FortuneItemStyle(borderWidth: 10,borderColor: Colors.grey,color: Colors.black),
                    child: Container(
                      child: Text('Han Solo5'),
                    ),
                  ),FortuneItem(style: FortuneItemStyle(borderWidth: 10,borderColor: Colors.grey,color: Colors.indigoAccent),
                    child: Container(
                      child: Text('Han Solo6'),
                    ),
                  ),FortuneItem(style: FortuneItemStyle(borderWidth: 10,borderColor: Colors.grey,color: Colors.redAccent),
                    child: Container(
                      child: Text('Han Solo7'),
                    ),
                  ),
                  FortuneItem(style: FortuneItemStyle(borderWidth: 10,borderColor: Colors.grey,color: Colors.brown),
                    child: Container(
                      child: Text('Han Solo8'),
                    ),
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    selected.add(
                      Fortune.randomInt(0, items.length),
                    );
                  });
                },
                child: Text("SPIN",style: TextStyle(color: Style.whitecolor),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
