import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  bool isFavorite(Map<String, dynamic> product) {
    return _favorites.any((item) => item['name'] == product['name']);
  }

  void toggleFavorite(Map<String, dynamic> product) {
    if (isFavorite(product)) {
      _favorites.removeWhere((item) => item['name'] == product['name']);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  void removeFavorite(Map<String, dynamic> product) {
    _favorites.removeWhere((item) => item['name'] == product['name']);
    notifyListeners();
  }
} 