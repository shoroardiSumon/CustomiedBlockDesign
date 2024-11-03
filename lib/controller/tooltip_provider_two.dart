import 'package:flutter/material.dart';

class TooltipProviderTwo extends ChangeNotifier {
  int _currentIndex = 0;
  List<GlobalKey> _keys = [];

  void setKeys(List<GlobalKey> keys) {
    _keys = keys;
    notifyListeners();
  }

  void next() {
    if (_currentIndex < _keys.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void skip() {
    _currentIndex = _keys.length - 1;
    notifyListeners();
  }

  GlobalKey get currentKey => _keys[_currentIndex];
}