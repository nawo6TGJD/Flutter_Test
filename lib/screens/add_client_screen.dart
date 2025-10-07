import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/client_provider.dart';
import '../models/client.dart';
import '../widgets/custom_button.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final nicController = TextEditingController();
  final commentController = TextEditingController();
  String visitType = 'PA';

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDFF6FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Add Client",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nicController,
              decoration: const InputDecoration(
                labelText: "Client NIC Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: visitType,
              decoration: const InputDecoration(
                labelText: "Visit Type",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: "PA", child: Text("Permanent Address")),
                DropdownMenuItem(value: "BA", child: Text("Business Address")),
                DropdownMenuItem(value: "MA", child: Text("Mailing Address")),
              ],
              onChanged: (v) => setState(() => visitType = v!),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: commentController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Note / Comment",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Select locations",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.location_pin, color: Colors.black),
                SizedBox(width: 10),
                Icon(Icons.location_on_outlined, color: Colors.black),
              ],
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "Add Details",
              onPressed: () async {
                final client = Client(
                  clientNIC: nicController.text,
                  visitType: visitType,
                  branchLatitude: "6.869027630309439",
                  branchLongitude: "79.89531403301659",
                  comment: commentController.text,
                  userId: "demo1",
                  visitTypeName: visitType == "PA"
                      ? "Permanent Address"
                      : visitType == "BA"
                          ? "Business Address"
                          : "Mailing Address",
                  visitDateTime: DateTime.now(),
                );

                final success = await clientProvider.saveClientVisit(client);

                if (success && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Client Visit Saved!")),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Failed to save visit")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
