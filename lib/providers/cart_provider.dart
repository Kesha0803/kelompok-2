import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  double get totalAmount {
    double total = 0;
    for (var item in _items) {
      // Extract numeric value from price string (remove 'Rp ' and any dots)
      String priceStr = item['price'].toString().replaceAll(RegExp(r'[^0-9]'), '');
      total += int.parse(priceStr) * item['quantity'];
    }
    return total;
  }

  void addItem(Map<String, dynamic> product, int quantity) {
    final existingItemIndex = _items.indexWhere((item) => item['name'] == product['name']);
    
    if (existingItemIndex >= 0) {
      _items[existingItemIndex]['quantity'] += quantity;
    } else {
      _items.add({
        ...product,
        'quantity': quantity,
      });
    }
    notifyListeners();
  }

  void updateQuantity(Map<String, dynamic> product, int quantity) {
    final index = _items.indexWhere((item) => item['name'] == product['name']);
    if (index >= 0) {
      _items[index]['quantity'] = quantity;
      notifyListeners();
    }
  }

  void removeItem(Map<String, dynamic> product) {
    _items.removeWhere((item) => item['name'] == product['name']);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
} 