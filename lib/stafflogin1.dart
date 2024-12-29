import 'package:flutter/material.dart';

class LoginScreena extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Display a logo or placeholder image
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                width: 150,
                height: 150,
                child: Image.network('assets/logo/vm1.png'), // Placeholder for your logo
              ),
              SizedBox(height: 24),
              // Main title
              Text(
                'Staff Portal',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              // Subheading for coming soon notice
              Text(
                'Staff Portal is Coming Soon!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              // Placeholder message or additional information
              Text(
                'We are working hard to bring you an amazing experience. Stay tuned!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              // Optional: you can add a progress indicator
              CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
              SizedBox(height: 16),
              // Optional: Back button to navigate back to the previous screen
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous page
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
