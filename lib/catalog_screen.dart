import 'package:flutter/material.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<Map<String, dynamic>> _flowers = [
    {'name': 'Роза красная', 'price': 250},
    {'name': 'Роза белая', 'price': 230},
    {'name': 'Роза розовая', 'price': 240},
    {'name': 'Тюльпан жёлтый', 'price': 180},
    {'name': 'Тюльпан красный', 'price': 190},
    {'name': 'Тюльпан белый', 'price': 200},
    {'name': 'Пион розовый', 'price': 350},
    {'name': 'Пион белый', 'price': 360},
    {'name': 'Хризантема белая', 'price': 150},
    {'name': 'Хризантема жёлтая', 'price': 160},
    {'name': 'Хризантема розовая', 'price': 170},
    {'name': 'Гербера красная', 'price': 220},
    {'name': 'Гербера оранжевая', 'price': 210},
    {'name': 'Гербера розовая', 'price': 215},
    {'name': 'Орхидея фиолетовая', 'price': 480},
    {'name': 'Орхидея белая', 'price': 500},
    {'name': 'Орхидея розовая', 'price': 520},
    {'name': 'Лилия белая', 'price': 300},
    {'name': 'Лилия розовая', 'price': 310},
    {'name': 'Лилия тигровая', 'price': 320},
    {'name': 'Нарцисс жёлтый', 'price': 150},
    {'name': 'Нарцисс белый', 'price': 160},
    {'name': 'Ирис синий', 'price': 200},
    {'name': 'Ирис фиолетовый', 'price': 210},
  ];

  Widget _buildCatalogItem(String name, double price) {
    return Container(
      key: ValueKey(name), //уникальный ключ для корректного удаления
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
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            '${price.toStringAsFixed(0)} ₽',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              setState(() {
                _flowers.removeWhere((flower) => flower['name'] == name);
              });
            },
            child: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddFlowerDialog() {
    final nameController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить цветок'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Название',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Цена (₽)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final price = int.tryParse(priceController.text.trim()) ?? 0;

                if (name.isNotEmpty && price > 0) {
                  setState(() {
                    _flowers.add({'name': name, 'price': price});
                  });
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Добавить'),
            ),
          ],
        );
      },
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
            'Каталог цветов',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _flowers
              .map((flower) =>
              _buildCatalogItem(flower['name'], flower['price'].toDouble()))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        onPressed: _showAddFlowerDialog,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
