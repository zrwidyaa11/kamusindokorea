import 'package:flutter/material.dart';
import 'home_view.dart'; // Import HomeView
import 'package:kamusindkorea/views/pharase_book.dart'; // Import PhrasebookView

class FavoriteView extends StatefulWidget {
  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  int _selectedIndex = 4; // Set to 4 since this is the index of the star icon

  final List<Map<String, String>> favorites = [
    // Example favorite items; replace with actual data
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhrasebookView(),
        ),
      );
    }
    // Handle other index navigation here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/navbar.png'), // Replace with the path to your image
              Positioned(
                top: 45.0, // Adjusted position
                left: 16.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_image.png'), // Replace with your profile image path
                ),
              ),
              Positioned(
                top: 45.0, // Adjusted position
                right: 37.0,
                child: GestureDetector(
                  onTap: () {
                    // Add functionality for the more icon if needed
                  },
                  child: Image.asset(
                    'assets/images/moreicon.png', // Replace with your icon image path
                    width: 36.0, // Increased size of the icon
                    height: 36.0, // Increased size of the icon
                  ),
                ),
              ),
              Positioned(
                top: 50.0, // Adjusted position below the profile section
                left: MediaQuery.of(context).size.width / 2 - 50, // Centering the text
                child: Text(
                  'Favorite',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal, // Mengubah menjadi normal
                    fontFamily: 'PlusJakartaSans', // Menambahkan font PlusJakartaSans
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return _buildFavoriteCard(favorites[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Image.asset(
            'assets/images/navbarbwh.png', // Replace with the correct image path
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80, // Adjust height to fit buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconButton(0, 'assets/images/homeicon.png'),
                  _buildIconButton(1, 'assets/images/cameraicon.png'),
                  _buildIconButton(2, 'assets/images/messagesicon.png'),
                  _buildIconButton(3, 'assets/images/bookicon.png'),
                  _buildIconButton(4, 'assets/images/staricon.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteCard(Map<String, String> favorite) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              favorite["indonesian"]!,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              favorite["korean"]!,
              style: TextStyle(fontSize: 16, color: Colors.purple),
            ),
            SizedBox(height: 8),
            Text(
              favorite["romanization"]!,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.star,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(int index, String assetName) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: 60, // Adjusted width
        height: 35, // Adjusted height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), // Radius of 20 for the button container
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            if (_selectedIndex == index)
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100), // Radius of 100 for the background image
                  child: Image.asset(
                    'assets/images/buttonpencet.png', // Background image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Center(
              child: Image.asset(
                assetName, // Icon image
                width: 28, // Increased size of the icon image
                height: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FavoriteView(),
  ));
}