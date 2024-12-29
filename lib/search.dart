import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animate/flutter_animate.dart' as flutter_animate;
import 'package:flutter_animate/flutter_animate.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> _recentSearches = ["Tomatoes", "Cabbages", "Fresh Apples"];
  final List<String> _popularTags = ["Organic", "Fresh", "Discounted", "Veggies"];
  final List<String> _suggestedItems = ["Broccoli", "Carrots", "Spinach", "Avocados"];
  final List<String> _imagePaths = [
    'assets/products/broccoli.png',
    'assets/products/carrots.png',
    'assets/products/spinach.png',
    'assets/products/avocados.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildRecentSearchesSection().animate().fadeIn(duration: 500.ms),
              const SizedBox(height: 20),
              _buildPopularTagsSection().animate().slideX(duration: 400.ms),
              const SizedBox(height: 20),
              _buildSuggestionsSection().animate().scale(duration: 600.ms), // Correct animation
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search for groceries',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.grey),
            onPressed: () {
              // Add voice search functionality
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearchesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Searches',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: _recentSearches.map((search) => _buildSearchChip(search)).toList(),
        ),
      ],
    );
  }

  Widget _buildPopularTagsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Tags',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _popularTags.map((tag) => _buildTagChip(tag)).toList(),
        ),
      ],
    );
  }

  Widget _buildSuggestionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'You Might Like',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: _suggestedItems.length,
          itemBuilder: (context, index) {
            return _buildSuggestedItemCard(_suggestedItems[index], _imagePaths[index])
                .animate().fadeIn(duration: 600.ms).scale(); // Adding scale animation
          },
        ),
      ],
    );
  }

  Widget _buildSearchChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[300],
      shape: const StadiumBorder(
        side: BorderSide(color: Colors.grey, width: 1),
      ),
    );
  }

  Widget _buildTagChip(String tag) {
    return Chip(
      label: Text(
        tag,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }

  Widget _buildSuggestedItemCard(String itemName, String imagePath) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
              height: 150,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              itemName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Fresh & Organic',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
