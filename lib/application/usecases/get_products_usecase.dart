import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

 // Отримує список товарів через інтерфейс ProductRepository.
Future<List<Product>> call() {
  return repository.getProducts();
}
}