import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {

  String currentLocale = "en";


  void changeLocal(String newLocale) {
    if (newLocale == currentLocale) return;
    currentLocale = newLocale;
    notifyListeners();
  }
}
