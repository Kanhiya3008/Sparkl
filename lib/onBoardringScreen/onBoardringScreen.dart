import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sparkl/Widget/OnBoardringFirstWidget/HeadingFiestScreen.dart';
import 'package:sparkl/Widget/OnBoardringFirstWidget/studentView.dart';
import 'package:sparkl/onBoardringScreen/screenTwo.dart';
import 'package:video_player/video_player.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late VideoPlayerController _controller;
  bool _moveTexts = false;
  bool _firstLoad = true;
  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with the asset video

    _controller = VideoPlayerController.asset('assets/studentvideo.mp4')
      ..initialize().then((_) {
        setState(() {
          // Ensure the UI is updated after initialization
        });
        // Play the video as soon as it's initialized
        _controller.play();
      });
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _firstLoad = false; // After 500ms, it's no longer the first load
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose the controller to free resources
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(
              254, 250, 237, 1), // Set the scaffold background color
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: 'imageHero',
                    child: Image.asset(
                      "assets/sparkl_logo.png",
                      width: MediaQuery.of(context).size.height / 5,
                    )),
              ],
            ),
            FirstPageHeading(firstLoad: _firstLoad),
            Studentview(firstLoad: _firstLoad, controller: _controller, moveTexts: _moveTexts),







            Positioned(
              bottom: 20,
              child: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _moveTexts = !_moveTexts; // Trigger the animation
                        });
                        print(_moveTexts);
                        // Navigator.push(
                        //   context,
                        //   PageRouteBuilder(
                        //     transitionDuration: Duration(seconds: 2), // Set the animation speed
                        //     pageBuilder: (context, animation, secondaryAnimation) => SecondScreen(),
                        //   ),
                        // );

                        Future.delayed(const Duration(milliseconds: 250), () { // Delay of 500 milliseconds
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: const Duration(seconds: 2),
                                pageBuilder: (context, animation, secondaryAnimation) =>  SecondScreen(),
                              //  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                //   const begin = Offset(1.0, 0.0);
                                //   const end = Offset.zero;
                                //   const curve = Curves.ease;
                                //
                                //   var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                //
                                //   return SlideTransition(
                                //     position: animation.drive(tween),
                                //     child: child,
                                //   );
                                // }
                            ),
                          ).then(
                              ffutureOr
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Color.fromRGBO(
                            248, 212, 100, 1), // Button background color
                        foregroundColor: Colors.black, // Button text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Rounded button
                        ),
                
                        // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // Padding inside the button
                      ),
                      child: Text("Next"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  FutureOr ffutureOr(v){
    _moveTexts = !_moveTexts;
    setState(() {

    });

  }
}
