import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/presentation/screens/documents/document_card.dart';
import 'package:my_health_app/presentation/stores/documents_store.dart';
import 'package:my_health_app/routes/routes.dart';

class DocumentsScreen<T extends DocumentsStore> extends StatefulWidget {
  final T store;

  const DocumentsScreen({Key? key, required this.store}) : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.store.getDocuments();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(builder: (_) {
      switch (widget.store.getDocumentsFuture!.status) {
        case FutureStatus.pending:
          return const Center(child: CircularProgressIndicator());
        case FutureStatus.rejected:
          return const Center(child: Text('Error'));
        case FutureStatus.fulfilled:
          return widget.store.errorText != null
              ? Center(
                  child: Text(widget.store.errorText!),
                )
              : Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.addDocument),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Document'),
                      ),
                      Expanded(
                        child: widget.store.documentList.isEmpty
                            ? const Center(
                                child: Text('No Documents Found'),
                              )
                            : ListView.builder(
                                itemCount: widget.store.documentList.length,
                                itemBuilder: (_, index) {
                                  final DocumentModel document =
                                      widget.store.documentList[index];

                                  return DocumentCard(
                                      document: document, docIndex: index);
                                },
                              ),
                      ),
                    ],
                  ),
                );
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
