import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:my_health_app/data/constants/enums.dart';
import 'package:my_health_app/data/constants/hive_constants.dart';
import 'package:my_health_app/data/models/document_model.dart';

class DocumentCard extends StatelessWidget {
  final DocumentModel document;

  //This Key is used to identify the document key in Hive Box used for updating and deleting the document.
  final int documentKey;

  const DocumentCard(
      {Key? key, required this.document, required this.documentKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              ? const Icon(Icons.description,size: 50,)
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
                    style: const TextStyle(color: Colors.black38, fontSize: 12),
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
                    style: const TextStyle(color: Colors.black38, fontSize: 12),
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
              final box = Hive.box<DocumentModel>(HiveBoxNames.documentBoxName);
              print(documentKey);
              await box.deleteAt(documentKey);
            },
          ),
        ],
      ),
    );
  }
}
