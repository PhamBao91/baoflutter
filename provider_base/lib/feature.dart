import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Feature with ChangeNotifier {

  int _count = 0;
  int get count => _count;

  /// Tăng số
  increaseCount()
  {
    _count ++;
    notifyListeners(); // khi thay đổi sẽ lắng nghe và thông báo đến các Widget liên quan
  }


}