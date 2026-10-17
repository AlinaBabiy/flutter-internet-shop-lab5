import 'package:flutter/material.dart'; import 'package:provider/provider.dart';
import '../providers/cart_notifier.dart';
class CartScreen extends StatelessWidget { const CartScreen({super.key});
@override Widget build(BuildContext context) 
{ final cart = context.watch<CartNotifier>();
return Scaffold(
  appBar: AppBar(
    title: Text('Кошик (${cart.count})'),
    actions: [
      IconButton(
        icon: const Icon(Icons.delete_sweep),
        onPressed: cart.items.isEmpty
            ? null
            : () {
                context.read<CartNotifier>().clear();
              },
      ),
    ],
  ),
  body: Consumer<CartNotifier>(
    builder: (context, cart, child) {
      if (cart.items.isEmpty) {
        return const Center(
          child: Text(
            'Кошик порожній',
            style: TextStyle(fontSize: 20),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];

          return Card(
            child: ListTile(
              leading: Image.asset(
                item.image,
                width: 55,
                height: 55,
                fit: BoxFit.contain,
              ),
              title: Text(item.name),
              subtitle: Text(
                '${item.price.toStringAsFixed(0)} грн',
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<CartNotifier>().remove(item);
                },
              ),
            ),
          );
        },
      );
    },
  ),
  bottomNavigationBar: const _CartTotalBar(),
);
} }
class _CartTotalBar extends StatelessWidget { const _CartTotalBar();
@override Widget build(BuildContext context) { final cart = context.watch<CartNotifier>();
return SafeArea(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Text(
      'Загальна сума: ${cart.total.toStringAsFixed(0)} грн',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
} }