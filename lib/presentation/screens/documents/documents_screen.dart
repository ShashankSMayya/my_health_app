import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_health_app/data/constants/hive_constants.dart';
import 'package:my_health_app/data/models/document_model.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton.icon(
            onPressed: () => Navigator.pushNamed(context, Routes.addDocument),
            icon: const Icon(Icons.add),
            label: const Text('Add Document'),
          ),
          Expanded(
              child: ValueListenableBuilder(
                  valueListenable:
                      Hive.box<DocumentModel>(HiveBoxNames.documentBoxName)
                          .listenable(),
                  builder: (context, Box<DocumentModel> box, _) {
                    if (box.isEmpty) {
                      return const Center(child: Text('No documents yet'));
                    }

                    return ListView.builder(
                      itemCount: box.keys.length,
                      itemBuilder: (context, index) {
                        final DocumentModel document =
                            box.values.elementAt(index);

                        return DocumentCard(
                          document: document,
                          documentKey: index,
                        );
                      },
                    );
                  })),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
