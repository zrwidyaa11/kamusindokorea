import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamusindkorea/controllers/translation_controller.dart';

class TranslateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TranslationController controller = Get.put(TranslationController());

    return Scaffold(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Memindahkan semua konten ke kiri
          children: [
            Obx(() => Row(
                  crossAxisAlignment: CrossAxisAlignment.center, // Memastikan semua elemen sejajar vertikal
                  children: [
                    Text(
                      controller.isIndonesianFirst.value ? 'Korea' : 'Indonesia',
                      style: TextStyle(
                        fontSize: 14, // Mengubah ukuran font
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8), // Mengurangi jarak antara teks dan ikon
                    GestureDetector(
                      onTap: () {
                        controller.toggleLanguage();
                      },
                      child: Text(
                        '→', // Menggunakan simbol panah
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Mengurangi jarak antara ikon dan teks
                    Text(
                      controller.isIndonesianFirst.value ? 'Indonesia' : 'Korea',
                      style: TextStyle(
                        fontSize: 14, // Mengubah ukuran font
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                        controller.isIndonesianFirst.value ? 'Korea' : 'Indonesia',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 14, // Mengubah ukuran font
                        ),
                      )),
                  Obx(() => TextField(
                        controller: controller.controller,
                        decoration: InputDecoration(
                          labelText: controller.isTextEmpty.value
                              ? 'Type the text to translate'
                              : null,
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                        onChanged: (text) {
                          controller.isTextEmpty.value = text.isEmpty;
                        },
                        onSubmitted: (text) async {
                          await controller.translate(); // Tambahkan await di sini
                          controller.showListView.value = true;
                        },
                      )),
                ],
              ),
            ),
            SizedBox(height: 16),
            Obx(() => controller.showListView.value
                ? Expanded(
                    child: ListView.builder(
                      itemCount: controller.translationResults.length,
                      itemBuilder: (context, index) {
                        final item = controller.translationResults[index];
                        return ListTile(
                          title: Text(item.word),
                          subtitle: Text(item.translation),
                        );
                      },
                    ),
                  )
                : SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
