import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sparkl/onBoardringScreen/screen_three.dart';
import 'package:video_player/video_player.dart';

import '../Widget/DottedBoderContainer.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  bool _isAtTop = false;
  bool _firstLoad = true;

  late VideoPlayerController _controllerteacher;
  late VideoPlayerController _controllerstudent;
  bool _moveTexts = false;



  @override
  void initState() {
    super.initState();
    // Trigger the animation after a small delay
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isAtTop = true;
      });
    });

    _controllerteacher = VideoPlayerController.asset('assets/teachervideo.mp4')
      ..initialize().then((_) {
        setState(() {
          // Ensure the UI is updated after initialization
        });
        // Play the video as soon as it's initialized
        _controllerteacher.play();
      });
    _controllerstudent = VideoPlayerController.asset('assets/studentvideo.mp4')
      ..initialize().then((_) {
        setState(() {
          // Ensure the UI is updated after initialization
        });
        // Play the video as soon as it's initialized
        _controllerstudent.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerteacher.dispose();
    _controllerstudent.dispose(); // Dispose the controller to free resources
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Places the image at the top-left
                children: [
                  SizedBox(height: 20), // Add space from the top
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0), // Add space from the left
                    child: Hero(
                      tag: 'imageHero',
                      child: Image.asset(
                        "assets/sparkl_logo.png",
                        width: MediaQuery.of(context).size.height / 7,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ],
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                curve: Curves.easeInOut,
                // When `_isAtTop` is false, start near the right-center
                // When `_isAtTop` is true, place it near the top-center
                top: _isAtTop
                    ? 70
                    : screenHeight / 2 -
                        20, // Top of the screen (change 50 to any value)
                left: _isAtTop ? _moveTexts == true? -900  : 20 : screenWidth, // Move from right to center
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1-on-1 Live Classes',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      ' Learning customized for every student',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 45,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                  duration: Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  top: _isAtTop
                      ?  MediaQuery.of(context).size.height / 5
                      : -200,
                  left: MediaQuery.of(context).size.width / 4.4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(

                      width: MediaQuery.of(context).size.height / 4.4,
                      height: MediaQuery.of(context).size.height / 7.5,
                      child: Hero(
                        tag: 'teacherHero',
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                20), // Set the round corner radius
                            child: AspectRatio(
                              aspectRatio: _controllerteacher.value.aspectRatio,
                              child: VideoPlayer(_controllerteacher),
                            )),
                      ),
                    ),
                  )),
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                // top:  MediaQuery.of(context).size.height/3.2,
                left: _isAtTop ?  MediaQuery.of(context).size.width/8 : screenWidth*3,
                bottom: MediaQuery.of(context).size.height/4.5,
                child: Container(
                    width: MediaQuery.of(context).size.width/1.3,
                    height: MediaQuery.of(context).size.height / 3,

                    child: Image.asset("assets/stack_card.png",fit: BoxFit.fill,)
                ),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                // top:  MediaQuery.of(context).size.height/3.2,
                left: _isAtTop ?  MediaQuery.of(context).size.width/11 : screenWidth*1.5,
                bottom: MediaQuery.of(context).size.height/5,
                child: Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: MediaQuery.of(context).size.height / 3,

                    child: Image.asset("assets/stack_card.png",fit: BoxFit.fill,)
                ),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                // top:  MediaQuery.of(context).size.height/3.2,
                left: _isAtTop ?  MediaQuery.of(context).size.width/20 : screenWidth,
                bottom: MediaQuery.of(context).size.height/5.5,
                child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    height: MediaQuery.of(context).size.height / 3,

                    child: Image.asset("assets/stack_card.png",fit: BoxFit.fill,)
                ),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                // top:  MediaQuery.of(context).size.height/3.2,
                left: _isAtTop ? 0 : screenWidth/1.5,
                bottom: MediaQuery.of(context).size.height/6,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,

                    child: Image.asset("assets/stack_card.png",fit: BoxFit.fill,)
                ),
              ),



              AnimatedPositioned(
                duration: Duration(seconds: 1),
                left: MediaQuery.of(context).size.width / 3,
                bottom: MediaQuery.of(context).size.height/7.5,
                child: Container(
                    width:  MediaQuery.of(context).size.height/7.5,
                    height: MediaQuery.of(context).size.height/7.5,

                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        // width: MediaQuery.of(context).size.width/1.2,
                        // height: MediaQuery.of(context).size.width/1.2,
                        child: Hero(
                          tag: 'studentHero',
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  180), // Set the round corner radius
                              child: Transform(
                                transform: Matrix4.identity()..scale(1.4, 1, 1),
                                child: AspectRatio(
                                  aspectRatio:
                                  _controllerstudent.value.aspectRatio,
                                  child: VideoPlayer(_controllerstudent),
                                ),
                              )),
                        ),
                      ),
                    )),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SizedBox(

                          child: DottedPorderContainer(
                            strokeWidth: 5,
                            progressValues: const [0.3, 0.4, 0.2],
                            segmentColors: const [Color.fromRGBO(
                                       248, 212, 100, 1), Color.fromRGBO(
                               248, 212, 100, 1),Color.fromRGBO(
                                231, 220, 202, 1) ],
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: const Icon(Icons.arrow_back,),
                            ),
                          ),
                        ),

                        SizedBox(width: 10,),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _moveTexts = true;
                              });

                              Future.delayed(const Duration(milliseconds: 250), () { // Delay of 500 milliseconds
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: const Duration(seconds: 2),
                                      pageBuilder: (context, animation, secondaryAnimation) =>  OnboardingChatWithProfileAnimation(),
                                      // transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
                                    futureOr
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
                            child: Text("Get Started"),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  FutureOr futureOr(v){
    _moveTexts = !_moveTexts;
    setState(() {

    });}
}
