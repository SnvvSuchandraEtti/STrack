import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';
import 'signupa.dart';
import 'logina.dart';
import 'homescreeno.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5C5CAD),
        title: Text(
          'STrack',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                width: screenWidth * 0.4, // Responsive width
                height: screenWidth * 0.4, // Responsive height
                child: Image.asset('assets/logo/vm1.png'),
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive height
              Text(
                'Your Academic Companion at',
                style: TextStyle(
                  fontSize: screenHeight * 0.02, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Aditya University',
                style: TextStyle(
                  fontSize: screenHeight * 0.02, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.05), // Responsive height
              _buildAnimatedButton(
                context,
                label: 'Log In',
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SimpleLoginScreen()),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive height
              _buildAnimatedButton(
                context,
                label: 'Sign Up',
                backgroundColor: Colors.greenAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SimpleRegisterScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedButton(BuildContext context,
      {required String label, required Color backgroundColor, required VoidCallback onPressed}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            backgroundColor: backgroundColor,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(label, style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
