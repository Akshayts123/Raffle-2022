import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/style.dart';

class SuperDialog extends StatefulWidget {
  const SuperDialog({Key? key}) : super(key: key);

  @override
  State<SuperDialog> createState() => _SuperDialogState();
}

class _SuperDialogState extends State<SuperDialog> {
  @override
  Widget build(BuildContext context) {
    late double _rating;
    double _initialRating = 1.0;
    IconData? _selectedIcon;
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(top: 8.0, right: 8.0, left: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 0.0,
                  ),
                  Container(
                    child: Image.asset(
                      "assets/purchase.png",
                      width: 100.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    color: Colors.white,
                    height: 400,
                    child: Column(
                      children: [
                        Text(
                          "Lorem Ipsum is simply dummy text ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Style.blackcolor,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer  .",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Style.blackcolor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Raffledraw007",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Style.blackcolor,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {},
                              constraints: BoxConstraints(),
                              elevation: 2.0,
                              fillColor: Colors.blue,
                              child: Icon(
                                Icons.facebook,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(12.0),
                              shape: CircleBorder(),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            RawMaterialButton(
                              onPressed: () {},
                              constraints: BoxConstraints(),
                              elevation: 2.0,
                              fillColor: Colors.green,
                              child: Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(12.0),
                              shape: CircleBorder(),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            RawMaterialButton(
                              onPressed: () {},
                              constraints: BoxConstraints(),
                              elevation: 2.0,
                              fillColor: Style.blackcolor,
                              child: Icon(
                                Icons.account_balance_wallet_sharp,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(12.0),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Rate App",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Style.blackcolor,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RatingBar.builder(
                          initialRating: _initialRating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          unratedColor: Colors.amber.withAlpha(50),
                          itemCount: 5,
                          itemSize: 30.0,
                          glowColor: Colors.white,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            _selectedIcon ?? Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          },
                          updateOnDrag: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: FractionalTranslation(
              translation: Offset(0.5, -0.5),
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CircleAvatar(
                    radius: 14.0,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Style.systemblue),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _divider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        Text(
          'TAP TO SHARE',
          style: GoogleFonts.poppins(
              fontSize: 15, color: Colors.blue, fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}
