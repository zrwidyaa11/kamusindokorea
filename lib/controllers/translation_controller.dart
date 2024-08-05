import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kamusindkorea/pages/database_helper.dart'; // Pastikan path ini benar sesuai dengan struktur project Anda

class TranslationController extends GetxController {
  var isIndonesianFirst = true.obs;
  var isTextEmpty = true.obs;
  var typedText = ''.obs;
  var translationResults = <TranslationItemData>[].obs;
  var showListView = true.obs;
  var isKoreanFirst = true.obs;

  final TextEditingController controller = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  @override
  void onInit() {
    super.onInit();
    // Adding a debounce listener for typedText
    debounce(typedText, (String text) {
      searchTranslations(text);
    }, time: Duration(milliseconds: 400));

    controller.addListener(() {
      typedText.value = controller.text;
    });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void toggleLanguage() {
    isIndonesianFirst.value = !isIndonesianFirst.value;
    isKoreanFirst.value = !isKoreanFirst.value;
    searchTranslations(controller.text);
  }

  Future<void> searchTranslations(String text) async {
    isTextEmpty.value = text.isEmpty;

    if (text.isEmpty) {
      translationResults.clear();
      return;
    }

    var words =
        text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).toList();
    final allRows = await dbHelper.queryAllRows();

    var newTranslationResults = <TranslationItemData>[];

    for (var word in words) {
      var matchingRow;
      if (isIndonesianFirst.value) {
        matchingRow = allRows.firstWhere(
            (row) => row[DatabaseHelper.columnWord] == word,
            orElse: () => <String, dynamic>{});
      } else if (isKoreanFirst.value) {
        matchingRow = allRows.firstWhere(
            (row) => row[DatabaseHelper.columnKorean] == word,
            orElse: () => <String, dynamic>{});
      } else {
        matchingRow = allRows.firstWhere(
            (row) => row[DatabaseHelper.columnTransliteration] == word,
            orElse: () => <String, dynamic>{});
      }

      String translatedWord = matchingRow.isNotEmpty
          ? (isIndonesianFirst.value
              ? (matchingRow[DatabaseHelper.columnTransliteration] ?? '')
              : (matchingRow[DatabaseHelper.columnWord] ?? ''))
          : 'No translation found';
      String translation = matchingRow.isNotEmpty
          ? (matchingRow[DatabaseHelper.columnTranslation] ?? '')
          : 'No translation found';

      newTranslationResults.add(TranslationItemData(
          word: word, translation: '$translatedWord, $translation'));
    }

    translationResults.value = newTranslationResults;
  }

  Future<void> translate() async {
    print("Translating: ${typedText.value}");
    showListView.value = true;

    try {
      // Save translation results to the database
      for (var result in translationResults) {
        await dbHelper.insert({
          DatabaseHelper.columnWord: isIndonesianFirst.value
              ? result.word
              : result.translation.split(', ')[0],
          DatabaseHelper.columnTranslation: result.translation,
          DatabaseHelper.columnTransliteration: isIndonesianFirst.value
              ? result.translation.split(', ')[0]
              : result.word,
        });
      }

      // Query data from the database
      final allRows = await dbHelper.queryAllRows();
      print('Database rows: $allRows');

      // Update translationResults from the database if needed
      var words = typedText.value
          .split(RegExp(r'\s+'))
          .where((word) => word.isNotEmpty)
          .toList();
      var newTranslationResults = words.map((word) {
        var matchingRow;
        if (isIndonesianFirst.value) {
          matchingRow = allRows.firstWhere(
              (row) => row[DatabaseHelper.columnWord] == word,
              orElse: () => <String, dynamic>{});
        } else if (isKoreanFirst.value) {
          matchingRow = allRows.firstWhere(
              (row) => row[DatabaseHelper.columnKorean] == word,
              orElse: () => <String, dynamic>{});
        } else {
          matchingRow = allRows.firstWhere(
              (row) => row[DatabaseHelper.columnTransliteration] == word,
              orElse: () => <String, dynamic>{});
        }

        String translation = matchingRow.isNotEmpty
            ? (matchingRow[DatabaseHelper.columnTranslation] ??
                'No translation found')
            : 'No translation found';

        print('Word: $word, Translation: $translation');

        return TranslationItemData(word: word, translation: translation);
      }).toList();

      translationResults.value = newTranslationResults;
    } catch (e) {
      print("Error during translation: $e");
    }
  }

  Future<String?> translateKoreanToIndonesian(String word) async {
    typedText.value = word; // Update the typedText
    isKoreanFirst.value = true; // Set the language to Korean first
    await searchTranslations(word); // Call searchTranslations method
    isKoreanFirst.value = false; // Reset after translation
    return word;
  }
}

class TranslationItemData {
  final String word;
  final String translation;

  TranslationItemData({required this.word, required this.translation});
}
