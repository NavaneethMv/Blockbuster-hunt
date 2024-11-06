import 'package:blockbuster_hunt/Constants/answers.dart';
import 'package:blockbuster_hunt/Constants/constants.dart';
import 'package:blockbuster_hunt/widgets/troll_popup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnswerScreen extends StatelessWidget {
  int level;
  AnswerScreen({required this.level, super.key});

  Future<void> incrementLevel() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String email = user.email ?? "No";
      // await allUsers.doc(email).update({
      //   'level':
      // })
      FirebaseFirestore.instance
          .collection('Allusers')
          .doc(email)
          .get()
          .then((querySnapshot) {
        print(querySnapshot);
      });

      CollectionReference allUsers =
          FirebaseFirestore.instance.collection('Allusers');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Opacity(
              opacity: 0.6,
              child: Image(
                image: AssetImage(bg_images[level]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(
                0.7), // Adjust opacity here for darker or lighter shade
          ),
          AppBar(
              backgroundColor: Colors.black12,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                color: kwhite,
                iconSize: 30,
              )),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.7,
                  ),
                  Text(
                    'Enter the answer of Day ${level + 1}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: kwhite),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: TextField(
                            style: TextStyle(
                              fontSize: 24,
                              color: kblack,
                            ),
                            controller: _controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var text = _controller.text.toString();
                      String formattedText = FormatText(text);
                      if (formattedText == answers[level]) {
                        var a = CorrectTrollPopup(level: level);
                        a.show(context);
                      } else if (level == 5 && formattedText == 'STARS') {
                        var a = CorrectTrollPopup(level: level);
                        a.show(context);
                      } else {
                        WrongTrollPopup.show(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15), // Padding
                      shape: RoundedRectangleBorder(
                        // Shape
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5, // Elevation
                    ),
                    child: const Text('Submit Answer',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String FormatText(String originalText) {
    String formattedText =
        originalText.replaceAll(RegExp(r'\s+'), '').trim().toUpperCase();
    return formattedText;
  }
}
