import 'package:flutter/foundation.dart';

class FavoriteChangeNotifier with ChangeNotifier {
  late bool _isFavorited;
  late final int _favoritedCount;

  FavoriteChangeNotifier(this._isFavorited, this._favoritedCount);

  //getter
  bool get isFarited => _isFavorited;
  int get favoriteCount => _favoritedCount + (_isFavorited ? 1 : 0);

  //setter
  set isFavorited(bool isFavorited) {
    _isFavorited = isFavorited;
    notifyListeners();
  }
}