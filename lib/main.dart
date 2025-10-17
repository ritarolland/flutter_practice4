import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> flowers = [
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: flowers
              .map(
                (flower) => _buildCatalogItem(flower['name'], flower['price']),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCatalogItem(String name, double price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            '${price.toStringAsFixed(0)} ₽',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
