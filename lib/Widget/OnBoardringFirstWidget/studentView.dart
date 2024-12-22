import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class Studentview extends StatelessWidget {
  final bool firstLoad;
  final bool moveTexts;
  final VideoPlayerController controller;
  const Studentview({super.key,required this.firstLoad,required this.controller,required this.moveTexts});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            bottom: MediaQuery.of(context).size.height / 4.6,
            left: MediaQuery.of(context).size.width / 20,
            child: Container(
              // color: Colors.red,
                child: Lottie.asset('assets/sparkl_shape_shift_lottie.json',
                    width: MediaQuery.of(context).size.width/1.1,
                    height: MediaQuery.of(context).size.width/1.1,
                    fit: BoxFit.contain)),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 6,
            bottom: MediaQuery.of(context).size.height / 3.6,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Color.fromRGBO(247, 210, 96, 1), width: 2),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            // top:  MediaQuery.of(context).size.height/3.2,
            left: MediaQuery.of(context).size.width / 6,
            bottom: firstLoad
                ? -200 // Initially off-screen to the left
                : MediaQuery.of(context).size.height / 3.6,

            // (_moveTexts ? -300 : 20),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.5,

              child: controller.value.isInitialized
                  ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.width / 1.5,
                  child:  Hero(
                    tag: 'studentHero',
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            180), // Set the round corner radius
                        child: Transform(
                          transform: Matrix4.identity()..scale(1.4, 1, 1),
                          child: AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),
                          ),
                        )),
                  ),
                ),
              )
                  : CircularProgressIndicator(),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500), // Duration of the move
            top: MediaQuery.of(context).size.height / 3,
            left: firstLoad
                ? -50 // Initially off-screen to the left
                : (moveTexts ? -300 : MediaQuery.of(context).size.width / 5.8), // Move text to the left
            child: AnimatedOpacity(
                opacity: moveTexts ? 0 : 1, // Fade out when moved
                duration: Duration(milliseconds: 500),
                child: DottedBorder(
                  strokeWidth: 2, // Thickness of the dotted line
                  color: Color.fromRGBO(
                      248, 212, 100, 1),
                  borderType: BorderType.Circle,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(245, 244, 233, 1), // Inside color of the circle
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/blue_book.png",
                        height: MediaQuery.of(context).size.width / 15,
                      ),
                    ),
                  ),
                )),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: MediaQuery.of(context).size.height / 2.2,
            left: firstLoad
                ? -50 // Initially off-screen to the left
                : (moveTexts
                ? -300
                : MediaQuery.of(context).size.width /
                11), // Duration of the move
            // Move text to the left
            child: AnimatedOpacity(
                opacity: moveTexts ? 0 : 1, // Fade out when moved
                duration: Duration(milliseconds: 500),
                child:  DottedBorder(
                  strokeWidth: 2, // Thickness of the dotted line
                  color: Color.fromRGBO(
                      248, 212, 100, 1),
                  borderType: BorderType.Circle,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(245, 244, 233, 1), // Inside color of the circle
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/pre_read_selected.png",
                        height: MediaQuery.of(context).size.width / 15,
                      ),
                    ),
                  ),
                )
            ),
          ),

          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: MediaQuery.of(context).size.height / 1.8,
            left: firstLoad
                ? -50 // Initially off-screen to the left
                : (moveTexts ? -300 : 20),
            child: AnimatedOpacity(
              opacity: moveTexts ? 0 : 1,
              duration: Duration(milliseconds: 500),
              child: DottedBorder(
                strokeWidth: 2,
                borderType: BorderType.RRect,
                color: Color.fromRGBO(247, 210, 96, 1),
                radius: Radius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 246, 240, 1), // Inside color of the container
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Doubt Clarification',
                      style: TextStyle(
                          fontSize:MediaQuery.of(context).size.width / 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),



            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: MediaQuery.of(context).size.height / 2.8,
            left: firstLoad
                ? 400 // Initially off-screen to the left
                : (moveTexts
                ? 300
                : MediaQuery.of(context).size.width / 1.7),
            child: AnimatedOpacity(
              opacity: moveTexts ? 0 : 1,
              duration: Duration(milliseconds: 500),
              child: DottedBorder(
                strokeWidth: 2,
                borderType: BorderType.RRect,
                color: Color.fromRGBO(247, 210, 96, 1),
                radius: Radius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 246, 240, 1), // Inside color of the container
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Holistic Well-Being',
                      style: TextStyle(
                          fontSize:MediaQuery.of(context).size.width / 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),



            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: MediaQuery.of(context).size.height / 1.9,
            left: firstLoad
                ? 400 // Initially off-screen to the left
                : (moveTexts
                ? 300
                : MediaQuery.of(context).size.width / 1.5),
            child: AnimatedOpacity(
              opacity: moveTexts ? 0 : 1,
              duration: Duration(milliseconds: 500),
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: Color.fromRGBO(247, 210, 96, 1),
                strokeWidth: 2,
                radius: Radius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 246, 240, 1), // Inside color of the container
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Personalised',
                      style: TextStyle(
                          fontSize:MediaQuery.of(context).size.width / 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            bottom: MediaQuery.of(context).size.height / 5.5,
            left: firstLoad
                ? 400 // Initially off-screen to the left
                : (moveTexts
                ? 300
                : MediaQuery.of(context).size.width / 1.8),
            child: AnimatedOpacity(
              opacity: moveTexts ? 0 : 1,
              duration: Duration(milliseconds: 500),
              child: DottedBorder(
                strokeWidth: 2, // Thickness of the dotted line
                color: Color.fromRGBO(
                    248, 212, 100, 1),
                borderType: BorderType.Circle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/emoji.png",
                    height: MediaQuery.of(context).size.width / 15,
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



class AssetsPosition extends StatelessWidget {
  final bool firstLoad;
  final bool moveTexts;
  final Widget image;
  final topPosition;
  final leftPosition;

  const AssetsPosition(
      {super.key,
        required this.firstLoad,
        required this.moveTexts,
        required this.image,
        required this.topPosition,
        required this.leftPosition});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      top: topPosition,
      left: firstLoad
          ? 400 // Initially off-screen to the left
          : (moveTexts ? 300 : MediaQuery.of(context).size.width / 1.8),
      child: AnimatedOpacity(
        opacity: moveTexts ? 0 : 1,
        duration: Duration(milliseconds: 500),
        child: DottedBorder(
          strokeWidth: 2, // Thickness of the dotted line
          color: Color.fromRGBO(248, 212, 100, 1),
          borderType: BorderType.Circle,
          child: Padding(padding: const EdgeInsets.all(8.0), child: image),
        ),
      ),
    );
  }
}
