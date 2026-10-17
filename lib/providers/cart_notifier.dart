import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartNotifier extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get count => _items.length;

  double get total {
    return _items.fold(
      0,
      (sum, item) => sum + item.price,
    );
  }

  void add(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}