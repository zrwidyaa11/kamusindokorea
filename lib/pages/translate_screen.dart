import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamusindkorea/controllers/translation_controller.dart';

class TranslateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TranslationController controller = Get.put(TranslationController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/navbar.png'), // Replace with the path to your image
              Positioned(
                top: 40.0, // Adjusted position
                left: 16.0,
                child: Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/backicon.png', // Path to the new back icon image
                        width: 24.0, // Adjust size as needed
                        height: 24.0, // Adjust size as needed
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 50.0, // Adjusted position
                left: 0,
                right: 10,
                child: Center(
                  child: Text(
                    'Translate',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontFamily: 'PlusJakartaSans-Regular',
                       fontWeight: FontWeight.normal,
                    ),
                  ),
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
                      padding: EdgeInsets.only(bottom: 16), // Space for buttons
                      child: Stack(
                        children: [
                          Image.asset('assets/images/textfield.png'), // Replace with your image path
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 4.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          controller.isIndonesianFirst.value ? 'Korea  ' : 'Indonesia',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF9C3FC4),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.toggleLanguage();
                                          },
                                          child: Image.asset(
                                            'assets/images/swapicon.png', // Path to your swap icon image
                                            width: 24, // Adjust size as needed
                                            height: 24,
                                          ),
                                        ),
                                        Text(
                                          controller.isIndonesianFirst.value ? ' Indonesia' : ' Korea',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF9C3FC4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => TextField(
                                    controller: controller.controller,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText: controller.isTextEmpty.value ? 'Type the text to translate' : null,
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(8),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(top: 0.0, right: 8.0), // Adjusted padding to move icon up
                                        child: Image.asset(
                                          'assets/images/microphoneicon.png', // Path to your microphone icon image
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.black),
                                    onChanged: (text) {
                                      controller.isTextEmpty.value = text.isEmpty;
                                    },
                                    onSubmitted: (text) async {
                                      await controller.translate();
                                      controller.showListView.value = true;
                                    },
                                  ),
                                ),
                                SizedBox(height: 8), // Space between TextField and buttons
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildTranslateOption('Formal'),
                                      _buildTranslateOption('Semi Formal'),
                                      _buildTranslateOption('Non Formal'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Obx(
                      () => controller.showListView.value
                          ? ListView.builder(
                              shrinkWrap: true, // Added to prevent unbounded height error
                              itemCount: controller.translationResults.length,
                              itemBuilder: (context, index) {
                                final item = controller.translationResults[index];
                                return ListTile(
                                  title: Text(item.word),
                                  subtitle: Text(item.translation),
                                );
                              },
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
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
}
