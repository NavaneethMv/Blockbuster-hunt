import 'package:flutter/material.dart';

void category_snackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'You can select up to 3 categories only.',
          style: TextStyle(
            color: Colors.black, // Change text color
            fontWeight:
                FontWeight.bold, // Make the text bold
          ),
        ),
        backgroundColor: Colors.white,
           // Set a vibrant background color
        behavior: SnackBarBehavior
            .floating, // Make it float above other content
        duration: const Duration(
            seconds: 2), // Set duration for display
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              10), // Rounded corners
        ),
        action: SnackBarAction(
          label: 'Okay', // Action label
          textColor:
              Colors.green, // Action text color
          onPressed: () {},
        ),
      ),
    );
  }