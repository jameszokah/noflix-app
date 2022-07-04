import 'package:flutter/foundation.dart';

class AppBarModel with ChangeNotifier {
  double _offset = 0.0;

  void setOffset(double offset) {
    _offset = offset;

    notifyListeners();
  }

  double get offset => _offset;
}
