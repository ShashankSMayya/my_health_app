import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({Key? key}) : super(key: key);

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
          const Placeholder(
            fallbackHeight: 60,
            fallbackWidth: 40,
          ),
          const Gap(20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Document Name',
                style: TextStyle(fontSize: 16),
              ),
              const Gap(5),
              Row(
                children: [
                  const Text(
                    'JPEG',
                    style: TextStyle(color: Colors.black38, fontSize: 12),
                  ),
                  const Gap(10),
                  Container(
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black38),
                  ),
                  const Gap(10),
                  const Text(
                    '0.5 MB',
                    style: TextStyle(color: Colors.black38, fontSize: 12),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                'Uploaded on: 14 Sep 2022',
                style: TextStyle(fontSize: 11, color: Colors.black38),
              ),
            ],
          )),
          const Gap(10),
          GestureDetector(
            child: const Icon(
              Icons.delete_outline,
              size: 16,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
