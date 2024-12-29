import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'ProfileScreen.dart';
import 'allproducts.dart';
import 'productoverview.dart';
import 'suchendrsetting.dart';

class HomeScreen extends StatefulWidget {
  final int pu;
  const HomeScreen({this.pu = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curr = 0, ba = 0;
  List<String> productNames = ["Ac", "Book", "Pet Foods", "iPhone 15"];
  List<Map<String, String>> productRates = [
    {"Wireless Headphones": "₹1029"},
    {"Shoes": "₹2999"},
    {"Ac": "₹97,000"},
    {"Book": "₹890"},
    {"iPhone 15": "₹1,19,000"},
    {"Shirts": "₹1999"},
    {"Trousers": "₹999"},
    {"Pet Foods": "₹200"}
  ];

  List deals = [
    ["vivo y19", "₹20,000", 'image1.jpg'],
    ["Motorola G85", "₹17,999", 'image2.jpg'],
    ["CMF by Nothing", "₹15,999", 'image3.jpg'],
  ];

  final List<Color> colors = [Colors.blue, Colors.white, Colors.grey];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;

    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.4),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Balaraju', style: TextStyle(fontSize: 20)),
              accountEmail: Text('balaraju2020@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://image-url.com'),
              ),
            ),
            drawerItem(Icons.home, 'Home'),
            drawerItem(Icons.person, 'Account', ProfileScreen()),
            drawerItem(Icons.settings, 'Settings', SettingsScreen()),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo/vm0.png', height: 40),
              SizedBox(width: 10),
              Text('Veggie Mart', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  ListTile drawerItem(IconData icon, String text, [Widget? screen]) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () => screen != null ? Navigator.push(context, MaterialPageRoute(builder: (_) => screen)) : null,
    );
  }
}

Widget productContainer({
  required BuildContext context,
  required String productName,
  required String imageUrl,
  required String price,
  required bool isFavorite,
  required Function() onFavoriteTap,
  required Function() onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(left: 17.0),
      child: Stack(
        children: [
          Container(
            height: 190,
            width: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(31),
              color: Colors.white, // Add your dynamic color
            ),
          ),
          Positioned(
            bottom: 65,
            right: 1,
            child: Container(
              height: 108,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error), // Placeholder for error
                ),
              ),
            ),
          ),
          Positioned(
            top: 155,
            left: 20,
            child: Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),
          Positioned(
            top: 129,
            left: 20,
            child: Text(
              productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            left: 150,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: Colors.orange,
              ),
              child: InkWell(
                onTap: onFavoriteTap,
                child: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: isFavorite ? Colors.pinkAccent : Colors.white60,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
