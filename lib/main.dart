import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int points = 0;

  final String profileImageUrl =
      'https://tse1.explicit.bing.net/th/id/OIP.GBWUQUx938jBExN0d59O6gHaHn?r=0&rs=1&pid=ImgDetMain&o=7&rm=3';

  void _incrementPoints() {
    setState(() {
      points++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(profileImageUrl),
              ),
            ),
            const SizedBox(height: 24),

            const Divider(color: Colors.black26, thickness: 1),
            const SizedBox(height: 24),

            // Name
            const Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 4),
            const Text('Manuja Jayasinghe', style: TextStyle(fontSize: 17)),
            const SizedBox(height: 20),

            // Email
            const Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Icon(Icons.email, size: 16, color: Colors.black54),
                SizedBox(width: 6),
                Text(
                  'mjmpjayasinghe@students.nsbm.ac.lk',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Points
            const Text(
              'Points',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 6),
                Text('$points', style: const TextStyle(fontSize: 17)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementPoints,
        child: const Icon(Icons.add),
      ),
    );
  }
}
