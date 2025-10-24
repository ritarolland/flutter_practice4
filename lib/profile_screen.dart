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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Text(
            item['title']!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          const Spacer(),
          Text(
            item['value']!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
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
    );
  }
}
