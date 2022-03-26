import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddDocumentScreen extends StatelessWidget {
  const AddDocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Document'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Document Name'),
            Gap(10),
            TextField(
              decoration: InputDecoration(hintText: 'Enter document name'),
            ),
          ],
        ),
      ),
    );
  }
}
