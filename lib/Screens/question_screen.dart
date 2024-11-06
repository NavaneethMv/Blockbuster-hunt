import 'package:blockbuster_hunt/Constants/constants.dart';
import 'package:blockbuster_hunt/Constants/questions.dart';
import 'package:blockbuster_hunt/Screens/answer_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionScreen extends StatelessWidget {
   int level;
   QuestionScreen({this.level=0,super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Stack(
        children: [
          // Background Image
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Opacity(
              opacity: 0.5, // Adjust this value to control the opacity
              child: Image(
                image: AssetImage("assets/bg1.webp"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(
                0.6), 
          ),
          Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Positioned(
                top: 0,
                child: Center(
                  child: Text(
                    "BLOCKBUSTER HUNT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 28),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 1.5,
              )
            ],
          ),

          Positioned(
            bottom: 10, // Position 10 pixels from the top
            left: 10, // Align to the left edge of the screen
            right: 10, // Align to the right edge of the screen
            child: Container(
              decoration: BoxDecoration(
                color: kwhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), // Top left corner radius
                  topRight: Radius.circular(20),
                ),
              ),
              height: MediaQuery.of(context).size.height / 1.7,
              child: Scrollbar(
                thickness: 8.0,
                radius: const Radius.circular(10), // Rounded corners
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      height10,
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            "DAY ${level+1}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 22),
                          ),
                          const Text(
                            " / 7",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(38.0),
                        child: Text(
                          question[level],
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("level=$level");
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  AnswerScreen(level: level,),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15), // Padding
                          shape: RoundedRectangleBorder(
                            // Shape
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5, // Elevation
                        ),
                        child: const Text('Click here to submit the answer',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ),
                      height20
                    ],
                  ),
                ), // Set the height of the container
              ),
            ),
          ),
        ],
      ),
    );
  }
}
