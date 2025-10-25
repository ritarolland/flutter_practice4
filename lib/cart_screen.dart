import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> _cartItems = [
    {'name': 'Роза красная', 'quantity': 3},
    {'name': 'Тюльпан жёлтый', 'quantity': 5},
    {'name': 'Орхидея белая', 'quantity': 1},
    {'name': 'Нарцисс жёлтый', 'quantity': 6},
    {'name': 'Ирис фиолетовый', 'quantity': 3},
    {'name': 'Орхидея фиолетовая', 'quantity': 2},
    {'name': 'Тюльпан красный', 'quantity': 4},
    {'name': 'Пион белый', 'quantity': 1},
    {'name': 'Хризантема розовая', 'quantity': 2},
    {'name': 'Лилия розовая', 'quantity': 3},
    {'name': 'Гербера розовая', 'quantity': 5},
    {'name': 'Роза белая', 'quantity': 2},
    {'name': 'Ирис синий', 'quantity': 1},
    {'name': 'Нарцисс белый', 'quantity': 3},
    {'name': 'Орхидея розовая', 'quantity': 1},
    {'name': 'Тюльпан белый', 'quantity': 2},
  ];

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Container(
      key: ValueKey(item['name']), //уникальный ключ для корректного удаления
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            'x${item['quantity']}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              setState(() {
                _cartItems.remove(item);
              });
            },
            child: const Icon(Icons.delete, color: Colors.red, size: 28),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Корзина',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 16),
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          final item = _cartItems[_cartItems.length - 1 - index];
          return _buildCartItem(item);
        },
      ),
    );
  }
}
