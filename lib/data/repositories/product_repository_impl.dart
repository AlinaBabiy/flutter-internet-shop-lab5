import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    return [
      const Product(
        id: '1',
        name: 'Camera',
        description: 'Digital camera',
        price: 12000,
        imagePath: 'assets/images/camera.jpg',
        category: 'Electronics',
      ),
      const Product(
        id: '2',
        name: 'Headphones',
        description: 'Wireless headphones',
        price: 2500,
        imagePath: 'assets/images/headphones.jpg',
        category: 'Electronics',
      ),
      const Product(
        id: '3',
        name: 'Lamp',
        description: 'Table lamp',
        price: 800,
        imagePath: 'assets/images/lamp.jpg',
        category: 'Home',
      ),
      const Product(
        id: '4',
        name: 'Laptop',
        description: 'Personal laptop',
        price: 25000,
        imagePath: 'assets/images/laptop.jpg',
        category: 'Electronics',
      ),
      const Product(
        id: '5',
        name: 'Smartphone',
        description: 'Modern smartphone',
        price: 15000,
        imagePath: 'assets/images/smartphone.jpg',
        category: 'Electronics',
      ),
      const Product(
        id: '6',
        name: 'T-shirt',
        description: 'Casual T-shirt',
        price: 500,
        imagePath: 'assets/images/tshirt.jpg',
        category: 'Clothing',
      ),
    ];
  }
}