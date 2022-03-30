import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:my_health_app/data/constants/enums.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/presentation/stores/documents_store.dart';
import 'package:my_health_app/presentation/widgets/confirm_dialog.dart';
import 'package:provider/provider.dart';

class ViewDocumentScreen extends StatefulWidget {
  final DocumentModel document;
  final int documentIndex;

  const ViewDocumentScreen(
      {Key? key, required this.document, required this.documentIndex})
      : super(key: key);

  @override
  State<ViewDocumentScreen> createState() => _ViewDocumentScreenState();
}

class _ViewDocumentScreenState extends State<ViewDocumentScreen> {
  late final ReactionDisposer _disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposer = reaction(
      (_) => context.read<DocumentsStore>().deleteDocumentFuture?.status,
      (result) {
        if (result == FutureStatus.fulfilled) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Document deleted successfully'),
            ),

          );
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
        if (result == FutureStatus.rejected) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error deleting document'),
            ),
          );

        }
        if (result == FutureStatus.pending) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Deleting document...'),
            ),
          );
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.document.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'Uploaded on: ${DateFormat('dd MM yyyy').format(widget.document.uploadDate)}',
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 12),
                      ),
                      const Gap(10),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black38),
                      ),
                      const Gap(10),
                      //File Size in MB
                      Text(
                        widget.document.fileExtension.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => ConfirmDialog(
                            title: 'Delete Document',
                            message:
                                'Are you sure you want to delete this document?',
                            icon: const Icon(Icons.delete_outline,
                                color: Colors.white),
                            onConfirm: () => context
                                .read<DocumentsStore>()
                                .deleteDocument(widget.documentIndex)));
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(14.0),
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: widget.document.fileType == FileTypes.image
                ? Image.memory(widget.document.fileBytes,fit: BoxFit.cover,)
                : const Icon(
                    Icons.description,
                    size: 300,
                  ),
          )
        ],
      ),
    );
  }
}
