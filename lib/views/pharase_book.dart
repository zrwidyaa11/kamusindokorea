import 'package:flutter/material.dart';
import 'home_view.dart'; // Import HomeView
import 'favorite_view.dart'; // Import FavoriteView

class PhrasebookView extends StatefulWidget {
  @override
  _PhrasebookViewState createState() => _PhrasebookViewState();
}

class _PhrasebookViewState extends State<PhrasebookView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavoriteView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/navbar.png'), // Ganti dengan path navbar atas
              Positioned(
                top: 45.0,
                left: 16.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_image.png'), // Ganti dengan path gambar profil
                  radius: 18.0, // Ukuran icon profil
                ),
              ),
              Positioned(
                top: 45.0,
                right: 37.0,
                child: GestureDetector(
                  onTap: () {
                    // Tambahkan fungsi jika diperlukan
                  },
                  child: Image.asset(
                    'assets/images/moreicon.png', // Ganti dengan path gambar icon more
                    width: 36.0, // Ukuran icon more
                    height: 36.0, // Ukuran icon more
                  ),
                ),
              ),
              Positioned(
                top: 50.0, // Sesuaikan posisi teks
                left: MediaQuery.of(context).size.width / 2 - 50, // Centering text
                child: Center( // Tambahkan widget Center untuk menengahkan teks
                  child: Text(
                    'Phrasebook',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/pencarian.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter, // Turunkan posisi gambar
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari contoh kalimat',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0.1), // Naikkan posisi icon
                            child: Icon(
                              Icons.search,
                              size: 24,
                              color: Colors.grey,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      children: [
                        _buildPhrasebookItem('Touring', 'assets/images/touring_icon.png', 16.0), // Naikkan ukuran teks
                        _buildPhrasebookItem('Marketing', 'assets/images/marketing_icon.png', 16.0), // Naikkan ukuran teks
                        _buildPhrasebookItem('Designer', 'assets/images/designer_icon.png', 16.0), // Naikkan ukuran teks
                        _buildPhrasebookItem('Tour Guide', 'assets/images/tour_guide_icon.png', 16.0), // Naikkan ukuran teks
                        _buildPhrasebookItem('Project Manager', 'assets/images/project_manager_icon.png', 15.3), // Naikkan ukuran teks
                        _buildPhrasebookItem('Event Planner', 'assets/images/event_planner_icon.png', 16.0), // Naikkan ukuran teks
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Image.asset(
            'assets/images/navbarbwh.png', // Ganti dengan path gambar navbar bawah
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
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

  Widget _buildPhrasebookItem(String title, String iconPath, double textSize) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/kolom.png'), // Ganti dengan path gambar latar belakang
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 10.0, 16.0, 5.0), // Naikkan posisi gambar
            child: Image.asset(
              iconPath,
              height: 70, // Naikkan ukuran gambar
              width: 70, // Naikkan ukuran gambar
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 5.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  ' Lorem ipsum dolor \n sit amet',
                  style: TextStyle(
                    fontSize: 10.13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(int index, String assetName) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: 60,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            if (_selectedIndex == index)
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/buttonpencet.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Center(
              child: Image.asset(
                assetName,
                width: 28,
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
    home: PhrasebookView(),
  ));
}