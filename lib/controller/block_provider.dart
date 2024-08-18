import 'package:flutter/material.dart';

class BlockProvider extends ChangeNotifier {
  int? _expandedBlockIndex;
  List<Map<String, dynamic>> _blocks = [];

  int? get expandedBlockIndex => _expandedBlockIndex;
  List<Map<String, dynamic>> get blocks => _blocks;

  void setBlocks(List<Map<String, dynamic>> newBlocks) {
    _blocks = newBlocks;
    notifyListeners();
  }

  void swapToTop(int index) {
    if (_expandedBlockIndex == index) return;

    if (_expandedBlockIndex != null) {
      var temp = _blocks[0];
      _blocks[0] = _blocks[_expandedBlockIndex!];
      _blocks[_expandedBlockIndex!] = temp;
    }
    _expandedBlockIndex = (_expandedBlockIndex == index) ? null : index;
    notifyListeners();
  }
}