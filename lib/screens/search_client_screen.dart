import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/client_provider.dart';

class SearchClientScreen extends StatefulWidget {
  const SearchClientScreen({super.key});

  @override
  State<SearchClientScreen> createState() => _SearchClientScreenState();
}

class _SearchClientScreenState extends State<SearchClientScreen> {
  final nicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Search Client")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nicController, decoration: const InputDecoration(labelText: "Enter NIC")),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => clientProvider.searchClient(nicController.text),
              child: const Text("Search"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: clientProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: clientProvider.clients.length,
                      itemBuilder: (context, index) {
                        final c = clientProvider.clients[index];
                        return ListTile(
                          title: Text(c.clientNIC),
                          subtitle: Text(c.visitTypeName),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
