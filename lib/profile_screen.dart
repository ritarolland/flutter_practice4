import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, String>> _profileInfo = [
    {'title': 'Имя', 'value': 'Вероника Захарченко'},
    {'title': 'Email', 'value': 'nika@example.com'},
    {'title': 'Телефон', 'value': '+7-123-456-78-90'},
    {'title': 'Адрес', 'value': 'г. Москва, ул. Пушкина, д. 10'},
    {'title': 'Дата рождения', 'value': '10.12.2004'},
  ];

  Widget _buildProfileItem(Map<String, String> item) {
    return Padding(
      key: ValueKey(item['title']), //уникальный ключ для корректного удаления
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item['title']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ),
          Text(
            item['value']!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              setState(() {
                _profileInfo.remove(item);
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

  void _showAddInfoDialog() {
    final titleController = TextEditingController();
    final valueController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Добавить информацию'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Название поля',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
                labelText: 'Значение',
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
              final title = titleController.text.trim();
              final value = valueController.text.trim();

              if (title.isNotEmpty && value.isNotEmpty) {
                setState(() {
                  _profileInfo.add({'title': title, 'value': value});
                });
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('Добавить'),
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
            'Профиль',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: _profileInfo.length,
        itemBuilder: (context, index) {
          return _buildProfileItem(_profileInfo[index]);
        },
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          thickness: 1,
          indent: 16,
          endIndent: 16,
          color: Colors.grey,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        onPressed: _showAddInfoDialog,
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
