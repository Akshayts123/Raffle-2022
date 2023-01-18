

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/style.dart';

class OfferGrid extends StatelessWidget {
  const OfferGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 1;
    final double itemWidth = size.width / 0.8;
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      itemCount: 10,
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: (itemWidth / itemHeight),
          crossAxisCount:
          (orientation == Orientation.portrait)
              ? 2
              : 9),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 170,
                            width: 150,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: (index % 2 == 0)
                                        ? [Colors.purple, Color(0xFF4347F0)]
                                        : [Colors.orange, Color(0xFFFE5312)])),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: Icon(
                                        Icons.workspace_premium,
                                        color: Colors.white,
                                        size: 100,
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      child: Text(
                                        "Elite Class",
                                        style: Style.text15
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "Lorem Ipsum is simply",
                                  style:
                                  Style.text14
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  "Lorem Ipsum is simply dummy text ",
                                  style:
                                  Style.text7
                                ),
                              ),
                              Container(
                                child: Text(
                                  "\$30,000",
                                  style:
                                  GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: (index % 2 == 0)
                                          ? Color(0xFF4347F0)
                                          : Colors.orange,
                                      fontWeight:
                                      FontWeight
                                          .w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
