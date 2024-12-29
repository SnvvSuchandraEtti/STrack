import 'dart:async';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'settings.dart';
import 'selling.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'user_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController(); // Add this line
  int _currentIndex = 0;
  int _currentPage = 0;
  final List<String> _images = [
    'assets/products/1.jpg',
    'assets/products/7.jpg',
    'assets/products/9.jpg',
    'assets/products/11.jpg',
    'assets/products/5.jpg',
    'assets/products/2.jpg',
  ];
  final int someItemCount = 10; // Set a value for someItemCount

  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = [
      _buildHomeScreen(),
      SellingScreen(),
      _buildSearchScreen(),
      _buildInboxScreen(),
      const SellerProfile(),
    ];
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        if (_currentPage < _images.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 299),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose(); // Dispose the page controller
    super.dispose();
  }

  void _onBottomNavigationBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildDrawer() {
    final userState = UserState(); // Consider using a provider or state management.

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              userState.username ?? 'Balaraju...',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              userState.email ?? 'Balaraju2020@gmail.com',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-vector/hand-drawn-heart-cartoon-character-illustration_23-2150497827.jpg?t=st=1721703363~exp=1721706963~hmac=d276478e751e1979401811a0e91e2998405cf33ffefeb9ce1dea6dab1d3b21d9&w=740',
                ),
              ),
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF7A97CC),
                  Color(0xFF536AE8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SellerProfile()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Orders'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSomeScrollableWidget() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: someItemCount,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[199],
        borderRadius: BorderRadius.circular(9),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 9),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search on Veggie Mart',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCategoryButton('Selling'),
        _buildCategoryButton('Deals'),
        _buildCategoryButton('Categories'),
        _buildCategoryButton('Saved'),
      ],
    );
  }

  Widget _buildCategoryButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
          side: const BorderSide(color: Colors.grey),
        ),
        elevation: 0,
      ),
      child: Text(text),
    );
  }

  Widget _buildSellingBanner() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      color: Colors.yellow[699],
      child: const Text(
        'Have you been selling on Veggie Mart already?',
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 199,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: Image.network(
              _images[index],
              fit: BoxFit.contain,
              width: 299,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourseSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommended for you',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 9),
        _buildCourseList(),
      ],
    );
  }

  Widget _buildCourseList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(9, (index) => _buildCourseItem()),
      ),
    );
  }

  Widget _buildCourseItem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9),
      width: 199,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'assets/logo/basket.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 199,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
          const SizedBox(height: 9),
          const Text(
            'Welcome seller',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text('Explore more'),
        ],
      ),
    );
  }

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 9),
          _buildSearchBar(),
          const SizedBox(height: 9),
          _buildCategoryButtons(),
          const SizedBox(height: 9),
          _buildSellingBanner(),
          const SizedBox(height: 9),
          _buildImageCarousel(),
          const SizedBox(height: 9),
          _buildCourseSection(),
        ],
      ),
    );
  }

  Widget _buildSearchScreen() {
    return const Center(
      child: Text('Search Screen'),
    );
  }

  Widget _buildInboxScreen() {
    return const Center(
      child: Text('Inbox Screen'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Veggie Mart',
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
      ),
      drawer: _buildDrawer(),
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.green,
        items: const <Widget>[
          Icon(Icons.home, size: 29, color: Colors.white),
          Icon(Icons.sell, size: 29, color: Colors.white),
          Icon(Icons.search, size: 29, color: Colors.white),
          Icon(Icons.inbox, size: 29, color: Colors.white),
          Icon(Icons.account_circle, size: 29, color: Colors.white),
        ],
        onTap: _onBottomNavigationBarTap,
      ),
    );
  }
}
