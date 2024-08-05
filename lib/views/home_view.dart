import 'package:flutter/material.dart';
import 'package:kamusindkorea/pages/translate_screen.dart'; // Import TranslateScreen

class HomeView extends StatelessWidget {
  final List<Map<String, String>> quotes = [
    {
      "korean": "걱정하지 말아요\n아무대서나 우리 목소리로 노래를 부르자\n청춘에게 건배",
      "english": "Let’s not worry\nLet’s sing anywhere with our voices\nCheers to youth"
    },
    {
      "korean": "우리는 절대 길을 잃지 않을 거예요\n똑바로 걸어갈게요\n나랑 가요",
      "english": "We’ll never get lost\nI’m gonna walk straight\nCome with me"
    },
    {
      "korean": "오늘 세상이 끝난다라도 가장 중요한 것은 지금 우리",
      "english": "Even if today the world comes to an end\nWhat matters most is our now"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan tombol back
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'), // Ganti dengan path gambar profil Anda
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
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Indonesian -> Korean',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9C3FC4),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Menambahkan warna putih pada Container
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TranslateScreen()),
                        );
                      },
                      child: AbsorbPointer(
                        child: TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Type the text to translate',
                            filled: true,
                            fillColor: Colors.white, // Memberikan warna putih pada TextField
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTranslateOption('Formal'),
                        _buildTranslateOption('Semi Formal'),
                        _buildTranslateOption('Non Formal'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Reminder for today',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9C3FC4),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/images/gambar reminder.png', // Ganti dengan path gambar Anda
                    height: 110,
                    width: 110,
                  ),
                  SizedBox(width: 5), // Mengurangi jarak kiri sebesar 30%
                  Expanded(
                    child: Container(
                      height: 110,
                      padding: EdgeInsets.all(8), // Sesuaikan padding
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                        children: [
                          Text(
                            '오늘 세상이 끝난다라도\n가장 중요한 것은 지금 우리',
                            style: TextStyle(fontSize: 12, color: Colors.orange[900]), // Sesuaikan ukuran teks
                            textAlign: TextAlign.left, // Align text to the left
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Even if today the world comes to an end\nWhat matters most is our now',
                            style: TextStyle(fontSize: 10, color: Colors.black), // Sesuaikan ukuran teks
                            textAlign: TextAlign.left, // Align text to the left
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quotes',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9C3FC4),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9C3FC4),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 200, // Sesuaikan tinggi container sesuai kebutuhan
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0), // Mengurangi padding
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0), // Mengurangi border radius
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 4.0, // Mengurangi notch margin
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.purple),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.grey),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.chat, color: Colors.grey),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.book, color: Colors.grey),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.star, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTranslateOption(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12), // Mengecilkan padding
      decoration: BoxDecoration(
        color: Colors.purple[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12, // Mengecilkan ukuran teks
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
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Text(korean,
              style: TextStyle(fontSize: 14, color: Colors.pink[900]),
              textAlign: TextAlign.left), // Align text to the left
          SizedBox(height: 10),
          Text(english,
              style: TextStyle(fontSize: 12, color: Colors.black),
              textAlign: TextAlign.left), // Align text to the left
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeView(),
  ));
}
