import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_notifier.dart';
import '../models/cart_item.dart';
import 'cart_screen.dart';
class HomeScreen extends StatefulWidget { const HomeScreen({super.key});
@override State<HomeScreen> createState() => _HomeScreenState(); }
class _HomeScreenState extends State<HomeScreen> {

String? _selected = 'Всі';

final TextEditingController _searchController =
    TextEditingController();

final List<String> categories = [
  'Всі',
  'Електроніка',
  'Одяг',
  'Дім',
];

final List<Map<String, String>> products = [
  {
    'name': 'Смартфон',
    'price': '18 999 грн',
    'rating': '4.8',
    'category': 'Електроніка',
    'image': 'assets/images/smartphone.jpg',
  },
  {
    'name': 'Навушники',
    'price': '2 499 грн',
    'rating': '4.7',
    'category': 'Електроніка',
    'image': 'assets/images/headphones.jpg',
  },
  {
    'name': 'Ноутбук',
    'price': '32 999 грн',
    'rating': '4.9',
    'category': 'Електроніка',
    'image': 'assets/images/laptop.jpg',
  },
  {
    'name': 'Фотоапарат',
    'price': '24 999 грн',
    'rating': '4.8',
    'category': 'Електроніка',
    'image': 'assets/images/camera.jpg',
  },
  {
    'name': 'Футболка',
    'price': '799 грн',
    'rating': '4.6',
    'category': 'Одяг',
    'image': 'assets/images/tshirt.jpg',
  },
  {
    'name': 'Настільна лампа',
    'price': '1 299 грн',
    'rating': '4.5',
    'category': 'Дім',
    'image': 'assets/images/lamp.jpg',
  },
];
List<Map<String, String>> get filteredProducts { final query = _searchController.text.toLowerCase();
return products.where((product) { final matchesCategory = _selected == 'Всі' || product['category'] == _selected;
final matchesSearch =
    product['name']!.toLowerCase().contains(query);

return matchesCategory && matchesSearch;
}).toList(); }
void _addToCart(Map<String, String> product) {
  final price = double.parse(
    product['price']!.replaceAll(RegExp(r'[^0-9]'), ''),
  );

  context.read<CartNotifier>().add(
    CartItem(
      name: product['name']!,
      price: price,
      image: product['image']!,
    ),
  );
}
void _onSearchChanged(String value) {
  setState(() {});
}

void _onCategorySelected(String category) {
  setState(() {
    _selected = category;
  });
}
@override
void dispose() {
  _searchController.dispose();
  super.dispose();
}
@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar(
  title: const Text('Каталог товарів'),
  actions: [
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {},
    ),
    Selector<CartNotifier, int>(
      selector: (_, cart) => cart.count,
      builder: (context, count, child) {
        return Badge(
          label: Text('$count'),
          isLabelVisible: count > 0,
          child: child,
        );
      },
     child: IconButton(
  icon: const Icon(Icons.shopping_cart),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartScreen(),
      ),
    );
  },
),
    ),
  ],
),
body: Column( children: [ Padding( padding: const EdgeInsets.all(12), 
child: Wrap(
  spacing: 8,
  runSpacing: 8,
  children: categories
      .map((category) => categoryButton(category))
      .toList(),
), ), 
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: TextField(
    controller: _searchController,
    decoration: const InputDecoration(
      labelText: 'Пошук товарів',
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(),
    ),
  onChanged: _onSearchChanged,
  ),
),
const SizedBox(height: 8),
Expanded( child: GridView.builder( padding: const EdgeInsets.all(12), 
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.78, ),
 itemCount: filteredProducts.length, itemBuilder: (context, index) { final product = filteredProducts[index];
          return Card(
  key: ValueKey(product['name']!),
  elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          product['image']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product['name']!,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
  children: [
    const Icon(Icons.star, color: Colors.amber, size: 18),
    const SizedBox(width: 4),
    Text(
      product['rating']!,
      style: const TextStyle(fontSize: 16),
    ),
    const SizedBox(width: 4),
    Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerRight,
        child: Text(
          product['price']!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ],
),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _addToCart(product),
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('До кошика'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  ),
);
}
Widget categoryButton(String category) {
  return FilterChip(
    label: Text(category),
    selected: _selected == category,
   onSelected: (bool selected) {
  _onCategorySelected(category);
},
  );
}
}