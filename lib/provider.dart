import 'package:flutter/material.dart';

class NewsUpdatesProvider extends ChangeNotifier {
  List<String> newsUpdates = [];

  void addNewsUpdate(String newsUpdate) {
    newsUpdates.add(newsUpdate);
    notifyListeners();
  }

  void removeNewsUpdate(String newsUpdate) {
    newsUpdates.remove(newsUpdate);
    notifyListeners();
  }
}
