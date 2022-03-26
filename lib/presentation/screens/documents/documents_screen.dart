import 'package:flutter/material.dart';
import 'package:my_health_app/presentation/screens/documents/document_card.dart';
import 'package:my_health_app/routes/routes.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.indigo.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton.icon(
            onPressed: () => Navigator.pushNamed(context, Routes.addDocument),
            icon: const Icon(Icons.add),
            label: const Text('Add Document'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) => const DocumentCard(),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
