import 'package:flutter/material.dart';
import 'search_client_screen.dart';
import 'add_client_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Client Inspection")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Search Client by NIC"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchClientScreen()),
              ),
            ),
            ElevatedButton(
              child: const Text("Add Client Visit"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddClientScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
