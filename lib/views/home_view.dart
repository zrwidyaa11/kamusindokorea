import 'package:flutter/material.dart';
import 'package:kamusindkorea/pages/translate_screen.dart'; // Import TranslateScreen
import 'package:kamusindkorea/views/favorite_view.dart'; // Import FavoriteView
import 'package:kamusindkorea/views/pharase_book.dart'; // Import PharaseBook
import 'package:kamusindkorea/views/setting_view.dart'; // Import SettingView

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Map<String, String>> quotes = [
    {
      "korean": "걱정하지 말아요\n아무대서나 우리 목소리로 노래를 부르자\n청춘에게 건배",
      "english": "Let's not worry\nLet's sing anywhere with our voices\nCheers to youth"
    },
    {
      "korean": "우리는 절대 길을 잃지 않을 거예요\n똑바로 걸어갈게요\n나랑 가요",
      "english": "We'll never get lost\nI'm gonna walk straight\nCome with me"
    },
    {
      "korean": "오늘 세상이 끝난다라도 가장 중요한 것은 지금 우리",
      "english": "Even if today the world comes to an end\nWhat matters most is our now"
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavoriteView()),
      ).then((_) {
        // Do nothing here to retain the selected index state
      });
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PhrasebookView()),
      ).then((_) {
        // Do nothing here to retain the selected index state
      });
    }
  }

  // Tambahkan state untuk mengontrol visibilitas pop-up
  bool _isPopupVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/navbar.png'), // Replace with the path to your image
                  Positioned(
                    top: 40.0, // Adjusted position
                    left: 16.0,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/profile_image.png'), // Replace with your profile image path
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hi, Jisoo', style: TextStyle(color: Colors.black, fontSize: 20)),
                            Text('잘 오셨어요', style: TextStyle(color: Colors.grey, fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 45.0, // Adjusted position
                    right: 37.0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPopupVisible = !_isPopupVisible; // Tampilkan atau sembunyikan pop-up
                        });
                      },
                      child: Image.asset(
                        'assets/images/moreicon.png', // Replace with your icon image path
                        width: 36.0, // Increased size of the icon
                        height: 36.0, // Increased size of the icon
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 1), // Space for buttons
                          child: Stack(
                            children: [
                              Image.asset('assets/images/textfl.png'), // Replace with your image path
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 4.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Indonesian  ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF9C3FC4),
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/images/swapicon.png', // Path to your swap icon image
                                            width: 24, // Adjust size as needed
                                            height: 24,
                                          ),
                                          Text(
                                            '  Korean',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF9C3FC4),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => TranslateScreen()),
                                        );
                                      },
                                      child: AbsorbPointer(
                                        child: TextField(
                                          maxLines: 1, // Mengatur jumlah baris menjadi 1 untuk posisi horizontal
                                          decoration: InputDecoration(
                                            hintText: 'Type the text to translate', // Tetap ada
                                            filled: true,
                                            fillColor: Colors.white, // Pastikan background tidak transparan
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8), // Menambah padding vertikal
                                            suffixIcon: Container( // Menambahkan opsi terjemahan ke dalam TextField
                                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(height: 20), // Menambahkan jarak untuk menurunkan posisi
                                                  _buildTranslateOption('Formal'),
                                                  SizedBox(width: 8), // Jarak antar opsi
                                                  _buildTranslateOption('Semi Formal'),
                                                  SizedBox(width: 8), // Jarak antar opsi
                                                  _buildTranslateOption('Non Formal'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          textAlign: TextAlign.start, // Mengatur teks menjadi horizontal
                                          style: TextStyle(color: Colors.black), // Menambahkan warna teks agar terlihat
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8), // Space between TextField and buttons
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Reminder for today',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9C3FC4),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
                          children: [
                            Image.asset(
                              'assets/images/reminder.png',
                              height: 150,
                              width: 180,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 130,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '오늘 세상이 끝난다라도\n가장 중요한 것은 지금 우리',
                                      style: TextStyle(fontSize: 14, color: Colors.orange[900]),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 7), // Reduced spacing
                                    Text(
                                      'Even if today the world comes to an end\nWhat matters most is our now',
                                      style: TextStyle(fontSize: 10, color: Colors.black),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20), // Adjusted spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                'Quotes',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF9C3FC4),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF9C3FC4),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 200,
                          child: PageView.builder(
                            itemCount: quotes.length,
                            itemBuilder: (context, index) {
                              return _buildQuoteCard(quotes[index]["korean"]!, quotes[index]["english"]!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Pop-up kecil di pojok kanan atas
          if (_isPopupVisible)
            Positioned(
              top: 80.0, // Ubah sesuai kebutuhan
              right: 37.0, // Ubah sesuai kebutuhan
              child: Container(
                width: 150.0, // Atur lebar pop-up
                color: Colors.white, // Warna latar belakang pop-up tanpa border
                child: SingleChildScrollView( // Tambahkan scroll view
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Ukuran kolom sesuai dengan konten
                    children: [
                      SizedBox(height: 8), // Jarak atas
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingView()), // Pindah ke halaman SettingView
                          );
                        },
                        child: Text('Setting', style: TextStyle(fontSize: 16)),
                      ),
                      SizedBox(height: 8), // Jarak antar teks
                      Text('History', style: TextStyle(fontSize: 16)), // Tidak ada fungsionalitas untuk History
                      SizedBox(height: 8), // Jarak antar teks
                      Text('Offline Mode', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8), // Jarak bawah
                    ],
                  ),
                ),
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
                  _buildIconButton(3, 'assets/images/bookicon.png'), // Update to use the book icon
                  _buildIconButton(4, 'assets/images/staricon.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTranslateOption(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.purple[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildQuoteCard(String korean, String english) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.pink[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            korean,
            style: TextStyle(fontSize: 14, color: Colors.pink[900]),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Text(
            english,
            style: TextStyle(fontSize: 12, color: Colors.black),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(int index, String assetName) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
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