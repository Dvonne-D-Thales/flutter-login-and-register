import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/contact_controller.dart';
import 'package:latihan_11pplg1/widgets/reusable_textfield.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactController controller = Get.put(ContactController());

    return Scaffold(
      appBar: AppBar(title: const Text('Contact Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Name',
                    isPassword: false,
                    controller: controller.nameController,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.addName,
                  child: const Text('Add Name'),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              'List of Names:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: Obx(() {
                if (controller.names.isEmpty) {
                  return const Center(child: Text('No names found.'));
                }
                return ListView.builder(
                  itemCount: controller.names.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(controller.names[index]['name']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.deleteName(
                          controller.names[index]['id'],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
