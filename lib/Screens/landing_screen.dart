import 'package:blockbuster_hunt/Constants/constants.dart';
import 'package:blockbuster_hunt/Screens/category_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    super.key,
    required groupName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage('assets/img (3).webp'),
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoryScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent),
                  child: Text(
                    'Let\'s Start The Journey',
                    style: TextStyle(
                      color: kblack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
