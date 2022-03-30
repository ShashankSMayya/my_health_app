import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:my_health_app/data/constants/enums.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/presentation/stores/documents_store.dart';
import 'package:my_health_app/presentation/widgets/confirm_dialog.dart';
import 'package:my_health_app/routes/route_arguments.dart';
import 'package:my_health_app/routes/routes.dart';
import 'package:provider/provider.dart';

class DocumentCard extends StatelessWidget {
  final DocumentModel document;

  //This Key is used to identify the document key in Hive Box used for updating and deleting the document.
  final int docIndex;

  const DocumentCard({Key? key, required this.document, required this.docIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.viewDocument,
          arguments:
              ViewDocumentArgs(document: document, documentIndex: docIndex)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            document.fileType == FileTypes.pdf
                ? const Icon(
                    Icons.description,
                    size: 50,
                  )
                : Image.memory(document.fileBytes, height: 50, width: 50),
            const Gap(20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  document.name,
                  style: const TextStyle(fontSize: 16),
                ),
                const Gap(5),
                Row(
                  children: [
                    Text(
                      document.fileExtension.toUpperCase(),
                      style:
                          const TextStyle(color: Colors.black38, fontSize: 12),
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
                      document.fileSize,
                      style:
                          const TextStyle(color: Colors.black38, fontSize: 12),
                    ),
                  ],
                ),
                const Gap(10),
                Text(
                  'Uploaded on: ${DateFormat('dd-MMM-yyyy hh:mm:ss').format(document.uploadDate)}',
                  style: const TextStyle(fontSize: 11, color: Colors.black38),
                ),
              ],
            )),
            const Gap(10),
            GestureDetector(
              child: const Icon(
                Icons.delete_outline,
                size: 24,
              ),
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (_) => ConfirmDialog(
                    title: 'Delete Document',
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 64,
                      color: Colors.white,
                    ),
                    message: 'Are you sure you want to delete this document?',
                    onConfirm: () async {
                      context.read<DocumentsStore>().deleteDocument(docIndex);
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
