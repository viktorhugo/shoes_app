import 'package:flutter/material.dart';

class ShoeProvider with ChangeNotifier {

  String _assetImage = 'assets/imgs/azul.png';
  double _size = 7.0;

  String get assetImage => _assetImage;
  set assetImage(String value) {
    _assetImage = value;
    notifyListeners();
  } 

  double get size => _size;
  set size(double value) {
    _size = value;
    notifyListeners();
  } 
}