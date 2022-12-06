import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(" Welcome User "),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 100,
                          height: 35,
                          child: Center(child: Text("LogOut"))),
                    )
                  ],
                ),
              ),
            ),
          );
  }


}
