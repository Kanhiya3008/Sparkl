
import 'package:flutter/material.dart';
class FirstPageHeading extends StatelessWidget {
  final bool firstLoad;

  const FirstPageHeading({super.key, required this.firstLoad});




  @override
  Widget build(BuildContext context) {
    return   AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top: MediaQuery.of(context).size.height / 15,
      left: firstLoad
          ? -700 // Initially off-screen to the left
          : 20,
      // (_moveTexts ? -300 : 20),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Learning Made Personal",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "A Program designed just for YOU!",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}
