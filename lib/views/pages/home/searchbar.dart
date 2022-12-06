import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';

class DemoPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DemoPage> {

  bool folded = true;
  @override
  Widget build(BuildContext context) {
    return
            AnimatedContainer(

              duration: Duration(milliseconds: 800),
              width: folded ? 46 : MediaQuery.of(context).size.width *0.6,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: kElevationToShadow[2],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      child: !folded
                          ? TextField(
                              decoration: InputDecoration(
                                  hintText: "Search..",
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  border: InputBorder.none),
                            )
                          : null,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 800),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(folded ? 30 : 0 ,),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(folded ? 30 : 0 ,),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            folded
                             ? Icons.search : Icons.close,
                            color: Colors.black87,
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            folded = !folded;
                            folded == false;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            );

  }


}
