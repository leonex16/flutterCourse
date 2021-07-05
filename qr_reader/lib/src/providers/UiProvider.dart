import 'package:flutter/cupertino.dart';

class UiProvider extends ChangeNotifier {
  int _selectedenuOpt = 0;

  int get selectedMenuOpt {
    return this._selectedenuOpt;
  }

  void set selectedMenuOpt(int i) {
    this._selectedenuOpt = i;
    notifyListeners();
  }
}
