import '../../../domain/repositories/product_repository.dart';
 import '../../../data/repositories/product_repository_impl.dart'; 
 import '../../../application/providers/product_provider.dart';
  import '../../../application/usecases/get_products_usecase.dart';
class AppDependencies { static ProductRepository createProductRepository()
 { return ProductRepositoryImpl(); }
static ProductProvider createProductProvider() 
{ final repository = createProductRepository(); 
final getProductsUseCase = GetProductsUseCase(repository);
return ProductProvider(getProductsUseCase);
}
static ProductProvider createInitializedProductProvider()
 { final provider = createProductProvider(); provider.loadProducts(); 
 return provider; } }