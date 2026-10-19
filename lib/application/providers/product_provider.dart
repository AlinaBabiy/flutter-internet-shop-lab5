import 'package:flutter/foundation.dart';
import '../../domain/entities/product.dart'; import '../usecases/get_products_usecase.dart';
class ProductProvider extends ChangeNotifier { final GetProductsUseCase getProductsUseCase;
ProductProvider(this.getProductsUseCase);
List<Product> _products = []; bool _isLoading = false; String? _error;
List<Product> get products => _products; bool get isLoading => _isLoading; String? get error => _error;
Future<void> loadProducts() async { _isLoading = true; _error = null; notifyListeners();
try {
  _products = await getProductsUseCase();
} catch (e) {
  _error = e.toString();
} finally {
  _isLoading = false;
  notifyListeners();
}
} }