import 'package:flutter/material.dart';

class TooltipProviderThree with ChangeNotifier {
  int currentTooltipIndex = 0;
  bool isTooltipVisible = true;

  void showTooltip(int index) {
    currentTooltipIndex = index;
    isTooltipVisible = true;
    notifyListeners();
  }

  void nextTooltip() {
    currentTooltipIndex++;
    notifyListeners();
  }

  void previousTooltip() {
    if (currentTooltipIndex > 0) {
      currentTooltipIndex--;
      notifyListeners();
    }
  }

  void skipTooltip() {
    isTooltipVisible = false;
    notifyListeners();
  }

  void cancelTooltip() {
    isTooltipVisible = false;
    currentTooltipIndex = 0;
    notifyListeners();
  }
}
