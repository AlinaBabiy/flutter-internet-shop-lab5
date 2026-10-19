import '../../domain/repositories/product_repository.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../application/providers/product_provider.dart';

class AppDependencies {
  static ProductRepository createProductRepository() {
    return ProductRepositoryImpl();
  }

  static ProductProvider createProductProvider() {
    final repository = createProductRepository();
    return ProductProvider(repository);
  }

  static ProductProvider createInitializedProductProvider() {
    final provider = createProductProvider();
    provider.loadProducts();
    return provider;
  }
}
