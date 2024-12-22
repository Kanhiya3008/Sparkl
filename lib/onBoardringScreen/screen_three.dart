

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../Widget/DottedBoderContainer.dart';

class OnboardingChatWithProfileAnimation extends StatefulWidget {
  @override
  _OnboardingChatWithProfileAnimationState createState() =>
      _OnboardingChatWithProfileAnimationState();
}

class _OnboardingChatWithProfileAnimationState
    extends State<OnboardingChatWithProfileAnimation> with TickerProviderStateMixin {
  late VideoPlayerController _controllerstudent;
  late VideoPlayerController _teacherController;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  late Animation<Offset> _slideAnimation1;
  late Animation<Offset> _slideAnimation2;
  late Animation<Offset> _slideAnimation3;

  late Animation<double> _scaleAnimation1;
  late Animation<double> _scaleAnimation2;
  late Animation<double> _scaleAnimation3;
  bool _firstLoad = true;

  final List<String> chatMessages = [
    "Do you want to go over how to apply the quadratic formula?",
    "Yes, I'm confused about when to use it.",
    "You use it when the equation is in the form ax? + bx + c = 0. Let me show you a quick example to clarify.",
  ];

  @override
  void initState() {
    super.initState();
    _controllerstudent = VideoPlayerController.asset('assets/studentvideo.mp4')
      ..initialize().then((_) {
        setState(() {
          // Ensure the UI is updated after initialization
        });
        // Play the video as soon as it's initialized

      });
    _teacherController = VideoPlayerController.asset('assets/teachervideo.mp4')
      ..initialize().then((_) {
        setState(() {
          // Ensure the UI is updated after initialization
        });
        // Play the video as soon as it's initialized

      });

    // Initialize the animation controllers
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    // Define slide animations for each bubble
    _slideAnimation1 = Tween<Offset>(
      begin: Offset(-1, 0), // Slide in from the left
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeOut));

    _slideAnimation2 = Tween<Offset>(
      begin: Offset(1, 0), // Slide in from the right
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeOut));

    _slideAnimation3 = Tween<Offset>(
      begin: Offset(-1, 0), // Slide in from the left
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller3, curve: Curves.easeOut));

    // Define scale animations for "pop" effect
    _scaleAnimation1 = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.elasticOut),
    );
    _scaleAnimation2 = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller2, curve: Curves.elasticOut),
    );
    _scaleAnimation3 = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller3, curve: Curves.elasticOut),
    );

    // Start animations sequentially
    _startAnimations();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _firstLoad = false; // After 500ms, it's no longer the first load
      });
    });
  }

  void _startAnimations() async {
    await _controller1.forward();
    await _controller2.forward();
    await _controller3.forward();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  Widget _buildChatBubble(
      int index,
      String message, Animation<Offset> slideAnimation, Animation<double> scaleAnimation,
      {bool isUser = false}) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Row(
          mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment:
            //   isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     if (!isUser)
            //       Stack(
            //         clipBehavior: Clip.none,
            //         children: [
            //           // Chat Bubble
            //           Container(
            //             margin: EdgeInsets.only(top: 25, left: 8, right: 8),
            //             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            //             decoration: BoxDecoration(
            //               color: Colors.grey[300],
            //               borderRadius: BorderRadius.only(
            //                 topLeft: Radius.circular(20),
            //                 topRight: Radius.circular(20),
            //                 bottomLeft: Radius.circular(0),
            //                 bottomRight: Radius.circular(20),
            //               ),
            //             ),
            //             child: ConstrainedBox(
            //               constraints: BoxConstraints(
            //                   maxWidth: MediaQuery.of(context).size.width / 2), // 50% width
            //               child: Text(
            //                 message,
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 16,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           // Image or Video on Top Corner
            //           Positioned(
            //             top: -10,
            //             left: -10,
            //             child: Container(
            //               width: 40,
            //               height: 40,
            //               decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 border: Border.all(
            //                     color: Color.fromRGBO(247, 210, 96, 1), width: 2),
            //               ),
            //               child: ClipRRect(
            //                 borderRadius: BorderRadius.circular(20),
            //                 child: index == 0
            //                     ? Hero(
            //                   tag: 'teacherHero',
            //                   child: Transform.scale(
            //                     scale: 1.4,
            //                     child: AspectRatio(
            //                       aspectRatio:
            //                       _teacherController.value.aspectRatio,
            //                       child: VideoPlayer(_teacherController),
            //                     ),
            //                   ),
            //                 )
            //                     : Transform.scale(
            //                   scale: 1.4,
            //                   child: AspectRatio(
            //                     aspectRatio:
            //                     _teacherController.value.aspectRatio,
            //                     child: VideoPlayer(_teacherController),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     if (isUser)
            //       Stack(
            //         clipBehavior: Clip.none,
            //         children: [
            //           // Chat Bubble
            //           Container(
            //             margin: EdgeInsets.only(top: 25, left: 8, right: 8),
            //             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            //             decoration: BoxDecoration(
            //               color: Colors.blue,
            //               borderRadius: BorderRadius.only(
            //                 topLeft: Radius.circular(20),
            //                 topRight: Radius.circular(20),
            //                 bottomLeft: Radius.circular(20),
            //                 bottomRight: Radius.circular(0),
            //               ),
            //             ),
            //             child: ConstrainedBox(
            //               constraints: BoxConstraints(
            //                   maxWidth: MediaQuery.of(context).size.width / 2), // 50% width
            //               child: Text(
            //                 message,
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 16,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           // Image or Video on Top Corner
            //           Positioned(
            //             top: -10,
            //             right: -10,
            //             child: Container(
            //               width: 40,
            //               height: 40,
            //               decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 border: Border.all(
            //                     color: Color.fromRGBO(247, 210, 96, 1), width: 2),
            //               ),
            //               child: ClipRRect(
            //                 borderRadius: BorderRadius.circular(20),
            //                 child: Hero(
            //                   tag: 'studentHero',
            //                   child: Transform.scale(
            //                     scale: 1.4,
            //                     child: AspectRatio(
            //                       aspectRatio: _controllerstudent.value.aspectRatio,
            //                       child: VideoPlayer(_controllerstudent),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //   ],
            // ),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child:

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.white : Color.fromRGBO(
                          248, 212, 100, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft:
                        isUser ? Radius.circular(20) : Radius.circular(0),
                        bottomRight:
                        isUser ? Radius.circular(0) : Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: const Offset(0, 3), // Changes position of shadow
                        ),
                      ],
                    ),
                    child:  ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width /2), // Max width is 75% of screen width
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize:  MediaQuery.of(context).size.height / 55,
                        ),
                      ),
                    ),
                  ),
                ),
                if (!isUser)

                Positioned(
                  left: -15,
                  top: -25,
                  child: Container(
                    child:    index == 0 ?



                    Container(
                      width: 50,
                      height:50,
                      // decoration: BoxDecoration(
                      //
                      //   shape: BoxShape.circle,
                      //   border: Border.all(
                      //       color: Color.fromRGBO(247, 210, 96, 1), width: 2),
                      // ),
                      child:  Hero(
                        tag: 'teacherHero',
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                180), // Set the round corner radius
                            child: Transform(
                              transform: Matrix4.identity()..scale(1.4, 1, 1),
                              child: AspectRatio(
                                aspectRatio:
                                _teacherController.value.aspectRatio,
                                child: VideoPlayer(_teacherController),
                              ),
                            )),
                      ),
                    )
                        :
                    Container(
                      width: 50,
                      height:50,
                      // decoration: BoxDecoration(
                      //
                      //   shape: BoxShape.circle,
                      //   border: Border.all(
                      //       color: Color.fromRGBO(247, 210, 96, 1), width: 2),
                      // ),
                      child:  ClipRRect(
                          borderRadius: BorderRadius.circular(
                              180), // Set the round corner radius
                          child: Transform(
                            transform: Matrix4.identity()..scale(1.4, 1, 1),
                            child: AspectRatio(
                              aspectRatio:
                              _teacherController.value.aspectRatio,
                              child: VideoPlayer(_teacherController),
                            ),
                          )),
                    ),
                  ),
                ),


                if (isUser)


                  Positioned(
                    right: -15,
                    top: -25,
                    child: Container(
                      width: 50,
                      height:50,
                      // decoration: BoxDecoration(
                      //
                      //   shape: BoxShape.circle,
                      //   border: Border.all(
                      //       color: Color.fromRGBO(247, 210, 96, 1), width: 2),
                      // ),
                      child:  Hero(
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
                  ),
              ],
            ),


          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0), // Add space from the left
              child: Image.asset(
                "assets/sparkl_logo.png",
                width: MediaQuery.of(context).size.height / 7,
                fit: BoxFit.cover,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top:   MediaQuery.of(context).size.height / 24,
              left: _firstLoad
                  ? MediaQuery.of(context).size.width // Initially off-screen to the left
                  : 20,
              // (_moveTexts ? -300 : 20),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Doubt Resolution with Teachers",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120,),


                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildChatBubble(0,chatMessages[0], _slideAnimation1,
                            _scaleAnimation1),
                        _buildChatBubble(1,chatMessages[1], _slideAnimation2,
                            _scaleAnimation2,
                            isUser: true),
                        _buildChatBubble(2,chatMessages[2], _slideAnimation3,
                            _scaleAnimation3),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
                                  248, 212, 100, 1) ],
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

                                Navigator.pop(context);
                                // Navigator.push(
                                //   context,
                                //   PageRouteBuilder(
                                //     transitionDuration: Duration(seconds: 2), // Set the animation speed
                                //     pageBuilder: (context, animation, secondaryAnimation) => OnboardingChatWithProfileAnimation(),
                                //   ),
                                // );
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



