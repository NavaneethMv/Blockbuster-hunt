import 'package:blockbuster_hunt/Constants/categories.dart';
import 'package:blockbuster_hunt/Constants/constants.dart';
import 'package:blockbuster_hunt/Screens/meme_screen.dart';
import 'package:blockbuster_hunt/widgets/category_snackbar_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Select the'),),
      backgroundColor: kblack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              height20,
              Text(
                'Choose What You Need',
                style: TextStyle(
                    color: kwhite, fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedCategories.contains(categories[
                        index]); // Check category name instead of index
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            // Deselect if already selected
                            selectedCategories.remove(categories[index]);
                          } else if (selectedCategories.length < 3) {
                            // Select only if less than 3 categories selected
                            selectedCategories.add(categories[index]);
                          } else {
                            //  Show a message if max selection is reached
                            category_snackbar(context);
                          }
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(categoryImages[index]),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black
                                      .withOpacity(isSelected ? 0.4 : 0.7),
                                  BlendMode.darken,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(2, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          if (isSelected)
                            const Positioned(
                              top: 8,
                              right: 8,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.greenAccent,
                                size: 24,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              height20,
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: selectedCategories.isNotEmpty
                    ? () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MemeScreen(
                              button_text: "Next",
                              img_path: "assets/lolan.png",
                            ),
                          ),
                        );
                      }
                    : null,
                child: const Text(
                  "Proceed",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}