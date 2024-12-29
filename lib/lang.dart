import 'package:flutter/material.dart';
import 'studentlogin1.dart';
import 'stafflogin1.dart';

class LanguageSelectionPage1 extends StatefulWidget {
  @override
  State<LanguageSelectionPage1> createState() => _LanguageSelectionPage1State();
}

class _LanguageSelectionPage1State extends State<LanguageSelectionPage1> {
  bool isStudentHovered = false;
  bool isStaffHovered = false;

  void _onLanguageSelected1(String language) {
    print('Selected Language: $language');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF3E5F5), // Light background color
      appBar: AppBar(
        title: Text(
          'Select Your Role',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor:Color(0xFF5C5CAD),
        shadowColor: Colors.black.withOpacity(0.5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildRoleOption(
                title: 'Student',
                isHovered: isStudentHovered,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                colors: [Colors.orange, Colors.orangeAccent], // Updated colors
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  );
                },
                onHover: (hovered) {
                  setState(() {
                    isStudentHovered = hovered;
                  });
                },
              ),
              SizedBox(height: screenHeight * 0.04),
              _buildRoleOption(
                title: 'Staff',
                isHovered: isStaffHovered,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                colors: [Colors.blue, Color(0xFF112148)], // Updated colors
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreena(),
                    ),
                  );
                },
                onHover: (hovered) {
                  setState(() {
                    isStaffHovered = hovered;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleOption({
    required String title,
    required bool isHovered,
    required double screenWidth,
    required double screenHeight,
    required List<Color> colors,
    required VoidCallback onTap,
    required ValueChanged<bool> onHover,
  }) {
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isHovered ? screenWidth * 0.85 : screenWidth * 0.8,
        padding: EdgeInsets.all(screenHeight * 0.02),
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: colors[1].withOpacity(0.4),
              blurRadius: 10,
              offset: Offset(0, 1.5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenHeight * 0.03,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
