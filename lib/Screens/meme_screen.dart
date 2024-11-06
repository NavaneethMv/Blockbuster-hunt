import 'package:blockbuster_hunt/Screens/question_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MemeScreen extends StatelessWidget {
  String button_text;
  String img_path;
  bool completed;
  MemeScreen(
      {required this.button_text,
      required this.img_path,
      this.completed = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            child: ElevatedButton(
              onPressed: () {
                completed
                    ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => QuestionScreen()))
                    : Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MemeScreen(
                          button_text: "Start the game ",
                          img_path: "assets/maman.jpg",
                          completed: true,
                        ),
                      ));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                button_text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            child: Center(
              child: Expanded(
                child: Image(
                  image: AssetImage(img_path),
                ),
              ),
            ),
          ),

          //Spacer(),
        ],
      ),
    );
  }
}
