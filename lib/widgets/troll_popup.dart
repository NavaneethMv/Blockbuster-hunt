import 'package:blockbuster_hunt/Constants/constants.dart';
import 'package:blockbuster_hunt/Screens/question_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class WrongTrollPopup {
  static int num = generateRandom(min: 0,max: 10);

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Colors.white,
          title: const Column(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.redAccent,
                size: 40,
              ),
              SizedBox(height: 10),
              Text(
                'Wrong Guess!',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Container(
            width: double.maxFinite,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent.withOpacity(0.1), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(wrong_meme_list[num]),
                fit: BoxFit.contain,
              ),
            ),
          ),
          actionsPadding: const EdgeInsets.only(bottom: 10),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Close',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  num = generateRandom(previous: num);
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class CorrectTrollPopup {
  int level;
  CorrectTrollPopup({required this.level});
  static int num = generateRandom(max: 0, min: 0);

  void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Colors.white,
          title: const Column(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.green,
                size: 40,
              ),
              SizedBox(height: 10),
              Text(
                'You Got it!',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Container(
            width: double.maxFinite,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.withOpacity(0.1), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(corect_meme_list[0]),
                fit: BoxFit.contain,
              ),
            ),
          ),
          actionsPadding: const EdgeInsets.only(bottom: 10),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Close',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  // var previous = num;
                  // num = generateRandom(previous: previous);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => QuestionScreen(
                      level: level + 1,
                    ),
                  ));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

int generateRandom({int previous = 0, int min = 0, int max = 7}) {
  final random = Random();
  int n;

  do {
    n = min + random.nextInt(max - min + 1);
  } while (n == previous);

  return n;
}
